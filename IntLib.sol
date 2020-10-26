//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.5.0 <0.8.0;

library IntLib {
	function intLength(int i) public pure returns (uint len) {
		len = 0;
		if (i < 0) {
			len++;
		}
		do {
			i /= 10;
			len++;
		} while (i != 0);
	}

	function int2bytes(int i) public pure returns (bytes memory int_b) {
		uint index = intLength(i);
		int_b = new bytes(index);

		index--;
		if (i < 0) {
			int_b[0] = '-';
			i = -i;
		}
		do {
			int_b[index] = byte(uint8(48 + i % 10));
			i /= 10;
			index--;
		} while (i != 0);
	}
}
