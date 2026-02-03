const std = @import("std");
const HashMap = std.hash_map.AutoHashMap;
fn HashSet(comptime T: type) type {
    return HashMap(T, void);
}

pub fn isIsogram(str: []const u8) bool {
    const allocator = std.heap.page_allocator;
    var set = HashSet(u8).init(allocator);
    defer set.deinit();

    for (str) |c| {
        if (!std.ascii.isAlphabetic(c)) continue;
        const lower = std.ascii.toLower(c);
        if (set.contains(lower)) return false;
        set.put(lower, {}) catch return false;
    }

    return true;
}
