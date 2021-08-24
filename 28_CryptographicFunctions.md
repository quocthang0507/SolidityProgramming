|Bài trước đó|Mục lục|Bài kế tiếp|
|---|---|---|
|[Hàm toán học](27_MathematicalFunctions.md)|[Mục lục](README.md)|[Mẫu rút tiền](29_WithdrawalPattern.md)|

# Hàm mật mã học (Cryptographic Functions)

Solidity cung cấp các hàm mật mã học được tích hợp. Dưới đây liệt kê một vài hàm quan trọng như:

* `keccak256(bytes memory) returns (bytes32)`: Tính toán mã băm Keccal-256 của đầu vào
* `sha256(bytes memory) returns (bytes32)`: Tính toán mã băm SHA-256 của đầu vào
* `ripemd160(bytes memory) returns (bytes20)`: Tính toán mã băm RIPEMD-160 của đầu vào
* `ecrecover(bytes32 hash, uint8 v, bytes32 r, bytes32 s) returns (address)`: Khôi phục địa chỉ được liên kết (*associated*) với khóa công khai từ chữ ký đường cong elip (*elliptic curve signature*) hoặc trả về không nếu lỗi. Tham số hàm tương ứng với các giá trị ECDSA của chữ ký: `r` - 32 byte đầu tiên của chữ ký; `s` - 32 byte tiếp theo của chữ ký; `v` - 1 byte cuối của chữ ký. Hàm này trả về một địa chỉ.

## Ví dụ

```solidity
pragma solidity ^0.5.0;

contract Test {
    function callKeccak256() public pure returns (bytes32 result) {
        return keccak256("ABC");
    }
}
```

## Kết quả

```
0: bytes32: result 0xe1629b9dda060bb30c7908346f6af189c16773fa148d3366701fbaa35d54f3c8
```