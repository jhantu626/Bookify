<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%@page import="com.entity.User"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.DB.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All REcent Book</title>
        <%@include file="all_component/allCss.jsp"%>
        <style type="text/css">
            .back-img {
                background: url("img/b.jpg");
                height: 50vh;
                width: 100%;
                background-size: cover;
                background-repeat: no-repeat;
            }

            .crd-ho:hover {
                background-color: #fcf7f7;
            }
            .cont{
                box-shadow: rgba(0, 0, 0, 0.45) 0px 25px 20px -20px;
            }
            .book_img{
                box-shadow: rgba(0, 0, 0, 0.16) 0px 3px 6px, rgba(0, 0, 0, 0.23) 0px 3px 6px;
            }
            .bookD p{
                font-family: Rockwell;
            }
        </style>
    </head>
    <body>
        <%@include file="all_component/navbar.jsp"%>


        <%
            User u = (User) session.getAttribute("userobj");
        %>

    <c:if test="${not empty addCart}">
        <div id="toast">${addCart}</div>

        <script type="text/javascript">
            showToast();
            function showToast(content)
            {
                $('#toast').addClass("display");
                $('#toast').html(content);
                setTimeout(() => {
                    $("#toast").removeClass("display");
                }, 2000)
            }
        </script>
        <c:remove var="addCart" scope="session"></c:remove>
    </c:if>



    <div class="container-fluid cont p-5">
        <div class="row p-3">


            <%
                BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
                List<BookDtls> list2 = dao2.getAllRecentBook();
                for (BookDtls b : list2) {%>
            <div id="col" class="col-md-3 mt-1">
                <div class="card crd-ho">
                    <div class="card-body text-center bookD">
                        <img alt="" src="book/<%= b.getPhoto()%>"
                             style="width: 150px; height: 200px;" class="img-thumblin book_img">
                        <p><%= b.getBookName()%></p>
                        <p><%= b.getAuthor()%></p>
                        <p>Categories:<%= b.getBookCategory()%></p>
                        <%
                            if (b.getBookCategory().equalsIgnoreCase("Old")) {%>
                        <div class="row">
                            <a href="view_books.jsp?id=<%= b.getBookId()%>" class="btn btn-success btn-sm ml-1">View Details</a>
                            <a href="" class="btn btn-danger btn-sm ml-1"><i class="fas fa-rupee-sign"></i> <%= b.getPrice()%></a>
                        </div>  
                        <%} else {%>
                        <div class="row">
                            <% if (u == null) {%>
                            <!--Add to Cart-->
                            <a href="login.jsp" class="btn btn-danger btn-sm ml-1 mt-1">Add Cart</a> 
                            <%} else {%>
                            <a href="cart?bid=<%= b.getBookId()%>&&uid=<%=u.getId()%> " class="btn btn-danger btn-sm ml-1 mt-1">Add Cart</a>
                            <%}%>                            <a href="view_books.jsp?id=<%= b.getBookId()%>" class="btn btn-success btn-sm ml-1 mt-1">View Details</a>
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
    </div>



</body>
</html>
