require("@nomicfoundation/hardhat-toolbox");

// sepolia로 테스트 함
const INFURA_API_KEY = "418d77dbf67944c9b5373f85b53df36a";
const pvk = "edb37b575ac293aea7aef29aff8ff66dc3f41fe4cc325abd4eaa1ddb77e44a53";

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
    apiKey: "SAGCI2NHHGNT12FX8PMN791I2395GC899F",
  },
};
