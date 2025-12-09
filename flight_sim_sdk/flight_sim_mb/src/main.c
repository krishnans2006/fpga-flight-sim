#ifndef __MICROBLAZE__
#define __MICROBLAZE__
#endif

#include <xgpio.h>
#include "flight_sim.h"
#include "platform.h"
#include "sys/unistd.h"
#include "xil_printf.h"
#include "xil_types.h"

int main() {
    init_platform();
    usb_setup();
    
    xil_printf("Starting flight sim software...\n");

    struct usb_report report = {0};

    struct plane_state plane;
    init_plane_state(&plane);

    while (TRUE) {
        // Populate USB report
        u8 rcode = usb_get_inputs(&report);

        xil_printf("USB report - Throttle Up: %d, Throttle Down: %d, Pitch Up: %d, Pitch Down: %d, Roll Left: %d, Roll Right: %d, Yaw Left: %d, Yaw Right: %d\n",
            report.is_throttle_up,
            report.is_throttle_down,
            report.is_pitch_up,
            report.is_pitch_down,
            report.is_roll_left,
            report.is_roll_right,
            report.is_yaw_left,
            report.is_yaw_right
        );

        // Update plane state based on USB report
        float time_step = 0.1f;
        update_plane_state(&plane, &report, time_step);

        // Output updated plane state for debugging
        // Typecast to int for xil_printf
        xil_printf("Throttle: %d, Elevator: %d, Aileron: %d, Rudder: %d, Pitch: %d, Roll: %d, Yaw: %d, Latitude: %d, Longitude: %d, Altitude: %d, Airspeed: %d, Mass: %d\n",
            (int)(plane.throttle * 1000),
            (int)(plane.elevator * 1000),
            (int)(plane.aileron * 1000),
            (int)(plane.rudder * 1000),
            (int)(plane.pitch * 1000),
            (int)(plane.roll * 1000),
            (int)(plane.yaw * 1000),
            (int)(plane.latitude * 1000000),
            (int)(plane.longitude * 1000000),
            (int)(plane.altitude * 1000),
            (int)(plane.airspeed * 1000),
            (int)(plane.mass)
        );

        sleep(1);
    }

    cleanup_platform();
    return 0;
}
