<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header class="d-flex d-md-block justify-content-between align-items-center">
        <div class="logo">
            <a href="${pageContext.request.contextPath}/user?currentPage=1&recordsPerPage=5"><img class="w-100" src="${pageContext.request.contextPath}/assets/img/icons8-calendar-100.png" alt="logo calendar"></a>
        </div>
    <nav class="main-nav">
        <ul class="d-sm-flex  ">
           <li class="list"><a class="d-flex align-items-center" href="${pageContext.request.contextPath}/user?currentPage=1&recordsPerPage=5"><i class="fa-solid fa-gauge-high"></i><span>Dashboard</span></a></li>
           <li class="list"><a class="d-flex align-items-center" href="${pageContext.request.contextPath}/user/edit?id=${idAdmin}"><i class="fa-regular fa-user"></i><span>Profil</span></a></li>
           <li class="list"><a class="d-flex align-items-center" href="${pageContext.request.contextPath}/search"><i class="fa-solid fa-magnifying-glass"></i><span>Rechercher</span></a></li>
        </ul>
        <div class="logout w-100">
                <form class="logout-form text-center" action="${pageContext.request.contextPath}/logout" method="post">
                        <button class="text-uppercase border-0">Signout</button>
                </form>
        </div>
    </nav>

    <button class="nav-toggler d-block border-0 d-sm-none " aria-label="ouvrir et fermer le menu" type="submit">
        <img class="w-100" src="${pageContext.request.contextPath}/assets/img/hamburger.svg" alt="icone de menu">
    </button>
</header>

