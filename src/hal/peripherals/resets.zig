const build_options = @import("build_options");

/// Mapped as defined in RP2040 Datasheet section 2.14.3
pub const ResetRegisters = switch (build_options.chip) {
    .rp2040 => packed struct { adc: bool, busctrl: bool, dma: bool, i2c0: bool, i2c1: bool, io_bank0: bool, io_qspi: bool, jtag: bool, pads_bank0: bool, pads_qspi: bool, pio0: bool, pio1: bool, pll_sys: bool, pll_usb: bool, pwm: bool, rtc: bool, spi0: bool, spi1: bool, syscfg: bool, sysinfo: bool, tbman: bool, timer: bool, uart0: bool, uart1: bool, usbctrl: bool, _reserved: u7 },
    .rp2350 => packed struct { adc: bool, busctrl: bool, dma: bool, hstx: bool, i2c0: bool, i2c1: bool, io_bank0: bool, io_qspi: bool, jtag: bool, pads_bank0: bool, pads_qspi: bool, pio0: bool, pio1: bool, pio2: bool, pll_sys: bool, pll_usb: bool, pwm: bool, sha256: bool, spi0: bool, spi1: bool, syscfg: bool, sysinfo: bool, tbman: bool, timer0: bool, timer1: bool, trng: bool, uart0: bool, uart1: bool, usbctrl: bool, _reserved: u3 },
};

pub const ResetsHw = extern struct { reset: u32, wdsel: u32, reset_done: u32 };
