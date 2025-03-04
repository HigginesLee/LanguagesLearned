// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

contract Purchase {
    uint public value;
    address public seller;
    address public buyer;

    enum State { Created, Locked, Inactive }
    State public state;

    // 确保msg.value是一个偶数
    // 如果是一个奇数，将会截断， 通过乘法检查它不是计数

    constructor() public payable{
        seller = msg.sender;
        value = msg.value / 2;
        require((2*value) == msg.value, "Value has to be even.");
    }

    modifier condition(bool _condition){
        require(_condition);
        _;
    }

    modifier onlyBuyer(){
        require(
            msg.sender == buyer,
            "Only buyer can call this"
        );
        _;
    }

    modifier onlySeller(){
        require(
            msg.sender == seller,
            "Only seller can call this."
        );
        _;
    }

    modifier inState(State _state){
        require(state==_state, "Invalid state");
        _;
    }

    event Aborted();
    event PurchaseConfirmed();
    event ItemReceive();

    // 中止购买并回收以太币
    function abort() public onlySeller inState(State.Created){
        emit Aborted();
        state = State.Inactive;
        seller.transfer(address(this).balance);
    }

    // 买家确认购买
    // 交易必须包含2*value以太币， 以太币会被锁定直到confirmReceived被调用

    function confirmPurchase() public inState(State.Created) condition(msg.value == 2*value) payable{
        emit PurchaseConfirmed();
        buyer = msg.sender;
        state = State.Locked;
    }

    // 确认买家已经收到物品
    function confirmReceived() public onlyBuyer inState(State.Locked){
        emit ItemReceive();
        state = State.Inactive;
        buyer.transfer(value);
        seller.transfer(address(this).balance);
    }
}
