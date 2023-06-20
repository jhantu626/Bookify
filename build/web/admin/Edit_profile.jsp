<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Profile</title>
        <%@include file="all_component/allCss.jsp"%>

    </head>
    <body style="background-color: #f7f7f7;">
        <%@include file="all_component/navbar.jsp"%>

        <div class="container">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="text-center text-info">Edit Profile</h4>
                            <form action="register" method="post">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Enter Full Name</label> 
                                    <input type="text" class="form-control" id="exampleInputEmail1"
                                           aria-describedby="emailHelp" required="required" value="${userobj.name}"  name="fname">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label> <input
                                        type="email" class="form-control" id="exampleInputEmail1"
                                        aria-describedby="emailHelp" required="required" name="email" value="${userobj.email}"}>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Phone No</label> <input
                                        type="number" class="form-control" id="exampleInputEmail1"
                                        aria-describedby="emailHelp" required="required" name="phno" value="${userobj.phno}">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label> <input
                                        type="password" required="required" class="form-control" id="exampleInputPassword1"
                                        name="password">
                                </div>
                                
                                <button type="submit" class="btn btn-primary">Update</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>            
        </div>


    </body>
</html>
