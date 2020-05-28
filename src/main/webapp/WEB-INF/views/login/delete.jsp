<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <%@ include file="/WEB-INF/views/common/header.jsp" %>

    <script>
        $(document).ready(function () {
            if($("#delete_result").val() === "fail") {
                alert("비밀번호 인증 실패입니다. 재입력 해주십시오.");
            }

            $("#btnSubmit").on('click', function () {
                let deleteConfirm = confirm('회원 탈퇴 하시겠습니까?');
                if(deleteConfirm) {
                    return true;
                }
                return false;
            });
        });
    </script>

</head>

<body id="page-top">
<%@ include file="/WEB-INF/views/common/navbar.jsp" %>

<!-- Contact-->
<section class="page-section" id="contact">
    <div class="container">
        <div class="text-center">
            <h2 class="section-heading text-uppercase">Delete Account</h2>
            <h3 class="section-subheading text-muted">계정 탈퇴를 위해 비밀번호를 입력해주십시오.</h3>
        </div>
        <div class="row align-items-stretch mb-5 ">
            <div class="col-md-3"></div>
            <div class="col-md-6 text-center">
                <input type="hidden" value="${result}" id="delete_result">
                <form class="form-signin" method="POST" action="${pageContext.request.contextPath}/delete">
                    <label for="inputId" class="sr-only">Email address</label>
                    <input type="text" class="form-control" id="inputId" placeholder="아이디" name="userId" required="" autofocus=""
                           value="${sessionScope.loginUser.userId}" disabled>
                    <label for="inputPassword" class="sr-only">Password</label>
                    <input type="password" class="form-control" id="inputPassword" placeholder="비밀번호" name="password" required="">
                    <button class="btn btn-lg btn-primary btn-block" type="submit" id="btnSubmit">회원 탈퇴</button>
                </form>
            </div>
            <div class="col-md-3"></div>
        </div>
        <hr/>
    </div>
</section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>