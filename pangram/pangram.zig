const std = @import("std");
const BitSet = std.bit_set.IntegerBitSet;

pub fn isPangram(str: []const u8) bool {
    var letters = BitSet(26).initEmpty();

    for (str) |c| {
        if (!std.ascii.isAlphabetic(c)) continue;
        const index = std.ascii.toLower(c) - 'a';
        letters.set(index);
    }

    return letters.count() == 26;
}
