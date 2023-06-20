<%@page import="com.entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Profile</title>
        <%@include file="all_component/allCss.jsp"%>

    </head>
    <body style="background-color: #f7f7f7;">
        <%@include file="all_component/navbar.jsp"%>




        <%
            User us = (User) session.getAttribute("userobj");
            String name = us.getName();
            String email = us.getEmail();
            String phno = us.getPhno();
            int id = us.getId();
        %>

        <div class="container p-5">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="text-center text-info">Edit Profile</h4>

                            <c:if test="${not empty failedMsg}">
                                <h5 class="text-center text-danger">${failedMsg}</h5>
                                <% session.removeAttribute("failedMsg"); %>
                            </c:if>

                            <c:if test="${not empty success}">
                                <h5 class="text-center text-success">${success}</h5>
                                <% session.removeAttribute("succMsg");%>
                            </c:if>

                            <form action="update_profile" method="post">
                                <input type="hidden" name="id" value="${userobj.id}">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Enter Full Name</label> 
                                    <input type="text" class="form-control" id="exampleInputEmail1"
                                           aria-describedby="emailHelp" required="required" name="fname" value="${userobj.name}">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label> <input
                                        type="email" class="form-control" id="exampleInputEmail1"
                                        aria-describedby="emailHelp" required="required" name="email" value="${userobj.email}">
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
