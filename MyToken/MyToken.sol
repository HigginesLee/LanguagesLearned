// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    address[] private _whitelist; // 白名单数组
    address private _owner; // 合约控制者

    constructor() ERC20("MyToken", "MTK"){
        _owner = 0xfa6Be9473dc9e9193af66Af376832948A6462818; // 合约控制者地址为合约发布地址
    }

    function isInWhitelist(address addr) private view returns (bool) {
        for (uint i = 0; i< _whitelist.length; i++){
            if (addr == _whitelist[i]) {
                return true;
            }
        }
        return false;
    }

    function addToWhitelist(address addr) public returns (bool) {
        require(msg.sender == _owner, "you are not owner");

        require(!isInWhitelist(addr), "address already in whitelist");
        _whitelist.push(addr);
        return true;
    }

    function removeFromWhitelist(address addr) public returns (bool) {
        require(msg.sender == _owner, "you are not owner");

        require(!isInWhitelist(addr), "address already in whitelist");

        for (uint i = 0; i < _whitelist.length; i++){
            if (addr == _whitelist[i]) {
                delete _whitelist[i];
                return true;
            }
        }
        return false;
    }
}


contract C{
    function f(uint key, uint value)  public {
        // ....
    }

    function g() public {
        f({value: 2, key:3});
    }

    function h(uint key, uint) public pure returns (uint){
        return key;
    }

}

// 解构赋值 返回多值

contract D{
    uint[] data;

    function f() public pure returns (uint, bool, uint){
        return (7, true, 2);
    }

    function g() public {
        (uint x, bool y, uint z) = f();
        // 交换两个值， 不适用于非值类型的存储变量
        (x, z) = (z, x);

        // 元组的末尾元素可以省略, 将长度设置为7
        (data.length, ,) = f();
    }
}


mapping (uint => mapping(bool => Data[])) public data;

{
    1: {
        true: struct {
        a,b , {1: 1}
}
}
}