const std = @import("std");

const lib = @import("main.zig");
const utils = lib.utils;

pub const print = struct {

    /// Enable alternative screen buffer (xterm)
    pub const enableAlternativeScreenBuffer = utils.comptimeCsi("?1049h", .{});

    /// Disable alternative screen buffer (xterm)
    pub const disableAlternativeScreenBuffer = utils.comptimeCsi("?1049l", .{});
};

/// Enable alternative screen buffer (xterm)
pub fn enableAlternativeScreenBuffer(writer: anytype) !void {
    return std.fmt.format(writer, utils.csi ++ "?1049h", .{});
}

/// Disable alternative screen buffer (xterm)
pub fn disableAlternativeScreenBuffer(writer: anytype) !void {
    return std.fmt.format(writer, utils.csi ++ "?1049l", .{});
}
