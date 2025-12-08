#ifndef __MICROBLAZE__
#define __MICROBLAZE__
#endif

#include <xgpio.h>
#include "platform.h"
#include "xil_printf.h"
#include "xil_types.h"
#include "usb.h"

int main() {
    init_platform();
    usb_setup();
    
    xil_printf("Starting flight sim software...\n");

    usb_report report = {0};

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
    }

    cleanup_platform();
    return 0;
}
