<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <style><%@include file="/css/style.css"%></style>
    <script src="https://kit.fontawesome.com/2588fb90ed.js" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">

</head>
<body>

<%@ include file="menu.jsp"%>

<div class="w-100 container-dashboard" >
    <h1>Profil Utilisateur</h1>
            <div class="card-profil">
                <img class="card-profil-img" src="https://bootdey.com/img/Content/avatar/avatar4.png">
                <form class="needs-validation" novalidate>
                    <div class="row g-3">
                        <div class="col-6">
                            <label for="name" class="form-label">Nom</label>
                            <input  type="text" class="form-control form-profil" id="name">
                        </div>

                        <div class="col-6">
                            <label for="firstname" class="form-label">Prénom</label>
                            <input  type="text" class="form-control form-profil" id="firstname">
                        </div>

                        <div class="col-12">
                            <label for="role" class="form-label">Role</label>
                            <select class="form-select form-profil" id="role" >
                                <option value="">Choisir...</option>
                                <option value="admin">Admin</option>
                                <option value="user">Utilisateur</option>
                            </select>
                        </div>

                        <div class="col-12">
                            <label for="city" class="form-label">Ville</label>
                            <input type="text" class="form-control form-profil" id="city">
                        </div>

                    </div>
                    <div class="d-flex gap-5 profil-action">
                        <button class="w-50 btn btn-primary btn-lg" type="submit">Modifier</button>
                        <button class="w-50 btn btn-danger btn-lg" type="submit">Désactiver</button>
                    </div>
                </form>

    </div>

</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/main.js"></script>
</body>
</html>
