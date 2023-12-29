// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

contract GLOBAL_VARIABLES {
    uint time;

    function getTime() public view returns(uint) {
        return block.timestamp;
    }

    function getTime2() public view returns(uint) {
        return block.timestamp + 100;
    }

    function getTime3() public view returns(uint, uint) {
        return (block.timestamp + 10 seconds, block.timestamp + 10 minutes);
    }

    function getMsgSender() public view returns(address) {
        return msg.sender;
    }

    function getMsgValue() public payable returns(uint) {
        return msg.value;
    }

    function getMsgCalldata() public view returns(bytes calldata) {
        return msg.data;
    }

    function getMSGSIG() public pure returns(bytes4) {
        return msg.sig;
    }

    function getBlockNumber() public view returns(uint) {
        return block.number;
    }

    function getBlockChainId() public view returns(uint) {
        return block.chainid;
    }

    function getBlockCoinbase() public view returns(address) {
        return block.coinbase;
    }

    function getBlockDifficulty() public view returns(uint) {
        return block.prevrandao;
    }

    function getBlockHash() public view returns(bytes32) {
        return blockhash(getBlockNumber()-1);
    }

    function blockGasLimit() public view returns(uint) {
        return block.gaslimit;
    }

    function getGasLeft() public view returns(uint) {
        return gasleft();
    }

    function getTxGasPrice() public view returns(uint) {
        return tx.gasprice;
    }

    function getTxOrigin() public view returns(address) {
        return tx.origin;
    }

}