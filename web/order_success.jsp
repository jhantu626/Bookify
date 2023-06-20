<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Success</title>
        <%@include file="all_component/allCss.jsp"%>

    </head>
    <style>
      body {
        text-align: center;
        padding: 40px 0;
        background: #EBF0F5;
      }
        h1 {
          color: #88B04B;
          font-family: "Nunito Sans", "Helvetica Neue", sans-serif;
          font-weight: 400;
          font-size: 25px;
          margin-bottom: 10px;
        }
        .ty {
          color: #88B04B;
          font-family: "Nunito Sans", "Helvetica Neue", sans-serif;
          font-weight: 900;
          font-size: 40px;
          margin-bottom: 10px;
        }
        p {
          color: #404F5E;
          font-family: "Nunito Sans", "Helvetica Neue", sans-serif;
          font-size:20px;
          margin: 0;
        }
      .ii {
        color: #9ABC66;
        font-size: 100px;
        line-height: 200px;
        margin-left:-15px;
      }
      .cardsuccess {
        background: white;
        padding: 60px;
        border-radius: 4px;
        box-shadow: 0 2px 3px #C8D0D8;
        display: inline-block;
        margin: 0 auto;
      }
    </style>
    <body style="background-color: #f0f1f2;">
        <c:if test="${empty userobj}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        
        <%@include file="all_component/navbar.jsp" %>
        <div class="cardsuccess mt-5">
            <div style="border-radius:200px; height:200px; width:200px; background: #F8FAF5; margin:0 auto;">
                <i class="checkmark ii">✓</i>
            </div>
            <h1 class="ty mt-3">Thank You</h1>
            <h1 class="mt-2">Your Order Successfully</h1> 
            <p>With in 7 Days Your<br/>will be Delivered In Your Address</p>
            <div>
                <a href="index.jsp" class="btn btn-info mt-3">Home</a>
                <a href="order.jsp" class="btn btn-success mt-3">View Order</a>
            </div>
        </div>

    </body>
</html>
