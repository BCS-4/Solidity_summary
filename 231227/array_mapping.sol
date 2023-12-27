// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

contract ARRAY_MAPPING {
    struct A {
        string name;
        string _address;
    }

    A[] a_array;
    mapping(uint => A) a_mapping;
    uint idx; // v2
    uint idx_2 =0; // v3

    function pushA_1(A memory _a) public {
        a_array.push(_a);
    }

    function pushA_2(uint _n, A memory _a) public {
        a_mapping[_n]=_a;
        // idx++; // v2
        idx_2++; // v3
    }
}

// array gas : (91709, 69665) / (74609, 52565) / (74609, 52565)
// mapping gas : (69885, 47713) / (69887, 47713) / (69887, 47713)

/*v2*/ 
// array gas : (91709, 69665) / (74609, 52565) / (74609, 52565)
// mapping gas : (92151, 69967) / (75051, 52867) / (75051, 52867)

/*v3*/
// mapping gas : (92151, 69967) / (75051, 52867) / (75051, 52867)

// deployment gas : 374991, 2983535
contract ARRAY_MAPPING2 {
    struct A {
        string name;
        string _address;
    }

    A[] a_array;

    function pushA_1(A memory _a) public {
        a_array.push(_a);
    }
}

// deployment gas : 413272, 334372
contract ARRAY_MAPPING3 {
    struct A {
        string name;
        string _address;
    }

    mapping(uint => A) a_mapping;
    uint idx;

    function pushA_2(uint _n, A memory _a) public {
        a_mapping[_n]=_a;
        idx++;
    }
}

// deployment : 383567, 306541
contract ARRAY_MAPPING3_2 {
    struct A {
        string name;
        string _address;
    }

    mapping(uint => A) a_mapping;

    function pushA_2(uint _n, A memory _a) public {
        a_mapping[_n]=_a;
    }
}