|Bài trước đó|Mục lục|Bài kế tiếp|
|---|---|---|
|[Câu lệnh điều kiện](11_DecisionMaking.md)|[Mục lục](README.md)|[Mảng](13_Arrays.md)|

# Chuỗi (Strings)

Solidity hỗ trợ chuỗi ký tự (*string literal*) nằm trong cặp dấu nháy đơn (') và dấu nháy kép (") với kiểu dữ liệu là `string`.

```solidity
pragma solidity ^0.5.0;

contract SolidityTest {
    string data = "test";
}
```

Trong ví dụ trên, `"test"` là chuỗi ký tự có kiểu dữ liệu `string`. Một cách ưu tiên hơn là sử dụng kiểu `byte` vì kiểu `string` cần nhiều *gas* hơn để hoạt động so với `byte`. Solidity tích hợp hỗ trợ chuyển đổi giữa `byte` sang `string` và ngược lại. Chúng ta có thể gán chuỗi `string` sang một biến `byte32` dễ dàng.

```solidity
pragma solidity ^0.5.0;

contract SolidityTest {
    byte32 data = "test";
}
```

## Ký tự đặc biệt

|STT|Ký tự|Mô tả|
|---|---|---|
|1|`\n`|Bắt đầu một dòng mới|
|2|`\\`|Dấu gạch chéo ngược (*backslash*)|
|3|`\'`|Dấu nháy đơn (*single quote*)|
|4|`\"`|Dấu nháy kép (*double quote*)|
|5|`\b`|Dấu backspace|
|6|`\f`|Form Feed|
|7|`\r`|Trở về đầu dòng|
|8|`\t`|Tab|
|9|`\v`| Tab dọc|
|10|`\xNN`|Đại diện giá trị mã hex và chèn byte thích hợp|
|11|`\uNNNN`|Đại diện giá trị mã Unicode và chèn chuỗi (*sequence*) UTF-8|

## Chuyển đổi `bytes` sang `string`

`bytes` có thể chuyển đổi sang `string` nhờ vào hàm khởi tạo `string()`.

```solidity
bytes memory bstr = new bytes(10);
string message = string(bstr);  
```

Ví dụ:

```solidity
pragma solidity ^0.5.0;

contract SolidityTest {
    constructor() public {}

    function getResult() public view returns (string memory) {
        uint256 a = 1;
        uint256 b = 2;
        uint256 result = a + b;
        return integerToString(result);
    }

    function integerToString(uint256 _i) internal pure returns (string memory) {
        if (_i == 0) {
            return "0";
        }
        uint256 j = _i;
        uint256 len;

        while (j != 0) {
            len++;
            j /= 10;
        }
        bytes memory bstr = new bytes(len);
        uint256 k = len - 1;

        while (_i != 0) {
            bstr[k--] = bytes1(uint8(48 + (_i % 10)));
            _i /= 10;
        }
        return string(bstr);
    }
}
```

Kết quả:

```
0: string: 3
```
