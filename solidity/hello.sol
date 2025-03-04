pragma solidity >=0.7.1 <0.9.0;

contract TinyAction {

    // 定义一个事件
    event HighestBidIncreased(address bidder, uint amount);

    function bid() public payable {
        emit HighestBidIncreased(msg.sender, msg.value);
    }

    // 定义一个新函数
	function Mybid() public payable {
		// .....
	}

	// 定义一个对外接口
	function helper(uint x) pure returns (uint){
		return x * 2;
	}

    // 定义一个错误事件

    error NotEnoughFunds(uint requested, uint available);

    mapping (address => uint) balances;

    function transfer(address to, uint amount) public {
        uint balance = balances[msg.sender];
        if (balance < amount)
            revert NotEnoughFunds(amount, balance);
        balances[msg.sender] -= amount;
        balances[to] += amount;
    }

    // 枚举类型

    enum State{Created, Locked, InValid}


}


contract MyPurchase {
    address public seller;
    modifier onlySeller() {
        require(msg.sender == seller, "Only Seller can call this method");
        _;
}
    function abort() public onlySeller { // 修改器用法
    // ...
    }
}
