const regs = @import("registers.zig");
const gpio = @import("gpio.zig");

pub fn init() void {
    const mask = @as(u32, 1) << 2;
    regs.resets_hw.reset &= ~mask;
    while ((regs.resets_hw.reset_done & mask) == 0) {}
    regs.io_bank0_hw.io[0].ctrl = 2;
    regs.io_bank0_hw.io[1].ctrl = 2;
}
