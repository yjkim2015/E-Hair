<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>미용실 통합 예약시스템 HIRS(Hairshop Integration Reservation System)</title>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<script type="text/javascript">
    let deleteResult = '${param.deleteResult}';
    if(deleteResult == 'true') {
        alert('탈퇴 완료되었습니다.');
    }
    console.log(deleteResult);
</script>

</head>
<body id="page-top">
<%@ include file="/WEB-INF/views/common/navbar.jsp" %>
        <!-- Masthead-->
        <header class="masthead" style="height:1053px;">
            <div class="container">
                <div class="masthead-subheading" style="margin-top: 150px;">미용실 통합 예약시스템 <br>
                HIRS(Hairshop Integration Reservation System)</div>
                <div class="masthead-heading text-uppercase">It's Nice To Meet You</div>
            </div>
        </header>
        <%@ include file="/WEB-INF/views/common/footer.jsp" %>

    </body>
</html>