<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: warrior245
  Date: 6/5/22
  Time: 7:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Status</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>

<%@include file="../navbar.jsp" %>
<br>
<div class="container">
    <%--@elvariable id="statusDTO" type="com.this_project.dto.StatusDTO"--%>
    <form:form class="row g-3" action="${pageContext.request.contextPath}/status/save" method="post" modelAttribute="statusDTO" enctype="multipart/form-data" >
        <div class="form-floating">
            <form:input class="form-control" id="formGroupExampleInput" path="title" type="text" placeholder="Example input placeholder"/>
            <label for="title" for="formGroupExampleInput" class="form-label">Title</label>
        </div>
        <div class="form-floating">
            <form:input class="form-control" path="description" type="text"  placeholder="Example input placeholder"/>
            <label for="description" class="form-label">Description</label>
        </div>

        <div class="col-md-4" >
        <form:select path="location" class="form-select">
            <form:option selected="true" value="Select Location" disabled="true"/>
            <form:options items="${locationList}"/>
        </form:select>
        </div>
        <div class="col-md-4">
        <form:select path="privacy" class="form-select">
            <form:option value="Select Privacy" disabled="true" selected="true"/>
            <form:options items="${privacyList}"/>
        </form:select>
        </div>
        <br>

        <div class="mb-3">
            <label for="formFile" class="form-label">Attachment</label>
            <input class="form-control" type="file" id="formFile" name="images" multiple="multiple" accept="image/*">
        </div>
        <div class="col-12">
            <button type="submit" class="btn btn-primary">Save</button>
        </div>

    </form:form>
</body>
</html>


<%--    &lt;%&ndash;@elvariable id="userDTO" type="com.this_project.dto.UserDTO"&ndash;%&gt;--%>
<%--    <form:form class="row g-3" action="${pageContext.request.contextPath}/user/save" method="post" modelAttribute="userDTO" enctype="multipart/form-data">--%>

<%--            <form:input type="text" class="form-control" id="formGroupExampleInput" placeholder="Example input placeholder" path="name"/>--%>
<%--            <label for= class="form-label">Name</label>--%>
<%--        </div>--%>
<%--        <div class="form-floating">--%>
<%--            <form:input type="email" class="form-control" id="formGroupExampleInput" placeholder="Example input placeholder" path="email"/>--%>
<%--            <label for="formGroupExampleInput" class="form-label">Email</label>--%>
<%--        </div>--%>
<%--        <div class="form-floating">--%>
<%--            <form:input type="password" class="form-control" id="floatingPassword" placeholder="Example input placeholder" path="password"/>--%>
<%--            <label for="floatingPassword" class="form-label">Password</label>--%>
<%--        </div>--%>
<%--        <div class="col-md-4">--%>
<%--                &lt;%&ndash;        <label for="inputState" class="form-label">Location</label>&ndash;%&gt;--%>
<%--            <form:select id="inputState" class="form-select" path="location">--%>
<%--                <form:option  value="Select Location"></form:option>--%>
<%--                <form:options items="${stringLocationList}"></form:options>--%>
<%--            </form:select>--%>
<%--        </div>--%>

<%--        <div class="mb-3">--%>
<%--            <label for="formFile" class="form-label">Attachment</label>--%>
<%--            <input class="form-control" type="file" id="formFile" name="image" accept="images/*">--%>
<%--        </div>--%>
<%--        <div class="col-12">--%>
<%--            <button type="submit" class="btn btn-primary">Save</button>--%>
<%--        </div>--%>
<%--    </form:form>--%>
<%--</div>--%>