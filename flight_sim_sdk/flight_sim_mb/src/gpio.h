#include <stdint.h>
#include "flight_sim.h"
#include "xparameters.h"

struct gpio0_regs {
    union {
        struct __attribute__((packed)) {
            uint32_t status;
            uint32_t latitude;
            uint32_t longitude;
            uint32_t altitude;
        };

        uint8_t raw[16];
    };
};

struct gpio1_regs {
    union {
        struct __attribute__((packed)) {
            uint16_t airspeed;
            uint16_t pitch;
            uint16_t roll;
            uint16_t yaw;
            uint16_t throttle;
            uint16_t climb_rate;
        };

        uint8_t raw[16];
    };
};

struct gpio2_regs {
    union {
        // struct __attribute__((packed)) {
        //     // Nothing
        // };

        uint8_t raw[16];
    };
};

struct gpio3_regs {
    union {
        // struct __attribute__((packed)) {
        //     // Nothing
        // };

        uint8_t raw[16];
    };
};

// Note: there's an offset of 2 GPIOs (GPIO0 is USB reset, GPIO1 is USB interrupt)
#define GPIO0 (*(volatile struct gpio0_regs*)(XPAR_GPIO_2_BASEADDR))
#define GPIO1 (*(volatile struct gpio1_regs*)(XPAR_GPIO_3_BASEADDR))
#define GPIO2 (*(volatile struct gpio2_regs*)(XPAR_GPIO_4_BASEADDR))
#define GPIO3 (*(volatile struct gpio3_regs*)(XPAR_GPIO_5_BASEADDR))


// Functions

void write_plane_export_to_gpio(struct plane_state_export* export_state);
