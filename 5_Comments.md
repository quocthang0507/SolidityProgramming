|Bài trước đó|Mục lục|Bài kế tiếp|
|---|---|---|
|[Ứng dụng đầu tiên](4_FirstApplication.md)|[Mục lục](README.md)|[Kiểu](6_Types.md)|

# Ghi chú (Comments)

Solidity hỗ trợ ghi chú theo kiểu C/C++, tức là:

* Bất kỳ từ nào nằm sau ký tự // đến cuối dòng đều là một ghi chú và bị bỏ qua trong trình biên dịch Solidity.
* Bất kỳ từ nào nằm giữa ký tự /* và */ đều là một ghi chú và có thể ghi nhiều dòng.

## Ví dụ

Ví dụ dưới đây trình bày các kiểu ghi chú trong Solidity:

```solidity
function getResult() public view returns(uint){
   // This is a comment. It is similar to comments in C++

   /*
      * This is a multi-line comment in solidity
      * It is very similar to comments in C Programming
   */
   uint a = 1;
   uint b = 2;
   uint result = a + b;
   return result;
}
```
