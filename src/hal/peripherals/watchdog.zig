const build_options = @import("build_options");

pub const WatchdogHw = extern struct {
    ctrl: u32, // 0x00
    load: u32, // 0x04
    reason: u32, // 0x08
    scratch0: u32, // 0x0c
    scratch1: u32, // 0x10
    scratch2: u32, // 0x14
    scratch3: u32, // 0x18
    scratch4: u32, // 0x1c
    scratch5: u32, // 0x20
    scratch6: u32, // 0x24
    scratch7: u32, // 0x28
    tick: u32, // 0x2c
};
