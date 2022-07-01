<%--
  Created by IntelliJ IDEA.
  User: warrior245
  Date: 6/15/22
  Time: 7:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Login</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<%@include file="../header.jsp" %>
<br>
<div class="container">
<c:if test="${error == 'true'}">
  <div class="alert alert-danger" role="alert">Wrong username or
    password
  </div>
</c:if>
    <div class="sidenav">
      <div class="login-main-text">
        <h2>
          Application<br> Login Page
        </h2>
        <p>Login or register from here to access.</p>
      </div>
    </div>

  <div class="login-form">
      <form:form class="row g-3" action="${pageContext.request.contextPath }/login-processing" method="POST">
        <input type="hidden"
               name="${_csrf.parameterName}"
               value="${_csrf.token}"/>
        <div class="form-floating">
          <input id="Email" type="text" name="email" class="form-control" placeholder="email"/>
          <label for="Email">Email</label>
        </div>
        <div class="form-floating">
          <input type="password" id="floatingPassword" class="form-control" name="password" placeholder="Password">
          <label for="floatingPassword">Password</label>
        </div>

        <div class="btn-group">
          <div class="col-md-1">
            <button type="submit" class="btn btn-success">Login</button>
          </div>
          <div class="col-md-1">
<%--            <button type="submit" class="btn btn-secondary" formaction="${pageContext.request.contextPath}/user/create">Register</button>--%>
            <a type="button" class="btn btn-secondary" href="/user/create">Register</a>
          </div>
        </div>
      </form:form>
  </div>
</div>
</body>
</html>
