|Bài trước đó|Mục lục|Bài kế tiếp|
|---|---|---|
|[Giao diện](35_Interfaces.md)|[Mục lục](README.md)|[Hợp ngữ](37_Assembly.md)|

# Thư viện (Libraries)

Thư viện tương tự như các hợp đồng nhưng chức năng chính là để tái sử dụng. Một thư viện chứa các hàm mà các hợp đồng khác cần gọi đến. Solidity có giới hạn nhất định về sử dụng một thư viện. Dưới đây là các đặc điểm của một thư viện Solidity:

* Hàm thư viện có thể được gọi trực tiếp nếu họ không thay đổi trạng thái. Có nghĩa là các hàm `pure` hay `view` chỉ có thể được gọi từ bên ngoài thư viện.
* Thư viện không thể bị hủy nếu nó được cho là không có trạng thái (*stateless*).
* Một thư viện không thể có các biến trạng thái.
* Một thư viện không thể kế thừa bất cứ phần tử nào.
* Một thư viện không thể được kế thừa.

## Ví dụ

```solidity
pragma solidity ^0.5.0;

library Search {
    function indexOf(uint256[] storage self, uint256 value)
        public
        view
        returns (uint256)
    {
        for (uint256 i = 0; i < self.length; i++)
            if (self[i] == value) return i;
        return uint256(-1);
    }
}

contract Test {
    uint256[] data;

    constructor() public {
        data.push(1);
        data.push(2);
        data.push(3);
        data.push(4);
        data.push(5);
    }

    function isValuePresent() external view returns (uint256) {
        uint256 value = 4;

        //search if value is present in the array using Library function
        uint256 index = Search.indexOf(data, value);
        return index;
    }
}
```

Kết quả:

Chọn hợp đồng **Test** trước khi nhấn nút **Deploy**.

```
0: uint256: 3
```

## Sử dụng For

Chỉ thị **using A for B;** có thể được dùng để đính kèm các hàm thư viện của thư viện A đến một kiểu cho sẵn B. Những hàm này sẽ được kiểu trình gọi làm tham số đầu tiên của chúng (được xác định bằng `self`).

```solidity
pragma solidity ^0.5.0;

library Search {
    function indexOf(uint256[] storage self, uint256 value)
        public
        view
        returns (uint256)
    {
        for (uint256 i = 0; i < self.length; i++)
            if (self[i] == value) return i;
        return uint256(-1);
    }
}

contract Test {
    using Search for uint256[];
    uint256[] data;

    constructor() public {
        data.push(1);
        data.push(2);
        data.push(3);
        data.push(4);
        data.push(5);
    }

    function isValuePresent() external view returns (uint256) {
        uint256 value = 4;

        //Now data is representing the Library
        uint256 index = data.indexOf(value);
        return index;
    }
}
```

Kết quả:

Chọn hợp đồng **Test** trước khi nhấn nút **Deploy**.

```
0: uint256: 3
```
