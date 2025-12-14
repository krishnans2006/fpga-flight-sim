#include "gpio.h"


void write_plane_export_to_gpio(struct plane_state_export* export_state) {
    // Since this is real MMIO, we have to be careful!

    GPIO0.status = export_state->status;
    GPIO0.latitude = export_state->latitude;
    GPIO0.longitude = export_state->longitude;
    GPIO0.altitude = export_state->altitude;

    GPIO1.airspeed = export_state->airspeed;
    GPIO1.pitch = export_state->pitch;
    GPIO1.roll = export_state->roll;
    GPIO1.yaw = export_state->yaw;
    GPIO1.throttle = export_state->throttle;
    GPIO1.climb_rate = export_state->climb_rate;

    // Toggle ready bit
    GPIO0.status |= PSE_READY;
    GPIO0.status &= ~PSE_READY;
    // Hopefully, in this span of time, the hardware has triggered on the ready bit
    // and started processing the rest of the data
    // We also know this won't be optimized away, since GPIO0 is volatile
}
