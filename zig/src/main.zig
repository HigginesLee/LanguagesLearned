const std = @import("std");

pub fn main() void {
    var variable: u16 = 0;
    variable = 6666;
    std.debug.print("Hello, world!\n", .{});
    std.debug.print("variable is {d}\n", .{variable});
    const undefined_variable: u16 = undefined;
    std.debug.print("undefined_variable is {d}\n", .{undefined_variable});
}
