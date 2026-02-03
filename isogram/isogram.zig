const std = @import("std");
const BitSet = std.bit_set.IntegerBitSet;

pub fn isIsogram(str: []const u8) bool {
    var letters = BitSet(26).initEmpty();

    for (str) |c| {
        if (!std.ascii.isAlphabetic(c)) continue;
        const index = std.ascii.toLower(c) - 'a';
        if (letters.isSet(index)) return false;
        letters.set(index);
    }

    return true;
}
