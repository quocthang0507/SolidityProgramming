|Bài trước đó|Mục lục|Bài kế tiếp|
|---|---|---|
|[Hàm khởi tạo](33_Constructors.md)|[Mục lục](README.md)|[Giao diện](35_Interfaces.md)|

# Hợp đồng trừu tượng (Abstract Contracts)

Hợp đồng trừu tượng là một hợp đồng có chứa ít nhất một hàm mà không có thực hiện (*implementation*) gì. Hợp đồng như vậy được dùng như là hợp đồng cơ sở. Nói chung, một hợp đồng trừu tượng chứa cả các hàm được định nghĩa và các hàm trừu tượng. Hợp đồng dẫn xuất sẽ định nghĩa hàm trừu tượng và sử dụng hàm có sẵn khi được yêu cầu.

Trong trường hợp mà một hợp đồng dẫn xuất không định nghĩa hàm trừu tượng thì hợp đồng dẫn xuất đó sẽ được đánh dấu là trừu tượng.

## Ví dụ

```solidity
pragma solidity ^0.5.0;

contract Calculator {
    function getResult() public view returns (uint256);
}

contract Test is Calculator {
    function getResult() public view returns (uint256) {
        uint256 a = 1;
        uint256 b = 2;
        uint256 result = a + b;
        return result;
    }
}
```

## Kết quả

```
0: uint256: 3
```
