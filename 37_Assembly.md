|Bài trước đó|Mục lục|Bài kế tiếp|
|---|---|---|
|[Thư viện](36_Libraries.md)|[Mục lục](README.md)|[Sự kiện](38_Events.md)|

# Hợp ngữ (Assembly)

Solidity cung cấp một tùy chọn sử dụng ngôn ngữ **Hợp ngữ (*Assembly*)** nội dòng để viết hợp ngữ bên trong mã nguồn Solidity. Chúng ta có thể viết một mã hợp ngữ  độc lập (*standalone*) mà sau đó được chuyển đổi thành bytecode. Hợp ngữ độc lập là một ngôn ngữ trung gian cho một trình biên dịch Solidity và nó chuyển đổi mã Solidity đến một hợp ngữ độc lập và sau đó là bytecode. Chúng ta có thể sử dụng cùng một ngôn ngữ được sử dụng trong hợp ngữ nội dòng để viết mã trong một hợp ngữ độc lập.

## Hợp ngữ nội dòng (*Inline Assembly*)

Mã hợp ngữ nội dòng có thể được xen kẽ trong mã nguồn Solidity để có kiểm soát chi tiết hơn đối với EVM và được sử dụng đăc biệt khi viết các hàm thư viện.

Một mã hợp ngữ được viết bên trong khối `assembly {...}`.

## Ví dụ

```solidity
pragma solidity ^0.5.0;

library Sum {
    function sumUsingInlineAssembly(uint256[] memory _data)
        public
        pure
        returns (uint256 o_sum)
    {
        for (uint256 i = 0; i < _data.length; ++i) {
            assembly {
                o_sum := add(o_sum, mload(add(add(_data, 0x20), mul(i, 0x20))))
            }
        }
    }
}

contract Test {
    uint256[] data;

    constructor() public {
        data.push(1);
        data.push(2);
        data.push(3);
        data.push(4);
        data.push(5);
    }

    function sum() external view returns (uint256) {
        return Sum.sumUsingInlineAssembly(data);
    }
}
```

Chọn hợp đồng **Test** trước khi nhấn nút **Deploy**.

```
0: uint256: 15
```
