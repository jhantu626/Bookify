<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book Details</title>
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
            .con-box{
                box-shadow: rgba(0, 0, 0, 0.25) 0px 54px 55px, rgba(0, 0, 0, 0.12) 0px -12px 30px, rgba(0, 0, 0, 0.12) 0px 4px 6px, rgba(0, 0, 0, 0.17) 0px 12px 13px, rgba(0, 0, 0, 0.09) 0px -3px 5px;
            }
            .book_img{
                box-shadow: rgba(50, 50, 93, 0.25) 0px 30px 60px -12px, rgba(0, 0, 0, 0.3) 0px 18px 36px -18px;
            }
            .row1{
                background-image: linear-gradient(to right,#00B09B,#96C93D);
                font-family: Futara;
            }
            .container{
                color: white;
            }
        </style>
    </head>
    <body style="background-color: #f0faf2;">
        <%@include file="all_component/navbar.jsp" %>

        <%
            User u = (User) session.getAttribute("userobj");
        %>


        <%
            int id = Integer.parseInt(request.getParameter("id"));
            BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
            BookDtls b = dao.getBookById(id);

        %>





                <div class="container p-3 ">
            <div class="row p-5 con-box">
                <div class="col-md-6 bg-white text-center p-5 border row1">
                    <img class="img-fluid img-thumbnail book_img" src="book/<%= b.getPhoto()%>" alt="alt"/><br>
                    <h4 class="mt-3">Book Name: <span class=""><%= b.getBookName()%></span></h4>
                    <h4>Author Name: <span class=""><%= b.getAuthor()%></span></h4>
                    <h4>Category: <span class=""><%= b.getBookCategory()%></span></h4>
                </div>
                <div class="col-md-6 bg-white text-center p-5 border">
                    <h2><%= b.getBookName()%></h2>

                    <%
                        if ("Old".equals(b.getBookCategory())) {%>
                    <h5 class="text-info">Contact To Seller</h5>
                    <h5 class="text-info"><i class="fas fa-envelope"></i>Email: <%= b.getEmail()%></h5>
                    <%}
                    %>


                    <div class="row mt-5">
                        <div class="col-md-4 p-2 text-center text-danger">
                            <i class="fas fa-money-bill-wave fa-2x"></i>
                            <p>Cash On Delivery</p>
                        </div>
                        <div class="col-md-4 p-2 text-center text-danger">
                            <i class="fas fa-undo-alt fa-2x"></i> 
                            <p>Return Available</p>
                        </div>
                        <div class="col-md-4 p-2 text-center text-danger">
                            <i class="fas fa-truck-moving fa-2x"></i>
                            <p>Free Shipping</p>
                        </div>
                    </div>

                    <%
                        if ("Old".equals(b.getBookCategory())) {%>
                    <div class=" text-center p-3">
                        <a href="index.jsp" class="btn btn-outline-info"><i class="fas fa-cart-plus"></i>Continue Shopping</a>
                        <a href="" class="btn btn-info"><i class="fas fa-rupee-sign"></i><%= b.getPrice()%></a>
                    </div>   
                    <%} else {%>
                    <div class=" text-center p-3">
                        <a href="cart?bid=<%= b.getBookId()%>&&uid=<%=u.getId()%> " class="btn btn-outline-info"><i class="fas fa-cart-plus"></i>Add Cart</a>
                        <a href="" class="btn btn-info"><i class="fas fa-rupee-sign"></i><%= b.getPrice()%></a>
                    </div>
                    <%}
                    %>


                </div>                
            </div>
        </div>       
                    
            
    </body>
</html>
