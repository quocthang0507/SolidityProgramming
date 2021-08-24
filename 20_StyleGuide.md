|Bài trước đó|Mục lục|Bài kế tiếp|
|---|---|---|
|[Các biến đặc biệt](19_SpecialVariables.md)|[Mục lục](README.md)|[Hàm](21_Functions.md)|

# Hướng dẫn phong cách (Style Guide)

Hướng dẫn phong cách giúp duy trì bố cục mã nhất quán (*consistent*) và làm cho mã nguồn dễ đọc hơn. Dưới đây là các bước thực hành khi viết hợp đồng trong Solidity.

## Bố cục

* **Thụt lề (*Indentation*)**: Sử dụng 4 dấu cách thay vì dấu tab để duy trì mức độ thụt lề. Tránh sử dụng kết hợp khoảng cách và tab.

* Quy tắc hai dòng trống: Sử dụng hai dòng trống giữa hai định nghĩa hợp đồng.

Nên:

```solidity
pragma solidity ^0.5.0;

contract LedgerBalance {
    // ...
}


contract Updater {
    // ...
}
```

Không nên:

```solidity
contract A {
    ...
}
contract B {
    ...
}

contract C {
    ...
}
```

* **Quy tắc một dòng trống**: Sử dụng một dòng trống giữa hai hàm. Nếu chỉ có khai báo thì không cần cách một dòng trống.

Nên:

```solidity
pragma solidity ^0.5.0;

contract A {
    function balance() public pure;
    function account() public pure;
}


contract B is A {
    function balance() public pure {
        // ...
    }

    function account() public pure {
        // ...
    }
}
```

Không nên:

```solidity
contract A {
    function spam() public {
        // ...
    }
    function ham() public {
        // ...
    }
}
```

* **Chiều dài tối đa của dòng**: Một dòng không nên quá 79 ký tự để người đọc có thể dễ phân tích mã.

* **Quy tắc đóng gói (*Wrap*)**: Đối số đầu tiên ở dòng mới mà không mở ngoặc đơn (*opening parenthesis*). Sử dụng một thụt lề cho mỗi đối số. PHần tử kết thúc *);* nên là dòng cuối cùng.

Nên:

```solidity
function_with_a_long_name(
   longArgument1,
   longArgument2,
   longArgument3
);
variable = function_with_a_long_name(
   longArgument1,
   longArgument2,
   longArgument3
);
event multipleArguments(
   address sender,
   address recipient,
   uint256 publicKey,
   uint256 amount,
   bytes32[] options
);
MultipleArguments(
   sender,
   recipient,
   publicKey,
   amount,
   options
);
```

Không nên:

```solidity
thisFunctionCallIsReallyLong(longArgument1,
                              longArgument2,
                              longArgument3
);

thisFunctionCallIsReallyLong(longArgument1,
    longArgument2,
    longArgument3
);

thisFunctionCallIsReallyLong(
    longArgument1, longArgument2,
    longArgument3
);

thisFunctionCallIsReallyLong(
longArgument1,
longArgument2,
longArgument3
);

thisFunctionCallIsReallyLong(
    longArgument1,
    longArgument2,
    longArgument3);
```

* **Mã hóa mã nguồn**: Sử dụng bộ mã UTF-8 hoặc ASCII.

* **Nhập**: Các lệnh nhập nên được đặt ở đầu của tập tin sau khai báo pragma.

Nên:

```solidity
import "owned";


contract A {
    // ...
}


contract B is owned {
    // ...
}
```

Không nên:

```solidity
contract A {
    // ...
}


import "owned";


contract B is owned {
    // ...
}
```

* **Thứ tự hàm**: Các hàm nên được để gần nhau theo khả năng truy cập.

Nên:

```solidity
pragma solidity ^0.5.0;

contract A {
   constructor() public {
      // ...
   }
   function() external {
      // ...
   }

   // External functions
   // ...

   // External view functions
   // ...

   // External pure functions 
   // ...

   // Public functions
   // ...

   // Internal functions
   // ...

   // Private functions
   // ...
}
```

Không nên:

```solidity
contract A {

    // External functions
    // ...

    // Private functions
    // ...

    // Public functions
    // ...

    function A() public {
        ...
    }

    function() public {
        ...
    }

    // Internal functions
    // ...
}
```

* **Tránh các khoảng trắng dư thừa**: Tránh các khoảng trắng không liên quan (*extraneous*) ngay bên trong dấu ngoặc đơn, dấu ngoặc nhọn (*braces, "curly brackets"*) hay ngoặc vuông (*bracket, square bracket*).

Nên:

```solidity
spam(ham[1], Coin({name: "ham"}));

function spam(uint i, Coin coin) public;
```

