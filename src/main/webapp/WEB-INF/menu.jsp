<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header class="d-flex d-md-block justify-content-between align-items-center">
        <div class="logo">
            <a href="#"><img class="w-100" src="${pageContext.request.contextPath}/assets/img/icons8-calendar-100.png" alt="logo calendar"></a>
        </div>
    <nav class="main-nav d-none d-sm-flex flex-md-column">
        <ul class="d-sm-flex flex-md-column ">
           <li class="list"><a class="d-flex align-items-center" href="#"><i class="fa-solid fa-gauge-high"></i><span>Dashboard</span></a></li>
           <li class="list"><a class="d-flex align-items-center" href="#"><i class="fa-regular fa-user"></i><span>Profil</span></a></li>
           <li class="list"><a class="d-flex align-items-center" href="#"><i class="fa-solid fa-gear"></i><span>Settings</span></a></li>
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

