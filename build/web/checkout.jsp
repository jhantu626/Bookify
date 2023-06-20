<%@page import="java.util.List"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@page import="com.DAO.CartDAO"%>
<%@page import="com.entity.Cart"%>
<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart Product</title>
        <%@include file="all_component/allCss.jsp"%>
    </head>
    <body style="background-color: #f0f1f2;">
        <%@include file="all_component/navbar.jsp" %>

        <c:if test="${empty userobj}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>


        <c:if test="${not empty succMsg}">
            <div class="alert alert-success" role="alert">
                ${succMsg}
            </div>
            <c:remove var="succMsg" scope="session" />
        </c:if>
        <c:if test="${not empty failedMsg}">
            <div class="alert alert-danger" role="alert">
                ${failedMsg}
            </div>
            <c:remove var="failedMsg" scope="session" />
        </c:if>
        
        
        
        

        <div class="container mt-2">
            <div class="row p-2">
                <div class="col-md-6">
                    <div class="card bg-white">
                        <div class="card-header bg-info">
                            <h3 class="text-center text-white">Your Selected ITems</h3>

                        </div>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">Book Name</th>
                                    <th scope="col">Author</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>

                                <%
                                    User u = (User) session.getAttribute("userobj");
                                    CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
                                    List<Cart> cart = dao.getBookByUser(u.getId());
                                    Double totalPrice = 0.00;
                                    for (Cart c : cart) {
                                        totalPrice = c.getTotalPrice();
                                %>
                                <tr>
                                    <th scope="row"><%= c.getBookName()%></th>
                                    <td><%= c.getAuthor()%></td>
                                    <td><%= c.getPrice()%></td>
                                    <td><a href="remove_book?bid=<%= c.getBid()%>&&uid=<%= c.getUserId() %>&&cid=<%= c.getCid() %>" class="btn btn-sm btn-danger">Remove</a></td>
                                </tr>
                                <%}
                                %>
                                <tr>
                                    <td>Total Price</td>
                                    <td></td>
                                    <td></td>
                                    <td><%= totalPrice%></td>
                                </tr>


                            </tbody>
                        </table>
                    </div>
                </div>

                <%
                    String orderName=u.getName().toUpperCase();
                    String orderEmail=u.getEmail().toLowerCase();
                    String orderPhno=u.getPhno();
                %>

                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header bg-info">
                            <h3 class="text-center text-white">Your Details FOr Order</h3>
                        </div>
                        <div class="card card-body">
                            <form action="order" method="post">
                                <input type="hidden" name="id" value="${userobj.id}">
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputEmail4">Name</label>
                                        <input type="text" readonly="readonly" name="username" class="form-control" id="inputEmail4" value="<%= orderName %>" >
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputPassword4">Email</label>
                                        <input type="email" readonly="readonly" class="form-control" id="inputPassword4" name="email" value="<%= orderEmail %>" >
                                    </div>
                                </div> 
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputEmail4">Phone Number</label>
                                        <input type="number" class="form-control" id="inputEmail4" name="phno" value="<%= orderPhno %>">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputPassword4">Address</label>
                                        <input type="text" required="true" class="form-control" id="inputPassword4" name="address">
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputEmail4">Landmark</label>
                                        <input type="text" class="form-control" required="true" id="inputEmail4" name="landmark">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputPassword4">City</label>
                                        <input type="text" class="form-control" required="true" id="inputPassword4" name="city">
                                    </div>
                                </div> 
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputEmail4">State</label>
                                        <input type="text" class="form-control" required="true" id="inputEmail4" name="state">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputPassword4">Pin Code</label>
                                        <input type="number" required="true" class="form-control" name="pincode" id="inputPassword4">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label>Payment Mode</label>
                                    <select class="form-control" required="true" name="payment">
                                        <option value="noselect">---select---</option>
                                        <option value="COD">Cash On Delivery</option>
                                    </select>
                                </div>

                                <div>
                                    <button class="btn btn-warning">Order Now</button>
                                    <a href="index.jsp" class="btn btn-info">Continue Shopping</a>

                                </div>
                            </form>

                        </div>
                    </div>
                </div>


            </div>
        </div>

    </body>
</html>
