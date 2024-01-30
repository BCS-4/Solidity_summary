# hardhat 실습

- 환경설정

> npm init  
> npm install --save-dev hardhat  
> npm install --save-dev @nomicfoundation/hardhat-toolbox  
> npx hardhat

- contract 수정

  > contracts/Lock.sol

  ```javascript
  // SPDX-License-Identifier: UNLICENSED
  	pragma solidity ^0.8.9;

  	// Uncomment this line to use console.log
  	import "hardhat/console.sol";

  	contract Lock {
  		uint public a = 10;
  		string public b = "abc";
  		bytes1 public c  = 0x12;
  		uint public d;

  		function add(uint _a, uint _b) public pure returns(uint) {
  			return _a+_b;
  		}

  		function getAdd(uint _n) public view returns(uint) {
  			return a+_n;
  		}

  		function getAdd_2(uint _a, uint _b) public {
  			d = _a+_b;
  		}

  		function getString(string memory _b) public view returns(string memory) {
  			console.log("getting result");
  			return string(abi.encodePacked(b, _b));
  		}
  	}
  ```

- compile

  > npx hardhat compile  
  > test/Lock.js 확인  
  > Lock.js 아래와 같이 수정

  ```javascript
  const { expect } = require("chai");

  describe("Lock", function () {
    it("output of getString should be abcxyz with input of xyz", async function () {
      const contract = await ethers.deployContract("Lock");

      const result = "abcxyz";
      expect(await contract.getString("xyz")).to.equal("abcxyz");
    });

    it("output of getString should be abcxyz with input of xyz", async function () {
      const contract = await ethers.deployContract("Lock");
      const result = "abcxyz";
      expect(await contract.getString("xyz")).to.equal(result);
    });
  });
  ```

- test

  > npx hardhat test

- deploy (sepolia)

  > deploy.js 수정

  ```javascript
  const hre = require("hardhat");

  async function main() {
    const [deployer] = await ethers.getSigners();
    console.log("deploying contract with account : ", deployer.address);

    const contract = await ethers.deployContract("Lock");

    console.log("Contract Address : ", await contract.getAddress());
  }

  // We recommend this pattern to be able to use async/await everywhere
  // and properly handle errors.
  main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
  });
  ```

  > hardhat.config.js 수정

  ```javascript
  require("@nomicfoundation/hardhat-toolbox");

  // sepolia로 테스트 함
  const INFURA_API_KEY = "API KEY 입력";
  const pvk = "Wallet PrivateKey 입력";

  /** @type import('hardhat/config').HardhatUserConfig */
  module.exports = {
    solidity: "0.8.19",

    networks: {
      sepolia: {
        url: `https://sepolia.infura.io/v3/${INFURA_API_KEY}`, // provider
        accounts: [pvk], // signer
      },
    },

    etherscan: {
      apiKey: "Etherscan API Key입력",
    },
  };
  ```

  > npx hardhat run scripts/deploy.js --network sepolia  
  > 결과
  >
  > > deploying contract with account : 0x7809e03Ed0458782182045C107057b7577783510
  > > Contract Address : 0x0F7Cb6bF714FD0BE0Ea6d651bd3EDd8aDf5e746D

- contract verify

> npx hardhat verify --network sepolia 컨트랙트주소  
> sepolia etherscan에서 확인하기
