<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>
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
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>

<%@include file="../navbar.jsp" %>
<br>

    <div id="id02" class="w3-card w3-animate-zoom w3-centered" style="max-width:20%;max-height: 80%;margin-left: 35%;margin-top: 10%">

        <div class="w3-center"><br>
            <label class=" w3-margin-top w3-text-black w3-large"><b>Register</b></label>
            <span onclick="document.getElementById('id02').style.display='none'" class="w3-button w3-text-black w3-large w3-right" title="Close Modal">
                <i class="fa fa-close"></i>
            </span>
            <!-- <img src="./wp3092250.jpg" alt="Avatar" style="width:30%" class="w3-circle w3-margin-top"> -->

        </div>


        <%--@elvariable id="userDTO" type="com.this_project.dto.UserDTO"--%>
        <form:form class="w3-container w3-small" action="${pageContext.request.contextPath}/user/save" method="post" enctype="multipart/form-data" modelAttribute="userDTO">
            <div class="w3-section w3-small">

                <label class=" w3-margin-top w3-text-black"><b>Name</b></label>
                <input:input class="w3-input w3-border w3-margin-bottom" type="text" placeholder="Enter Name"  required="" path="name"/>

                <label class=" w3-margin-top w3-text-black"><b>Email ID</b></label>
                <input:input class="w3-input w3-border w3-margin-bottom" type="email" path="email" placeholder="Enter Email"  required=""/>

                <label class=" w3-margin-top w3-text-black"><b>Location</b></label>
                <form:select class="w3-select w3-border" path="location" name="option">
                    <form:option selected="true" value="Select Location" disabled="true"/>
                    <form:options items="${stringLocationList}"/>
                </form:select>
                <form:errors path="location" cssClass="text-danger"/>

                <br>
                <label class=" w3-margin-top w3-text-black"><b>Profile Photo</b></label>
                <input class="w3-input  w3-margin-bottom" type="file" placeholder="Photo" name="image" accept="images/*" required=""/>

                <label class=" w3-margin-top w3-text-black"><b>Password</b></label>
                <input:input id="passsword" class="w3-input w3-border" type="password" placeholder="Enter Password" name="psw" required="" path="password"/>
                <input onclick="showPassword()" class="w3-check w3-margin-top" type="checkbox"><label class="w3-text-black w3-margin"> Show Password</label>
                <button class="w3-button w3-block w3-green w3-section w3-padding" type="submit">Register</button>
            </div>
        </form:form>

        <div class="w3-container w3-border-top w3-padding-16 w3-light-grey w3-small">
            <a href="/auth/login" type="button" class="w3-button w3-gray">Login</a>
            <span class="w3-right w3-padding w3-hide-small">Forgot <a href="#">password?</a></span>
        </div>
    </div>

<%--<div class="container-sm">--%>
<%--@elvariable id="userDTO" type="com.this_project.dto.UserDTO"--%>
<%--<form:form class="row g-3" action="${pageContext.request.contextPath}/user/save" method="post" modelAttribute="userDTO" enctype="multipart/form-data">--%>
<%--            <div class="col-md-6">--%>
<%--                <label for="inputName4" class="form-label">Name</label>--%>
<%--                <form:input type="text" class="form-control" id="inputName4" path="name"/>--%>
<%--                <form:errors path="name" cssClass="text-danger"/>--%>
<%--            </div>--%>
<%--            <div class="col-md-6">--%>
<%--                <label for="inputEmail4" class="form-label">Email</label>--%>
<%--                <form:input type="email" class="form-control" id="inputEmail4" path="email"/>--%>
<%--                <form:errors path="email" cssClass="text-danger"/>--%>
<%--            </div>--%>
<%--            <div class="col-md-6">--%>
<%--                <label for="inputPassword4" class="form-label">Password</label>--%>
<%--                <form:input type="password" class="form-control" id="inputPassword4" path="password"/>--%>
<%--                <input type="checkbox" onclick="showPassword()"> Show Password--%>
<%--                <br>--%>
<%--                <form:errors path="password" cssClass="text-danger"/>--%>
<%--            </div>--%>
<%--            <div class="col-md-6">--%>
<%--                <label for="inputLocation" class="form-label">Location</label>--%>
<%--                    <form:select id="inputLocation" class="form-select" path="location">--%>
<%--                        <form:option selected="true" value="Select Location" disabled="true"/>--%>
<%--                        <form:options items="${stringLocationList}"/>--%>
<%--                    </form:select>--%>
<%--                <form:errors path="location" cssClass="text-danger"/>--%>
<%--            </div>--%>
<%--            <div class="col-md-6">--%>
<%--                <label for="formFile" class="form-label">Attachment</label>--%>
<%--                <input  type="file" id="formFile" name="image" accept="images/*">--%>
<%--            </div>--%>
<%--            <br>--%>
<%--            <div class="col-12">--%>
<%--                <button type="submit" class="btn btn-primary">Sign in</button>--%>
<%--            </div>--%>
<%--</form:form>--%>
<%--</div>--%>

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
