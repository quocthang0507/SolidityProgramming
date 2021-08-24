|Bài trước đó|Mục lục|Bài kế tiếp|
|---|---|---|
|[Hướng dẫn phong cách](20_StyleGuide.md)|[Mục lục](README.md)|[Bộ điều chỉnh hàm](22_FunctionModifiers.md)|

# Hàm (Functions)

Hàm là một nhóm mã có thể tái sử dụng (*reusable*) mà có thể được gọi ở bất kỳ nơi nào trong chương trình. Điều này loại bỏ (*eliminate*) các đoạn mã được viết lại nhiều lần. Nó giúp lập trình viên trong việc viết các mã mô-đun (*modular*).

Giống như các ngôn ngữ lập trình nâng cao khác, Solidity cũng hỗ trợ tất cả các tính năng cần thiết để viết mã mô-đun bằng hàm.

## Định nghĩa hàm

Trước khi sử dụng một hàm, chúng ta cần định nghĩa nó. Cách thông thường để định nghĩa một hàm trong Solidity là sử dụng từ khóa **function**, theo sau là tên hàm, danh sách tham số (có thể không có) và một khối lệnh bao quanh bởi dấu ngoặc nhọn.

### Cú pháp

```solidity
function function-name(parameter-list) scope returns() {
   //statements
}
```

### Ví dụ

```solidity
pragma solidity ^0.5.0;

contract Test {
   function getResult() public view returns(uint){
      uint a = 1; // local variable
      uint b = 2;
      uint result = a + b;
      return result;
   }
}
```

## Gọi hàm

Để gọi (*invoke*) một hàm ở nơi nào đó trong Contract, bạn chỉ cần gọi tên của chúng.

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
        return string(bstr); //access local variable
    }
}
```

Kết quả:

```
0: string: 3
```

## Tham số hàm

Hàm có thể có hoặc không có tham số. Một hàm có thể sử dụng nhiều tham số, được phân tách bằng dấu phẩy. Tham số được sử dụng để nhận các giá trị từ bên ngoài vào hàm và thao tác trên các giá trị đó.

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
        return string(bstr); //access local variable
    }
}
```

Kết quả:

```
0: string: 3
```

## Trả về giá trị

Hàm có thể trả về giá trị qua từ khóa **return**. Lệnh này nên được dùng ở cuối một hàm. Trong ví dụ trên, hàm `integerToString` trả về một chuỗi.

Ở ví dụ sau, một hàm có thể trả về nhiều giá trị.

```solidity
pragma solidity ^0.5.0;

contract Test {
    function getResult() public view returns (uint256 product, uint256 sum) {
        uint256 a = 1; // local variable
        uint256 b = 2;
        product = a * b;
        sum = a + b;

        //alternative return statement to return multiple values
        //return (a * b, a + b);
    }
}
```

Kết quả:

```
0: uint256: product 2
1: uint256: sum 3
```
