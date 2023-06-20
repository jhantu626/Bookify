<%@page import="com.entity.Book_Order"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookOrderImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin: All Order</title>
        <%@include file="allCss.jsp" %>        
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <c:if test="${empty userobj}">
            <c:redirect url="../login.jsp"></c:redirect>
        </c:if>

        <h3 class="text-center">Hello Admin</h3>

        <table class="table table-striped">
            <thead class="bg-primary text-white">
                <tr>
                    <th scope="col">Order Id</th>
                    <th scope="col">Name</th>
                    <th scope="col">Email</th>
                    <th scope="col">Address</th>
                    <th scope="col">Ph No</th>
                    <th scope="col">Book Name</th>
                    <th scope="col">Author</th>      
                    <th scope="col">Price</th>      
                    <th scope="col">Payment Method</th>      
                </tr>
            </thead>
            <tbody>
                <%
                    BookOrderImpl dao = new BookOrderImpl(DBConnect.getConn());
                    List<Book_Order> list = dao.getAllBook();

                    for (Book_Order b : list) {%>
                <tr>
                    <th scope="row"><%= b.getOrderID() %></th>
                    <td><%= b.getUserName() %></td>
                    <td><%= b.getEmail() %></td>
                    <td><%= b.getFulladd() %></td>
                    <td><%= b.getPhno() %></td>
                    <td><%= b.getBookName() %></td>
                    <td><%= b.getAuthor() %></td>
                    <td><%= b.getPrice() %></td>
                    <td><%= b.getPaymentType() %></td>
                </tr>
                <%}
                %>

            </tbody>
        </table>
        <div style="margin-top: 145px;">
            <%@include file="footer.jsp" %><div>
                </body>
                </html>
