<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

</head>
<script>
    $(document).ready(function(){
      $("#joinForm input").jqBootstrapValidation({
        preventSubmit: true,
        submitError: function($form, event, errors) {
        },
        submitSuccess: function($form, event) {
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
                <form id="joinForm" novalidate="novalidate" action="${pageContext.request.contextPath}/join" method="post">
                    <div class="row align-items-stretch mb-5 ">
                        <div clahss="col-md-3"></div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <input class="form-control" id="user_id" name="userId" type="text" placeholder="Your ID *" required="required" data-validation-required-message="Please enter your id." />
                                <p class="help-block text-danger"></p>
                            </div>
                            <div class="form-group">
                                <input class="form-control" id="password" name="password" type="password" placeholder="Your Password *" required="required" data-validation-required-message="Please enter password." />
                                <p class="help-block text-danger"></p>
                            </div>
                            <div class="form-group">
                                <input class="form-control" id="password_check" type="password" placeholder="Confirm Password *" required="required" data-validation-required-message="Please enter password again." />
                                <p class="help-block text-danger"></p>
                            </div>
                            <div class="form-group">
                                <input class="form-control" id="name" type="text" name="name" placeholder="Your Name *" required="required" data-validation-required-message="Please enter your name." />
                                <p class="help-block text-danger"></p>
                            </div>
                            <div class="form-group">
                                <div class="custom-control custom-radio">
                                    <input type="radio" name="sex" id="jb-radio-1"  class="custom-control-input" required="required" data-validation-required-message="Please check your sex."  value="M">
                                    <label class="custom-control-label" for="jb-radio-1" style="background-color: white;">Man</label>
                                </div>
                                <div class="custom-control custom-radio">
                                    <input type="radio" name="sex" id="jb-radio-2" class="custom-control-input" required="required" data-validation-required-message="Please check your sex." value="F">
                                    <label class="custom-control-label" for="jb-radio-2" style="background-color: white;">Woman</label>
                                </div>
                                <p class="help-block text-danger"></p>
                            </div>
                            <div class="form-group">
                                <input class="form-control" id="phone" name="phone" type="text" placeholder="Your Phone *" required="required" data-validation-required-message="Please enter your phone number." />
                                <p class="help-block text-danger"></p>
                            </div>
                            <div class="form-group">
                                <input class="form-control" id="age" name="age" type="text" placeholder="Your Age *" required="required" data-validation-required-message="Please enter your age" />
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3"></div>
                    <div class="text-center">
                        <div id="success"></div>
                        <button class="btn btn-primary btn-xl text-uppercase" type="submit">회원 가입하기</button>
                    </div>
                </form>
            </div>
        </section>
        <%@ include file="/WEB-INF/views/common/footer.jsp" %>
    </body>
</html>