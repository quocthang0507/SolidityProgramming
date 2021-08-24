|Bài trước đó|Mục lục|Bài kế tiếp|
|---|---|---|
|[Hợp đồng trừu tượng](34_AbstractContracts.md)|[Mục lục](README.md)|[Thư viện](36_Libraries.md)|

# Giao diện (Interfaces)

Interface tương tự như các hợp đồng trừu tượng nhưng được tạo ra nhờ sử dụng từ khóa `interface`. Dưới đây là các đặc điểm của một **interface**:

* Interface không thể có bất kỳ hàm nào được triển khai.
* Hàm của một interface chỉ có thể là kiểu *external*.
* Interface không thể có hàm khởi tạo.
* Interface không thể có các biến trạng thái.
* Interface có enum, struct mà có thể được truy cập sử dụng ký hiệu dấu chấm tên interface.

## Ví dụ

```solidity
pragma solidity ^0.5.0;

interface Calculator {
    function getResult() external view returns (uint256);
}

contract Test is Calculator {
    constructor() public {}

    function getResult() external view returns (uint256) {
        uint256 a = 1;
        uint256 b = 2;
        uint256 result = a + b;
        return result;
    }
}
```

## Kết quả

Trước khi **Deploy** thì chọn hợp đồng Test trước.

```
0: uint256: 3
```
