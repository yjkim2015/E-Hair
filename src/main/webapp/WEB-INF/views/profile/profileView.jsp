<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>현재 프로필 </title>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
</head>
<body>
<script>
var userId = '${oneProfile.userId}';
var loginId = '${loginId}';
</script>
<%@ include file="/WEB-INF/views/common/navbar.jsp" %>
<section class="page-section bg-light" id="team">
       <div class="container">
           <div class="text-center">
           		<br>
               <h2 class="section-heading text-uppercase">현재 프로필</h2>
           </div>
           <div class="row">
               <div class="col-lg-4">
                   <div class="team-member">
                       <img class="mx-auto rounded-circle" src="../../../resources/assets/img/team/2.jpg" alt="" />
                       <h4>'${oneProfile.profile}'</h4>
                       <p class="text-muted">Lead Marketer</p>
                       <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-twitter"></i></a><a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-facebook-f"></i></a><a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-linkedin-in"></i></a>
                   </div>
               </div>
           </div>
           <div class="row">
               <div class="col-lg-8 mx-auto text-center"><p class="large text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aut eaque, laboriosam veritatis, quos non quis ad perspiciatis, totam corporis ea, alias ut unde.</p></div>
           </div>
     </div>
</section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>