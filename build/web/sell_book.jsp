<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sell Book</title>
        <%@include file="all_component/allCss.jsp"%>

    </head>
    <body style="background-color: #f7f7f7;">
        <%@include file="all_component/navbar.jsp"%>
        <c:if test="${empty userobj}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>




        <div class="container p-5">
            <div class="row">
                <div class="col-md-5 offset-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="text-center text-primary">Sell Old Book</h5>
                            <c:if test="${not empty succMsg}">
                                <p class="text-center text-success">${succMsg}</p>                                
                                <% session.removeAttribute("succMsg"); %>
                            </c:if>
                            <c:if test="${not empty failedMsg}">
                                <p class="text-center text-danger">${failedMsg}</p>   
                                <% session.removeAttribute("failedMsg");%>
                            </c:if>
                            <form action="add_old_book" method="post" enctype="multipart/form-data">

                                <input type="hidden" value="${userobj.email}" name="user">

                                <div class="form-group">
                                    <label for="exampleInputEmail1">Book Name*</label>
                                    <input required="true" name="bname" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Author Name*</label>
                                    <input required="true" name="author" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Price*</label>
                                    <input required="true" name="price" type="number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                </div>

                                <div class="form-group">
                                    <label for="exampleFormControlFile1">Upload Photo</label>
                                    <input required="true" name="bimg" type="file" class="form-control-file" id="exampleFormControlFile1">
                                </div>

                                <button type="submit" class="btn btn-primary">Sell</button>
                            </form>
                        </div>
                        <div>
                        </div>

                    </div>


                    </body>
                    </html>
