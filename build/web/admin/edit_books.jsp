<%@page import="com.entity.BookDtls"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin: Add Books</title>
        <%@include file="allCss.jsp" %>
        
         <c:if test="${empty userobj}">
            <c:redirect url="../login.jsp"></c:redirect>
        </c:if>
    
    </head>
    <body style="background-color: #f0f1f2;">
        <%@include file="navbar.jsp" %>
        <div class="container p-5">
            <div class="row">
                <div class="col-md-5 offset-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="text-center">Edit Books</h4>
           
                                
                                <%
                                  int id=Integer.parseInt(request.getParameter("id"));
                                  BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
                                  BookDtls b=dao.getBookById(id);
                                  
                                %>
                            
                            <form action="../editbooks" method="post">
                                <input type="hidden"  name="id" value="<%= b.getBookId()%>">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Book Name*</label>
                                    <input name="bname" type="text" class="form-control" 
                                           id="exampleInputEmail1" aria-describedby="emailHelp"  value="<%= b.getBookName() %>">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Author Name*</label>
                                    <input name="author" type="text" class="form-control" 
                                    id="exampleInputEmail1" aria-describedby="emailHelp" value="<%= b.getAuthor()%>">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Price*</label>
                                    <input name="price" type="number" class="form-control" 
                                           id="exampleInputEmail1" aria-describedby="emailHelp" value="<%= b.getPrice() %>">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Book Status</label>
                                    <select id="inputState" name="status" class="form-control">
                                        <%
                                            if ("Active".equals(b.getStatus())) {%>
                                                <option value="Active">Active</option>
                                        <option value="Inactive">Inactive</option>                                                   
                                                <%}else{%>
                                                     <option value="Inactive">Inactive</option>                                     
                                                        <option value="Active">Active</option>

                                                     <%}
                                        %>
                                        
                                    </select>
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
