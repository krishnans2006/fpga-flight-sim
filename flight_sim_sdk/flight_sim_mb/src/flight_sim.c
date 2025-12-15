#include "flight_sim.h"
#include <math.h>

#define MSB_8 (1 << 7)

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
    if (state->pitch > 20) {
        state->pitch = 20;
    } else if (state->pitch < -20) {
        state->pitch = -20;
    }
    if (state->roll > 20) {
        state->roll = 20;
    } else if (state->roll < -20) {
        state->roll = -20;
    }
    if (state->yaw >= 360) {
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
    state->climb_rate = d_altitude;  // for export purposes

    // Prevent negative altitude
    if (state->altitude < 0) {
        state->altitude = 0;
    }

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

// Set all fields to zero
// Note - the struct is NOT memory-mapped or volatile
// Writing to MMIO is handled in gpio.c
void init_plane_export(struct plane_state_export* export_state) {
    *export_state = (struct plane_state_export){0};
}

void export_plane_state(struct plane_state* state, struct plane_state_export* export_state) {
    // We assume all fields are initialized, either to zero or to valid values from the previous iteration

    // Latitude: [][][].[][][][][]
    double lat = state->latitude;
    uint8_t lat3 = (get_nth_digit_d(lat, 2) << 4) | get_nth_digit_d(lat, 1);
    uint8_t lat2 = (get_nth_digit_d(lat, 0) << 4) | get_nth_digit_d(lat, -1);
    uint8_t lat1 = (get_nth_digit_d(lat, -2) << 4) | get_nth_digit_d(lat, -3);
    uint8_t lat0 = (get_nth_digit_d(lat, -4) << 4) | get_nth_digit_d(lat, -5);
    if (lat < 0) {
        lat3 |= MSB_8;
    }
    export_state->latitude = (lat3 << 24) | (lat2 << 16) | (lat1 << 8) | lat0;

    // Longitude: [][][].[][][][][]
    double lon = state->longitude;
    uint8_t lon3 = (get_nth_digit_d(lon, 2) << 4) | get_nth_digit_d(lon, 1);
    uint8_t lon2 = (get_nth_digit_d(lon, 0) << 4) | get_nth_digit_d(lon, -1);
    uint8_t lon1 = (get_nth_digit_d(lon, -2) << 4) | get_nth_digit_d(lon, -3);
    uint8_t lon0 = (get_nth_digit_d(lon, -4) << 4) | get_nth_digit_d(lon, -5);
    if (lon < 0) {
        lon3 |= MSB_8;
    }
    export_state->longitude = (lon3 << 24) | (lon2 << 16) | (lon1 << 8) | lon0;

    // Altitude: [][][][][].[][][]
    // float alt = state->altitude;
    // uint8_t alt3 = (get_nth_digit(alt, 4) << 4) | get_nth_digit(alt, 3);
    // uint8_t alt2 = (get_nth_digit(alt, 2) << 4) | get_nth_digit(alt, 1);
    // uint8_t alt1 = (get_nth_digit(alt, 0) << 4) | get_nth_digit(alt, -1);
    // uint8_t alt0 = (get_nth_digit(alt, -2) << 4) | get_nth_digit(alt, -3);
    // export_state->altitude = (alt3 << 24) | (alt2 << 16) | (alt1 << 8) | alt0;
    // Altitude is always positive
    export_state->altitude = (uint32_t)(state->altitude);

    // Airspeed: [][][].[]
    float airspeed = state->airspeed;
    uint8_t airspeed1 = (get_nth_digit(airspeed, 2) << 4) | get_nth_digit(airspeed, 1);
    uint8_t airspeed0 = (get_nth_digit(airspeed, 0) << 4) | get_nth_digit(airspeed, -1);
    export_state->airspeed = (airspeed1 << 8) | airspeed0;
    // Airspeed is always positive

    // Pitch: [][].[][]
    float pitch = state->pitch;
    uint8_t pitch1 = (get_nth_digit(pitch, 1) << 4) | get_nth_digit(pitch, 0);
    uint8_t pitch0 = (get_nth_digit(pitch, -1) << 4) | get_nth_digit(pitch, -2);
    if (pitch < 0) {
        pitch1 |= MSB_8;
    }
    export_state->pitch = (pitch1 << 8) | pitch0;

    // Roll: [][].[][]
    float roll = state->roll;
    uint8_t roll1 = (get_nth_digit(roll, 1) << 4) | get_nth_digit(roll, 0);
    uint8_t roll0 = (get_nth_digit(roll, -1) << 4) | get_nth_digit(roll, -2);
    if (roll < 0) {
        roll1 |= MSB_8;
    }
    export_state->roll = (roll1 << 8) | roll0;

    // Yaw: [][].[][]
    float yaw = state->yaw;
    uint8_t yaw1 = (get_nth_digit(yaw, 1) << 4) | get_nth_digit(yaw, 0);
    uint8_t yaw0 = (get_nth_digit(yaw, -1) << 4) | get_nth_digit(yaw, -2);
    if (yaw < 0) {
        yaw1 |= MSB_8;
    }
    export_state->yaw = (yaw1 << 8) | yaw0;

    // Throttle: [][][].[]
    float throttle = state->throttle;
    uint8_t throttle1 = (get_nth_digit(throttle, 2) << 4) | get_nth_digit(throttle, 1);
    uint8_t throttle0 = (get_nth_digit(throttle, 0) << 4) | get_nth_digit(throttle, -1);
    export_state->throttle = (throttle1 << 8) | throttle0;
    // Throttle is always positive

    // Climb rate: [][][][].
    float climb_rate = state->climb_rate;
    uint8_t climb_rate1 = (get_nth_digit(climb_rate, 3) << 4) | get_nth_digit(climb_rate, 2);
    uint8_t climb_rate0 = (get_nth_digit(climb_rate, 1) << 4) | get_nth_digit(climb_rate, 0);
    if (climb_rate < 0) {
        climb_rate1 |= MSB_8;
    }
    export_state->climb_rate = (climb_rate1 << 8) | climb_rate0;

    // Do not set ready bit here; it is handled in gpio.c
}

float d_sin(float degrees) {
    return sin(degrees * M_PI / 180);
}


float d_cos(float degrees) {
    return cos(degrees * M_PI / 180);
}

// digit 0 is the ones place, digit 1 is the tens place,
// digit -1 is the tenths place, digit -2 is the hundredths place, etc.
uint8_t get_nth_digit_d(double num, int n) {
    float shifted = fabs(num) / pow(10, n);
    return ((uint8_t) shifted) % 10;
}

uint8_t get_nth_digit(float num, int n) {
    float shifted = fabs(num) / pow(10, n);
    return ((uint8_t) shifted) % 10;
}
