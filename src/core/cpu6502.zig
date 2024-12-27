const std = @import("std");

const bus = @import("bus.zig");

pub const Cpu = struct {
    bus: *bus.Bus = undefined,

    a: u8 = 0x00, // Accumulator Register
    x: u8 = 0x00, // X Register
    y: u8 = 0x00, // Y Register
    stkp: u8 = 0x00, // Stack Pointer
    pc: u16 = 0x00, // Program Counter
    status: u8 = 0x00, // Status Register

    fetched: u8 = 0x00, // fetched data from fetch function

    addrs_abs: u16 = 0x0000,
    addrs_rel: u16 = 0x0000,
    opcode: u8 = 0x00,
    cycles: u8 = 0x00,

    // get and set flag?
    pub const Flags = enum(u8) {
        C = (1 << 0), // 0x01 // Carry bit
        Z = (1 << 1), // 0x02 // Zero
        I = (1 << 2), // 0x04 // Disable Interrupts
        D = (1 << 3), // 0x08 // Decimal Mode (TODO: UNUSED)
        B = (1 << 4), // 0x10 // Break
        U = (1 << 5), // 0x20 // Unused
        V = (1 << 6), // 0x40 // Overflow
        N = (1 << 7), // 0x80 // Negative
    };

    fn clock() void {}
    fn reset() void {}
    // interrupt request signal
    fn irq() void {}
    // non maskable interrupt request signal
    fn nmi() void {}

    // Addressing Modes -> R650X , R651X R6500 Microprocessor PDF / page 9
    fn IMP() u8 {}
    fn IMM() u8 {}
    fn ZP0() u8 {}
    fn ZPX() u8 {}
    fn ZPY() u8 {}
    fn REL() u8 {}
    fn ABY() u8 {}
    fn IND() u8 {}
    fn IZX() u8 {}
    fn IZY() u8 {}

    // Legal Opcodes
    // Illegal Opcodes

    pub fn connect_bus(cpu: *Cpu, Bus: *bus.Bus) !void {
        cpu.bus = Bus;
    }

    fn fetch() u8 {}
};
