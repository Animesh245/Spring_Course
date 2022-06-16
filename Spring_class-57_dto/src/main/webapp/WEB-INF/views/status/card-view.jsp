<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: warrior245
  Date: 6/14/22
  Time: 2:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Status Cards</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>
<%@include file="../../resources/js/header.ejs" %>
<br>

<c:forEach var="status" items="${statusList}">
            <div class="row row-cols-1 row-cols-md-3 g-4">
                <div class="col">
                    <div class="card">

<%--                <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">--%>
<%--                    <div class="carousel-inner">--%>
<%--                        <div class="carousel-item active">--%>
                            <c:forEach var="image" items="${status.getStatusAttachmentList()}">
                            <img src="/images/${image.getAttachmentPath()}" class="img-thumbnail" alt="..." height="200px" width="150px">
                            </c:forEach>
<%--                        </div>--%>
<%--                    </div>--%>

<%--                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">--%>
<%--                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>--%>
<%--                        <span class="visually-hidden">Previous</span>--%>
<%--                    </button>--%>
<%--                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">--%>
<%--                        <span class="carousel-control-next-icon" aria-hidden="true"></span>--%>
<%--                        <span class="visually-hidden">Next</span>--%>
<%--                    </button>--%>
<%--                </div>--%>
<%--                <img src="/images/${image.getAttachmentPath()}" class="card-img-top" alt="...">--%>

                        <div class="card-body">
                            <h5 class="card-title">${status.getStatusTitle()}</h5>
                            <p class="card-text">${status.getStatusDescription()}</p>
                            <a href="/status/show/${status.getId()}" class="btn btn-primary">See Full Story</a>
                        </div>
                    </div>
                </div>
                </div>
<%--        </div>--%>
</c:forEach>
<%--<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">--%>
<%--    <div class="carousel-inner">--%>
<%--        <div class="carousel-item active">--%>
<%--            <img src="..." class="d-block w-100" alt="...">--%>
<%--        </div>--%>
<%--        <div class="carousel-item">--%>
<%--            <img src="..." class="d-block w-100" alt="...">--%>
<%--        </div>--%>
<%--        <div class="carousel-item">--%>
<%--            <img src="..." class="d-block w-100" alt="...">--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">--%>
<%--        <span class="carousel-control-prev-icon" aria-hidden="true"></span>--%>
<%--        <span class="visually-hidden">Previous</span>--%>
<%--    </button>--%>
<%--    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">--%>
<%--        <span class="carousel-control-next-icon" aria-hidden="true"></span>--%>
<%--        <span class="visually-hidden">Next</span>--%>
<%--    </button>--%>
<%--</div>--%>
</body>
</html>
