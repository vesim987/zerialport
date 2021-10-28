const std = @import("std");

pub const impl = switch (@import("builtin").os.tag) {
    .windows => @import("windows/impl.zig"),
    .linux => @import("linux/impl.zig"),
    else => @panic("unuspported system"),
};

pub const DataBits = enum {
    Five,
    Six,
    Seven,
    Eight,
};

pub const Parity = enum {
    None,
    Even,
    Odd,
    Space,
    Mark,
    Unknown,
};

pub const StopBits = enum {
    One,
    OneAndHalf,
    Two,
};

pub const FlowControl = enum {
    None,
    Software,
    Hardware,
};

pub const SerialPort = struct {
    const Self = @This();

    path: []const u8,

    pub fn init(path: []const u8) Self {
        return .{
            .path = path,
        };
    }

    pub fn open(self: Self) !void {
        _ = self;
    }

    pub fn baudRate(self: Self) !u32 {
        _ = self;
        return 0;
    }
    pub fn dataBits(self: Self) !DataBits {
        _ = self;
        return DataBits.Eight;
    }
    pub fn flowControl(self: Self) !FlowControl {
        _ = self;
        return FlowControl.None;
    }
    pub fn parity(self: Self) !Parity {
        _ = self;
        return Parity.None;
    }
    pub fn stopBits(self: Self) !StopBits {
        _ = self;
        return StopBits.One;
    }

    pub fn setBaudRate(self: Self, baud_rate: u32) !void {
        _ = self;
        _ = baud_rate;
    }
    pub fn setDataBits(self: Self, data_bits: DataBits) !void {
        _ = self;
        _ = data_bits;
    }
    pub fn setFlowControl(self: Self, flow_control: FlowControl) !void {
        _ = self;
        _ = flow_control;
    }
    pub fn setParity(self: Self, parity_: Parity) !void {
        _ = self;
        _ = parity_;
    }

    pub fn setStopBits(self: Self, stop_bits: StopBits) !void {
        _ = self;
        _ = stop_bits;
    }

    pub const ReadError = error{Foo};
    pub const Reader = std.io.Reader(*Self, ReadError, readSome);

    pub fn reader(self: *Self) Reader {
        return .{
            .context = self,
        };
    }

    pub fn readSome(self: *Self, bytes: []const u8) ReadError!usize {
        _ = self;
        _ = bytes;
        return 0;
    }

    pub const WriteError = error{Foo};
    pub const Writer = std.io.Writer(*Self, WriteError, writeSome);

    pub fn writer(self: *Self) Writer {
        return .{
            .context = self,
        };
    }

    pub fn writeSome(self: *Self, bytes: []const u8) WriteError!usize {
        _ = self;
        _ = bytes;
        return 0;
    }
};
