module Utilities.uid;

import std.random;
import std.array;
import std.conv;
import std.format;

class UID {
	private string uid;
	private static string[] activeUIDs;

	this() {
		uid = generateUID();
	}

	this(string existingUID) {
		uid = existingUID;
	}

	string UidToString() const {
		return uid;
	}

	private string generateUID() {
		auto rng = Random(unpredictableSeed);
		auto chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
		auto length = 16;

		string result;

		foreach (_; 0 .. length) {
			result ~= chars[rng.front % chars.length];
			rng.popFront();
		}
		return result;
	}

}
