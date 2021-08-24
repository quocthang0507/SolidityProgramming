|Bài trước đó|Mục lục|Bài kế tiếp|
|---|---|---|
|[Chuỗi](12_Strings.md)|[Mục lục](README.md)|[Enum](14_Enums.md)|

# Mảng (Arrays)

Mảng là một cấu trúc dữ liệu lưu trữ một bộ sưu tập tuần tự (*sequential collection*) có kích thước cố định (*fixed-size*) chứa các phần tử cùng một kiểu. Một mảng lưu một bộ sưu tập dữ liệu hay còn gọi là một bộ sưu tập các biến cùng kiểu.

Thay vì phải khai báo riêng lẻ như *number0, number1, ..., number99* thì chúng ta khai báo một mảng các số *numbers* và gọi các giá trị riêng lẻ là *numbers[0], numbers[1], ..., numbers[99]* với `[index]` là chỉ số truy cập phần tử thứ `index` trong mảng `numbers`.

Trong Solidity, một mảng có thể có kích thước cố định vào thời điểm biên dịch (*compile-time*) hoặc kích thước động. Đối với mảng lưu trữ (*storage array*), nó có thể có các kiểu phần tử khác nhau. Trong trường hợp của mảng bộ nhớ (*memory array*), kiểu của phần tử không thể được ánh xạ và trong trường hợp nó được sử dụng như tham số hàm (*function parameter*) thì kiểu phần tử phải là kiểu ABI.

Tất cả mảng bao gồm các vị trí bộ nhớ liên tiếp nhau. Địa chỉ nhỏ nhất tương ứng với phần tử đầu tiên và địa chỉ lớn nhất là của phần tử cuối cùng.

## Khai báo mảng

Để khai báo mảng cố định trong Solidity, lập trình viên cần phải chỉ ra được kiểu dữ liệu của các phần tử và số lượng phần tử trong cú pháp:

```
type arrayName [arraySize];
```

Đây là mảng một chiều. `arraySize` phải là một số nguyên dương lớn hơn không và `type` phải là một kiểu dữ liệu hợp lệ trong Solidity. Ví dụ khai báo một mảng có tên `balance` chứa 10 số nguyên không dấu:

```solidity
uint balance[10];
```

Để khai báo một mảng có kích thước động sử dụng cú pháp sau:

```
type arrayName[];
```

## Khởi tạo mảng

Bạn có thể khởi tạo giá trị cho các phần tử như sau:

```solidity
uint balance[3] = [1, 2, 3];
```

Số lượng các số nằm trong ngoặc vuông ở sau lệnh gán không thể lớn hơn số lượng các phần tử trong khai báo mảng được.

Nếu bạn không khai báo kích thước mảng, thì sau khi khởi tạo giá trị của mảng, kích thước mảng sẽ bằng số lượng các phần tử được thêm vào mảng. Do đó: `uint balance[] = [1, 2, 3]` mảng `balance` có kích thước là 3 giống với ví dụ trên.

Thay vì bạn gán chúng trực tiếp sau lệnh khai báo thì bạn có thể khai báo mảng trước và gán giá trị cho chúng sau như ví dụ này:

```solidity
balance[0] = 1;
balance[1] = 2;
balance[2] = 3;
```

Ba dòng trên sẽ đưa giá trị tương ứng vào mảng theo thứ tự trong ngoặc vuông.

## Tạo mảng bộ nhớ động

Mảng bộ nhớ động được tạo bằng từ khóa `new`.

```solidity
uint size = 3;
uint balance[] = new uint[](size);
```

## Truy cập phần tử của mảng

Chúng ta truy cập các phần tử dựa trên chỉ số của chúng trong mảng. Ví dụ:

```solidity
uint salary = balance[2];
```

Dòng lệnh trên đưa phần tử thứ 3 (phần tử thứ 2 theo chỉ số 0 trở lên) của mảng `balance` và gán vào biến `salary`. Như vậy, trong ví dụ trên, chúng ta đã thực hiện 3 thao tác sau: khai báo (*declaration*), gán (*assignment*) và truy cập mảng (*access*).

## Các thuộc tính

*Lưu ý: Thuộc tính của một đối tượng được gọi từ đối tượng mà không cần dấu ngoặc tròn, còn phương thức thì phải sử dụng dấu ngoặc tròn kềm tham số (nếu được yêu cầu).*

|Tên thuộc tính|Mô tả|
|---|---|
|`length`|Trả về kích thước của mảng. Ta có thể thay đổi kích thước mảng động bằng cách thay đổi giá trị `length`|
|`push`|Đưa giá trị mới vào cuối mảng động. Nó trả về kích thước mới của mảng|

```solidity
pragma solidity ^0.5.0;

contract test {
    function testArray() public pure{
        uint len = 7; 

        //dynamic array
        uint[] memory a = new uint[](7);

        //bytes is same as byte[]
        bytes memory b = new bytes(len);

        assert(a.length == 7);
        assert(b.length == len);

        //access array variable
        a[6] = 8;

        //test array variable
        assert(a[6] == 8);

        //static array
        uint[3] memory c = [uint(1) , 2, 3];
        assert(c.length == 3);
    }
}
```
