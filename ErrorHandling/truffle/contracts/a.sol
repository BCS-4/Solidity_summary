// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

contract A {
	uint public count;

	struct Arr {
		uint num;
		string name;
	}

	Arr[] public arr2;

	function Input(string memory _name) public {
		arr2.push(Arr(++count, _name));
	}

}