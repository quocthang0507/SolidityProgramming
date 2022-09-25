|Bài trước đó|Mục lục|Bài kế tiếp|
|---|---|---|
|[Sự kiện](38_Events.md)|[Mục lục](README.md)||

# Xử lý lỗi (Error Handling)

Solidity cung cấp đa dạng các hàm để xử lý lỗi. Thông thường khi một lỗi được xảy ra, trạng thái được hoàn nguyên (*reverted*) về trạng thái ban đầu. Các kiểm tra khác là để ngăn chặn truy cập mã trái phép. Dưới đây là một số phương thức quan trọng được dùng trong xử lý lỗi.

* **assert(bool condition)**: Trong trường hợp không thỏa mãn, phương thức này gây ra một opcode không hợp lệ và bất kỳ thay đổi nào đến trạng thái được hoàn nguyên. Phương thức này được dùng cho xử lý lỗi nội bộ.
* **require(bool condition)**: Trong trường hợp không thỏa mãn, phương thức này gọi hoàn nguyên về trạng thái ban đầu. Phương thức này được dùng cho lỗi đầu vào hoặc các thành phần bên ngoài.
* **require(bool condition, string memory message)**: Trong trường hợp không thỏa mãn, phương thức này gọi hoàn nguyên về trạng thái ban đầu. Phương thức này được dùng cho những lỗi đầu vào hoặc các thành phần bên ngoài. Nó cung cấp một tùy chọn cung cấp một thông điệp tùy chỉnh.
* **revert()**: Phương thức này dừng thực thi và hoàn nguyên bất kỳ thay đổi nào đến trạng thái.
* **revert(string memory reason)**: Phương thức này dừng thực thi và hoàn nguyên bất kỳ thay đổi nào đến trạng thái. Nó cung cấp một tùy chọn để cung cấp một thông điệp tùy chỉnh.

## Ví dụ

```solidity
pragma solidity ^0.5.0;

contract Vendor {
    address public seller;
    modifier onlySeller() {
        require(msg.sender == seller, "Only seller can call this.");
        _;
    }

    function sell(uint256 amount) public payable onlySeller {
        if (amount > msg.value / 2 ether) revert("Not enough Ether provided.");
        // Perform the sell operation.
    }
}
```

Khi `revert` được gọi, nó sẽ trả về dữ liệu thập lục phân như sau:

```
0x08c379a0                     // Function selector for Error(string)
0x0000000000000000000000000000000000000000000000000000000000000020 // Data offset
0x000000000000000000000000000000000000000000000000000000000000001a // String length
0x4e6f7420656e6f7567682045746865722070726f76696465642e000000000000 // String data
```