Không nên:

```solidity
spam( ham[ 1 ], Coin( { name: "ham" } ) );

function spam(uint i , Coin coin) public ;
```

Ngoại lệ:

```solidity
function singleLine() public { spam(); }
```

* **Cấu trúc điều khiển**: Các dấu ngoặc nhọn nên được mở ở dòng khai báo và đóng ở dòng riêng cùng thứ tự thụt lề. Sử dụng khoảng cách trước dấu mở ngoặc nhọn.

Nên:

```solidity
pragma solidity ^0.5.0;

contract Coin {
   struct Bank {
      address owner;
      uint balance;
   }
}
if (x < 3) {
   x += 1;
} else if (x > 7) {
   x -= 1;
} else {
   x = 5;
}
if (x < 3)
   x += 1;
else
   x -= 1;
```

Không nên:

```solidity
contract Coin
{
    struct Bank {
        address owner;
        uint balance;
    }
}
```

* **Khai báo hàm**: Với quy tắc dấu ngoặc nhọn ở trên, luôn luôn đặt một nhãn khả năng truy cập (nhãn hiển thị) 

Nên:

```solidity
function increment(uint x) public pure returns (uint) {
    return x + 1;
}

function increment(uint x) public pure onlyowner returns (uint) {
    return x + 1;
}
```

Không nên:

```solidity
function increment(uint x) public pure returns (uint)
{
    return x + 1;
}

function increment(uint x) public pure returns (uint){
    return x + 1;
}

function increment(uint x) public pure returns (uint) {
    return x + 1;
    }

function increment(uint x) public pure returns (uint) {
    return x + 1;}
```

* **Ánh xạ**: Tránh các dấu khoảng trắng trong khi khai váo các biến ánh xạ.

```solidity
mapping(uint => uint) map;
mapping(address => bool) registeredAddresses;
mapping(uint => mapping(bool => Data[])) public data;
mapping(uint => mapping(uint => s)) data;
```

* **Khai báo biến**: Tránh khoảng trắng trong khi khai báo mảng.

```solidity
uint[] x;  // not unit [] x;
```

* **Khai báo chuỗi**: Sử dụng dấu nháy kép (*double quotes*) để khai báo chuỗi thay vì dấu nháy đơn (*single quote*).

```solidity
str = "foo";
str = "Hamlet says, 'To be or not to be...'";
```

## Thứ tự bố cục

Các phần tử nên được đặt theo thứ tự sau:

* Lệnh pragma

* Lệnh nhập

* Interface

* Thư viện

* Hợp đồng

Trong interface, thư viện hay hợp đồng, thứ tự sẽ là:

* Khai báo kiểu

* Biến trạng thái

* Sự kiện

* Hàm

## Quy ước đặt tên (*Naming conventions*)

* Hợp đồng hay thư viện nên được đặt tên sử dụng kiểu *CapWords (PascalCase)*. Ví dụ: SmartContract,...

* Tên hợp đồng hay thư viện phải khớp với tên tập tin.

* Trong trường hợp có nhiều hợp đồng/thư viện trong một tập tin, sử dụng tên lõi hợp đồng/thư viện.

Owned.sol

```solidity
pragma solidity ^0.5.0;

// Owned.sol
contract Owned {
   address public owner;
   constructor() public {
      owner = msg.sender;
   }
   modifier onlyOwner {
      //....
   }
   function transferOwnership(address newOwner) public onlyOwner {
      //...
   }
}
```

Congress.sol

```solidity
pragma solidity ^0.5.0;

// Congress.sol
import "./Owned.sol";

contract Congress is Owned, TokenRecipient {
   //...
}
```

* Tên cấu trúc, sự kiện, enum sử dụng kiểu *PascalCase*. Ví dụ: `SmartCoin`, `Deposit`, `AfterTransfer`.

* Tên biến, hàm, modifier sử dụng kiểu *camelCase*. Ví dụ: `initiateSupply`.

* Tên hằng thì viết hóa toàn bộ và sử dụng gạch dưới (*underscore*) để ngăn cách các từ. Ví dụ: `MAX_BLOCKS`.

Tổng kết lại, có các quy ước đặt tên sau:

* `b` (single lowercase letter)
* `B` (single uppercase letter)
* `lowercase` (hoặc `nocase`)
* `lower_case_with_underscores` (hoặc `snake_case`)
* `UPPERCASE`
* `UPPER_CASE_WITH_UNDERSCORES` (hoặc `SCREAMING_SNAKE_CASE`)
* `CapitalizedWords` (hoặc `CapWords`, `PascalCase`)
* `mixedCase` (hoặc `camelCase`, khác với`CapitalizedWords`)
* `Capitalized_Words_With_Underscores`
