#ifndef __MICROBLAZE__
#define __MICROBLAZE__
#endif

#include "lw_usb/GenericMacros.h"
#include "lw_usb/GenericTypeDefs.h"
#include "lw_usb/HID.h"
#include "lw_usb/MAX3421E.h"
#include "lw_usb/USB_params.h"
#include "lw_usb/transfer.h"
#include "lw_usb/usb_ch9.h"
#include "platform.h"
#include "xil_printf.h"


#include "usb.h"
#include "xparameters.h"

extern HID_DEVICE hid_device;

static BYTE addr = 1; // hard-wired USB address
const char* const devclasses[] = {" Uninitialized", " HID Keyboard", " HID Mouse", " Mass storage"};

BYTE runningdebugflag = 0; // flag to dump out a bunch of information when we first get to USB_STATE_RUNNING
BYTE errorflag = 0; // flag once we get an error device so we don't keep dumping out state info

BYTE device;

BYTE GetDriverandReport() {
    BYTE i;
    BYTE rcode;
    BYTE device = 0xFF;
    BYTE tmpbyte;

    DEV_RECORD* tpl_ptr;
    xil_printf("Reached USB_STATE_RUNNING (0x40)\n");
    for (i = 1; i < USB_NUMDEVICES; i++) {
        tpl_ptr = GetDevtable(i);
        if (tpl_ptr->epinfo != NULL) {
            xil_printf("Device: %d", i);
            xil_printf("%s \n", devclasses[tpl_ptr->devclass]);
            device = tpl_ptr->devclass;
        }
    }
    // Query rate and protocol
    rcode = XferGetIdle(addr, 0, hid_device.interface, 0, &tmpbyte);
    if (rcode) { // error handling
        xil_printf("GetIdle Error. Error code: ");
        xil_printf("%x \n", rcode);
    } else {
        xil_printf("Update rate: ");
        xil_printf("%x \n", tmpbyte);
    }
    xil_printf("Protocol: ");
    rcode = XferGetProto(addr, 0, hid_device.interface, &tmpbyte);
    if (rcode) { // error handling
        xil_printf("GetProto Error. Error code ");
        xil_printf("%x \n", rcode);
    } else {
        xil_printf("%d \n", tmpbyte);
    }
    return device;
}

void usb_setup() {
    xil_printf("initializing MAX3421E...\n");
    MAX3421E_init();
    xil_printf("initializing USB...\n");
    USB_init();
}

// The mouse stuff is left in, but for now, only keyboard inputs are processed and put into usb_report
// Returns 1 if new data is available, 0 otherwise
u8 usb_get_inputs(struct usb_report* report) {
    MAX3421E_Task();
    USB_Task();

    BYTE rcode;

    BOOT_KBD_REPORT kbdbuf;
    BOOT_MOUSE_REPORT mousebuf;

    if (GetUsbTaskState() == USB_STATE_RUNNING) {
        if (!runningdebugflag) {
            runningdebugflag = 1;
            device = GetDriverandReport();
        } else if (device == 1) {
            // Keyboard
            rcode = kbdPoll(&kbdbuf);
            if (rcode == hrNAK) {
                return 0; // NAK means no new data
            } else if (rcode) {
                xil_printf("Rcode: ");
                xil_printf("%x \n", rcode);
                return 0;
            }
            xil_printf("keycodes: ");
            for (int i = 0; i < 6; i++) {
                xil_printf("%x ", kbdbuf.keycode[i]);
            }
            xil_printf("\n");

            // Initially clear usb_report
            report->is_throttle_up = 0;
            report->is_throttle_down = 0;
            report->is_pitch_up = 0;
            report->is_pitch_down = 0;
            report->is_roll_left = 0;
            report->is_roll_right = 0;
            report->is_yaw_left = 0;
            report->is_yaw_right = 0;

            // Parse into usb_report
            // thrust_up = up arrow = 82 = 0x52
            // thrust_down = down arrow = 81 = 0x51
            // pitch_up = w = 26 = 0x1A
            // pitch_down = s = 22 = 0x16
            // roll_left = a = 4 = 0x04
            // roll_right = d = 7 = 0x07
            // yaw_left = left arrow = 80 = 0x50
            // yaw_right = right arrow = 79 = 0x4F
            for (int i = 0; i < 6; i++) {
                switch (kbdbuf.keycode[i]) {
                    case 0x52:
                        report->is_throttle_up = 1;
                        break;
                    case 0x51:
                        report->is_throttle_down = 1;
                        break;
                    case 0x1A:
                        report->is_pitch_up = 1;
                        break;
                    case 0x16:
                        report->is_pitch_down = 1;
                        break;
                    case 0x04:
                        report->is_roll_left = 1;
                        break;
                    case 0x07:
                        report->is_roll_right = 1;
                        break;
                    case 0x50:
                        report->is_yaw_left = 1;
                        break;
                    case 0x4F:
                        report->is_yaw_right = 1;
                        break;
                    default:
                        // do nothing
                        break;
                }
            }

            return 1;
        } else if (device == 2) {
            rcode = mousePoll(&mousebuf);
            if (rcode == hrNAK) {
                // NAK means no new data
                return 0;
            } else if (rcode) {
                xil_printf("Rcode: ");
                xil_printf("%x \n", rcode);
                return 0;
            }
            xil_printf("X displacement: ");
            xil_printf("%d ", (signed char)mousebuf.Xdispl);
            xil_printf("Y displacement: ");
            xil_printf("%d ", (signed char)mousebuf.Ydispl);
            xil_printf("Buttons: ");
            xil_printf("%x\n", mousebuf.button);
            return 0;
        }
    } else if (GetUsbTaskState() == USB_STATE_ERROR) {
        if (!errorflag) {
            errorflag = 1;
            xil_printf("USB Error State\n");
        }
    } else {
        xil_printf("USB task state: ");
        xil_printf("%x\n", GetUsbTaskState());
        if (runningdebugflag) {
            // previously running, reset USB hardware just to clear out any funky state, HS/FS
            runningdebugflag = 0;
            MAX3421E_init();
            USB_init();
        }
        errorflag = 0;
    }

    return 0;
}
