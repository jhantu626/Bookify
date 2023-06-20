<%@page import="java.util.List"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin: All Books</title>
        <%@include file="allCss.jsp" %>        
    </head>
    <body>
        <%@include file="navbar.jsp" %>
         <c:if test="${empty userobj}">
            <c:redirect url="../login.jsp"></c:redirect>
        </c:if>
        
        <h3 class="text-center">Hello Admin</h3>
 
    <c:if test="${not empty succMsg}">
        <h5 class="text-center text-success">${succMsg}</h5>                                
        <% session.removeAttribute("succMsg"); %>
    </c:if>
    <c:if test="${not empty failedMsg}">
        <h5 class="text-center text-danger">${failedMsg}</h5>   
        <% session.removeAttribute("failedMsg"); %>
    </c:if>


        
        <table class="table table-striped">
  <thead class="bg-primary text-white">
      <tr class="text-center">
      <th scope="col">Id</th>
      <th scope="col">Image</th>
      <th scope="col">Book Name</th>
      <th scope="col">Author</th>
      <th scope="col">Price</th>
      <th scope="col">Category</th>
      <th scope="col">Status</th>
      <th scope="col">Action</th>      
    </tr>
  </thead>
  <tbody>
      
      <%
          BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
          List<BookDtls> list=dao.getAllBooks();
          for(BookDtls b:list){%>
          <tr>
              <td><%= b.getBookId() %></td>
              <td><img src="../book/<%= b.getPhoto() %>" style="width: 50px; height: 50px;"></td>
              <td><%= b.getBookName() %></td>
              <td><%= b.getAuthor() %></td>
              <td><i class="fas fa-rupee-sign fa-1x"></i><%= b.getPrice() %></td>
              <td><%= b.getBookCategory() %></td>
              <td><%= b.getStatus()%></td>
              <td class="text-center">
                  <a href="edit_books.jsp?id=<%= b.getBookId() %>" class="btn btn-small btn-primary"><i class="fas fa-edit"></i>Edit</a>
                  <a href="../delete?id=<%= b.getBookId() %>" class="btn btn-small btn-danger"><i class="fas fa-trash-alt"></i>Delete</a>
              </td>
          </tr>
          <%}
      %>
      
  </tbody>
</table>
        <div style="margin-top: 145px;">
        <%@include file="footer.jsp" %><div>  
    </body>
</html>
