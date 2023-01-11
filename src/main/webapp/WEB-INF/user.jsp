<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Plan Your Dreams - BackOffice</title>
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
        <div>
            <h1>Dashboard</h1>
            <div class="dashboard">
                <div class="dashboard-card">
                    <form action="${pageContext.request.contextPath}/user" method="post">
                        <h2>Nombre d'utilisateurs</h2>
                        <span>${fn:length(usersSize)}</span>
                    </form>
                </div>
                <div class="dashboard-card">
                    <h2>Utilisateurs non activés</h2>
                    <span>${fn:length(usersActives)}</span>
                </div>
                <div class="dashboard-card">
                    <h2>Nombre d'admins</h2>
                    <span>${fn:length(usersAdmins)}</span>
                </div>
            </div>
        </div>
        <div class="test user-dashboard-info-box table-responsive mb-0 bg-white shadow-sm ">
            <div class="user-dashboard-header">
                <h2>Tous les utilisateurs</h2>
            </div>
            <table class="table manage-users-top mb-0">
                <thead>
                <tr>
                    <th class="text-center">Nom</th>
                    <th class="text-center">Email</th>
                    <th class="text-center">Role</th>
                    <th class="text-center">Status du compte</th>
                    <th class="action text-center">Actions</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${users}" var="user">
                <tr class="users-list">
                    <td class="title  ">
                        <div class="thumb">
                                <c:choose>
                                    <c:when test="${user.userPicture == null}">
                                        <img class="img-fluid" src="/assets/img/no-image-icon-6.png" alt="">
                                    </c:when>
                                    <c:otherwise>
                                        <img class="img-fluid" src="http://localhost:8080/files/${user.userPicture}"alt="">
                                    </c:otherwise>
                                </c:choose>
                        </div>
                        <div class="user-list-details text-truncate">
                            <div class="user-list-info text-truncate">
                                <div class="user-list-title text-truncate user-name">
                                    <h5 class="text-truncate mb-0">${user.userFirstname} ${user.userName}</h5>
                                </div>
                                <div class="user-list-option">
                                    <ul class="list-unstyled user-name text-truncate">
                                        <li class="user-name text-truncate"><i
                                                class="fas fa-map-marker-alt pr-1 user-name text-truncate"> ${user.userCity} </i>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </td>
                    <td class="text-center text-truncate user-mail">
                        <a href="mailto:${user.userEmail}"><span class="span-td">${user.userEmail}</span></a>
                    </td>
                    <td class="text-center ">
                        <span class="user-list-time order-1"> ${user.rolesByRoleId.roleName} </span>
                    </td>
                    <td class="user-list-favourite-time text-center">
                            <span class="user-list-time order-1">
                                <c:choose>
                                    <c:when test="${user.isActive == 1}">
                                        <c:out value="Activé"/>
                                    </c:when>
                                    <c:otherwise>
                                        <c:out value="Non activé"/>
                                    </c:otherwise>
                                </c:choose>
                            </span>
                    </td>
                    <td>
                        <ul class="list-unstyled mb-0 d-flex justify-content-center actions">
                            <li><a href="${pageContext.request.contextPath}/user/edit?id=${user.userId}"
                                    data-toggle="tooltip" title="" data-original-title="Edit"><i
                                    class="fas fa-pencil-alt"></i></a></li>
                            <li>
                 <%--               <button class="text-danger border-0" data-bs-toggle="modal"
                                        data-bs-target="#exampleModal${user.userId}" id="myInput"><i class="far fa-trash-alt"></i></button>--%>
                                <button class="text-danger border-0 myInput" data-bs-toggle="modal"
                                        data-bs-target="#exampleModal" data-id="${user.userId}"><i class="far fa-trash-alt"></i></button>
                            </li>
                        </ul>
                    </td>
                </tr>
               <%-- <div class="modal fade" id="exampleModal${user.userId}" tabindex="-1" aria-labelledby="exampleModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title" id="exampleModalLabel">Suppression du compte</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                            </div>
                            <div class="modal-bod p-5">
                                Si vous continuez, le profil et les informations du compte seront totalements supprimés.
                                En revanche, si vous changez d'avis, sachez que vous ne pourrez pas le récupérer
                            </div>
                            <div class="modal-footer">
                                <form action="${pageContext.request.contextPath}/user/delete?id=${user.userId}"
                                      method="post">
                                    <button type="submit" class="btn btn-danger">Confirmer</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>--%>

                    </c:forEach>
                </tbody>
            </table>
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title" id="exampleModalLabel">Suppression du compte</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                        </div>
                        <div class="modal-bod p-5">
                            Si vous continuez, le profil et les informations du compte seront totalements supprimés.
                            En revanche, si vous changez d'avis, sachez que vous ne pourrez pas le récupérer
                        </div>
                        <div class="modal-footer">
                            <form action="${pageContext.request.contextPath}/user/delete?id=${user.userId}"
                                  method="post" id="myModalForm">
                                <button type="submit" class="btn btn-danger">Confirmer</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <c:if test="${fn:length(usersSize) > 5}">
                <div class="text-center mt-3 mt-sm-3">
                    <ul class="pagination justify-content-center mb-0">
                        <c:if test="${currentPage != 1}">
                            <li class="page-item"><a class="page-link"
                                                     href="user?currentPage=${currentPage-1}&recordsPerPage=${recordsPerPage}"><span>Prev</span>
                            </a></li>
                        </c:if>
                        <c:forEach begin="1" end="${noOfPages}" var="i">
                            <c:choose>
                                <c:when test="${currentPage eq i}">
                                    <li class="page-item active">
                                        <a class="page-link">${i} <span class="sr-only">(current)</span></a>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li class="page-item">
                                        <a class="page-link"
                                           href="user?currentPage=${i}&recordsPerPage=${recordsPerPage}">${i}</a></li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        <c:if test="${currentPage < noOfPages}">
                            <li class="page-item">
                                <a class="page-link"
                                   href="user?currentPage=${currentPage+1}&recordsPerPage=${recordsPerPage}">Next</a>
                            </li>
                        </c:if>
                    </ul>
                </div>
            </c:if>
        </div>
        <div class="user-card-responsive">
            <c:forEach items="${users}" var="user">
                <div class="card">
                    <a href="${pageContext.request.contextPath}/user/edit?id=${user.userId}">
                        <div class="user-card-responsive-image">
                            <c:choose>
                                <c:when test="${user.userPicture == null}">
                                    <img class="img-fluid" src="/assets/img/no-image-icon-6.png" alt="">
                                </c:when>
                                <c:otherwise>
                                    <img class="img-fluid" src="http://localhost:8080/files/${user.userPicture}"alt="">
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="card-body">
                            <h5 class="card-title">${user.userFirstname} ${user.userName}</h5>
                            <p class="card-text">${user.userEmail}</p>
                        </div>
                    </a>
                </div>
            </c:forEach>
            <div class="text-center mt-3 mt-sm-3">
                <ul class="pagination justify-content-center mb-0">
                    <c:if test="${currentPage != 1}">
                        <li class="page-item"><a class="page-link"
                                                 href="user?currentPage=${currentPage-1}&recordsPerPage=${recordsPerPage}"><span>Prev</span>
                        </a></li>
                    </c:if>
                    <c:forEach begin="1" end="${noOfPages}" var="i">
                        <c:choose>
                            <c:when test="${currentPage eq i}">
                                <li class="page-item active">
                                    <a class="page-link">${i} <span class="sr-only">(current)</span></a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li class="page-item">
                                    <a class="page-link"
                                       href="user?currentPage=${i}&recordsPerPage=${recordsPerPage}">${i}</a></li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <c:if test="${currentPage < noOfPages}">
                        <li class="page-item">
                            <a class="page-link"
                               href="user?currentPage=${currentPage+1}&recordsPerPage=${recordsPerPage}">Next</a>
                        </li>
                    </c:if>
                </ul>
            </div>
        </div>
    </div>


</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/main.js"></script>
</body>
</html>
