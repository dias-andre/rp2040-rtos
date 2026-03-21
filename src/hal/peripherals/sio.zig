const build_options = @import("build_options");

/// Single-cycle IO (SIO) Register Map
/// Mapped exactly as defined in RP2040 Datasheet section 2.3.1.7
pub const SioHw = switch (build_options.chip) {
    .rp2040 => extern struct {
        cpuid: u32, // 0x000 Processor core identifier
        gpio_in: u32, // 0x004 Input value for GPIO pins
        gpio_hi_in: u32, // 0x008 Input value for QSPI pins
        _reserved0: u32, // 0x00c [PADDING] Reserved to maintain alignment

        gpio_out: u32, // 0x010 GPIO output value
        gpio_out_set: u32, // 0x014 GPIO output value set
        gpio_out_clr: u32, // 0x018 GPIO output value clear
        gpio_out_xor: u32, // 0x01c GPIO output value XOR

        gpio_oe: u32, // 0x020 GPIO output enable
        gpio_oe_set: u32, // 0x024 GPIO output enable set
        gpio_oe_clr: u32, // 0x028 GPIO output enable clear
        gpio_oe_xor: u32, // 0x02c GPIO output enable XOR

        gpio_hi_out: u32, // 0x030 QSPI output value
        gpio_hi_out_set: u32, // 0x034 QSPI output value set
        gpio_hi_out_clr: u32, // 0x038 QSPI output value clear
        gpio_hi_out_xor: u32, // 0x03c QSPI output value XOR

        gpio_hi_oe: u32, // 0x040 QSPI output enable
        gpio_hi_oe_set: u32, // 0x044 QSPI output enable set
        gpio_hi_oe_clr: u32, // 0x048 QSPI output enable clear
        gpio_hi_oe_xor: u32, // 0x04c QSPI output enable XOR
    },
    .rp2350 => extern struct {
        cpuid: u32,
        gpio_in: u32,
        gpio_hi_in: u32,
        _reserved: u32,

        gpio_out: u32,
        gpio_hi_out: u32,

        gpio_out_set: u32,
        gpio_hi_out_set: u32,

        gpio_out_clr: u32,
        gpio_hi_out_clr: u32,

        gpio_out_xor: u32,
        gpio_hi_out_xor: u32,

        gpio_oe: u32,
        gpio_hi_oe: u32,

        gpio_oe_set: u32,
        gpio_hi_oe_set: u32,

        gpio_oe_clr: u32,
        gpio_hi_oe_clr: u32,

        gpio_oe_xor: u32,
        gpio_hi_oe_xor: u32,
    },
};
