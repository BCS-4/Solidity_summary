# hardhat 실습 (constructor)

- 환경설정

> npm init  
> npm install --save-dev hardhat  
> npm install --save-dev @nomicfoundation/hardhat-toolbox  
> npx hardhat

- contracts/Lock.sol

  ```javascript
    // SPDX-License-Identifier: MIT
    pragma solidity ^0.8.0;

    import '@openzeppelin/contracts/token/ERC20/ERC20.sol';

    contract ABCToken is ERC20("LikeLion", "LION") {
      constructor(uint totalSupply) {
        _mint(msg.sender, totalSupply);
      }

      function getName() public pure returns(string memory) {
        return "ERC20_2";
      }

      function getNumber() public pure returns(uint) {
        return 12345;
      }

      function MintToken(uint a) public {
        _mint(address(this), a);
      }

      function decimals() public pure override returns(uint8) {
        return 0;
      }

      receive() external payable{}
    }
  ```

- scripts/deploy.js의 main 함수 수정

  ```javascript
  const [deployer] = await ethers.getSigners();
  console.log("deploying contract with account : ", deployer.address);
  const contract = await ethers.deployContract("ABCToken");
  ```

- compile

  > npx hardhat compile 하면 아래와 같이 오류가 발생함.
  >
  > > Error HH411: The library @openzeppelin/contracts, imported from contracts/Lock.sol, is not installed. Try installing it using npm.

  > npm install @openzeppelin/contracts  
  > 다시 compile 해도 오류가 발생함.
  >
  > > The Solidity version pragma statement in these files doesn't match any of the configured compilers in your config. Change the pragma or configure additional compiler versions in your hardhat config.
  > >
  > > - @openzeppelin/contracts/token/ERC20/ERC20.sol (^0.8.20) ....

  > Lock.sol / hardhat.confit.js version 수정 => 0.8.20

  > 다시 컴파일 하면 성공
  >
  > > Compiled 6 Solidity files successfully (evm target: paris).

- hardhat.config.js 수정

  ```javascript
  require("@nomicfoundation/hardhat-toolbox");

  // sepolia로 테스트 함
  const INFURA_API_KEY = "";
  const pvk = "";

  /** @type import('hardhat/config').HardhatUserConfig */
  module.exports = {
    solidity: "0.8.20",

    networks: {
      sepolia: {
        url: `https://sepolia.infura.io/v3/${INFURA_API_KEY}`, // provider
        accounts: [pvk], // signer
      },
    },

    etherscan: {
      apiKey: "",
    },
  };
  ```

- deploy

  > npx hardhat run scripts/deploy.js --network sepolia  
  > constructor(uint totalSupply) 값이 없어서 에러가 발생함.  
  > deploy.js에서 const contract 부분 아래와 같이 수정

  ```javascript
  const contract = await ethers.deployContract("ABCToken", 10000);
  ```

  > 다시 배포해도 아래와 같은 오류가 발생함.
  >
  > > TypeError: Cannot use 'in' operator to search for 'getAddress' in 10000

  > 해결방법 1
  >
  > > deploy.js main() 아래와 같이 수정

  ```javascript
  async function main() {
    const [deployer] = await ethers.getSigners();
    console.log("deploying contract with account : ", deployer.address);
    const LOCK = await hre.ethers.getContractFactory("ABCToken");
    const contract = await LOCK.deploy(123456789 /*constructor의 input 값*/);

    console.log("Contract Address : ", await contract.getAddress());
  }
  ```

  > > 다시 배포하면 성공
  > >
  > > > deploying contract with account : 0x7809e03Ed0458782182045C107057b7577783510  
  > > > Contract Address : 0x8CE4450164295609A90E16140F5EF40C14245f8f

  > 해결방법 2

  ```javascript
  async function main() {
    const [deployer] = await ethers.getSigners();
    console.log("deploying contract with account : ", deployer.address);

    const contract = await ethers.deployContract("ABCToken", {
      value: 123456 /*constructor의 input 값*/,
    });

    console.log("Contract Address : ", await contract.getAddress());
  }
  ```

- verify

  > 해결방법 1 contract verify
  >
  > > npx hardhat verify --network sepolia 컨트랙트주소  
  > > 아래와 같은 오류가 발생함.
  > >
  > > > Etherscan: The constructor for contracts/Lock.sol:ABCToken has 1 parameters but 0 arguments were provided instead.

  > > 배포했던 constructor 값도 같이 넣어주기  
  > > npx hardhat verify --network sepolia 컨트랙트주소 constructor값
