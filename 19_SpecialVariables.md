|Bài trước đó|Mục lục|Bài kế tiếp|
|---|---|---|
|[Đơn vị Ether](18_Conversations.md)|[Mục lục](README.md)|[Hướng dẫn phong cách](20_StyleGuide.md)|

# Các biến đặc biệt (Special Variables)

|STT|Tên biến|Mô tả|
|---|---|---|
|1|blockhash(uint blockNumber) returns (bytes32)|Mã băm của một khối, chỉ làm việc cho 256 khối gần nhất, ngoại trừ các khối hiện tại|
|2|block.coinbase (address payable)|Địa chi của người đào (*miner*) khối hiện tại|
|3|block.difficulty (uint)|Độ khó của khối hiện tại|
|4|block.gaslimit (uint)|Giới hạn gas của khối hiện tại|
|5|block.number (uint)|Số của khối hiện tại|
|6|block.timestamp|Dấu thời gian của khối hiện tại tính bằng giây kể từ epoch unix|
|7|gasleft() returns (uint256)|Gas còn lại|
|8|msg.data (bytes calldata)|Calldata hoàn thành|
|9|msg.sender (address payable)|Người gửi thông điệp|
|10|msg.sig (bytes4)|4 byte đầu tiên của calldata (chẳng hạn mã nhận diện hàm)|
|11|msg.value (uint)|Số lượng wei được gửi kèm thông điệp|
|12|now (uint)|Dấu thời gian khối hiện tại (bí danh cho block.timestamp)|
|13|tx.gasprice (uint)|Giá gas của giao dịch|
|14|tx.origin (address payable)|Người gửi giao dịch|

## Ví dụ

```solidity
pragma solidity ^0.5.0;

contract LedgerBalance {
    mapping(address => uint256) public balances;

    function updateBalance(uint256 newBalance) public {
        balances[msg.sender] = newBalance;
    }
}

contract Updater {
    function updateBalance() public returns (uint256) {
        LedgerBalance ledgerBalance = new LedgerBalance();
        ledgerBalance.updateBalance(10);
        return ledgerBalance.balances(address(this));
    }
}
```

## Kết quả

Trong hợp đồng *Updater*, Nhấn nút **updateBalance** để đặt giá trị 10 và xem *decoded output*:

```
{
   "0": "uint256: 10"
}
```
