|Bài trước đó|Mục lục|Bài kế tiếp|
|---|---|---|
|[Hàm View](23_ViewFunctions.md)|[Mục lục](README.md)|[Hàm Fallback](25_FallbackFunctions.md)|

# Hàm Pure (Pure Function)

Hàm **Pure** đảm bảo rằng nó không thể đọc hoặc chính sửa trạng thái. Nếu trong hàm **Pure** mà có các lệnh đọc trạng thái thì trình biên dịch sẽ cảnh báo lỗi.

* Đọc các biến trạng thái
* Truy cập `address(this).balance` hoặc `<address>.balance`
* Truy cập bất kỳ biến đặc biệt của khối, tx, msg (msg.sig, msg.data, có thể được đọc)
* Gọi bất kỳ hàm nào không phải hàm pure
* Sử dụng assembly nội dòng có chứa cá opcode nhất định.

Hàm Pure có thể sử dụng `revert()` và `require()` để hoàn nguyên (*revert*) các thay đổi trạng thái tiềm ẩn nếu một lỗi xảy ra.

## Ví dụ

```solidity
pragma solidity ^0.5.0;

contract Test {
    function getResult() public pure returns (uint256 product, uint256 sum) {
        uint256 a = 1;
        uint256 b = 2;
        product = a * b;
        sum = a + b;
    }
}
```

## Kết quả

```
0: uint256: product 2
1: uint256: sum 3
```
