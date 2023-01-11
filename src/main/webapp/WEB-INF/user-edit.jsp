<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Plan Yours dream - BackOffice</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="shortcut icon" href="<c:url value="/assets/img/favicon-32x32.png" />">
    <link href="<c:url value="/css/style.css" />" rel="stylesheet" type="text/css">
    <link href="<c:url value="/css/menu.css" />" rel="stylesheet" type="text/css">
    <script src="https://kit.fontawesome.com/2588fb90ed.js" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
</head>
<body>
<div class="d-flex flex-column flex-md-row min-vh-100">
    <%@ include file="menu.jsp" %>
    <div class="w-100 container-dashboard">
        <c:choose>
            <c:when test="${user.userId == idAdmin}">
                <h1>Profil</h1>
            </c:when>
            <c:otherwise>
                <h1>Profil Utilisateur</h1>
            </c:otherwise>
        </c:choose>
        <div class="card-profil">
            <div class="card-profil-img">
                <img  src="http://localhost:8080/files/${user.userPicture}">
            </div>

            <form id=form" method="post" class="needs-validation form-edit"
                  action="${pageContext.request.contextPath}/user/edit?id=${user.userId}">
                <div class="row g-3 wrapper">
                    <div class="col-6">
                        <label for="name" class="form-label">Nom</label>
                        <input type="text" class="form-control form-profil" id="name" name="userName"
                               value="${user.userName}">
                    </div>
                    <div class="col-6">
                        <label for="firstname" class="form-label">Prénom</label>
                        <input type="text" class="form-control form-profil" id="firstname" name="userFirstname"
                               value="${user.userFirstname}">
                    </div>
                    <div class="col-12">
                        <label for="role" class="form-label">Role</label>
                        <select class="form-select form-profil" id="role" name="userRole">

                            <c:choose>
                                <c:when test="${user.roleId == 1}">
                                    <c:choose>
                                        <c:when test="${idRole == 3}">
                                            <option value="">Choisir...</option>
                                            <option value="2" >admin</option>
                                            <option value="1" selected>user</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="">Choisir...</option>
                                            <option value="2" disabled >admin</option>
                                            <option value="1" selected>user</option>
                                        </c:otherwise>
                                    </c:choose>

                                </c:when>
                                <c:when test="${user.roleId == 2}">
                                    <c:choose>
                                        <c:when test="${idRole == 3}">
                                            <option value="">Choisir...</option>
                                            <option value="2"selected>admin</option>
                                            <option value="1" >user</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="">Choisir...</option>
                                            <option value="2" selected>admin</option>
                                            <option value="1" disabled >user</option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:when>
                                <c:when test="${user.roleId == 3}">
                                    <option value="">Choisir...</option>
                                    <option value="3" selected>superadmin</option>
                                    <option value="2" disabled >admin</option>
                                    <option value="1" disabled >user</option>
                                </c:when>
                            </c:choose>
                        </select>
                    </div>
                    <div class="col-12">
                        <label for="city" class="form-label">Ville</label>
                        <input type="text" class="form-control form-profil" id="city" name="userCity"
                               value="${user.userCity}" >
                    </div>
                </div>
                <div class="d-flex justify-content-center profil-action">
                    <button class="w-50 btn btn-primary btn-lg btn-edit" type="submit">Modifier</button>
                </div>
            </form>
            <c:choose>
                <c:when test="${user.isActive == 1}">
                    <form class="d-flex justify-content-center" method="post"
                          action="${pageContext.request.contextPath}/user/desactivate?id=${user.userId}">
                        <button class="w-50 btn btn-danger btn-lg" type="submit">Désactiver</button>
                    </form>
                </c:when>
                <c:otherwise>
                    <form class="d-flex justify-content-center" method="post"
                          action="${pageContext.request.contextPath}/user/activate?id=${user.userId}">
                        <button class="w-50 btn btn-primary btn-lg" type="submit">Activer</button>
                    </form>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/main.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/edit-user.js"></script>
</body>
</html>
