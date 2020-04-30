<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <%@ include file="/WEB-INF/views/common/header.jsp" %>

</head>
<body id="page-top">
<%@ include file="/WEB-INF/views/common/navbar.jsp" %>

<!-- Contact-->
<section class="page-section" id="contact">
    <div class="container">
        <div class="text-center">
            <h2 class="section-heading text-uppercase">Login</h2>
            <h3 class="section-subheading text-muted">서비스 이용을 위해서는 로그인을 해주시기 바랍니다.</h3>
        </div>
        <div class="text-center">
            <a href="${pageContext.request.contextPath}/join">일반 회원가입하기</a>
        </div>
        <hr/>
        <div class="text-center">
            <a href="${pageContext.request.contextPath}/login?loginType=admin">어드민 계정으로 로그인</a>
        </div>
        <div class="text-center">
            <a href="${pageContext.request.contextPath}/join?loginType=admin">미용실 사업자 회원가입하기</a>
        </div>
    </div>
</section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>