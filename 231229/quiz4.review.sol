/*
    자동차를 운전하려고 합니다.
    자동차의 상태에는 정지, 운전중, 시동 끔, 연료없음 총 4가지 상태가 있습니다.

    정지는 속도가 0인 상태, 운전 중은 속도가 있는 상태이다. 

    * 악셀 기능 - 속도를 1 올리는 기능, 악셀 기능을 이용할 때마다 연료가 2씩 줄어듬, 연료가 30이하면 더 이상 악셀을 이용할 수 없음, 속도가 70이상이면 악셀 기능은 더이상 못씀
    * 브레이크 기능 - 속도를 1 줄이는 기능, 브레이크 기능을 이용할 때마다 연료가 1씩 줄어듬, 속도가 0이면 브레이크는 더이상 못씀
    * 시동 끄기 기능 - 시동을 끄는 기능, 속도가 0이 아니면 시동은 꺼질 수 없음
    * 시동 켜기 기능 - 시동을 켜는 기능, 시동을 키면 정지 상태로 설정됨
    * 주유 기능 - 주유하는 기능, 주유를 하면 1eth를 지불해야하고 연료는 100이 됨

    지불은 smart contract에게 함.
    ----------------------------------------------------------------------------------------
    * 주유소 사장님은 2번 지갑의 소유자임(2번 지갑 주소 하드코딩(복붙) 하면 됨), 주유소 사장님이 withdraw하는 기능
    * 지불을 미리 하고 주유시 차감하는 기능
*/

// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

contract QUIZ4 {

    enum CarStatus {
        stop,
        off,
        driving,
        outOfFuel
    }

    struct Car {
        uint vel;
        uint gas;
        CarStatus status;
    }

    address payable owner;
    constructor() {
        owner = payable(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2);  /*2번 지갑*/
    }

    Car myCar;
    uint paid;

    // * 악셀 기능
    function accel() public {
        require(myCar.vel < 70 && myCar.gas > 30, "go back");
        require(myCar.status == CarStatus.driving || myCar.status == CarStatus.stop);

        if(myCar.status != CarStatus.driving) {
            myCar.status = CarStatus.driving;
        }

        myCar.vel += 10;
        myCar.gas -= 20;
    }

    // * 브레이크 기능
    function Break() public {
        require(myCar.status == CarStatus.driving, "go back");

        myCar.vel -= 10;
        myCar.gas -= 10;

        if(myCar.vel == 0) {
            myCar.status = CarStatus.stop;
        }
    }

    // * 시동 끄기 기능
    function turnOff() public {
        require(myCar.vel == 0 || myCar.status == CarStatus.stop, "go back");
        myCar.status = CarStatus.off;
    }

    // * 시동 켜기 기능
    function turnOn() public {
        require(myCar.status == CarStatus.off, "go back");
        myCar.status = CarStatus.stop;
    }

    // * 지불을 미리 하고 주유시 차감하는 기능
    // 충전 기능
    function deposit() public payable {
        require(msg.value == 1 ether, "go back");
        paid += msg.value;
    }

    // * 주유 기능
    function fillingUp() public payable {
        require((paid >= 1 ether || msg.value == 1 ether) && myCar.status == CarStatus.stop);
        if(msg.value != 1 ether) {
            paid -= 1 ether;
        }
        myCar.gas += 100;
    }

    function withdraw() public {
        owner.transfer(address(this).balance);
    }
}