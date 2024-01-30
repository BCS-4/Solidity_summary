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
