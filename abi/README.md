# ABI

### Link

> https://docs.solidity.org/en/latest/abi-spec.html

- bytes / encode / encodePacked 비교 1

  ```javascript
    function getBytes(string memory _s) public pure returns(bytes memory) {
        return bytes(_s);
    }
  ```

  > 인풋 값으로 abc 넣어보자.

  > >

  ```javascript
    0x
    0000000000000000000000000000000000000000000000000000000000000020
    0000000000000000000000000000000000000000000000000000000000000003    // 길이(글자수)
    6162630000000000000000000000000000000000000000000000000000000000    // 데이터
  ```
