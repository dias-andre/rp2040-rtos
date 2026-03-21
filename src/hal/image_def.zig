pub const ImageDefBlock = extern struct {
    magic_start: u32 = 0xFFFFDED3,
    image_type_item: u32 = 0x10210142,
    last_item: u32 = 0x000001FF,
    link_offset: u32 = 0x00000000,
    magic_end: u32 = 0xAB123579,
};

const boot_block_instance = ImageDefBlock{};

comptime {
    @export(&boot_block_instance, .{ .name = ".boot_block", .section = ".embedded_block" });
}
