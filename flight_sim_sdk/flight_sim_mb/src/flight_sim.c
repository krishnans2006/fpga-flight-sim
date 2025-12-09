#include "flight_sim.h"
#include <math.h>

// First, define default plane characteristics

// This is (kinda) (sorta) based on the Boeing 747 (different models)
// Based on the Boeing 747-8:
// - Initial weight is 987,000 lb = 447696 kg, so initial mass (W/g) = 45636.7 kg
// - Fuel empty weight is 485,300 lb = 220,128 kg, so fuel empty mass = 22439.1 kg
// - Fuel consumption rate is 0.47 lb per lbf of thrust per hour = 0.00001331134 kg per N of thrust per second
// - Max thrust is 283,800 lbf = 1262405.29 N
// - Wing area is 5963 ft^2 = 554 m^2
// Based on the Boeing 747-200:
// - Lift coefficient at 0 is 0.29
// - Lift coefficient per pitch angle is 5.5
// Based on the Boeing 747-400:
// - Drag coefficient is 0.0484x^2 + 0.0184
struct plane_characteristics default_plane_characteristics = {
    .initial_mass = 45636.7,
    .fuel_empty_mass = 22439.1,
    .fuel_consumption_rate = 0.00001331134,  // kg per N of thrust per second
    .max_throttle = 100,
    .min_throttle = 0,
    .max_elevator = 15,
    .min_elevator = -15,
    .max_aileron = 20,
    .min_aileron = -20,
    .max_rudder = 25,
    .min_rudder = -25,
    .throttle_rate = 20,  // percent per second
    .elevator_rate = 10,  // degrees per second
    .aileron_rate = 15,  // degrees per second
    .rudder_rate = 10,  // degrees per second
    .pitch_rate = 1,  // degrees per second per degree of elevator
    .roll_rate = 1,  // degrees per second per degree of aileron
    .yaw_rate = 0.2,  // degrees per second per degree of rudder
    .throttle_to_thrust = 1262405.29 / 100,  // N per percent throttle
    .wing_area = 554,  // m^2
    .lift_coefficient_0 = 0.29,
    .lift_coefficient_per_pitch = 5.5,
    .drag_coefficient_per_lift_0 = 0.0184,
    .drag_coefficient_per_lift_2 = 0.0484
};


void init_plane_state(struct plane_state* state) {
    state->characteristics = default_plane_characteristics;
    state->throttle = 0;
    state->elevator = 0;
    state->aileron = 0;
    state->rudder = 0;
    state->pitch = 0;
    state->roll = 0;
    state->yaw = 0;
    state->latitude = 0;
    state->longitude = 0.0;
    state->altitude = 0.0;
    state->airspeed = 0;
    state->mass = state->characteristics.initial_mass;
}


