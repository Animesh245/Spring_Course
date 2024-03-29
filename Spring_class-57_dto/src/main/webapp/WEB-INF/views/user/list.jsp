<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: warrior245
  Date: 6/5/22
  Time: 5:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User List</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <script src="https://kit.fontawesome.com/51be22c3ae.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
</head>
<body>
<%@include file="../navbar.jsp" %>
<br>
<div class="container">
    <table class="table table-bordered">
        <thead class="thead-dark">
        <tr>
            <th scope="col">Id</th>
            <th scope="col">Image</th>
            <th scope="col">Name</th>
            <th scope="col">Email</th>
            <th scope="col">Password</th>
            <th scope="col">Location</th>
            <th scope="col">Update</th>
            <th scope="col">Delete</th>
        </tr>
        </thead>
        <tbody>
<c:forEach var="user" items="${userList}">
        <tr>
            <th scope="row">${user.getId()}</th>
            <td><img src="/images/${user.getAttachment().getAttachmentPath()}" alt="" height="50px" width="50px" style="object-fit: cover" class="img-thumbnail"/></td>
            <td>${user.getUserName()}</td>
            <td>${user.getUserEmail()}</td>
            <td>${user.getUserPassword()}</td>
            <td>${user.getLocation().getLocationName()}</td>
            <td><i onclick="location='/user/update/${user.getId()}'" class="fa-solid fa-pen-to-square"></i></td>
            <td><i onclick="location='/user/delete/${user.getId()}'" class="fa-solid fa-trash-can"></i></td>
        </tr>
</c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
