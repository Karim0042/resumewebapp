<%@ page import="com.company.entity.User" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 15.12.2022
  Time: 21:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="Assets/css/users.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css">
</head>
<body>
<style>
    .error {
        color: red;
    }
</style>

<div class="container mycontainer">
    <div class="col-4">
        <form:form action="userM" method="GET" modelAttribute="user">
            <div class="col 4">
                <div class="form-group ">
                    <label>name:</label>
                    <form:input
                            placeholder="Enter name"
                            class="form-control"
                            path="name"
                    />
                    <form:errors path="name" cssClass="error"/>
                </div>
                <div class="form-group">
                    <label for="surname">surname:</label>
                    <form:input placeholder="Enter surname:"
                                class="form-control"
                                path="surname"
                    />
                    <form:errors path="surname" cssClass="error"/>
                </div>
                <form:button type="submit" class="btn btn-primary">Search</form:button>
            </div>
        </form:form>
    </div>
    <div>
        <table class="table">
            <thead>
            <tr>
                <th>name</th>
                <th>surname</th>
                <th>nationality</th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${users}" var="z">
            <tr>
                <td>${z.name}</td>
                <td>${z.surname}</td>
                <td>${z.nationality.name}</td>
                <td width="5px">
                    <form:form action="userdetail" name="POST">
                        <input type="hidden" name="id" value="${z.id}"/>
                        <button type="submit" class="btn btn-danger " name="action" value="delete">
                            <i class="fas fa-trash-alt"></i>
                        </button>
                    </form:form>
                </td>
                <td>
                    <form action="userdetail" method="get">
                        <input type="hidden" name="id" value="${z.name}"/>
                        <input type="hidden" name="action" value="update"/>
                        <button type="submit" class="btn btn-secondary " value="update">
                            <i class=" fas fa-pen-square"></i>
                        </button>
                        </c:forEach>
                    </form>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
