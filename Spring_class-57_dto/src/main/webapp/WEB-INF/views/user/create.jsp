<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: warrior245
  Date: 6/5/22
  Time: 5:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create User</title>
<%--    <style>--%>
<%--        .error{color:red}--%>
<%--    </style>--%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>

<%@include file="../header.jsp" %>
<br>

<div class="container-sm">
<%--@elvariable id="userDTO" type="com.this_project.dto.UserDTO"--%>
<form:form class="row g-3" action="${pageContext.request.contextPath}/user/save" method="post" modelAttribute="userDTO" enctype="multipart/form-data">
            <div class="col-md-6">
                <label for="inputName4" class="form-label">Name</label>
                <form:input type="text" class="form-control" id="inputName4" path="name"/>
                <form:errors path="name" cssClass="text-danger"/>
            </div>
            <div class="col-md-6">
                <label for="inputEmail4" class="form-label">Email</label>
                <form:input type="email" class="form-control" id="inputEmail4" path="email"/>
                <form:errors path="email" cssClass="text-danger"/>
            </div>
            <div class="col-md-6">
                <label for="inputPassword4" class="form-label">Password</label>
                <form:input type="password" class="form-control" id="inputPassword4" path="password"/>
                <input type="checkbox" onclick="showPassword()"> Show Password
                <form:errors path="password" cssClass="text-danger"/>
            </div>
            <div class="col-md-6">
                <label for="inputLocation" class="form-label">Location</label>
                    <form:select id="inputLocation" class="form-select" path="location">
                        <form:option selected="true" value="Select Location" disabled="true"/>
                        <form:options items="${stringLocationList}"/>
                    </form:select>
                <form:errors path="location" cssClass="text-danger"/>
            </div>
            <div class="col-md-6">
                <label for="formFile" class="form-label">Attachment</label>
                <input  type="file" id="formFile" name="image" accept="images/*">
            </div>
            <br>
            <div class="col-12">
                <button type="submit" class="btn btn-primary">Sign in</button>
            </div>
</form:form>
</div>

<script>
    function showPassword() {
        var x = document.getElementById("inputPassword4");
        if (x.type === "password") {
            x.type = "text";
        } else {
            x.type = "password";
        }
    }
</script>

</body>
</html>