// Now, physics equations
// This function takes in the current plane state and updates it
void update_plane_state(struct plane_state* state, struct usb_report* report, float time_step) {
    // User input updates
    if (report->is_throttle_up) {
        state->throttle += state->characteristics.throttle_rate * time_step;
        if (state->throttle > state->characteristics.max_throttle) {
            state->throttle = state->characteristics.max_throttle;
        }
    }
    if (report->is_throttle_down) {
        state->throttle -= state->characteristics.throttle_rate * time_step;
        if (state->throttle < state->characteristics.min_throttle) {
            state->throttle = state->characteristics.min_throttle;
        }
    }
    if (report->is_pitch_up) {
        state->elevator += state->characteristics.elevator_rate * time_step;
        if (state->elevator > state->characteristics.max_elevator) {
            state->elevator = state->characteristics.max_elevator;
        }
    }
    if (report->is_pitch_down) {
        state->elevator -= state->characteristics.elevator_rate * time_step;
        if (state->elevator < state->characteristics.min_elevator) {
            state->elevator = state->characteristics.min_elevator;
        }
    }
    if (report->is_roll_left) {
        state->aileron -= state->characteristics.aileron_rate * time_step;
        if (state->aileron < state->characteristics.min_aileron) {
            state->aileron = state->characteristics.min_aileron;
        }
    }
    if (report->is_roll_right) {
        state->aileron += state->characteristics.aileron_rate * time_step;
        if (state->aileron > state->characteristics.max_aileron) {
            state->aileron = state->characteristics.max_aileron;
        }
    }
    if (report->is_yaw_left) {
        state->rudder -= state->characteristics.rudder_rate * time_step;
        if (state->rudder < state->characteristics.min_rudder) {
            state->rudder = state->characteristics.min_rudder;
        }
    }
    if (report->is_yaw_right) {
        state->rudder += state->characteristics.rudder_rate * time_step;
        if (state->rudder > state->characteristics.max_rudder) {
            state->rudder = state->characteristics.max_rudder;
        }
    }

    // Air density (simplified model)
    float rho_atm = 1 - (0.6 / 27600) * state->altitude;  // atm
    float rho = rho_atm * 1.225f;  // kg/m^3

    // Lift coefficient (Cl) and drag coefficient (Cd)
    float Cl = state->characteristics.lift_coefficient_0 + state->characteristics.lift_coefficient_per_pitch * state->pitch;
    float Cd = state->characteristics.drag_coefficient_per_lift_2 * (Cl * Cl) + state->characteristics.drag_coefficient_per_lift_0;

    // Calculate forces (thrust, lift, drag)
    float T = state->throttle * state->characteristics.throttle_to_thrust;
    float L = 0.5 * rho * (state->airspeed * state->airspeed) * state->characteristics.wing_area * Cl;
    float D = 0.5 * rho * (state->airspeed * state->airspeed) * state->characteristics.wing_area * Cd;

    // Update mass
    float d_mass = - T * state->characteristics.fuel_consumption_rate;
    state->mass += d_mass * time_step;
    if (state->mass < state->characteristics.fuel_empty_mass) {
        state->mass = state->characteristics.fuel_empty_mass;
        T = 0;  // No fuel, no thrust
    }

    // Update airspeed
    float d_airspeed = (T - D - state->mass * g * d_sin(state->pitch)) / state->mass;
    state->airspeed += d_airspeed * time_step;
    if (state->airspeed < 0) {
        state->airspeed = 0;
    }

    // Update pitch, roll, yaw based on control surface inputs
    state->pitch += state->elevator * state->characteristics.pitch_rate * time_step;
    state->roll += state->aileron * state->characteristics.roll_rate * time_step;
    state->yaw += state->rudder * state->characteristics.yaw_rate * time_step;

    // Update pitch based on flight dynamics
    float d_pitch = (L * d_cos(state->roll) - state->mass * g * d_cos(state->pitch)) / (state->mass * state->airspeed);
    state->pitch += d_pitch * time_step;
    
    // Update yaw based on flight dynamics
    float d_yaw = (L * d_sin(state->roll)) / (state->mass * state->airspeed * d_cos(state->pitch));
    state->yaw += d_yaw * time_step;

    // Overflow corrections for pitch, roll, yaw
    if (state->pitch > 90) {
        state->pitch = 90;
    } else if (state->pitch < -90) {
        state->pitch = -90;
    }
    if (state->roll > 180) {
        state->roll -= 360;
    } else if (state->roll < -180) {
        state->roll += 360;
    }
    if (state->yaw > 360) {
        state->yaw -= 360;
    } else if (state->yaw < 0) {
        state->yaw += 360;
    }

    // Update position
    float d_latitude = (state->airspeed * d_cos(state->pitch) * d_cos(state->yaw)) / 111320;  // degrees
    state->latitude += d_latitude * time_step;
    float d_longitude = (state->airspeed * d_cos(state->pitch) * d_sin(state->yaw)) / (111320 * d_cos(state->latitude));  // degrees
    state->longitude += d_longitude * time_step;

    // Update altitude
    float d_altitude = state->airspeed * d_sin(state->pitch);
    state->altitude += d_altitude * time_step;

    // Altitude-based pitch and roll limits
    if (state->altitude < 5) {
        if (state->pitch < 0) {
            state->pitch = 0;
        }
        if (state->roll != 0) {
            state->roll = 0;
        }
    }
}

float d_sin(float degrees) {
    return sin(degrees * M_PI / 180);
}


float d_cos(float degrees) {
    return cos(degrees * M_PI / 180);
}
