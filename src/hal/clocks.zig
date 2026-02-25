const regs = @import("registers.zig");

pub fn crystal_init() void {
    regs.clocks.clk_sys_resus_ctrl = 0;
    regs.xosc_hw.ctrl = 0xAA0; // 1 - 15MHZ
    regs.xosc_hw.startup = 47;
    regs.xosc_hw.ctrl |= 0xFAB000;
    // regs.xosc_hw.ctrl = (0xFAB << 12) | 0xAA0;
    while ((regs.xosc_hw.status & 0x80000000) == 0) {}

    regs.clocks.clk_ref_ctrl = 2; // XOSC
    regs.clocks.clk_sys_ctrl = 0; //reset/clk_ref
    regs.clocks.clk_peri_ctrl = (1 << 11) | (4 << 5);
}
