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

    function readURL(input) {
      if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
          $('#cover').attr('src', e.target.result);        //cover src로 붙여지고
          $('#fileName').val(input.files[0].name);    //파일선택 form으로 파일명이 들어온다
        }
        reader.readAsDataURL(input.files[0]);
      }
    }

    $("#myFileUp").change(function () {
      readURL(this);
    });

  });
</script>
<style>
    img {
        max-width: 80%;
        max-height: 80%;
    }

    body {
        color: antiquewhite;
    }

    .fileRegiBtn label {
        display: inline-block;
        padding: .5em .75em;
        color: #ffffff;
        font-size: inherit;
        line-height: normal;
        vertical-align: middle;
        background-color: #FC7D01;
        cursor: pointer;
        border: 1px solid #ebebeb;
        border-bottom-color: #e2e2e2;
        border-radius: .25em;
    }

    /*파일선택시 선택된 파일명이 붙는것을 가려준다*/

    .fileRegiBtn input[type="file"] {
        position: absolute;
        width: 1px;
        height: 1px;
        padding: 0;
        margin: -1px;
        overflow: hidden;
        clip: rect(0, 0, 0, 0);
        border: 0;
    }

</style>
<body id="page-top">
<%@ include file="/WEB-INF/views/common/navbar.jsp" %>

<!-- Contact-->
<section class="page-section" id="contact">
    <div class="container">
        <div class="text-center">
            <h2 class="section-heading text-uppercase"><c:out value="${param.userType}"
                                                              default="user"/> 정보 수정</h2>
            <h3 class="section-subheading text-muted">회원님의 정보를 수정하세요.</h3>
        </div>
        <form action="${pageContext.request.contextPath}/user_update?userType=<c:out value="${param.userType}" default="user"/>"
              method="post">
            <div class="row align-items-stretch mb-5 ">
                <div class="col-md-6">
                    <!-- 파일등록 -->
                    <div class="form-group">
                        <div class="fileRegiBtn row">
                            <div class="col-md-8">
                                <input id="fileName" class="form-control" value="파일선택"
                                       disabled="disabled" style="display: inline;">
                            </div>
                            <div class="col-md-4">
                                <label for="myFileUp">파일등록하기</label>
                                <input type="file" id="myFileUp">
                            </div>
                        </div>
                    </div>
                    <!-- 커버이미지 들어오는 부분 (임시로 이미지를 넣어줬다)-->
                    <div class="selectCover" style="padding-left: 0;">
                        <img id="cover" src="../../../resources/assets/img/user/human_image.png"
                             style="width: 80%; height: 80%;"/>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <div class="input-group">
                            <input type="hidden" name="userNo" id="user_no" value="${sessionScope.loginUser.userNo}"/>
                        </div>
                        <div class="form-group">
                            <label class="col-form-label" for="user_id">유저 아이디</label>
                            <input class="form-control" id="user_id" name="userId" type="text" readonly value="${sessionScope.loginUser.userId}"/>
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
                        <label class="col-form-label" for="name">이름</label>
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

                        <div class="form-group">
                                <div class="custom-control custom-radio">
                                    <input type="radio" name="sex" id="jb-radio-1"
                                           class="custom-control-input" required="required"
                                           data-validation-required-message="Please check your sex."
                                           value="M" ${mSex}>
                                    <label class="custom-control-label" for="jb-radio-1">Man</label>
                                </div>
                                <div class="custom-control custom-radio">
                                    <input type="radio" name="sex" id="jb-radio-2"
                                           class="custom-control-input" required="required"
                                           data-validation-required-message="Please check your sex."
                                           value="F" ${fSex}>
                                    <label class="custom-control-label" for="jb-radio-2">Woman</label>
                                </div>
                            <p class="help-block text-danger"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-form-label" for="phone">핸드폰</label>
                        <input class="form-control" id="phone" name="phone" type="text"
                               placeholder="Your Phone *" required="required"
                               data-validation-required-message="Please enter your phone number."
                               value="${sessionScope.loginUser.phone}"/>
                        <p class="help-block text-danger"></p>
                    </div>
                    <div class="form-group">
                        <label class="col-form-label" for="age">생년월일</label>
                        <input class="form-control" id="age" name="age" type="text"
                               placeholder="ex) 20000316" required="required"
                               data-validation-required-message="Please enter your age"
                               value="${sessionScope.loginUser.age}"/>
                        <p class="help-block text-danger"></p>
                    </div>
                </div>
            </div>

            <div class="text-center">
                <button class="btn btn-primary btn-xl text-uppercase" type="submit">정보 수정하기</button>
            </div>
        </form>
    </div>
</section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>