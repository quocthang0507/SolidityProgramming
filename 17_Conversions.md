|Bài trước đó|Mục lục|Bài kế tiếp|
|---|---|---|
|[Ánh xạ](16_Mappings.md)|[Mục lục](README.md)|[Đơn vị Ether](18_EtherUnits.md)|

# Chuyển đổi (Conversions)

Solidity cho phép chuyển đổi ngầm định cũng như là chuyển đổi tường minh. Trình biên dịch Solidity cho phép chuyển đổi ngầm định giữa hai kiểu giá trị được miễn là có thể chuyển đổi không ngầm định và không mất thông tin. Ví dụ `uint18` có thể chuyển đổi sang `uint16` nhưng `int8` có thể chuyển đổi sang `uint256` như kiểu `int8` có thể chứa các giá trị âm mà không được phép ở `uint256`.

## Chuyển đổi tường minh

Chúng ta có thể chuyển đổi tường minh một kiểu dữ liệu sang kiểu khác sử dụng hàm xây dựng:

```solidity
int8 y = -3;
uint x = uint(y);
```

Bây giờ x = 0xfffff..fd == phép [bù 2](https://vi.wikipedia.org/wiki/B%C3%B9_2) (*two complement*) của -3 ở định dạng 256 bit.

Chuyển đổi sang kiểu nhỏ hơn lấy các bit thứ tự cao (*higher order bits*):

```solidity
uint32 a = 0x12345678;
uint16 b = uint16(a); // b = 0x5678
```

Chuyển đổi sang kiểu cao hơn thêm các bit đệm (*padding bits*) vào bên trái:

```solidity
uint16 a = 0x1234;
uint32 b = uint32(a); // b = 0x00001234
```

Chuyển đổi sang byte nhỏ hơn lấy dữ liệu bit thứ tự cao (*higher order data*):

```solidity
bytes2 a = 0x1234;
bytes1 b = bytes1(a); // b = 0x12
```

Chuyển đổi sang byte lớn hơn thêm các bit đệm vào bên phải:

```solidity
bytes2 a = 0x1234;
bytes4 b = bytes4(a); // 0x12340000
```

Chuyển đổi giữa kiểu `bytes` và `int` kích thước cố định chỉ có thể khi chúng cùng kích thước:

```solidity
bytes2 a = 0x1234;
uint32 b = uint16(a); // b = 0x00001234
uint32 c = uint32(bytes4(a)); // c = 0x12340000
uint8 d = uint8(uint16(a)); // d = 0x34
uint8 e = uint8(bytes1(a)); // e = 0x12
```

Các số thập lục phân (*hexadecimal numbers*) có thể được gán đến bất kỳ kiểu số nguyên nếu không cần cắt xén (*truncation*):

```solidity
uint8 a = 12; // no error
uint32 b = 1234; // no error
uint16 c = 0x123456; // error, as truncation required to 0x3456
```
