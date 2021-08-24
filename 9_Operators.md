|Bài trước đó|Mục lục|Bài kế tiếp|
|---|---|---|
|[Phạm vi biến](8_VariableScope.md)|[Mục lục](README.md)|[Vòng lặp](10_Loops.md)|

# Toán tử (Operators)

Trong biểu thức đơn giản sau: **1 + 2 = 3**. Số **1** và số **2** được gọi là toán hạng (*operand*) còn **3** được gọi là toán tử (*operator*).

Solidity hỗ trợ các loại toán tử sau:

* **Toán tử số học (*Arithmetic Operators*)**

* **Toán tử so sánh (*Comparison Operators*)**

* **Toán tử luận lý/quan hệ (*Logical/ Relational Operators*)**

* **Toán tử gán (*Assignment Operators*)**

* **Toán tử điều kiện/tam phân) (*Conditional/Ternary Operators*)**

## Toán tử số học

Giả sử biến A có giá trị 10 và biến B có giá trị 20.

### Ví dụ

```solidity
pragma solidity ^0.5.0;

contract SolidityTest {
    constructor() public{
    }

    function getResult() public view returns(uint){
        uint a = 1; 
        uint b = 2;
        uint result = a + b; //arithmetic operation
        return result; 
    }
}
```

### Kết quả

```
0: uint256: 3
```

|STT|Toán tử|Mô tả|
|---|---|---|
|1|`+` (Addition)|Cộng hai toán hạng. `A + B = 30`|
|2|`-` (Subtraction)|Trừ hai toán hạng. `A - B = -10`|
|3|`*` (Multiplication)|Nhân hai toán hạng. `A * B = 200`|
|4|`/` (Division)|Chia tử số (*numerator*) cho mẫu số (*denominator*). `B / A = 2`|
|5|`%` (Modulus)|Chia lấy phần dư là số nguyên. `B % A = 0`|
|6|`++` (Increment)|Tăng số nguyên một đơn vị. `A+= = 11`|
|7|`--` (Decrement)|Giảm số nguyên một đơn vị. `A-- = 9`|

## Toán tử so sánh

Giả sử biến A có giá trị 10 và biến B có giá trị 20.

### Ví dụ

```solidity
pragma solidity ^0.5.0;

contract SolidityTest {
uint storedData; 

constructor() public{
    storedData = 10;   
}

function getResult() public view returns(string memory){
    uint a = 1; // local variable
    uint b = 2;
    uint result = a + b;
    return integerToString(result); 
}

function integerToString(uint _i) internal pure 
    returns (string memory _uintAsString) {
        if (_i == 0) {   //comparison operator
            return "0";
        }
        uint j = _i;
        uint len;
        
        while (j != 0) {  //comparison operator
            len++;
            j /= 10;
        }
        bytes memory bstr = new bytes(len);
        uint k = len - 1;
        
        while (_i != 0) {
            bstr[k--] = byte(uint8(48 + _i % 10));
            _i /= 10;
        }
        return string(bstr);//access local variable
    }
}
```

### Kết quả

```
0: string: 3
```

|STT|Toán tử|Mô tả|
|---|---|---|
|1|`==` (Equal)|Hai toán hạng có bằng nhau hay không. `(A == B) TRUE`|
|2|`!=` (Not Equal)|Hai toán hạng có khác nhau hay không. `(A != B) TRUE`|
|3|`>` (Greater than)|Toán hạng bên trái có lớn hơn toán hạng bên phải không. `(A > B) FALSE`|
|4|`<` (Less than)|Toán hạng bên trái có nhỏ hơn toán hạng bên phải không. `(A < B) TRUE`|
|5|`>=` (Greater than or Equal to)|Toán hạng bên trái có lớn hơn hoặc bằng toán hạng bên phải không. `(A >= B) FALSE`|
|6|`<=` (Less than or Equal to)|Toán hạng bên trái có nhỏ hơn hoặc bằng toán hạng bên phải không. `(A <= B) TRUE`|

## Toán tử luận lý

Giả sử biến A có giá trị 10 và biến B có giá trị 20.

### Ví dụ

```solidity
pragma solidity ^0.5.0;

contract SolidityTest {
uint storedData; // State variable

constructor() public{
    storedData = 10;   
}

function getResult() public view returns(string memory){
    uint a = 1; // local variable
    uint b = 2;
    uint result = a + b;
    return integerToString(storedData); //access the state variable
}

function integerToString(uint _i) internal pure 
    returns (string memory) {
        if (_i == 0) {
            return "0";
        }
        uint j = _i;
        uint len;
        
        while (!(j == 0)) {  //logical operator
            len++;
            j /= 10;
        }
        bytes memory bstr = new bytes(len);
        uint k = len - 1;
        
        while (_i != 0) {
            bstr[k--] = byte(uint8(48 + _i % 10));
            _i /= 10;
        }
        return string(bstr);
    }
}
```

### Kết quả

```
0: string: 3
```

|STT|Toán tử|Mô tả|
|---|---|---|
|1|`&&` (Logical AND)|Hai mệnh đề có cùng giá trị chân lý (đúng/sai) hoặc nếu là hai số thì chúng có cùng khác không hay không. `(A && B) TRUE`|
|2|<code>&#124;&#124;</code> (Logical OR)|Hai toán hạng có khác nhau hay không. `(A` <code>&#124;&#124;</code> `B) TRUE`|
|3|`!` (Logical NOT)|Toán tử một ngôi đảo ngược giá trị chân lý (đúng -> sai, sai -> đúng). `!(A && B) FALSE`|

## Toán tử dịch bit

Giả sử biến A có giá trị 2 và biến B có giá trị 3.

### Ví dụ

