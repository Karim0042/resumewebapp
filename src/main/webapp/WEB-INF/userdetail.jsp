<%@ page import="com.company.entity.User" %>
<%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 27.12.2022
  Time: 21:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../Assets/css/users.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css">
</head>
<body>
<%
    /* if (request.getAttribute("owner")==null){
         response.sendRedirect("error.jsp?msg=not found");
         return;
     }*/
    User u = (User) request.getAttribute("user");
%>
<div class="col-4">
    <form action="userdetail" method="POST">
        <input type="hidden" name="id" value="<%=u.getId()%>"/>

        <div>
            <div class="form-group ">
                <label for="name">name: </label>
                <input type="text" class="form-control" name="name" value="<%=u.getName()%>">
            </div>
            <div class="form-group">
                <label for="surname">surname:</label>
                <input type="text" class="form-control" name="surname" value="<%=u.getSurname()%>"/>
            </div>
            <input type="submit" class="btn btn-primary" name="action" value="update"/>
            <input type="submit" class="btn btn-primary" name="action" value="delete"/>
        </div>
    </form>
</div>
</body>
</html>
