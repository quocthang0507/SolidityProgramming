|Bài trước đó|Mục lục|Bài kế tiếp|
|---|---|---|
|[Chuyển đổi](17_Conversions.md)|[Mục lục](README.md)|[Các biến đặc biệt](19_SpecialVariables.md)|

# Đơn vị Ether (Ether Units)

Trong Solidity, chúng ta dùng *wei*, *finney*, *szabo* hoặc *ether* như là một hậu tố chuyển đổi các mệnh giá (*denominations*) dựa trên *ether*. Đơn vị nhỏ nhất là *wei*. 1e12 = 1×10^12.

```solidity
assert(1 wei == 1);
assert(1 szabo == 1e12);
assert(1 finney == 1e15);
assert(1 ether == 1e18);
assert(2 ether == 2000 fenny);
```

## Đơn vị Thời gian

Tương tự như tiền, Solidity có một vài đơn vị thời gian, đơn vị nhỏ nhất là giây và sử dụng nó như là hậu tố biểu thị (*denote*) thời gian.

```solidity
assert(1 seconds == 1);
assert(1 minutes == 60 seconds);
assert(1 hours == 60 minutes);
assert(1 day == 24 hours);
assert(1 week == 7 days);
```
