<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: warrior245
  Date: 6/6/22
  Time: 2:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Maintain</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<%@include file="../navbar.jsp" %>
<br>
<div class="container">


    <%--@elvariable id="statusDTO" type="com.this_project.dto.StatusDTO"--%>
        <form:form class="row g-3" method="POST" action="${pageContext.request.contextPath}/status/update"  modelAttribute="statusDTO">
            <table >
                <tr>
                    <div class="col-md-12">
                        <td><label class="form-label">Name : </label></td>
                        <td><form:input  path="id" placeholder="${statusDTO.id}" class="form-control" readonly="true"></form:input></td>
                    </div>
                </tr>
                <tr>
                    <div class="col-md-12">
                        <td><label class="form-label">Name : </label></td>
                        <td><form:input  path="title" placeholder="${statusDTO.title}" class="form-control"></form:input></td>
                    </div>
                </tr>
                <tr>
                    <div class="col-md-12">
                    <td><label class="form-label">Email : </label></td>
                    <td><form:input path="description" placeholder="${statusDTO.description}" class="form-control"></form:input></td>
                    </div>
                </tr>
                <tr>
                    <div class="col-md-4">
                        <td><label class="form-label">Password : </label></td>
                        <td><form:select path="privacy" class="form-select">
                            <form:option value="${statusDTO.privacy}"/>
                            <form:options items="${privacyList}"/>
                            </form:select>
                        </td>
                    </div>
                </tr>
                <tr>
                    <div class="col-md-4">
                        <td>
                            <label class="form-label" class="form-label">Location : </label>
                        </td>
                            <%--                    <td><form:input path="location" />${user.location}</td>--%>
                        <td><form:select id="inputState" class="form-select" path="location">
                            <form:option  value="${statusDTO.location}"/>
                            <form:options items="${stringLocationList}"/>
                            </form:select>
                        </td>
                </div>
                </tr>
                <tr>
                    <div class="col-md-12">
                        <td><input type="submit" class="btn btn-primary" value="save"/></td>
                    </div>
                </tr>
            </table>
        </form:form>
</div>
</body>
</html>
