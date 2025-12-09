#include "xil_types.h"

// Types for usage outside usb.c

struct usb_report {
    u8 is_throttle_up;
    u8 is_throttle_down;
    u8 is_pitch_up;
    u8 is_pitch_down;
    u8 is_roll_left;
    u8 is_roll_right;
    u8 is_yaw_left;
    u8 is_yaw_right;
};


// Functions

void usb_setup();
u8 usb_get_inputs(struct usb_report* report);
