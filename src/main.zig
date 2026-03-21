const build_options = @import("build_options");
const vectors = @import("vectors.zig");

pub const ImageDefBlock = extern struct {
    magic_start: u32 = 0xFFFFDED3,
    image_type_item: u32 = 0x10210142,
    last_item: u32 = 0x000001FF,
    link_offset: u32 = 0x00000000,
    magic_end: u32 = 0xAB123579,
};

const boot_block_instance = ImageDefBlock{};

comptime {
    _ = vectors;
    if (build_options.chip == .rp2350) {
        @export(&boot_block_instance, .{ .name = ".boot_block", .section = ".embedded_block" });
    }
}

const std = @import("std");
const gpio = @import("hal/gpio.zig");

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
