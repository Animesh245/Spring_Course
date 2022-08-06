<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Login Page</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<%@include file="../navbar.jsp"%>

        <div id="id01" class="w3-card w3-centered w3-animate-zoom" style="max-width:20%;max-height: 80%; margin-left: 35%;margin-top: 10%">

            <div class="w3-center"><br>
                <label class=" w3-margin-top w3-text-black w3-large"><b>Login</b></label>
                <span onclick="document.getElementById('id01').style.display='none'" class="w3-button w3-text-black w3-large w3-right" title="Close Modal">
                    <i class="fa fa-close"></i>
                </span>

            </div>


            <form:form class="w3-container w3-small" action="${pageContext.request.contextPath }/login-processing" method="post">
                <div class="w3-section w3-small">

                    <label class=" w3-margin-top w3-text-black"><b>Email ID</b></label>
                    <input class="w3-input w3-border w3-margin-bottom" type="email" placeholder="Enter Email" name="email" required="">

                    <label class=" w3-margin-top w3-text-black"><b>Password</b></label>
                    <input id="password" class="w3-input w3-border" type="password" placeholder="Enter Password" name="password" required="">

                    <input onclick="showPassword()" class="w3-check w3-margin-top" type="checkbox"><label class="w3-text-black w3-margin"> Show Password</label>
                    <button class="w3-button w3-block w3-green w3-section w3-padding" type="submit">Login</button>
                </div>
            </form:form>

            <div class="w3-container w3-border-top w3-padding-16 w3-light-grey w3-small">
                <a href="/user/create" type="button" class="w3-button w3-gray">Register</a>
                <span class="w3-right w3-padding w3-hide-small">Forgot <a href="#">password?</a></span>
            </div>
        </div>
<%--<main class="form-signin w-100 m-auto">--%>
<%--    <c:if test="${error == 'true'}">--%>
<%--        <div class="alert alert-danger" role="alert">Wrong username or--%>
<%--            password--%>
<%--        </div>--%>
<%--    </c:if>--%>
<%--    <form:form action="${pageContext.request.contextPath }/login-processing" method="POST">--%>
<%--        <input type="hidden"--%>
<%--               name="${_csrf.parameterName}"--%>
<%--               value="${_csrf.token}"/>--%>
<%--        <!--    <img class="mb-4" src="/docs/{{< param docs_version >}}/assets/brand/bootstrap-logo.svg" alt="" width="72" height="57">-->--%>
<%--        <h1 class="h3 mb-3 fw-normal">Please sign in</h1>--%>
<%--        <div class="form-floating">--%>
<%--            <input name="email"  type="email" class="form-control" id="floatingInput" placeholder="name@example.com">--%>
<%--            <label for="floatingInput">Email address</label>--%>
<%--        </div>--%>
<%--        <div class="form-floating">--%>
<%--            <input name="password"  type="password" class="form-control" id="floatingPassword" placeholder="Password">--%>
<%--            <label for="floatingPassword">Password</label>--%>
<%--        </div>--%>
<%--        <div class="checkbox mb-3">--%>
<%--                    <input type="checkbox" onclick="showPassword()"> Show Password--%>
<%--        </div>--%>
<%--&lt;%&ndash;        <button class="w-50  btn btn-primary" type="submit">Sign in</button> <button type="button" class="w-50 btn btn-success">Register</button>&ndash;%&gt;--%>

<%--        <div class="d-grid gap-2 col-12 mx-auto">--%>
<%--            <button class="w-100 btn-lg btn-primary" type="submit">Login</button>--%>
<%--&lt;%&ndash;            <button class="w-100 btn-lg btn-success" type="button" href="${pageContext.request.contextPath}/user/create">Register</button>&ndash;%&gt;--%>
<%--            <div class="col-md-12">--%>
<%--                    &lt;%&ndash;            <button type="submit" class="btn btn-secondary" formaction="${pageContext.request.contextPath}/user/create">Register</button>&ndash;%&gt;--%>
<%--                <a type="button" class="w-100 btn btn-success" href="/user/create">Register</a>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </form:form>--%>
<%--</main>--%>

<script>
        function shift(){
        let x = document.getElementById("id01");
        let y = document.getElementById("id02");

        if(x.style.display === 'block')
    {
        x.style.display='none';
        y.style.display='block';
    }else{
        x.style.display='block';
        y.style.display='none';
    }
    }
    function showPassword() {
        let x = document.getElementById("password");

        if (x.type === "password") {
            x.type = "text";
        } else {
            x.type = "password";
        }
    }
</script>
</body>
</html>

