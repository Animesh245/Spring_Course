<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="">
<head>
<!--    <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">-->
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
    <title></title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="/status/card-view">banglaMedium <i class="uil uil-intercom"></i></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">

<%--                <li class="nav-item dropdown">--%>
<%--                    <a class="nav-link dropdown-toggle" href="#"  role="button" data-bs-toggle="dropdown" aria-expanded="false">--%>
<%--                        User--%>
<%--                    </a>--%>
<%--                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">--%>
<%--                        <li><a class="dropdown-item" href="/user/create">Create User</a></li>--%>
<%--                        <li><a class="dropdown-item" href="/user/list">User List</a></li>--%>

<%--                    </ul>--%>
<%--                </li>--%>

                    <li class="nav-item">
                        <sec:authorize access="hasAuthority('ROLE_ADMIN')">
                            <a class="nav-link" href="/user/list" > User List</a>
                        </sec:authorize>
                    </li>

                    <li class="nav-item">
                        <sec:authorize access="hasAuthority('ROLE_USER')" >
                            <a class="nav-link" href="/user/getUser" > Update User</a>
                        </sec:authorize>
                    </li>
                <sec:authorize access="hasAuthority('ROLE_USER')" >
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#"  role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Status
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="/status/create">Create Status</a></li>
                        <li><a class="dropdown-item" href="/status/list">Status List</a></li>
                    </ul>
                </li>
                </sec:authorize>

                <li class="nav-item">
                    <sec:authorize access="hasAuthority('ROLE_ADMIN')" >
                        <a class="nav-link" href="/status/list" > Status List</a>
                    </sec:authorize>
                </li>

                <li class="nav-item dropdown">

                    <sec:authorize access="hasRole('ADMIN')">
                                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                                Location
                                            </a>
                                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                                <li><a class="dropdown-item" href="/location/create">Add Location</a></li>
                                                <li><a class="dropdown-item" href="/location/list">Location List</a></li>
                                            </ul>
                    </sec:authorize>

                </li>
            </ul>

            <ul class="navbar-nav navbar-right">
                <sec:authorize access="!isAuthenticated()">
                    <a class="btn btn-secondary" href="/auth/login">Login</a>
                </sec:authorize>
                <sec:authorize access="isAuthenticated()">
                    <!--                Username showing on homepage-->
<%--                    <sec:authentication property="username"/>--%>
                    <a class="btn btn-danger" href="/auth/logout">Logout</a>
                </sec:authorize>
            </ul>


        </div>
    </div>
</nav>

</body>
</html>
