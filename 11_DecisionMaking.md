|Bài trước đó|Mục lục|Bài kế tiếp|
|---|---|---|
|[Vòng lặp](10_Loops.md)|[Mục lục](README.md)|[Chuỗi](12_Strings.md)|

# Câu lệnh điều kiện (Decision Making)

Trong lập trình, bạn có thể gặp một số tình huống cần áp dụng theo các hướng khác nhau. Trong trường hợp như vậy, bạn cần sử dụng các lệnh điều kiện để cho phép chương trình đưa ra quyết định và thực hiện đúng.

Solidity hỗ trợ các lệnh điều kiện `if ... else ...` cho phép thực hiện các hành động khác nhau dựa trên điều kiện khác nhau.

## Lưu đồ

![Hinh1](Images/Bai11/Hinh1.jpg)

|STT|Lệnh|Mô tả|
|---|---|---|
|[1](Source/Bai11/Bai11_If.sol)|`if (condition) {statement(s) to be executed if condition is true}`|Câu lệnh điều kiện cơ bản đưa ra quyết định và thực thi khối lệnh theo điều kiện đúng|
|[2](Source/Bai11/Bai11_IfElse.sol)|`if (condition) {statement(s) to be executed if condition is true} else {statement(s) to be executed otherwise}`|Khi điều kiện được thỏa mãn hay không thì có khối lệnh tương ứng sẽ thực thi|
|[3](Source/Bai11/Bai11_IfElseIf.sol)|`if (condition_1) {statement(s) to be executed if condition_1 is true} else if (condition_2) {statement(s) to be executed if condition_1 is false and condition_2 is true}`|Một dạng nâng cao của câu lệnh `if ... else ...` cho phép đưa ra quyết định chính xác theo các điều kiện|
