// SPDX-License-Identifier: MIt
pragma solidity >=0.8.2 <0.9.0;

contract MAPPING {
    // key => value
    // string을 넣으면 uint 값이 나옴.
    mapping(string => uint) age;

    function push(string memory _name, uint _age) public {
        age[_name] = _age;  // MAPPING이름[key] = value
    }

    function get(string memory _name) public view returns(uint) {
        return age[_name];
    }

    /* 이름을 검색하여 성별을 찾을 수 있는 mapping을 설정하세요.
    성별을 설정하고 성별을 알려주는 함수도 구현하세요.
    */
    
    // 이름을 검색해서 성별을 찾는 mapping
    mapping(string => bool) gender;

    // 성별을 설정하는 함수
    function setGender(string memory _name, bool _gender) public {
        gender[_name] = _gender;
    }

    // 성별을 알려주는 함수
    function getGender(string memory _name) public view returns(bool) {
        return gender[_name];
    }
}