<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <%@ include file="/WEB-INF/views/common/header.jsp" %>

</head>
<script>

  $(document).ready(function () {

    if ($("#login_result").val() === "fail") {
      alert("로그인 실패!! 다시 시도하세요");
    }
  });
</script>
<body id="page-top">
<%@ include file="/WEB-INF/views/common/navbar.jsp" %>

<!-- Contact-->
<section class="page-section" id="contact">
    <div class="container">
        <div class="text-center">
            <h2 class="section-heading text-uppercase"><c:out value="${param.userType}"
                                                              default="user"/> Login</h2>
            <h3 class="section-subheading text-muted">서비스 이용을 위해서는 로그인을 해주시기 바랍니다.</h3>
        </div>
        <div class="row align-items-stretch mb-5 ">
            <div class="col-md-3"></div>
            <div class="col-md-6 text-center">
                <input type="hidden" value="${result}" id="login_result">
                <form class="form-signin" method="POST"
                      action="${pageContext.request.contextPath}/login?userType=<c:out value="${param.userType}" default="user"/>">
                    <label for="inputId" class="sr-only">Email address</label>
                    <input type="text" class="form-control" id="inputId" placeholder="아이디"
                           name="userId" required="" autofocus="">
                    <label for="inputPassword" class="sr-only">Password</label>
                    <input type="password" class="form-control" id="inputPassword"
                           placeholder="비밀번호" name="password" required="">
                    <button class="btn btn-lg btn-primary btn-block" type="submit"><c:out
                            value="${param.userType}" default="user"/> &nbsp로그인
                    </button>
                </form>
            </div>
            <div class="col-md-3"></div>
        </div>
        <hr/>


        <div class="row align-items-stretch mb-5">
            <div class="col-md-3"></div>
            <div class="col-md-6 row">
                <div class="col-md-6">
                    <div class="text-center">
                        <a href="${pageContext.request.contextPath}/login"><p class="text-warning">
                            일반 계정으로 로그인</p></a>
                    </div>
                    <div class="text-center">
                        <a href="${pageContext.request.contextPath}/join"><p class="text-warning">일반
                            회원가입하기</p></a>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="text-center">
                        <a href="${pageContext.request.contextPath}/login?userType=admin"><p
                                class="text-warning">어드민 계정으로 로그인</p></a>
                    </div>
                    <div class="text-center">
                        <a href="${pageContext.request.contextPath}/join?userType=admin"><p
                                class="text-warning">미용실 사업자 회원가입하기</p></a>
                    </div>
                </div>
            </div>
            <div class="col-md-3"></div>
        </div>
    </div>
    </div>
</section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>