<%@page import="com.entity.User"%>
<%@page import="com.sun.javafx.scene.control.skin.VirtualFlow.ArrayLinkedList"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.DB.DBConnect"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
        pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>Ebook: Index</title>
        <%@include file="all_component/allCss.jsp"%>
        <style type="text/css">
            .back-img {
                /*background: url("img/img4.jpg");*/
                height: 50vh;
                width: 100%;
                background-size: cover;
                background-repeat: no-repeat;
            }

            .crd-ho:hover {
                background-color: #fcf7f7;
            }
            .book_img{
                box-shadow: rgba(0, 0, 0, 0.16) 0px 3px 6px, rgba(0, 0, 0, 0.23) 0px 3px 6px;
            }
            .bookD p{
                font-family: Rockwell;
            }
            .cBack{
                  background-image: linear-gradient(to right, #BDC3C7,#2C3E50);
            }
        </style>

    </head>
    <body style="background-color: #f7f7f7;">
        <%
            User u = (User) session.getAttribute("userobj");
        %>
        <%@include file="all_component/navbar.jsp"%>
        <%@include file="all_component/slider.jsp" %>

        <!--	<div class="container-fluid back-img">
                    
                    <h2 class="text-center text-danger">EBook-Management App</h2>
                </div>-->

        <!-- Start Recent Book -->
        <div class="container">
            <h3 class="text-center">Recent Book</h3>
            <div class="row">
                <%
                    BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
                    List<BookDtls> list2 = dao2.getRecentBook();
                    for (BookDtls b : list2) {%>
                <div class="col-md-4 ">
                    <div class="card crd-ho mt-2 ml-1 ">
                        <div class="card-body text-center bookD">
                            <img alt="" src="book/<%= b.getPhoto()%>"
                                 style="width: 150px; height: 200px;" class="img-thumblin book_img">
                            <p class="mt-3"><%= b.getBookName()%></p>
                            <p class="mb-2"><%= b.getAuthor()%></p>
                            <p class="mb-2">Categories:<%= b.getBookCategory()%></p>
                            <%
                                        if (b.getBookCategory().equalsIgnoreCase("Old")) {%>
                            <div class="row">
                                <a href="view_books.jsp?id=<%= b.getBookId()%>" class="btn btn-success btn-sm ml-1">View Details</a>
                                <a href="" class="btn btn-danger btn-sm ml-1"><i class="fas fa-rupee-sign"></i> <%= b.getPrice()%></a>
                            </div>  
                            <%} else {%>
                            <div class="row ">
                                <% if (u == null) {%>
                                <!--Add to Cart-->
                                <a href="login.jsp" class="btn btn-danger btn-sm ml-1 mt-1">Add Cart</a> 
                                <%} else {%>
                                <a href="cart?bid=<%= b.getBookId()%>&&uid=<%=u.getId()%>" class="btn btn-danger btn-sm ml-1 mt-1">Add Cart</a>
                                <%}%>
                                <a href="view_books.jsp?id=<%= b.getBookId()%>" class="btn btn-success btn-sm ml-1 mt-1">View Details</a>
                                <a href="" class="btn btn-danger btn-sm ml-1 mt-1"><i class="fas fa-rupee-sign"></i><%= b.getPrice()%></a>
                            </div>
                            <%}
                            %>

                        </div>
                    </div>
                </div>
                <%}
                %>



            </div>
            <div class="text-center mt-1">
                <a href="all_recent_book.jsp" class="btn btn-danger btn-sm text-center">View All</a>
            </div>
        </div>
        <!-- End Recent Book -->

        <hr>

        <!-- Start New Book -->
        <div class="container">
            <h3 class="text-center">New Book</h3>
            <div class="row">


                <%
                    BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
                    List<BookDtls> list = dao.getNewBook();
                    for (BookDtls b : list) {%>
                <div class="col-md-4 ">
                    <div class="card crd-ho">
                        <div class="card-body text-center bookD">
                            <img alt="" src="book/<%=b.getPhoto()%>"
                                 style="width: 150px; height: 200px;" class="img-thumblin book_img">
                            <p><%= b.getBookName()%></p>
                            <p><%= b.getAuthor()%></p>
                            <p>Categories:<%= b.getBookCategory()%></p>
                            <div class="row">

                                <% if (u == null) {%>
                                <!--Add to Cart-->
                                <a href="login.jsp" class="btn btn-danger btn-sm ml-1 mt-1">Add Cart</a> 
                                <%} else {%>
                                <a href="cart?bid=<%= b.getBookId()%>&&uid=<%=u.getId()%> " class="btn btn-danger btn-sm ml-1 mt-1">Add Cart</a>
                                <%}%>

                                <a href="view_books.jsp?id=<%= b.getBookId()%>" class="btn btn-success btn-sm ml-1 mt-1">View Details</a> 
                                <a href="" class="btn btn-danger btn-sm ml-1 mt-1"><i class="fas fa-rupee-sign"></i> <%= b.getPrice()%></a>
                            </div>  
                        </div>
                    </div>
                </div>
                <%}
                %>	





            </div>
            <div class="text-center mt-1">
                <a href="all_new_book.jsp" class="btn btn-danger btn-sm text-center">View All</a>
            </div>
        </div>
        <!-- End New Book -->

        <hr>


        <!-- Start Old Book -->
        <div class="container">
            <h3 class="text-center">Old Book</h3>
            <div class="row">


                <%
                    BookDAOImpl dao3 = new BookDAOImpl(DBConnect.getConn());
                    List<BookDtls> list3 = dao3.getOldBook();
                    for (BookDtls b : list3) {%>
                <div class="col-md-4 ">
                    <div class="card crd-ho">
                        <div class="card-body text-center bookD">
                            <img alt="" src="book/<%=b.getPhoto()%>"
                                 style="width: 150px; height: 200px;" class="img-thumblin book_img">
                            <p><%= b.getBookName()%></p>
                            <p><%= b.getAuthor()%></p>
                            <p>Categories:<%= b.getBookCategory()%></p>
                            <div class="row">
                                <a href="view_books.jsp?id=<%= b.getBookId()%>" class="btn btn-success btn-sm ml-1 mt-1">View Details</a>
                                <a href="" class="btn btn-danger btn-sm ml-1 mt-1"><i class="fas fa-rupee-sign"></i> <%= b.getPrice()%></a>
                            </div>
                        </div>
                    </div>
                </div>
                <%}
                %>


            </div>
            <div class="text-center mt-1">
                <a href="all_old_book.jsp" class="btn btn-danger btn-sm text-center">View All</a>
            </div>
        </div>
        <!-- End Old Book -->


        <!-- Footer -->
        <%@include file="all_component/footer.jsp"%>


    </body>
</html>