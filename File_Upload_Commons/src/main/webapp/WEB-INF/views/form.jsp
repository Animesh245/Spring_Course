<%--
  Created by IntelliJ IDEA.
  User: warrior245
  Date: 7/11/22
  Time: 12:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Product Form</title>
<%--    <style type="text/css">@import url("<c:url value="/css/main.css"/>");</style>--%>
</head>
<body>
<div id="global">

    <%--@elvariable id="product" type="model "--%>
    <form:form modelAttribute="product" action="/save-file" method="post"
               enctype="multipart/form-data">
        <fieldset>
            <legend>Add a product</legend>
            <img src="/images/${img}" >
<%--            <p>--%>
<%--                <label for="name">Product Name: </label>--%>
<%--                <form:input id="name" path="name"--%>
<%--                            cssErrorClass="error"/>--%>
<%--                <form:errors path="name" cssClass="error"/>--%>
<%--            </p>--%>
<%--            <p>--%>
<%--                <label for="description">Description: </label>--%>
<%--                <form:input id="description" path="description"/>--%>
<%--            </p>--%>
<%--            <p>--%>
<%--                <label for="price">Price: </label>--%>
<%--                <form:input id="price" path="price"--%>
<%--                            cssErrorClass="error"/>--%>
<%--            </p>--%>
            <p>
                <%--@declare id="image"--%><label for="image">Product Image: </label>
<%--                <input type="file" name="images[0]"/>--%>
                <input type="file" name="image"/>
            </p>
            <p id="buttons">
                <input id="reset" type="reset" tabindex="4">
                <input id="submit" type="submit" tabindex="5"
                       value="Add Product">
            </p>
        </fieldset>
    </form:form>
</div>
</body>
</html>
