|Bài trước đó|Mục lục|Bài kế tiếp|
|---|---|---|
|[Quá tải hàm](26_Overloading.md)|[Mục lục](README.md)|[Hàm mật mã học](28_CryptographicFunctions.md)|

# Hàm toán học (Mathematical Functions)

Solidity cung cấp các hàm toán học được tích hợp. Dưới đây là các hàm hay được dùng:

* `addmod(uint x, uint y, uint k) returns (uint)`: Tính `(x + y) % k` trong đó phép cộng được thực hiện với độ chính xác tùy ý (*arbitrary precision*) và không lớn hơn 2^256.
* `mulmod(uint x, uint y, uint k) returns (uint)`: Tính `(x * y) % k` trong đó phép nhân được thực hiện với độ chính xác tùy ý và không lớn hơn 2^256.

## Ví dụ

```solidity
pragma solidity ^0.5.0;

contract Test {
    function callAddMod() public pure returns (uint256) {
        return addmod(4, 5, 3);
    }

    function callMulMod() public pure returns (uint256) {
        return mulmod(4, 5, 3);
    }
}
```

## Kết quả

Nhấn nút **callAddMod** trước và sau đó nhấn nút **callMulMod**.

![Hinh1](Images/Bai27/Hinh1.jpeg)

```
0: uint256: 0
0: uint256: 2
```
