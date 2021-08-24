|Bài trước đó|Mục lục|Bài kế tiếp|
|---|---|---|
|[Kế thừa](32_Inheritance.md)|[Mục lục](README.md)|[Hợp đồng trừu tượng](34_AbstractContracts.md)|

# Hàm khởi tạo (Constructor)

Hàm khởi tạo là một hàm đặc biệt được khai báo sử dụng từ khóa `constructor`. Nó là một hàm tùy chọn và được dùng để khởi tạo các biến trạng thái của một hợp đồng. Một hàm khởi tạo có các đặc trưng (*characteristics*) sau:

* Một hợp đồng chỉ có thể có một phương thức khởi tạo.
* Mã của hàm khởi tạo được thực thi khi một hợp đồng được tạo và nó được sử dụng để khởi tạo trạng thái hợp đồng.
* Sau một hàm khởi tạo được thực thi, mã cuối cùng được triển khai đến chuỗi khối. Mã này bao gồm các hàm công khai và mã có thể truy cập thông qua các hàm công khai. Mã hàm khởi tạo hoặc bất kỳ phương thức nội bộ chỉ được sử dụng bởi hàm khởi tạo không được bao gồm trong mã cuối cùng.
* Một hàm khởi tạo có thẻ là `public` hoặc `internal`.
* Một hàm khởi tạo nội bộ đánh dấu hợp đồng là trừu tượng.
* Trong trường hợp không có hàm khởi tạo nào được định nghĩa, một hàm khởi tạo mặc định sẽ có trong hợp đồng.

```solidity
pragma solidity ^0.5.0;

contract Test {
   constructor() public {}
}
```

* Trong trường hợp hợp đồng cơ sở có hàm khởi tạo với các đối số, mỗi hợp đồng dẫn xuất phải truyền vào chúng.
* Hàm khởi tạo cơ sở có thể được khởi tạo trực tiếp theo cách sau:

```solidity
pragma solidity ^0.5.0;

contract Base {
   uint data;
   constructor(uint _data) public {
      data = _data;   
   }
}

contract Derived is Base (5) {
   constructor() public {}
}
```

* Hàm khởi tạo cơ sở có thể được khởi tạo gián tiếp theo cách sau:

```solidity
pragma solidity ^0.5.0;

contract Base {
   uint data;
   constructor(uint _data) public {
      data = _data;   
   }
}

contract Derived is Base {
   constructor(uint _info) Base(_info * _info) public {}
}
```

* Cách trực tiếp hoặc gián tiếp của khởi tạo hàm khởi tạo hợp đồng cơ sở là không được phép.
* Nếu hợp đồng dẫn xuất không truyền các đối số đến hàm khởi tạo hợp đồng cơ sở thì hợp đông dẫn xuất sẽ trở thành trừu tượng.
