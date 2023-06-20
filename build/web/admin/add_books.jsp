<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin: Add Books</title>
        <%@include file="allCss.jsp" %>
    </head>
    <body style="background-color: #f0f1f2;">
        <%@include file="navbar.jsp" %>
         <c:if test="${empty userobj}">
            <c:redirect url="../login.jsp"></c:redirect>
        </c:if>
        
        <div class="container p-5">
            <div class="row">
                <div class="col-md-5 offset-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="text-center">Add Books</h4>
                            
                            <c:if test="${not empty succMsg}">
                                <p class="text-center text-success">${succMsg}</p>                                
                                <% session.removeAttribute("succMsg"); %>
                            </c:if>
                            <c:if test="${not empty failedMsg}">
                                <p class="text-center text-danger">${failedMsg}</p>   
                                 <% session.removeAttribute("failedMsg"); %>
                            </c:if>
                            
                            <form action="../add_books" method="post" enctype="multipart/form-data">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Book Name*</label>
                                    <input name="bname" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Author Name*</label>
                                    <input name="author" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Price*</label>
                                    <input name="price" type="number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Book Categories</label>
                                    <select id="inputState" name="categories" class="form-control">
                                        <option selected>--select--</option>
                                        <option value="New">New Book</option>
                                        <option value="Old">Old Book</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Book Status</label>
                                    <select id="inputState" name="status" class="form-control">
                                        <option selected>--select--</option>
                                        <option value="Active">Active</option>
                                        <option value="Inactive">Inactive</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlFile1">Upload Photo</label>
                                    <input name="bimg" type="file" class="form-control-file" id="exampleFormControlFile1">
                                </div>
                               
                                <button type="submit" class="btn btn-primary">Submit</button>
                            </form>
                        </div>                        
                    </div>
                </div>
            </div>
            
        </div>

    </body>
</html>
