const build_options = @import("build_options");
const std = @import("std");
const vectors = @import("vectors.zig");
const image_def = @import("hal/image_def.zig");
const gpio = @import("hal/gpio.zig");

comptime {
    _ = vectors;
    if(build_options.chip == .rp2350) {
        _ = image_def;
    }
}

export fn kernel_main() callconv(.c) noreturn {
    gpio.init();
    gpio.init_pin(25);
    gpio.set_output_mode(25);
    gpio.write_high(25);
    while (true) {
        asm volatile ("nop");
    }
}

pub fn panic(_: []const u8, _: ?*std.builtin.StackTrace, _: ?usize) noreturn {
    while (true) {}
}
