<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--<html lang="">--%>
<%--<head>--%>
<%--<!--    <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">-->--%>
<%--     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">--%>
<%--    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>--%>
<%--    <title></title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<nav class="navbar navbar-expand-lg navbar-dark bg-dark">--%>
<%--    <div class="container-fluid">--%>
<%--        <a class="navbar-brand" href="/status/card-view">banglaMedium <i class="uil uil-intercom"></i></a>--%>
<%--        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">--%>
<%--            <span class="navbar-toggler-icon"></span>--%>
<%--        </button>--%>
<%--        <div class="collapse navbar-collapse" id="navbarSupportedContent">--%>
<%--            <ul class="navbar-nav me-auto mb-2 mb-lg-0">--%>

<%--&lt;%&ndash;                <li class="nav-item dropdown">&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <a class="nav-link dropdown-toggle" href="#"  role="button" data-bs-toggle="dropdown" aria-expanded="false">&ndash;%&gt;--%>
<%--&lt;%&ndash;                        User&ndash;%&gt;--%>
<%--&lt;%&ndash;                    </a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <li><a class="dropdown-item" href="/user/create">Create User</a></li>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <li><a class="dropdown-item" href="/user/list">User List</a></li>&ndash;%&gt;--%>

<%--&lt;%&ndash;                    </ul>&ndash;%&gt;--%>
<%--&lt;%&ndash;                </li>&ndash;%&gt;--%>

<%--                    <li class="nav-item">--%>
<%--                        <sec:authorize access="hasAuthority('ADMIN')">--%>
<%--                            <a class="nav-link" href="/user/list" > User List</a>--%>
<%--                        </sec:authorize>--%>
<%--                    </li>--%>

<%--                    <li class="nav-item">--%>
<%--                        <sec:authorize access="hasAuthority('USER')" >--%>
<%--                            <a class="nav-link" href="/user/getUser" > Update User</a>--%>
<%--                        </sec:authorize>--%>
<%--                    </li>--%>
<%--                <sec:authorize access="hasAuthority('USER')" >--%>
<%--                <li class="nav-item dropdown">--%>
<%--                    <a class="nav-link dropdown-toggle" href="#"  role="button" data-bs-toggle="dropdown" aria-expanded="false">--%>
<%--                        Status--%>
<%--                    </a>--%>
<%--                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">--%>
<%--                        <li><a class="dropdown-item" href="/status/create">Create Status</a></li>--%>
<%--                        <li><a class="dropdown-item" href="/status/list">Status List</a></li>--%>
<%--                    </ul>--%>
<%--                </li>--%>
<%--                </sec:authorize>--%>

<%--                <li class="nav-item">--%>
<%--                    <sec:authorize access="hasAuthority('ADMIN')" >--%>
<%--                        <a class="nav-link" href="/status/list" > Status List</a>--%>
<%--                    </sec:authorize>--%>
<%--                </li>--%>

<%--                <li class="nav-item dropdown">--%>

<%--                    <sec:authorize access="hasRole('ADMIN')">--%>
<%--                                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">--%>
<%--                                                Location--%>
<%--                                            </a>--%>
<%--                                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">--%>
<%--                                                <li><a class="dropdown-item" href="/location/create">Add Location</a></li>--%>
<%--                                                <li><a class="dropdown-item" href="/location/list">Location List</a></li>--%>
<%--                                            </ul>--%>
<%--                    </sec:authorize>--%>

<%--                </li>--%>
<%--            </ul>--%>

<%--            <ul class="navbar-nav navbar-right">--%>
<%--                <sec:authorize access="!isAuthenticated()">--%>
<%--                    <a class="btn btn-secondary" href="/auth/login">Login</a>--%>
<%--                </sec:authorize>--%>
<%--                <sec:authorize access="isAuthenticated()">--%>
<%--                    <!--                Username showing on homepage-->--%>
<%--&lt;%&ndash;                    <sec:authentication property="username"/>&ndash;%&gt;--%>
<%--                    <a class="btn btn-danger" href="/auth/logout">Logout</a>--%>
<%--                </sec:authorize>--%>
<%--            </ul>--%>


<%--        </div>--%>
<%--    </div>--%>
<%--</nav>--%>

<%--</body>--%>
<%--</html>--%>


<%-- html page--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<div class="w3-top">
    <div class="w3-bar w3-border w3-large w3-indigo">
        <a href="/" class="w3-bar-item w3-button"><i class="fa fa-home"></i></a>

        <a href="#" class="w3-bar-item w3-button w3-center" style="margin-left:40%"><i class="fa fa-search"></i></a>


        <a href="../profile.jsp" class="w3-bar-item w3-button w3-margin-left"><i class="fa fa-user"></i></a>
        <a href="#" class="w3-bar-item w3-button w3-margin-left"><i class="fa fa-globe"></i></a>

        <!-- <a href="#" onclick="document.getElementById('id01')" class="w3-bar-item w3-button" style="margin-left: auto;"><i class="fa fa-sign-in"></i></a> -->


            <sec:authorize access="!isAuthenticated()">
