package com.entity;

public class BookDtls {
    private int bookId;
    private String bookName;
    private String author;
    private String price;
    private String bookCategory;
    private String Status;
    private String photo;
    private String email;

    public BookDtls() {
    }


    @Override
    public String toString() {
        return "BookDtls{" + " bookName=" + bookName + ", author=" + author + ", price=" + price + ", bookCategory=" + bookCategory + ", Status=" + Status + ", photo=" + photo + ", email=" + email + '}';
    }

    public BookDtls(String bookName, String author, String price, String bookCategory, String Status, String photo, String email) {
        this.bookName = bookName;
        this.author = author;
        this.price = price;
        this.bookCategory = bookCategory;
        this.Status = Status;
        this.photo = photo;
        this.email = email;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getBookCategory() {
        return bookCategory;
    }

    public void setBookCategory(String bookCategory) {
        this.bookCategory = bookCategory;
    }

    public String getStatus() {
        return Status;
    }

    public void setStatus(String Status) {
        this.Status = Status;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    
}
