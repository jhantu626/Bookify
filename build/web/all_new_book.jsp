<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Old Book</title>
        <%@include file="all_component/allCss.jsp"%>
        <script src="https://common.olemiss.edu/_js/sweet-alert/sweet-alert.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://common.olemiss.edu/_js/sweet-alert/sweet-alert.css">
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
            /* toast */
            #toast {
                min-width: 300px;
                position: fixed;
                bottom: 30px;
                margin-bottom: 2%;
                left: 50%;
                margin-left: -125px;
                background: #333;
                padding: 10px;
                color: white;
                text-align: center;
                z-index: 1;
                font-size: 18px;
                visibility: hidden;
                box-shadow: 0px 0px 100px #000;
            }

            #toast.display {
                visibility: visible;
                animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
            }

            @keyframes fadeIn {
                from {
                    bottom:0;
                    opacity: 0;
                }

                to {
                    bottom: 30px;
                    opacity: 1;
                }

            }
            @keyframes fadeOut {
                form {
                    bottom:30px;
                    opacity: 1;
                }

                to {
                    bottom: 0;
                    opacity: 0;
                }
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




        <%@include file="all_component/navbar.jsp"%>

        <div class="container-fluid p-5 border cont">
            <div class="row">

                <%
                    BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
                    List<BookDtls> list = dao.getAllNewBook();
                    for (BookDtls b : list) {%>
                <div class="col-md-3 mt-2">
                    <div class="card crd-ho">
                        <div class="card-body text-center bookD">
                            <img alt="" src="book/<%=b.getPhoto()%>"
                                 style="width: 150px; height: 200px;" class="img-thumblin book_img">
                            <p><%= b.getBookName()%></p>
                            <p><%= b.getAuthor()%></p>
                            <p>Categories:<%= b.getBookCategory()%></p>
                            <div class="row ml-3">
                                <% if (u == null) {%>
                                <!--Add to Cart-->
                                <a href="login.jsp" class="btn btn-danger btn-sm ml-1 mt-1">Add Cart</a> 
                                <%} else {%>
                                <a href="cart?bid=<%= b.getBookId()%>&&uid=<%=u.getId()%> " class="btn btn-danger btn-sm ml-1 mt-1">Add Cart</a>
                                <%}%>
                                <a href="view_books.jsp?id=<%= b.getBookId() %>" class="btn btn-success btn-sm ml-1 mt-1">View Details</a> 
                                <a href="" class="btn btn-danger btn-sm ml-1 mt-1"><i class="fas fa-rupee-sign"></i> <%= b.getPrice()%></a>
                            </div>
                        </div>
                    </div>
                </div>
                <%}
                %>	


            </div>
        </div>
    </body>
</html>