```solidity
pragma solidity ^0.5.0;

contract SolidityTest {
uint storedData; 

constructor() public{
    storedData = 10;   
}

function getResult() public view returns(string memory){
    uint a = 2; // local variable
    uint b = 2;
    uint result = a & b;  // bitwise operation
    return integerToString(result); 
}

function integerToString(uint _i) internal pure 
    returns (string memory) {
        if (_i == 0) {
            return "0";
        }
        uint j = _i;
        uint len;
        
        while (j != 0) {
            len++;
            j /= 10;
        }
        bytes memory bstr = new bytes(len);
        uint k = len - 1;
        
        while (_i != 0) {
            bstr[k--] = byte(uint8(48 + _i % 10));
            _i /= 10;
        }
        return string(bstr);//access local variable
    }
}
```

### Kết quả

```
0: string: 2
```

|STT|Toán tử|Mô tả|
|---|---|---|
|1|`&` (Bitwise AND)|Thực hiện phép toán AND trên mỗi bit của các đối số nguyên. `(A & B) = 2`|
|2|<code>&#124;</code> (Bitwise OR)|Thực hiện phép toán OR trên mỗi bit của các đối số nguyên. `(A` <code>&#124;&#124;</code> `B) = 3`|
|3|`^` (Bitwise XOR)|Thực hiện phép tuyển loại trừ (*Exclusive OR*) trên mỗi bit của các đối số nguyên. XOR cho kết quả true nếu toán hạng 1 true hoặc toán hạng 2 true mà không đồng thời cả hai true. `(A ^ B) = 1`|
|4|`~` (Bitwise NOT)|Toán tử một ngôi (*unary*) đảo nghịch các bit của toán hạng. `(~B) = -4`|
|5|`<<` (Left Shift)|Dịch các bit của toán hạng 1 sang trái một vị số bit được chỉ định ở toán hạng 2. Các bit mới được điền giá trị 0. Dịch bit sang trái 1 bit bằng với giá trị của toán hạng 1 nhân 2, dịch trái 2 bit bằng giá trị của toán hạng 1 nhân 4... `(A << 1) = 4`|
|6|`>>` (Right Shift)|Dịch các bit của toán hạng 1 sang phải một số bit được chỉ định ở toán hạng 2. `(A >> 1) = 1`|
|7|`>>>` (Right shift with Zero)|Toán tử này giống toán tử `>>` ngoại trừ các bit sau khi dịch ở bên trái đều bằng 0. `(A >>> 1) = 1`|

## Toán tử gán

### Ví dụ

```solidity
pragma solidity ^0.5.0;

contract SolidityTest {
uint storedData; 

constructor() public{
    storedData = 10;   
}

function getResult() public view returns(string memory){
    uint a = 1; 
    uint b = 2;
    uint result = a + b;
    return integerToString(storedData); 
}

function integerToString(uint _i) internal pure 
    returns (string memory) {
        if (_i == 0) {
            return "0";
        }
        uint j = _i;
        uint len;
        while (j != 0) {
            len++;
            j /= 10; //assignment operation
        }
        bytes memory bstr = new bytes(len);
        uint k = len - 1;
        while (_i != 0) {
            bstr[k--] = byte(uint8(48 + _i % 10));
            _i /= 10;//assignment operation
        }
        return string(bstr);  //access local variable
    }
}
```

### Kết quả

```
0: string: 10
```

|STT|Toán tử|Mô tả|
|---|---|---|
|1|`=` (Simple Assignment)|Gán giá trị của toán hạng bên phải cho toán hạng ở bên trái. `C = A + B`|
|2|`+=` (Add and Assignment)|Cộng toán hạng bên phải với toán hạng bên trái và gán kết quả cho toán hạng bên trái. `C += A` bằng `C = C + A`|
|3|`-=` (Subtract and Assignment)|Lấy toán hạng bên trái trừ toán hạng bên phải và gán kết quả cho toán hạng bên trái. `C -= A` bằng `C = C - A`|
|4|`*=` (Multiply and Assignment)|Nhân toán hạng bên phải với toán hạng bên trái và gán kết quả cho toán hạng bên trái. `C *= A` bằng `C = C * A`|
|5|`/=` (Divide and Assignment)|Lấy toán hạng bên trái chia cho toán hạng bên phải và gán kết quả cho toán hạng bên trái. `C /= A` bằng `C = C / A`|
|6|`%=` (Modules and Assignment)|Lấy toán hạng bên trái chia cho toán hạng bên phải và lấy phần dư gán cho toán hạng bên trái. `C %= A` bằng `C = C % A`|

Tương tự cho các toán từ sau: `<<=`, `>>=`, `>>=`, `&=`, `|=` và `^=`.

## Toán tử điều kiện

Toán tử điều kiện hay còn gọi là toán tử tam phân có dạng như sau:

```
nếu điều kiện đúng ? trả về X : ngược lại trả về Y
```

### Ví dụ

```solidity
pragma solidity ^0.5.0;

contract SolidityTest {
uint storedData; 

constructor() public{
    storedData = 10;   
}

function getResult() public view returns(string memory){
    uint a = 1; // local variable
    uint b = 2;
    uint result = (a > b? a: b);  //conditional operation
    return integerToString(result); 
}

function integerToString(uint _i) internal pure 
    returns (string memory) {
        if (_i == 0) {
            return "0";
        }
        uint j = _i;
        uint len;
        while (j != 0) {
            len++;
            j /= 10;
        }
        bytes memory bstr = new bytes(len);
        uint k = len - 1;
        while (_i != 0) {
            bstr[k--] = byte(uint8(48 + _i % 10));
            _i /= 10;
        }
        return string(bstr);
    }
}
```

### Kết quả

```
0: string: 2
```
