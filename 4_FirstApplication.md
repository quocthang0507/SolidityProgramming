|Bài trước đó|Mục lục|Bài kế tiếp|
|---|---|---|
|[Cú pháp cơ bản](3_BasicSyntax.md)|[Mục lục](README.md)|[Ghi chú](5_Comments.md)|

# Ứng dụng đầu tiên (First Application)

Sử dụng [Remix IDE](https://remix.ethereum.org/) để **Compile (*Biên dịch*)** và **Run (*Chạy*)** mã cơ sở Solidity.

![Hinh1](Images/Bai4/Hinh1.png)

## Ví dụ

```solidity
pragma solidity >=0.5.0;

contract SolidityTest {
    constructor() public{
    }

    function getResult() public view returns(uint){
        uint a = 1;
        uint b = 2;
        uint result = a + b;
        return result;
    }
}
```

## Các bước chạy Solidity trên Remix IDE

1. Tạo một tập tin .sol mới

![Hinh2](Images/Bai4/Hinh2.png)

2. Sao chép đoạn mã trên vào khu vực soạn thảo của Remix IDE

![Hinh3](Images/Bai4/Hinh3.png)

![Hinh4](Images/Bai4/Hinh4.png)

3. Ở menu *Solidity Compiler*, nhấn vào nút **Compile <tên_file>.sol**

![Hinh5](Images/Bai4/Hinh5.png)

4. Ở menu *Deploy & run Transactions*, nhấn vào nút **Deploy**

![Hinh6](Images/Bai4/Hinh6.png)

![Hinh7](Images/Bai4/Hinh7.png)

5. Nhấn vào danh sách thả xuống có chữ **SOLIDITYTEST AT 0X...**

![Hinh8](Images/Bai4/Hinh8.png)

6. Nhấn vào nút **getResult** để xem kết quả

![Hinh9](Images/Bai4/Hinh9.png)

### Kết quả

```
0: uint256: 3
```
