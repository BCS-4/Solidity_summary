# hardhat 실습 (local testnet)

- 환경설정

> npm init  
> npm install --save-dev hardhat  
> npm install --save-dev @nomicfoundation/hardhat-toolbox  
> npx hardhat

- contracts/Lock.sol

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

- scripts/deploy.js

  ```javascript
  const hre = require("hardhat");

  async function main() {
    const [deployer] = await ethers.getSigners();
    console.log("deploying contract with account : ", deployer.address);

    const contract = await ethers.deployContract("Lock");

    console.log("Contract Address : ", await contract.getAddress());
  }
  ```

- npx hardhat node

  > 위 명령어를 실행하면 account 20개 확인 할 수 있음.

- compile (다른 터미널에서!)

  > npx hardhat compile

- deploy

  > npx hardhat run --network localhost scripts/deploy.js  
  > 위 명령어를 실행하면 node 터미널에서 확인 가능함.

- contract 확인 (npx hardhat console)

  > await ethers.deployContract("Lock")
  >
  > > target : contract address  
  > > fragments : methods Id  
  > > runnder.address : deploy account

  > const contract = await ethers.deployContract("Lock")
  >
  > > contract  
  > > contract.target
  > > contract.runner.address  
  > > contract.interface.fragments : 함수 확인  
  > > contract.a().then(console.log) : a 값 확인  
  > > contract.add(2, 3).then(console.log) : add(2, 3) 실행(결과 5)  
  > > contract.getAdd(4).then(console.log) : getAdd(4) 실행(결과 14)  
  > > contract.getString("a").then(console.log) : getString(a) 실행(결과 abca)  
  > > contract.d().then(console.log) : uint public d 확인(결과 0)  
  > > contract.getAdd_2(4, 5).then(console.log) : getAdd_2(4,5) 실행 후 d 확인해보면 값이 9로 변경 되어 있음 확인 (※ 상태변수 변경해서 돈을 사용했는데 node 터미널에서 나타나지 않음)

  > const [deployer] = await ethers.getSigners()
  >
  > > deployer  
  > > deployer.address
