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
