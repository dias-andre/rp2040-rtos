const build_options = @import("build_options");

pub const GPIO_COUNT = switch (build_options.chip) {
    .rp2040 => 30,
    .rp2350 => 48,
};

pub const GpioHw = extern struct { status: u32, ctrl: u32 };

pub const IoBank0Hw = extern struct {
    io: [GPIO_COUNT]GpioHw,
};

/// Mapped as defined in RP2040 Datasheet section 2.19.6.3
pub const PadHw = switch (build_options.chip) {
    .rp2040 => packed struct {
        slew_fast: bool, // bit 0
        schmitt: bool, // bit 1
        pde: bool, // bit 2
        pue: bool, // bit 3
        drive: u2, // bits 4-5
        ie: bool, // bit 6
        od: bool, // bit 7
        _reserved: u24,
    },
    .rp2350 => packed struct {
        slew_fast: bool, // bit 0
        schmitt: bool, // bit 1
        pde: bool, // bit 2
        pue: bool, // bit 3
        drive: u2, // bits 4-5
        ie: bool, // bit 6
        od: bool, // bit 7
        iso: bool, // bit 8
        _reserved: u23,
    },
};

pub const PadBankHw = extern struct { vol: u32, pads: [GPIO_COUNT]PadHw, _reserved: [2]u32 };
