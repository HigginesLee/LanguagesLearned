// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 <=0.9.0;

// @title 委托投票
contract Ballot {

    struct Voter{
        uint weight; // 计票权重
        bool voted; // 若为真，代表已投票
        address delegate; //委托人
        uint vote; // 投票提案索引
    }

    // 提案类型
    struct Proposal {
        bytes32 name; // 简称
        uint voteCount; // 投票数
    }

    address public chairperson;

    // 声明一个状态变量，为每个可能的地址存储一个`Voter`
    mapping(address=>Voter) public voters;


    // 一个`Proposal`结构类型的动态数组
    Proposal[] public personals;

    // 为`proposalNames`中的每个提案， 创建一个新的表决
    constructor(bytes32[] memory proposalNames){
        chairperson = msg.sender;
        voters[chairperson].weight = 1;

    }
}
