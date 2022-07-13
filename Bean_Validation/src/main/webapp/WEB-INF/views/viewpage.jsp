<%--
  Created by IntelliJ IDEA.
  User: warrior245
  Date: 7/13/22
  Time: 5:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <style>
        .error{color:red}
    </style>
</head>
<body>
<%--@elvariable id="emp" type="model"--%>
<form:form action="${pageContext.request.contextPath}/hello_again" modelAttribute="emp" method="post">
    Username: <form:input path="name"/> <br><br>
    Password(*): <form:password path="pass"/>
    <form:errors path="pass" cssClass="error"/><br><br>
    <input type="submit" value="submit">
</form:form>
</body>
</html>
