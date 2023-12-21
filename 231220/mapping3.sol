// SPDX-License-Identifier: MIt
pragma solidity >=0.8.2 <0.9.0;

contract MAPPING3 {
    // 어차피 이름으로 검색할거면 구조체 안에 이름이 있어야 할까? 이름이 있으면 가스비가 더나올까?
    // 빼는게 가스비가 더 저렴하지 않을까? 비교해보자.
    // mapping2.sol에서는 구조체에서 이름을 빼고 했음.

    struct Student1 {
        uint number;
        uint score;
        string home_address;
    }

    struct Student2 {
        string name;
        uint number;
        uint score;
        string home_address;
    }

    mapping(string => Student1) s1;
    mapping(string => Student2) s2;

    function setStudent(string memory _name, Student1 memory _s1) public {
        s1[_name] = _s1;
    }
    /* setStudent함수 input 값 입력해보기 : _name = alice, _s1 = [1, 100, "a"]
    transaction cost : 92025, excution cost : 69653 정도 나왔음.
    */

    function setStudent2(string memory _name, Student2 memory _s2) public {
        s2[_name] = _s2;
    }
    /* setStudent2함수 input 값 입력해보기 : _name = alice, _s1 = ["alice", 1, 100, "a"]
    transaction cost : 115768, excution cost : 92928 정도 나왔음.
    더 많이 나오는 걸 볼 수 있음!
    */

}