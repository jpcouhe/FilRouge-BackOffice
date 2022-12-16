<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Plan Your Dreams - BackOffice</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="shortcut icon" href="<c:url value="/assets/img/favicon-32x32.png" />">
    <link href="<c:url value="/css/style.css" />" rel="stylesheet" type="text/css">
    <link href="<c:url value="/css/login.css" />" rel="stylesheet" type="text/css">
    <script src="https://kit.fontawesome.com/2588fb90ed.js" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
</head>
<body class="text-center body-container">
<main class="form-signin w-100 m-auto">
    <img src="../assets/img/icons8-calendar-100.png" alt="">
    <h1 class="h3 mb-5 fw-lighter">Plan Your Dreams</h1>
    <c:if test="${loginFail}">
        <div class="alert alert-danger" role="alert">Bad credentials</div>
    </c:if>
    <form method="post" action="${pageContext.request.contextPath}/login">
        <div class="form-floating">
            <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com" name="mail">
            <label for="floatingInput">Adresse email</label>
        </div>
        <div class="form-floating">
            <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="password">
            <label for="floatingPassword">Mot de passe</label>
        </div>
        <div class="checkbox mb-3">
            <label>
                <input type="checkbox" value="remember-me"> Se souvenir de moi
            </label>
        </div>
        <button class="form-btn w-100 btn btn-lg" type="submit">Se connecter</button>
    </form>
</main>


</body>
</html>
