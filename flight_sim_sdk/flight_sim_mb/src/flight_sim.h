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

// We want to use an AXI IP to export these values to hardware
// The AXI Lite IP code supports 32-bit registers, so we try to make everything 32-bit optimized
// To avoid DSP usage we want simple ways to convert this data into decimal fixed point
// So, we use 4 bits per digit (8 digits per register)
struct plane_state_export {
    uint32_t status;  // bits that convey status info (e.g., ready bit)

    // For latitude and longitude, we can fit it in one register
    // We will use [sign][3 digit degree][2 digit minute][2 digit second][1 digit 0.1 second] = 8 digits
    // We sneak the sign into the first bit of the degree, since the first digit will always be 0 or 1
    uint32_t latitude;
    uint32_t longitude;

    // Altitude requires 5 digits before the decimal (max height 99,999ft) and can use 3 digits after the decimal
    uint32_t altitude;

    // Airspeed (knots) can be up to 600 knots, so 3 digits before decimal and 1 after is enough
    // This will fit in 16 bits
    uint16_t airspeed;

    // Attitude (pitch, roll, yaw) can all be stored in 16 bits: 2 digits before decimal and 2 after
    // We add hard limits for roll, pitch, and yaw to somewhat emulate fly-by-wire systems
    // So this is okay (i.e., we can't have 180 degree roll)
    uint16_t pitch;
    uint16_t roll;
    uint16_t yaw;

    // Finally, user input is also important to export since it will be used in the HUD
    // Throttle is percent (0-100) with 1 decimal place
    uint16_t throttle;
    // We also want climb rate (feet per minute) which can go up to like 6000 fpm
    // So, 4 digits before decimal and 0 digits after
    uint16_t climb_rate;

    // We also need to tell the hardware how to draw the artificial horizon
    // This will use a y-displacement (for pitch) and a rotation (for roll)
    // The artificial horizon is drawn as a 64x64 square, so max displacement is 32 pixels
    int8_t ah_y_disp;
};

void init_plane_state(struct plane_state* state);
void update_plane_state(struct plane_state* state, struct usb_report* report, float time_step);
void export_plane_state(struct plane_state* state, struct plane_state_export* export_state);

float d_sin(float degrees);
float d_cos(float degrees);
