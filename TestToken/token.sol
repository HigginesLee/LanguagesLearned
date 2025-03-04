contract TestToken{
    // 账户余额表
    mapping(address => uint256) public balances;

    /// @title 定义时间
    // 定义转账事件, 包含转账的from, to, value, gas_fee,message(备注信息)
    event TransferLog(address indexed from, address indexed to, uint256 value, 
                   unint256 gas_fee, string message);
    

    constructor() public {
        // 初始化合约的拥有者
        _owner = msg.sender;
        balances[_owner] = 10000000; // 初始化拥有者的余额为1000w代币，用户注册时赠送10代币
    }

    /// @title 拥有者特定的权限
    modifier onlyOwner() {
        require(msg.sender == _owner, "Only owner can call this method");
        _;
    }

    function gift(address to, uint256 value) onlyOwner public {
        // 向to账户赠送value个代币
        require(balances[_owner] >= value, "Not enough balance");
        balances[_owner] -= value;
        to.transfer(value);
    }

    function register(address addr, uint value) public {
        // 注册用户
        require(value >= 1, "value must be gather or equal 1wei");
        require(!isRegistered(addr), "address already registered");

    }


    function isRegistered(address addr) private view returns (bool) {
        // 判断用户是否已经注册, 由于用户代币消费一定不为0，因此只需要判断余额是否大于0即可
        return balances[addr] > 0;
    }



}