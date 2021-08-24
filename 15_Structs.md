|Bài trước đó|Mục lục|Bài kế tiếp|
|---|---|---|
|[Enum](14_Enums.md)|[Mục lục](README.md)|[Ánh xạ](16_Mappings.md)|

# Cấu trúc (Structs)

Kiểu `struct` được dùng để biểu diễn một bản ghi. Giả sử bạn muốn theo dõi các cuốn sách của bạn trong thư viện. Có lẽ bạn muốn theo dõi các thông tin sau của từng cuốn sách:

* Tiêu đề (*Title*)
* Tác giả (*Author*)
* Chủ đề (*Subject*)
* ID sách (*ID*)

## Định nghĩa một `struct`

Để định nghĩa một `struct`, bạn sử dụng từ khóa `struct`. `struct` định nghĩa một kiểu dữ liệu mới với nhiều hơn một thành viên. Cú pháp như sau:

```solidity
struct struct_name {
    type1 type_name_1;
    type2 type_name_2;
    type3 type_name_3;
}
```

Ví dụ:

```solidity
struct Book { 
   string title;
   string author;
   uint book_id;
}
```

## Truy cập các thông tin trong `struct`

Để truy cập các thành viên trong `struct` ta sử dụng dấu chấm sau đối tượng `struct`. Ví dụ:

```solidity
pragma solidity ^0.5.0;

contract Library {
    struct Book {
        string title;
        string author;
        uint256 book_id;
    }

    Book book;

    function setBook() public {
        book = Book("Learn Java", "TP", 1);
    }

    function getBookId() public view returns (uint256) {
        return book.book_id;
    }
}
```

Nếu nhấn vào nút **setBook** và sau đó là nhấn vào **getBookId** thì giá trị trả về là:

```
uint256: 1
```
