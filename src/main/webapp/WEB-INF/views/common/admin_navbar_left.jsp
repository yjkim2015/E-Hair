<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
</head>

<body class="fixed-navigation">
<!-- Navigation-->
<nav class="navbar-default navbar-static-side" role="navigation">
    <div class="sidebar-collapse">
        <ul class="nav metismenu" id="side-menu">
            <li class="nav-header">
                <div class="dropdown profile-element">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                        <span class="block m-t-xs font-bold">David Williams</span>
                        <span class="text-muted text-xs block">Art Director <b class="caret"></b></span>
                    </a>
                    <ul class="dropdown-menu animated fadeInRight m-t-xs">
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/">Logout</a></li>
                    </ul>
                </div>
                <div class="logo-element">
                    IN+
                </div>
            </li>
            <li>
                <a href="#">
                    <i class="fa fa-th-large"></i>
                    <span class="nav-label">대시보드</span>
                    <span class="fa arrow"></span>
                </a>
                <ul class="nav nav-second-level">
                    <li><a href="${pageContext.request.contextPath}/admin/${sessionScope.loginUser.adminNo}">매출 대시보드</a></li>
                </ul>
            </li>
            <li>
                <a href="#">
                    <i class="fa fa-th-large"></i>
                    <span class="nav-label">개인 정보 관리</span>
                    <span class="fa arrow"></span>
                </a>
                <ul class="nav nav-second-level">
                    <li><a href="${pageContext.request.contextPath}/profile?adminNo=${sessionScope.loginUser.adminNo}">Profile 수정</a></li>
                    <li><a href="${pageContext.request.contextPath}/dayOff?adminNo=${sessionScope.loginUser.adminNo}">휴무 설정</a></li>
                </ul>
            </li>
            <li>
                <a href="#">
                    <i class="fa fa-th-large"></i>
                    <span class="nav-label">서비스 관리</span>
                    <span class="fa arrow"></span>
                </a>
                <ul class="nav nav-second-level">
                    <li><a href="${pageContext.request.contextPath}/serviceView?adminNo=${sessionScope.loginUser.adminNo}">서비스</a></li>

                </ul>
            </li>
            <li>
                <a href="#">
                    <i class="fa fa-th-large"></i>
                    <span class="nav-label">예약 관리</span>
                    <span class="fa arrow"></span>
                </a>
                <ul class="nav nav-second-level">
                    <li><a href="${pageContext.request.contextPath}/reservationView?adminNo=${sessionScope.loginUser.adminNo}">예약 관리</a></li>
                </ul>
            </li>
        </ul>
    </div>
</nav>
</body>

</html>