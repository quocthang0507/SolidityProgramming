|Bài trước đó|Mục lục|Bài kế tiếp|
|---|---|---|
|[Hàm mật mã học](28_CryptographicFunctions.md)|[Mục lục](README.md)|[Mẫu hạn chế](30_RestrictedAccess.md)|

# Mẫu rút tiền (Withdrawal Pattern)

Mấu rút tiền đảm bảo lời gọi chuyển khoản trực tiếp (*direct transfer call*) không gây ra một mối đe dọa bảo mật. Dưới đây là ví dụ sử dụng lời gọi chuyển tiền không bảo mật đến người khác.

```solidity
pragma solidity ^0.5.0;

contract Test {
    address payable public richest;
    uint256 public mostSent;

    constructor() public payable {
        richest = msg.sender;
        mostSent = msg.value;
    }

    function becomeRichest() public payable returns (bool) {
        if (msg.value > mostSent) {
            // Insecure practice
            richest.transfer(msg.value);
            richest = msg.sender;
            mostSent = msg.value;
            return true;
        } else {
            return false;
        }
    }
}
```

Hợp đồng trên có thể được hiển thị trong trạng thái không ổn định bằng cách khiến *richest* trở thành một hợp đồng của hàm `fallback` thất bại. Khi hàm `fallback` thất bại, hàm `becomeRichest()` cũng thất bại và hợp đồng sẽ mắc kẹt mãi mãi. Để giảm thiểu (*mitigate*) vấn đề này, chúng ta có thể sử dụng mẫu rút tiền.

Trong mẫu rút tiền, chúng ta sẽ cài đặt lại số tiền đang chờ xử lý trước mỗi lần chuyển. Nó đảm bảo rằng chỉ hợp đồng người gọi thất bại.

```solidity
pragma solidity ^0.5.0;

contract Test {
    address public richest;
    uint256 public mostSent;

    mapping(address => uint256) pendingWithdrawals;

    constructor() public payable {
        richest = msg.sender;
        mostSent = msg.value;
    }

    function becomeRichest() public payable returns (bool) {
        if (msg.value > mostSent) {
            pendingWithdrawals[richest] += msg.value;
            richest = msg.sender;
            mostSent = msg.value;
            return true;
        } else {
            return false;
        }
    }

    function withdraw() public {
        uint256 amount = pendingWithdrawals[msg.sender];
        pendingWithdrawals[msg.sender] = 0;
        msg.sender.transfer(amount);
    }
}
```
