<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Login</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body class="login_background">
<form action="login" method="POST">
    <div class="col-4 container login_fix_">

        <center>
            <h1>Login:</h1>
        </center>
        <div class="form-group">
            <label>Email address</label>
            <input type="text" class="form-control" name="username" placeHolder="email"/>
        </div>
        <div class="form-group">
            <label>Password</label>
            <input type="text" class="form-control" name="password" placeholder="Password"/>
        </div>
        <button type="submit" class="btn btn-primary" name="login">Login</button>
    </div>
</form>
</body>
</html>