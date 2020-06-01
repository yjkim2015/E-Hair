<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
</head>
<style>
    body {
        color: antiquewhite;
    }
</style>
<script type="application/javascript">
    $(document).ready(function () {
        // 밸리데이션
        $("#joinForm input").jqBootstrapValidation({
            preventSubmit: true,
            submitError: function ($form, event, errors) {
            },
            submitSuccess: function ($form, event) {
            }
        });

        // 패스워드 중복체크
        $('.pw').focusout(function () {
            var pwd1 = $("#password_1").val();
            var pwd2 = $("#password_2").val();

            if (pwd1 != '' && pwd2 == '') {
                null;
            } else if (pwd1 != "" || pwd2 != "") {
                if (pwd1 == pwd2) {
                    $("#alert-success").css('display', 'inline-block');
                    $("#alert-danger").css('display', 'none');
                } else {
                    alert("비밀번호가 일치하지 않습니다. 비밀번호를 재확인해주세요.");
                    $("#password_1").val("");
                    $("#password_2").val("");
                    $("#alert-success").css('display', 'none');
                    $("#alert-danger").css('display', 'inline-block');
                }
            }
        });

        let checkIdFlag = false;

        // 아이디 중복체크 -> user, admin
        $("#checkId").on("click", function () {
            let id = $("#user_id").val();
            let userType = '${param.userType}';

            $.ajax({
                url: "${pageContext.request.contextPath}/check-id?id=" + id + "&userType=" + userType,
                type: "GET",
                dataType: "json",
                success: function (data) {
                    console.log(data);
                    if (data.checkId === false) {
                        $("#checkId").css('background-color', 'green');
                        alert("확인 되었습니다.")
                        $("#user_id").focus()
                        checkIdFlag = true;
                    } else {
                        alert("이미 존재하는 아이디입니다. 재입력 해주십시오.")
                        $("#user_id").val('')
                        $("#user_id").focus()
                    }
                }
            })
        })

        // 회원가입 버튼 클릭 -> 아이디 중복체크 여부
        $("#btnSubmit").on('click', function() {
            if(checkIdFlag != true) {
                alert("아이디 중복체크는 필수입니다.")
            }
        });
    });

</script>
<body id="page-top">
<%@ include file="/WEB-INF/views/common/navbar.jsp" %>
<!-- Contact-->
<section class="page-section" id="contact">
    <div class="container">
        <div class="text-center">
            <h2 class="section-heading text-uppercase">Join</h2>
            <h3 class="section-subheading text-muted">회원 가입을 환영합니다.</h3>
        </div>
        <form id="joinForm" novalidate="novalidate" method="post"
                <c:choose>
                    <c:when test="${param.userType eq 'admin'}">
                        action="${pageContext.request.contextPath}/join?userType=admin"
                    </c:when>
                    <c:otherwise>
                        action="${pageContext.request.contextPath}/join?userType=user"
                    </c:otherwise>
                </c:choose>
        >

            <div class="row align-items-stretch mb-5 ">
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-form-label" for="user_id">아이디</label>
                        <div class="input-group">

                            <input class="form-control" id="user_id" name="userId" type="text"
                                   placeholder="Your ID *" required="required"
                                   data-validation-required-message="Please enter your id."/>
                            <button class="btn btn-info" type="button" id="checkId">중복 확인</button>
                        </div>
                        <p class="help-block text-danger"></p>
                    </div>
                    <!-- 어드민인 경우에만 해당 인풋창 생성 -->
                    <c:if test="${param.userType eq 'admin'}">
                        <div class="form-group">
                            <label class="col-form-label" for="shop_name">매장명</label>
                            <input class="form-control" id="shop_name" name="shopName" type="text"
                                   placeholder="Your Shop Name *" required="required"
                                   data-validation-required-message="Please enter shop name."/>
                            <p class="help-block text-danger"></p>
                        </div>
                    </c:if>
                    <div class="form-group">
                        <label class="col-form-label" for="password_1">비밀번호</label>
                        <input class="form-control pw" id="password_1" name="password" type="password"
                               placeholder="Your Password *" required="required"
                               data-validation-required-message="Please enter password."/>
                        <p class="help-block text-danger"></p>
                    </div>
                    <div class="form-group">
                        <label class="col-form-label" for="password_2">비밀번호 확인</label>
                        <input class="form-control pw" id="password_2" type="password"
                               placeholder="Confirm Password *" required="required"
                               data-validation-required-message="Please enter password again."/>
                        <p class="help-block text-danger"></p>
                        <div class="text-center">
                            <span id="alert-success" style="display: none; color: black; background-color:greenyellow">비밀번호가 일치합니다.</span>
                            <span id="alert-danger"
                                  style="display: none; color: white; font-weight: bold; background-color: #a71d2a ">비밀번호가 일치하지 않습니다.</span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-form-label" for="name">이름</label>
                        <input class="form-control" id="name" type="text" name="name"
                               placeholder="Your Name *" required="required"
                               data-validation-required-message="Please enter your name."/>
                        <p class="help-block text-danger"></p>
                    </div>

                    <div class="form-group">
                        <div class="custom-control custom-radio">
                            <input type="radio" name="sex" id="jb-radio-1"
                                   class="custom-control-input" required="required"
                                   data-validation-required-message="Please check your sex."
                                   value="M">
                            <label class="custom-control-label" for="jb-radio-1">Man</label>
                        </div>
                        <div class="custom-control custom-radio">
                            <input type="radio" name="sex" id="jb-radio-2"
                                   class="custom-control-input" required="required"
                                   data-validation-required-message="Please check your sex."
                                   value="F">
                            <label class="custom-control-label" for="jb-radio-2">Woman</label>
                        </div>
                        <p class="help-block text-danger"></p>
                    </div>
                    <div class="form-group">
                        <label class="col-form-label" for="phone">핸드폰</label>
                        <input class="form-control" id="phone" name="phone" type="text"
                               placeholder="Your Phone *" required="required"
                               data-validation-required-message="Please enter your phone number."/>
                        <p class="help-block text-danger"></p>
                    </div>
                    <div class="form-group">
                        <label class="col-form-label" for="age">생년월일</label>
                        <input class="form-control" id="age" name="age" type="text"
                               placeholder="ex) 19990301" required="required"
                               data-validation-required-message="생년월일"/>
                        <p class="help-block text-danger"></p>
                    </div>
                </div>
            </div>
            <div class="col-md-3"></div>
            <div class="text-center">
                <div id="success"></div>
                <button class="btn btn-primary btn-xl text-uppercase" type="submit" id="btnSubmit">회원 가입하기</button>
            </div>
        </form>
    </div>
</section>
</body>
</html>