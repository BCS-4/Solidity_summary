import { useState, useEffect } from "react";
import Web3 from "web3";

function App() {
  const [blockNumber, setBlockNumber] = useState();
  const [balance, setBalance] = useState();
  const pvKey = `0x${process.env.REACT_APP_PVKEY}`;

  const web3 = new Web3(
    `wss://sepolia.infura.io/ws/v3/${process.env.REACT_APP_INFURA_KEY}`
  );
  const account = web3.eth.accounts.privateKeyToAccount(pvKey).address;

  useEffect(() => {
    async function subscribeBlock() {
      const subscription = await web3.eth.subscribe("newHeads");
      subscription.on("data", async (blockHead) => {
        console.log("number of block : ", blockHead.number);
        setBlockNumber(Number(blockHead.number));
      });
    }

    subscribeBlock();

    async function getBalance() {
      var balance = await web3.eth.getBalance(account);
      setBalance(Number(balance));
    }

    getBalance();
  });

  return (
    <div>
      <li>current Block Number is : {blockNumber}</li>
      <li>current Wallet is : {account}</li>
      <li>current Balance is : {balance}</li>
    </div>
  );
}

export default App;
