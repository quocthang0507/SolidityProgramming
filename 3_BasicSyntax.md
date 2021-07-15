|Bài trước đó|Mục lục|Bài kế tiếp|
|---|---|---|
|[Cài đặt môi trường](2_EnvironmentSetup.md)|[Mục lục](README.md)|Chưa có|

# Bài 3. Cú pháp cơ bản

Một tập tin mã nguồn Solidity có thể chứa bất kỳ số lượng các định nghĩa hợp đồng, các chỉ thị nhập (*import directives*) và chỉ thị pragma. Dưới đây là một tập tin mã nguồn Solidity đơn giản:

```solidity
pragma solidity >=0.4.0 <0.6.0;
contract SimpleStorage {
   uint storedData;
   function set(uint x) public {
      storedData = x;
   }
   function get() public view returns (uint) {
      return storedData;
   }
}
```

## Pragma

Dòng đầu tiên là một chỉ thị pragma cho biết mã nguồn được viết bởi phiên bản Solidity 0.4.0 hoặc mới hơn mà không phá vỡ chức năng, nhưng không bao gồm phiên bản 0.6.0.

Một chỉ thị pragma luôn nằm cục bộ trong tập tin nguồn và nếu bạn nhập một tập tin khác, pragma từ tập tin đó sẽ không tự động áp dụng cho tập tin nhập.

Vì vậy một pragma của tập tin sẽ không biên dịch ở phiên bản trước 0.4.0 và nó sẽ không làm việc trên một trình biên dịch từ phiên bản 0.5.0 nếu được viết như sau:

```solidity
pragma solidity ^0.4.0
```

Đây là điều kiện thứ hai được thêm bởi dấu ^.

## Hợp đồng

Một hợp đồng Solidity là một bộ sưu tập mã (các chức năng của nó) và dữ liệu (trạng thái của nó) nằm tại một địa chỉ cụ thể trên Ethereumblockchain.

`uint storedData` khai báo một biến trạng thái được gọi là `storedData` có kiểu `uint`, các hàm `set` và `get` được dùng để chỉnh sửa và nhận giá trị của biến.

## Tập tin nhập

Mặc dù ví dụ trên không có lệnh nhập nhưng Solidity hỗ trợ các lệnh nhập tương tự như Javascript.

Lệnh sau nhập tất cả các ký tự toàn cục từ "filename":

```solidity
import "filename";
```

Ví dụ sau tạo một ký hiệu toàn cục mới `symbolName` mà các thành viên của nó đều là các ký hiệu toàn cục từ "filename":

```solidity
import * as symbolName from "filename;
```

Để nhập một tập tin x từ cùng thư mục với tập tin hiện tại, sử dụng `import "./x" as x;`. Nếu sử dụng `import "x" as x;`, một tập tin khác có thể được tham chiếu trong một "include directory" toàn cục.

## Từ khóa dành riêng

Dưới đây là các từ khóa dành riêng (*reserved keywors*) trong Solidity:

|---|---|---|---|
|abstract|after|alias|apply|
|auto|case|catch|copyof|
|default|define|final|immutable|
|implements|in|inline|let|
|macro|match|mutable|null|
|of|override|partial|promise|
|reference|relocatable|sealed|sizeof|
|static|supports|switch|try|
|typedef|typeof|unchecked||
