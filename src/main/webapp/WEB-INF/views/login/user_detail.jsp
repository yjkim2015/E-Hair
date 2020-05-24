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


    });
</script>
<body id="page-top">
<%@ include file="/WEB-INF/views/common/navbar.jsp" %>

<!-- Contact-->
<section class="page-section" id="contact">
    <div class="container">
        <div class="text-center">
            <h2 class="section-heading text-uppercase"><c:out value="${param.userType}" default="user"/> 정보 수정</h2>
            <h3 class="section-subheading text-muted">회원님의 정보를 수정하세요.</h3>
        </div>
        <form action="${pageContext.request.contextPath}/user_update?userType=<c:out value="${param.userType}" default="user"/>" method="post">
            <div class="row align-items-stretch mb-5 ">
                <div class="col-md-6">
                    <input type="file">
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <div class="input-group">
                            <input type="hidden" name="userNo" value="${sessionScope.loginUser.userNo}"/>
                            <input class="form-control" id="user_id" name="userId" type="text" readonly
                                   value="${sessionScope.loginUser.userId}"/>
                        </div>
                        <p class="help-block text-danger"></p>
                    </div>
                    <!-- 어드민인 경우에만 해당 인풋창 생성 -->
                    <c:if test="${param.userType eq 'admin'}">
                        <div class="form-group">
                            <input class="form-control" id="shop_name" name="shopName" type="text"
                                   placeholder="Your Shop Name *" required="required"
                                   data-validation-required-message="Please enter shop name."/>
                            <p class="help-block text-danger"></p>
                        </div>
                    </c:if>
                    <div class="form-group">
                        <input class="form-control" id="name" type="text" name="name"
                               placeholder="Your Name *" required="required"
                               data-validation-required-message="Please enter your name."
                               value="${sessionScope.loginUser.name}"/>
                        <p class="help-block text-danger"></p>
                    </div>
                    <div class="form-group">
                        <c:choose>
                            <c:when test="${sessionScope.loginUser.sex eq 'F'}">
                                <c:set var="fSex" value="checked"/>
                            </c:when>
                            <c:when test="${sessionScope.loginUser.sex eq 'M'}">
                                <c:set var="mSex" value="checked"/>
                            </c:when>
                            <c:otherwise>
                                <c:set var="mSex" value="checked"/>
                            </c:otherwise>
                        </c:choose>
                        <div class="custom-control custom-radio">
                            <input type="radio" name="sex" id="jb-radio-1"
                                   class="custom-control-input" required="required"
                                   data-validation-required-message="Please check your sex."
                                   value="M" ${mSex}>
                            <label class="custom-control-label" for="jb-radio-1"
                                   style="background-color: white;">Man</label>
                        </div>
                        <div class="custom-control custom-radio">


                            <input type="radio" name="sex" id="jb-radio-2"
                                   class="custom-control-input" required="required"
                                   data-validation-required-message="Please check your sex."
                                   value="F" ${fSex}>
                            <label class="custom-control-label" for="jb-radio-2"
                                   style="background-color: white;">Woman</label>
                        </div>
                        <p class="help-block text-danger"></p>
                    </div>
                    <div class="form-group">
                        <input class="form-control" id="phone" name="phone" type="text"
                               placeholder="Your Phone *" required="required"
                               data-validation-required-message="Please enter your phone number."
                               value="${sessionScope.loginUser.phone}"/>
                        <p class="help-block text-danger"></p>
                    </div>
                    <div class="form-group">
                        <input class="form-control" id="age" name="age" type="text"
                               placeholder="Your Age *" required="required"
                               data-validation-required-message="Please enter your age"
                               value="${sessionScope.loginUser.age}"/>
                        <p class="help-block text-danger"></p>
                    </div>
                </div>
            </div>

            <div class="text-center">
                <div id="success"></div>
                <button class="btn btn-primary btn-xl text-uppercase" type="submit">정보 수정하기</button>
            </div>
        </form>
    </div>
</section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>