#include "usb.h"

// This file forms the templating for a lot of physics
// These calculations are actually simplified greatly (turns out aircraft dynamics is hard!)
// Primarily derived from:
// https://eng.libretexts.org/Bookshelves/Aerospace_Engineering/Fundamentals_of_Aerospace_Engineering_(Arnedo)/07%3A_Mechanics_of_flight/7.01%3A_Performances/7.1.03%3A_Hypotheses

#define g 9.81f

struct plane_characteristics {
    double initial_mass;
    double fuel_empty_mass;
    double fuel_consumption_rate;  // kg/s

    float max_throttle;
    float min_throttle;
    float max_elevator;
    float min_elevator;
    float max_aileron;
    float min_aileron;
    float max_rudder;
    float min_rudder;

    float throttle_rate;
    float elevator_rate;
    float aileron_rate;
    float rudder_rate;

    float pitch_rate;
    float roll_rate;
    float yaw_rate;

    // thrust = k * throttle
    // normally thurst = f(throttle, altitude, airspeed) but we simplify
    double throttle_to_thrust;

    // lift = 0.5 * rho * v^2 * A * Cl
    // we only need to know A and Cl
    // Cl = Cl0 + Cl_p * pitch
    float wing_area;
    float lift_coefficient_0;
    float lift_coefficient_per_pitch;

    // drag = 0.5 * rho * v^2 * A * Cd
    // note that Cd is a function of Cl, i.e., Cd = k2 * Cl^2 + k0
    float drag_coefficient_per_lift_0;
    float drag_coefficient_per_lift_2;
};

struct plane_state {
    struct plane_characteristics characteristics;

    // Mass
    float mass;

    // Stuff affected directly by user input
    float throttle;
    float elevator;
    float aileron;
    float rudder;

    // Orientation
    float pitch;
    float roll;
    float yaw;

    // Position
    double latitude;
    double longitude;
    float altitude;

    // Velocity (in the forward direction)
    float airspeed;
    // Note: vertical speed does not need to be stored - it can be derived from pitch and airspeed
};

void init_plane_state(struct plane_state* state);
void update_plane_state(struct plane_state* state, struct usb_report* report, float time_step);

float d_sin(float degrees);
float d_cos(float degrees);
