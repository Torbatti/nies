const std = @import("std");

const cpu = @import("cpu6502.zig");

const Bus = struct {
    cpu: cpu.Cpu = undefined,
    ram: [64 * 1024]u8 = [_]u8{0} ** 64 * 1024, // initialize to zero

    pub fn write(bus: *Bus, addr: u8, data: u8) void {
        // bus as a pointer -> bus can change inside this function

        if (addr >= 0x000 and addr <= 0xFFFF) {
            bus.ram[addr] = data; //TODO: check if boss pointer is valid?
        } else {
            @panic("out of bound: ram address access");
        }
    }
    pub fn read(bus: Bus, addr: u8, ReadOnly: bool) u8 {
        // bus as a value -> bus can NOT change inside this function

        ReadOnly = false;

        if (addr >= 0x000 and addr <= 0xFFFF) {
            return bus.ram[addr]; //TODO: check if boss pointer is valid?
        } else {
            @panic("out of bound: ram address access");
        }
    }
};
