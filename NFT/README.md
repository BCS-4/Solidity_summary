# NFT

- import 하기

  ```javascript
  import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
  import "@openzeppelin/contracts/utils/Strings.sol";
  ```

- ERC721은 constructor가 필요하고, input 값으로 토큰이름 / 티커가 들어감.

  ```javascript
    constructor() ERC721("LikeLion NFT", "LL") {}
  ```

- mintNFT function

  ```javascript
    // SPDX-License-Identifier: MIT
    pragma solidity ^0.8.20;

    import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
    import "@openzeppelin/contracts/utils/Strings.sol";

    contract NFT is ERC721Enumerable {

      string public metaDataURI;
      constructor() ERC721("LikeLion NFT", "LL") {}

      function mintNFT(string memory _URI, uint _tokenId) public {
          metaDataURI = _URI;
          _mint(msg.sender, _tokenId);
      }
    }
  ```

- pinata에 이미지 파일 업로드하기. (color폴더의 5개 이미지)

  > 업로드 후 CID값 복사.  
  > ipfs.io/ipfs/CID값붙여넣어서 확인해보기. (게이트웨이 주소 대신 ipfs.io/ipfs/CID 로 사용해도 됨.)  
  > 같은 이미지를 업로드하면 CID값은 비슷하게 나올 확률이 높음.

- pinata에 metadata.json 파일 업로드하기. (json폴더의 5개 파일)

- mint하기

  > 정상적으로 발행은 되지만, 이미지가 보이지 않을 것임.  
  > Remix에서도 metaDataURI 함수를 누르면 ipfs 주소가 잘 나오지만, tokenURI함수에 1을 넣은 값을 실행하면 빈 값으로 나옴.  
  > 이유가 뭘까?  
  > ERC721의 tokenURI와 baseURI 함수를 보자.

  ```javascript
      function tokenURI(uint256 tokenId) public view virtual returns (string memory) {
        _requireOwned(tokenId);

        string memory baseURI = _baseURI();
        return bytes(baseURI).length > 0 ? string.concat(baseURI, tokenId.toString()) : "";
    }

    function _baseURI() internal view virtual returns (string memory) {
        return "";
    }
  ```

  > tokenURI 함수를 추가해보자.

  ```javascript
      function tokenURI(uint _tokenId) public view override returns (string memory) {
          return string(abi.encodePacked(metaDataURI,'/',Strings.toString(_tokenId),'.json'));
      }
  ```

  > 재배포해서 tokenId 입력해서 나온 uri주소를 들어가보면 오류 페이지임. (주소 뒤에 1.json이 붙어있음.)  
  > tokenURI함수를 아래처럼 수정해서 재배포 해보자.(아래 함수에서 \_tokenId 인풋값은 없어도 됨)

  ```javascript
    function tokenURI(uint _tokenId) public view override returns (string memory){
        return string(abi.encodePacked(metaDataURI));
    }
  ```

# Reveal

- code

  ```javascript
    // SPDX-License-Identifier: MIT
    pragma solidity ^0.8.20;

    import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
    import "@openzeppelin/contracts/utils/Strings.sol";

    contract reveal is ERC721Enumerable {
        string public beforeURI;
        string public afterURI;
        bool public revealed;

        constructor(string memory _a, string memory _b) ERC721("LikeLion Reveal", "LLR1") {
          beforeURI = _a;
          afterURI = _b;
        }

        function mintNFT() public {
          uint tokenId = totalSupply()+1;
          _mint(msg.sender, tokenId);
        }

        function setStatus(bool _revealed) public {
          revealed = _revealed;
        }

        function tokenURI(uint tokenId) public override view returns(string memory) {
          if(revealed == false) {
              return string(abi.encodePacked(beforeURI));
          } else {
              return string(abi.encodePacked(afterURI));
          }
        }
      }
  ```
