<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Setting</title>
        <%@include file="all_component/allCss.jsp"%>

        <style>
            a{
                text-decoration: none;
                color: black
            }
            a:hover{
                text-decoration: none;
            }
        </style>
    </head>
    <body style="background-color: #f7f7f7;">
        <c:if test="${empty userobj}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>


        <%@include file="all_component/navbar.jsp"%>


        <div class="container">
                <h3 class="text-center">Hello, ${userobj.name}</h3>

            <div class="row p-5">


                <div class="col-md-4 mt-1">
                    <a href="sell_book.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="text-primary">
                                    <i class="fas fa-book-open fa-3x"></i>                                    
                                </div>
                                <h3>Sell old Book</h3>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-4 mt-1">
                    <a href="old_book.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="text-warning">
                                    <i class="fas fa-book-open fa-3x"></i>                                    
                                </div>
                                <h3>Old Book</h3>
                            </div>
                        </div>
                    </a>
                </div>

                <div class="col-md-4 mt-1">
                    <a href="edit_profile.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="text-primary">
                                    <i class="fas fa-edit fa-3x"></i>                                    
                                </div>
                                <h4>Edit Profile</h3>
                            </div>
                        </div>
                    </a>
                </div>



                <div class="col-md-6 mt-1">
                    <a href="order.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="text-danger">
                                    <i class="fas fa-box-open fa-3x"></i>                                    
                                </div>
                                <h3>My Order</h3>
                                <p>Track Your Order</p>
                            </div>
                        </div>
                    </a>
                </div>


                <div class="col-md-6 mt-1">
                    <a href="helpline.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="text-primary">
                                    <i class="fas fa-user-circle fa-3x"></i>                                    
                                </div>
                                <h3>Help Center</h3>
                                <p>24*7 Service</p>
                            </div>
                        </div>
                    </a>
                </div>



            </div>

        </div>


        <!-- Footer -->
        <%@include file="all_component/footer.jsp"%>

    </body>
</html>
