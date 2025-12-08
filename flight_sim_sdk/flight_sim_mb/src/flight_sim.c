#include "lw_usb/GenericMacros.h"
#include "lw_usb/GenericTypeDefs.h"
#include "lw_usb/HID.h"
#include "lw_usb/MAX3421E.h"
#include "lw_usb/USB.h"
#include "lw_usb/transfer.h"
#include "lw_usb/usb_ch9.h"
#include "platform.h"
#include "xil_printf.h"
#include <xgpio.h>

int main() {
    init_platform();
    xil_printf("Hello World\n\r");
    xil_printf("Successfully ran Hello World application");
    cleanup_platform();
    return 0;
}
