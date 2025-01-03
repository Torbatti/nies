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

    pub const Instruction = struct {
        name: []u8,
        operate: *const fn () u8,
        addrmode: *const fn () u8,
        cycles: u8,
    };

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

    // Addressing Modes : 10 -> R650X , R651X R6500 Microprocessor PDF / page 9
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

    // Legal Opcodes : 56
    fn ADC() u8 {}
    fn AND() u8 {}
    fn ASL() u8 {}
    fn BCC() u8 {}

    fn BCS() u8 {}
    fn BEQ() u8 {}
    fn BIT() u8 {}
    fn BMI() u8 {}

    fn BNE() u8 {}
    fn BPL() u8 {}
    fn BRK() u8 {}
    fn BVC() u8 {}

    fn BVS() u8 {}
    fn CLC() u8 {}
    fn CLD() u8 {}
    fn CLI() u8 {}

    fn CLV() u8 {}
    fn CMP() u8 {}
    fn CPX() u8 {}
    fn CPY() u8 {}

    fn DEC() u8 {}
    fn DEX() u8 {}
    fn DEY() u8 {}
    fn EOR() u8 {}

    fn INC() u8 {}
    fn INX() u8 {}
    fn INY() u8 {}
    fn JMP() u8 {}

    fn JSR() u8 {}
    fn LDA() u8 {}
    fn LDX() u8 {}
    fn LDY() u8 {}

    fn LSR() u8 {}
    fn NOP() u8 {}
    fn ORA() u8 {}
    fn PHA() u8 {}

    fn PHP() u8 {}
    fn PLA() u8 {}
    fn PLP() u8 {}
    fn ROL() u8 {}

    fn ROR() u8 {}
    fn RTI() u8 {}
    fn RTS() u8 {}
    fn SBC() u8 {}

    fn SEC() u8 {}
    fn SED() u8 {}
    fn SEI() u8 {}
    fn STA() u8 {}

    fn STX() u8 {}
    fn STY() u8 {}
    fn TAX() u8 {}
    fn TAY() u8 {}

    fn TSX() u8 {}
    fn TXA() u8 {}
    fn TXS() u8 {}
    fn TYA() u8 {}

    // Illegal Opcodes
    fn XXX() u8 {}

    pub fn connect_bus(cpu: *Cpu, Bus: *bus.Bus) !void {
        cpu.bus = Bus;
    }

    fn fetch() u8 {}
};
