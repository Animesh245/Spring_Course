<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Login Page</title>
<%--    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/signin.css">--%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <style>
        html,
        body {
            height: 100%;
        }

        body {
            display: flex;
            align-items: center;
            padding-top: 40px;
            padding-bottom: 40px;
            background-color: rgb(220, 220, 220);
        }

        .form-signin {
            max-width: 330px;
            padding: 15px;
        }

        .form-signin .form-floating:focus-within {
            z-index: 2;
        }

        .form-signin input[type="email"] {
            margin-bottom: -1px;
            border-bottom-right-radius: 0;
            border-bottom-left-radius: 0;
        }

        .form-signin input[type="password"] {
            margin-bottom: 10px;
            border-top-left-radius: 0;
            border-top-right-radius: 0;
        }
    </style>
<%--    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>--%>
</head>
<body class="body">
<main class="form-signin w-100 m-auto">
    <c:if test="${error == 'true'}">
        <div class="alert alert-danger" role="alert">Wrong username or
            password
        </div>
    </c:if>
    <form:form action="${pageContext.request.contextPath }/login-processing" method="POST">
        <input type="hidden"
               name="${_csrf.parameterName}"
               value="${_csrf.token}"/>
        <!--    <img class="mb-4" src="/docs/{{< param docs_version >}}/assets/brand/bootstrap-logo.svg" alt="" width="72" height="57">-->
        <h1 class="h3 mb-3 fw-normal">Please sign in</h1>
        <div class="form-floating">
            <input name="email"  type="email" class="form-control" id="floatingInput" placeholder="name@example.com">
            <label for="floatingInput">Email address</label>
        </div>
        <div class="form-floating">
            <input name="password"  type="password" class="form-control" id="floatingPassword" placeholder="Password">
            <label for="floatingPassword">Password</label>
        </div>
        <div class="checkbox mb-3">
                    <input type="checkbox" onclick="showPassword()"> Show Password
        </div>
<%--        <button class="w-50  btn btn-primary" type="submit">Sign in</button> <button type="button" class="w-50 btn btn-success">Register</button>--%>

        <div class="d-grid gap-2 col-12 mx-auto">
            <button class="w-100 btn-lg btn-primary" type="submit">Login</button>
<%--            <button class="w-100 btn-lg btn-success" type="button" href="${pageContext.request.contextPath}/user/create">Register</button>--%>
            <div class="col-md-12">
                    <%--            <button type="submit" class="btn btn-secondary" formaction="${pageContext.request.contextPath}/user/create">Register</button>--%>
                <a type="button" class="w-100 btn btn-success" href="/user/create">Register</a>
            </div>
        </div>
    </form:form>
</main>

<script>
    function showPassword() {
        let x = document.getElementById("floatingPassword");
        if (x.type === "password") {
            x.type = "text";
        } else {
            x.type = "password";
        }
    }
</script>
</body>
</html>

