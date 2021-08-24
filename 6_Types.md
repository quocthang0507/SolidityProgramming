|Bài trước đó|Mục lục|Bài kế tiếp|
|---|---|---|
|[Ghi chú](5_Comments.md)|[Mục lục](README.md)|[Biến](7_Variables.md)|

# Kiểu (Types)

Trong khi viết chương trình ở bất kỳ ngôn ngữ nào, chúng ta cần sử dụng nhiều loại biến khác nhau để lưu trữ các dữ liệu khác nhau. Các biến là các phần trong bộ nhớ được dành riêng để lưu trữ dữ liệu.

Các dữ liệu lưu trữ thuộc nhiều loại khác nhau như ký tự, một chuỗi ký tự, số nguyên, số thực (*floating point* và *double floating point*), boolean,... Dựa trên kiểu dữ liệu của biến mà hệ điều hành sẽ phân bổ bộ nhớ và quyết định những gì được lưu trong bộ nhớ dành riêng.

## Các kiểu dữ liệu

Solidity cung cấp cho lập trình viên nhiều kiểu dữ liệu được tích hợp sẵn cũng như là các kiểu dữ liệu người dùng tự định nghĩa. Bảng dưới đây liệt kê bảy kiểu cơ bản trong C++:

|Kiểu|Từ khóa|Ý nghĩa|
|---|---|---|
|Boolean|bool|true/false|
|Số nguyên|int/uint|Số nguyên có dấu/không dấu có kích thước khác nhau|
|Số nguyên|int8 đến int256/uint8 đến uint256|Số nguyên có dấu/không dấu từ 8 bit đến 256 bit (int/uint là bí danh của int256/uint256 )|
|Số chấm cố định|fixed/unfixed|Số chấm cố định có dấu và không dấu có kích thước khác nhau|
|Số chấm cố định|fixed/ufixedMxN|Số chấm cố định có dấu và không dấu với M là số bit của kiểu và N là dấu thập phân. M nên chia hết cho 8 và từ 8 đến 256, N từ 0 đến 80. fixed/ufixed là bí danh của fixed/ufixed128x18|

## Địa chỉ (address)

`address` giữ 20 byte giá trị đại diện cho kích thước của một địa chỉ Ethereum. Một địa chỉ có thể được dùng để lấy số dư (*balance*) bằng **phương thức số dư** và có thể được dùng để chuyển số dư đến địa chỉ khác sử dụng **phương thức chuyển tiền (transfer method)**. Ví dụ:

```solidity
address x = 0x212;
address myAddress = this;
if (x.balance < 10 && myAddress.balance >= 10) 
    x.transfer(10);
```
