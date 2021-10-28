const zerialport = @import("lib.zig");

pub fn main() !void {
    const serial = zerialport.SerialPort.init("/dev/ttyUSB0");
    try serial.open();
}
