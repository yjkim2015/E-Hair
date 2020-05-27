<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <script type="text/javascript">
        function logoutCheck() {
            var logoutFlag = confirm('로그아웃 하시겠습니까?');
            if(logoutFlag) {
                location.href = '${pageContext.request.contextPath}/logout';
            }
            return false;
        }
    </script>
</head>
<body>
<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
    <div class="container">
        <a class="navbar-brand js-scroll-trigger" href="${pageContext.request.contextPath}/#page-top"><img src="../../../resources/assets/img/navbar-logo.svg" /></a><button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">Menu<i class="fas fa-bars ml-1"></i></button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav text-uppercase ml-auto">
                <li class="nav-item"><a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/#services">Services</a></li>
                <li class="nav-item"><a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/#portfolio">Portfolio</a></li>
                <li class="nav-item"><a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/#about">About</a></li>
                <li class="nav-item"><a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/#team">Team</a></li>
                <li class="nav-item"><a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/#contact">Contact</a></li>
                <c:if test="${not empty sessionScope.loginUser}">
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/user_detail">회원수정</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/delete">탈퇴</a></li>
                <c:if test="${sessionScope.loginUser.adminNo == 0}">
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/membership?userNo=${sessionScope.loginUser.userNo}">포인트</a></li>
                </c:if>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="javascript:logoutCheck()">로그아웃</a></li>
                </c:if>
                <c:if test="${sessionScope.loginUser.adminNo != 0 && not empty sessionScope.loginUser}">
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/admin/${sessionScope.loginUser.adminNo}">관리자</a></li>
                </c:if>
                <c:if test="${empty sessionScope.loginUser}">
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/login">로그인</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/join">회원가입</a></li>
                </c:if>
            </ul>
        </div>
    </div>
</nav>
</body>

</html>