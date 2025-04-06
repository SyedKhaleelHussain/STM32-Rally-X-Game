// Function to configure GPIO pins as input or output
void port_set() {
    // Configure GPIOA pins (CRL for pins 0-7, CRH for pins 8-15)
    GPIOA_CRL = 0x33333333;  // Configure GPIOA pins 0-7 as input
    GPIOA_CRH = 0x33333333;  // Configure GPIOA pins 8-15 as input

    // Configure GPIOB pins
    GPIOB_CRL = 0x33333333;  // Configure GPIOB pins 0-7 as input
    GPIOB_CRH = 0x33333333;  // Configure GPIOB pins 8-15 as input

    // Configure GPIOC pins
    GPIOC_CRL = 0x33333333;  // Configure GPIOC pins 0-7 as input
    GPIOC_CRH = 0x33333333;  // Configure GPIOC pins 8-15 as input

    // Configure GPIOD pins
    GPIOD_CRL = 0x33333333;  // Configure GPIOD pins 0-7 as input
    GPIOD_CRH = 0x33333333;  // Configure GPIOD pins 8-15 as input

    // Configure GPIOE pins
    GPIOE_CRL = 0x44444444;  // Configure GPIOE pins 0-7 as output
    GPIOE_CRH = 0x44444444;  // Configure GPIOE pins 8-15 as output
}
