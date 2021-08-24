|Bài trước đó|Mục lục|Bài kế tiếp|
|---|---|---|
|[Hàm Pure](24_PureFunctions.md)|[Mục lục](README.md)|[Quá tải hàm](26_Overloading.md)|

# Hàm dự phòng (Fallback Function)

Hàm **Fallback** là một hàm đặc biêt có sẵn cho một hợp đồng.

* Nó được gọi khi một hàm không tồn tại (*non-existen*) được gọi trong hợp đồng
* Nó được yêu cầu để được đánh dấu bên ngoài (*external*)
* Không có tên
* Không có đối số (*agrument*)
* Không thể trả về bất kỳ thứ gì
* Có thể được định nghĩa trong mỗi hợp đồng
* Nếu không được đánh dấu có thể trả (*payable*), nó sẽ tạo ngoại lệ nếu hợp đồng nhận Ether thuần túy (*plain*) mà không có dữ liệu.

## Ví dụ

Ví dụ sau đây cho thấy khái niệm về **Fallback** cho mỗi hợp đồng.

```solidity
pragma solidity ^0.5.0;

contract Test {
    uint256 public x;

    function() external {
        x = 1;
    }
}

contract Sink {
    function() external payable {}
}

contract Caller {
    function callTest(Test test) public returns (bool) {
        (bool success, ) = address(test).call(
            abi.encodeWithSignature("nonExistingFunction()")
        );
        require(success);
        // test.x is now 1

        address payable testPayable = address(uint160(address(test)));

        // Sending ether to Test contract,
        // the transfer will fail, i.e. this returns false here.
        return (testPayable.send(2 ether));
    }

    function callSink(Sink sink) public returns (bool) {
        address payable sinkPayable = address(sink);
        return (sinkPayable.send(2 ether));
    }
}
```
