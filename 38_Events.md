|Bài trước đó|Mục lục|Bài kế tiếp|
|---|---|---|
|[Hợp ngữ](37_Assembly.md)|[Mục lục](README.md)|[Xử lý lỗi](39_ErrorHandling.md)|

# Sự kiện (Events)

Sự kiện là một thành viên có thể kế thừa của một hợp đồng. Một sự kiện được tạo ra (*emitted*), nó lưu trữ các đối số được truyền trong nhật ký giao dịch. Những nhật ký này được lưu trữ trên chuỗi khối và có thể truy cập bằng địa chỉ của hợp đồng cho đến hợp đồng hiện diện trên chuỗi khối. Một sự kiện được tạo ra không thể truy cập từ bên trong hợp đồng, thậm chí không phải sự kiện mà tạo ra chúng.

Một sự kiện được khai vào bằng từ khóa `event`.

```solidity
//Declare an Event
event Deposit(address indexed _from, bytes32 indexed _id, uint _value);

//Emit an event
emit Deposit(msg.sender, _id, msg.value);
```

## Ví dụ

Đầu tiên là tạo một hợp đồng và tạo một sự kiện.

```solidity
pragma solidity ^0.5.0;

contract Test {
    event Deposit(address indexed _from, bytes32 indexed _id, uint _value);

    function deposit(bytes32 _id) public payable {
        emit Deposit(msg.sender, _id, msg.value);
    }
}
```

Sau đó truy cập sự kiện của hợp đồng trong mã JavaScript.

```javascript
var abi = /* abi as generated using compiler */;
var ClientReceipt = web3.eth.contract(abi);
var clientReceiptContract = ClientReceipt.at("0x1234...ab67" /* address */);

var event = clientReceiptContract.Deposit(function(error, result) {
   if (!error)console.log(result);
});
```

## Kết quả

```
{
    "returnValues": {
        "_from": "0x1111...FFFFCCCC",
        "_id": "0x50...sd5adb20",
        "_value": "0x420042"
    },
    "raw": {
        "data": "0x7f...91385",
        "topics": ["0xfd4...b4ead7", "0x7f...1a91385"]
    }
}
```
