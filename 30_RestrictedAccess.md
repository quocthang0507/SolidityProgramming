|Bài trước đó|Mục lục|Bài kế tiếp|
|---|---|---|
|[Mẫu rút tiền](29_WithdrawalPattern.md)|[Mục lục](README.md)|[Hợp đồng](31_Contracts.md)|

# Truy cập hạn chế (Restricted Access)

Truy cập hạn chế đến một hợp đồng là một thực tế phổ biến. Mặc định, một trạng thái hợp đồng là chỉ-đọc trừ khi nó được chỉ định là **public**.

Chúng ta có thể hạn chế người chỉnh sửa trạng thái của hợp đồng hoặc gọi các hàm của một hợp đồng sử dụng bộ điều chỉnh (*modifier*). Chúng ta sẽ tạo và sử dụng nhiều modifier như sau:

* **onlyBy**: Một khi được sử dụng trong một hàm thì chỉ có người gọi được nhắc đến có thể gọi hàm này.
* **onlyAfter**: Một khi được sử dụng trong một hàm thì hàm này có thể được gọi sau một khoảng thời gian nhất định.
* **costs**: Một khi được sử dụng trong một hàm thì người gọi có thể gọi hàm này nếu giá trị nhất định được cung cấp.

## Ví dụ

```solidity
pragma solidity ^0.5.0;

contract Test {
    address public owner = msg.sender;
    uint256 public creationTime = now;

    modifier onlyBy(address _account) {
        require(msg.sender == _account, "Sender not authorized.");
        _;
    }

    function changeOwner(address _newOwner) public onlyBy(owner) {
        owner = _newOwner;
    }

    modifier onlyAfter(uint256 _time) {
        require(now >= _time, "Function called too early.");
        _;
    }

    function disown() public onlyBy(owner) onlyAfter(creationTime + 6 weeks) {
        delete owner;
    }

    modifier costs(uint256 _amount) {
        require(msg.value >= _amount, "Not enough Ether provided.");
        _;
        if (msg.value > _amount) msg.sender.transfer(msg.value - _amount);
    }

    function forceOwnerChange(address _newOwner)
        public
        payable
        costs(200 ether)
    {
        owner = _newOwner;
        if (uint256(owner) & 0 == 1) return;
    }
}
```
