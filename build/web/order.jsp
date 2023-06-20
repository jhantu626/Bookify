<%@page import="java.util.List"%>
<%@page import="com.entity.Book_Order"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookOrderImpl"%>
<%@page import="com.entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Order</title>
        <%@include file="all_component/allCss.jsp"%>

    </head>
    <body style="background-color: #f7f7f7;">
        <c:if test="${empty userobj}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        <%@include file="all_component/navbar.jsp"%>
        
        <div class="container p-1">
            <h3 class="text-center mt-1 text-info">Your Order</h3>
            <table class="table mt-4 table-striped">
                <thead class="bg-info text-white">
                    <tr>
                        <th scope="col">Order Id</th>
                        <th scope="col">Name</th>
                        <th scope="col">Book Name</th>
                        <th scope="col">Author</th>
                        <th scope="col">Price</th>
                        <th scope="col">Payment Type</th>
                    </tr>
                </thead>
                <tbody>

                    <%
                        User us = (User) session.getAttribute("userobj");
                        BookOrderImpl dao = new BookOrderImpl(DBConnect.getConn());
                        List<Book_Order> blist = dao.getBook(us.getEmail());

                        for (Book_Order b : blist) {%>
                    <tr>
                        <th scope="row"><%= b.getOrderID() %></th>
                        <td><%= b.getUserName() %></td>
                        <td><%= b.getBookName() %></td>
                        <td><%= b.getAuthor() %></td>
                        <td><%= b.getPrice() %></td>
                        <td><%= b.getPaymentType() %></td>
                    </tr>
                    <%}
                    %>



                </tbody>
            </table>
        </div>


    </body>
</html>
