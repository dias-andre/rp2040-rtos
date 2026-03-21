/// Mapped as defined in RP2040 Datasheet section 4.2.8
pub const UartHw = extern struct {
    dr: u32, // 0x000 Data Register (Read to receive, Write to send)
    rsr: u32, // 0x004 Receive Status / Error Clear Register
    _reserved0: [4]u32, // 0x008 to 0x014 [PADDING] 4 * 4 bytes = 16 bytes

    fr: u32, // 0x018 Flag Register (Check if TX is full or RX is empty)
    _reserved1: u32, // 0x01c [PADDING] 4 bytes

    ilpr: u32, // 0x020 IrDA Low-Power Counter Register
    ibrd: u32, // 0x024 Integer Baud Rate Register
    fbrd: u32, // 0x028 Fractional Baud Rate Register
    lcr_h: u32, // 0x02c Line Control Register (Sets 8N1, parity, etc)
    cr: u32, // 0x030 Control Register (Master switch for UART)
    ifls: u32, // 0x034 Interrupt FIFO Level Select
    imsc: u32, // 0x038 Interrupt Mask Set/Clear
    ris: u32, // 0x03c Raw Interrupt Status
    mis: u32, // 0x040 Masked Interrupt Status
    icr: u32, // 0x044 Interrupt Clear Register
    dmacr: u32, // 0x048 DMA Control Register

    _reserved2: [997]u32, // 0x04c to 0xfdc [PADDING] Huge memory gap (3988 bytes)

    periphid0: u32, // 0xfe0 UARTPeriphID0 Register
    periphid1: u32, // 0xfe4 UARTPeriphID1 Register
    periphid2: u32, // 0xfe8 UARTPeriphID2 Register
    periphid3: u32, // 0xfec UARTPeriphID3 Register
    pcellid0: u32, // 0xff0 UARTPCellID0 Register
    pcellid1: u32, // 0xff4 UARTPCellID1 Register
    pcellid2: u32, // 0xff8 UARTPCellID2 Register
    pcellid3: u32, // 0xffc UARTPCellID3 Register
};
