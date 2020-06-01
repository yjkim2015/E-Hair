<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>미용실 통합 예약시스템 HIRS(Hairshop Integration Reservation System)</title>
    <%@ include file="/WEB-INF/views/common/header.jsp" %>

    <script type="text/javascript">

    </script>

</head>
<body id="page-top">
<%@ include file="/WEB-INF/views/common/navbar.jsp" %>
<section class="page-section">
    <div class="container">
        <div class="text-center">
            <h2 class="section-heading text-uppercase">마이페이지</h2>
            <h3 class="section-subheading text-muted">나의 이용 정보 확인</h3>
        </div>
        <div class="row align-items-stretch mb-5 ">
            <div class="col-md-6">
                <div class="selectCover" style="padding-left: 0;">
                    <img id="cover" src="<c:out value='displayFile?fileName=${sessionScope.loginUser.imgUrl}' default='../../../resources/assets/img/user/human_image.png'/>"
                         style="width: 80%; height: 80%;"/>
                </div>
            </div>

            <div class="col-md-6">
                <c:if test="${not empty sessionScope.loginUser}">
                    <c:if test="${sessionScope.loginUser.adminNo == 0}">
                <div class="form-group">
                    <a href="/user_detail" class="btn btn-block btn-outline-info"> 내 정보 수정하기 </a>
                </div>
                <hr/>
                <div class="form-group">
                    <a href="/mypage/reservation?userId=${loginUser.userId}" class="btn btn-block btn-outline-info"> 예약내역 확인하기 </a>
                </div>
                <hr/>
                <div class="form-group">
                    <a href="${pageContext.request.contextPath}/membership?userNo=${sessionScope.loginUser.userNo}" class="btn btn-block btn-outline-info"> 멤버쉽 잔액 확인하기 </a>
                </div>
                <hr/>
                <div class="form-group">
                    <a href="${pageContext.request.contextPath}/delete" class="btn btn-block btn-outline-danger"> 회원 탈퇴 </a>
                </div>
                    </c:if>
                </c:if>
            </div>
        </div>
    </div>
</section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>