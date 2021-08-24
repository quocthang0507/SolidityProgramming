|Bài trước đó|Mục lục|Bài kế tiếp|
|---|---|---|
|[Bộ điều chỉnh hàm](22_FunctionModifiers.md)|[Mục lục](README.md)|[Hàm Pure](24_PureFunctions.md)|

# Hàm View (View Functions)

Hàm **View** đảm bảo rằng nó không thể thay đổi trạng thái. Một hàm có thể được khai báo như **view**. Trong hàm nếu có các câu lệnh sau, thì trình biên dịch sẽ đưa ra cảnh báo.

* Thay đổi các biến trạng thái
* Sự kiện phát ra (*Emitting events*)
* Tạo hợp đồng khác
* Sử dụng `selfdestruct`
* Gửi Ether thông qua lời gọi
* Gọi bất kỳ hàm nào mà không được đánh dấu là `view` hoặc `pure`
* Sử dụng lời gọi cấp thấp
* Sử dụng assembly nội dòng có chứa opcode (*operation code*) nhất định

Phương thức `Getter` là chức năng xem mặc định.

## Ví dụ

```solidity
pragma solidity ^0.5.0;

contract Test {
    function getResult() public view returns (uint256 product, uint256 sum) {
        uint256 a = 1; // local variable
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