<%--                            <a class="btn btn-secondary" href="/auth/login">Login</a>--%>
              <a href="/auth/login" class="w3-button w3-bar-item w3-blue w3-right" ><i class="fa fa-sign-in"></i></a>
            </sec:authorize>
            <sec:authorize access="isAuthenticated()">
                            <!--                Username showing on homepage-->
        <%--                    <sec:authentication property="username"/>--%>
              <a href="/auth/logout" class="w3-button w3-bar-item w3-red w3-large w3-right"><i class="fa fa-sign-in"></i></a>
<%--                            <a class="btn btn-danger" href="/auth/logout">Logout</a>--%>
            </sec:authorize>

    </div>
</div>


<%--<div class="w3-container">--%>
<%--    <div id="id01" class="w3-modal">--%>
<%--        <div class="w3-modal-content w3-card-6 w3-animate-zoom" style="max-width:20%;max-height: 80%;">--%>

<%--            <div class="w3-center"><br>--%>
<%--                <span onclick="document.getElementById('id01').style.display='none'" class="w3-button w3-text-black w3-large w3-display-topright" title="Close Modal"><i class="fa fa-close"></i></span>--%>
<%--                <!-- <img src="./wp3092250.jpg" alt="Avatar" style="width:30%" class="w3-circle w3-margin-top"> -->--%>
<%--                <label class=" w3-margin-top w3-text-black w3-large"><b>Login</b></label>--%>
<%--            </div>--%>


<%--            <form class="w3-container w3-small" action="/action_page.php">--%>
<%--                <div class="w3-section w3-small">--%>

<%--                    <label class=" w3-margin-top w3-text-black"><b>Email ID</b></label>--%>
<%--                    <input class="w3-input w3-border w3-margin-bottom" type="text" placeholder="Enter Email" name="usrname" required="">--%>

<%--                    <label class=" w3-margin-top w3-text-black"><b>Password</b></label>--%>
<%--                    <input id="paasssword" class="w3-input w3-border" type="password" placeholder="Enter Password" name="psw" required="">--%>


<%--                    <input onclick="showPassword()" class="w3-check w3-margin-top" type="checkbox"><label class="w3-text-black w3-margin"> Show Password</label>--%>
<%--                    <button class="w3-button w3-block w3-green w3-section w3-padding" type="submit">Login</button>--%>
<%--                </div>--%>
<%--            </form>--%>

<%--            <div class="w3-container w3-border-top w3-padding-16 w3-light-grey w3-small">--%>
<%--                <button onclick="shift()" type="button" class="w3-button w3-gray">Register</button>--%>
<%--                <span class="w3-right w3-padding w3-hide-small">Forgot <a href="#">password?</a></span>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>

<%--    <!-- Register -->--%>

<%--    <div id="id02" class="w3-modal">--%>
<%--        <div class="w3-modal-content w3-card-6 w3-animate-zoom" style="max-width:20%;max-height: 80%;">--%>

<%--            <div class="w3-center"><br>--%>
<%--                <span onclick="document.getElementById('id02').style.display='none'" class="w3-button w3-text-black w3-large w3-display-topright" title="Close Modal"><i class="fa fa-close"></i></span>--%>
<%--                <!-- <img src="./wp3092250.jpg" alt="Avatar" style="width:30%" class="w3-circle w3-margin-top"> -->--%>
<%--                <label class=" w3-margin-top w3-text-black w3-large"><b>Register</b></label>--%>
<%--            </div>--%>


<%--            <form class="w3-container w3-small" action="/action_page.php">--%>
<%--                <div class="w3-section w3-small">--%>

<%--                    <label class=" w3-margin-top w3-text-black"><b>Name</b></label>--%>
<%--                    <input class="w3-input w3-border w3-margin-bottom" type="text" placeholder="Enter Name"  required="">--%>

<%--                    <label class=" w3-margin-top w3-text-black"><b>Email ID</b></label>--%>
<%--                    <input class="w3-input w3-border w3-margin-bottom" type="email" placeholder="Enter Email"  required="">--%>

<%--                    <label class=" w3-margin-top w3-text-black"><b>Location</b></label>--%>
<%--                    <input class="w3-input w3-border w3-margin-bottom" type="text" placeholder="Enter Location"  required="">--%>

<%--                    <label class=" w3-margin-top w3-text-black"><b>Profile Photo</b></label>--%>
<%--                    <input class="w3-input  w3-margin-bottom" type="file" placeholder="Photo"  required="">--%>

<%--                    <label class=" w3-margin-top w3-text-black"><b>Password</b></label>--%>
<%--                    <input id="passsword" class="w3-input w3-border" type="password" placeholder="Enter Password" name="psw" required="">--%>
<%--                    <input onclick="showPassword()" class="w3-check w3-margin-top" type="checkbox"><label class="w3-text-black w3-margin"> Show Password</label>--%>
<%--                    <button class="w3-button w3-block w3-green w3-section w3-padding" type="submit">Register</button>--%>
<%--                </div>--%>
<%--            </form>--%>

<%--            <div class="w3-container w3-border-top w3-padding-16 w3-light-grey w3-small">--%>
<%--                <button onclick="shift()" type="button" class="w3-button w3-gray">Login</button>--%>
<%--                <span class="w3-right w3-padding w3-hide-small">Forgot <a href="#">password?</a></span>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

</body>
</body>
</html>