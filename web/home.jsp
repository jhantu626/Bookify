<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="all_component/allCss.jsp"%>

    </head>
    <body>
        <h1>User:Home</h1>
        <%@include file="all_component/slider.jsp" %>
        
        
        <c:if test="${not empty userobj}">
            <h1>${userobj.name}</h1>
            <h1>${userobj.email}</h1>
            
        </c:if>
        
        
    </body>
</html>
