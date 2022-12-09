<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<%--    <link href="<c:url value="/css/style.css" />" rel="stylesheet" type="text/css">--%>
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
        <h1>Dashboard</h1>
        <div class="dashboard">
            <div class="dashboard-card">
                <form action="${pageContext.request.contextPath}/user" method="post" >
                    <h2>Nombre d'utilisateurs</h2>
                    <span>${fn:length(users)}</span>
                </form>

            </div>
            <div class="dashboard-card">
                <h2>Utilisateurs non activés</h2>
                <span>${fn:length(usersActives)}</span>
            </div>
        </div>
        <div class="user-dashboard-info-box table-responsive mb-0 bg-white p-4 shadow-sm ">
            <div class="user-dashboard-header">
            <h2>Tous les utilisateurs</h2>

            <div class="input-group input-group-table mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text"><i class="fa-solid fa-magnifying-glass"></i></span>
                </div>
                <input type="text" class="form-control" id="rechercher" placeholder="Rechercher" aria-label="rechercher" aria-describedby="basic-addon1" >
            </div>

            </div>
            <table class="table manage-users-top mb-0">
                <thead>
                <tr>
                    <th class="text-center">Nom</th>
                    <th class="text-center">Email</th>
                    <th class="text-center">Role</th>
                    <th class="text-center">Status</th>
                    <th class="action text-center">Actions</th>
                </tr>
                </thead>
                <tbody>

<%--                <c:choose>--%>
<%--                    <c:when test="${condition1}">--%>


<%--                </c:choose>--%>

                <c:forEach items="${users}" var="user">
                <tr class="users-list">
                    <td class="title">
                            <div class="thumb">
                                <img class="img-fluid" src="https://bootdey.com/img/Content/avatar/avatar4.png" alt="">
                            </div>
                            <div class="user-list-details">
                                <div class="user-list-info">
                                    <div class="user-list-title">
                                        <h5 class="mb-0">${user.userFirstname} ${user.userName}</h5>
                                    </div>
                                    <div class="user-list-option">
                                        <ul class="list-unstyled">
                                            <li><i class="fas fa-map-marker-alt pr-1"> ${user.userCity} </i></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                    </td>
                    <td class="text-center text-truncate user-mail" >
                        <span class="span-td">${user.userEmail}</span>
                     </td>
                    <td class="text-center ">
                            <span class="user-list-time order-1"> ${user.rolesByRoleId.roleName} </span>
                    </td>
                    <td class="user-list-favourite-time text-center">
                            <span class="user-list-time order-1">
                                <c:choose >
                                    <c:when test="${user.isActive == 1}">
                                        <c:out value="Terminé"/>
                                    </c:when>
                                    <c:otherwise>
                                        <c:out value="Non activé"/>
                                    </c:otherwise>
                                </c:choose>
                            </span>
                    </td>
                    <td>
                        <ul class="list-unstyled mb-0 d-flex justify-content-center">
                            <li><a href="${pageContext.request.contextPath}/user/edit?id=${user.userId}" class="text-info" data-toggle="tooltip" title="" data-original-title="Edit"><i class="fas fa-pencil-alt"></i></a></li>
                            <li><button class="text-danger border-0" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="far fa-trash-alt"></i></button ></li>
                        </ul>
                    </td>
                </tr>
                </c:forEach>
                </tbody>
            </table>

    </div>
        </div>
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title" id="exampleModalLabel">Suppression du compte</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-bod p-5">
                    Si vous continuez, le profil et les informations du compte seront totalements supprimés. En revanche, si vous changez d'avis, sachez que vous ne pourrez pas le récupérer
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger">Confirmer</button>
                </div>
            </div>
        </div>
    </div>



    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/main.js"></script>
</body>
</html>
