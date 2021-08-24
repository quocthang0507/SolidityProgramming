|Bài trước đó|Mục lục|Bài kế tiếp|
|---|---|---|
|[Hàm](21_Functions.md)|[Mục lục](README.md)|[Hàm View](23_ViewFunctions.md)|

# Bộ điều chỉnh hàm (Function Modifiers)

Bộ điều chỉnh hàm được dùng để thay đổi hành vi của một hàm. Ví dụ như thêm điều kiện vào một hàm.

Đầu tiên tạo một `modifier` có hoặc không có tham số.

```solidity
contract Owner {
   modifier onlyOwner {
      require(msg.sender == owner);
      _;
   }
   modifier costs(uint price) {
      if (msg.value >= price) {
         _;
      }
   }
}
```

Thâm hàm được chèn vào nơi có ký tự '_' xuất hiện trong định nghĩa của một bộ điều chỉnh. Nếu điều kiện của bộ điều chỉnh được thỏa mãn trong khi gọi hàm, thì hàm sẽ được thực thi và ngược lại, một ngoại lệ (*exception*) được tạo ra.

```solidity
pragma solidity ^0.5.0;

contract Owner {
    address owner;

    constructor() public {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
    modifier costs(uint256 price) {
        if (msg.value >= price) {
            _;
        }
    }
}

contract Register is Owner {
    mapping(address => bool) registeredAddresses;
    uint256 price;

    constructor(uint256 initialPrice) public {
        price = initialPrice;
    }

    function register() public payable costs(price) {
        registeredAddresses[msg.sender] = true;
    }

    function changePrice(uint256 _price) public onlyOwner {
        price = _price;
    }
}
```
