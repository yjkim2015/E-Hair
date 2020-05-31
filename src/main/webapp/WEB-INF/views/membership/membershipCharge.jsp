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
    $(document).on("change", "#point", function (e) {
      console.log(e.currentTarget.value);
      let selectedPoint = e.currentTarget.value;
      let curPoint = $("#beforePoint").text()
      let afterPoint = parseInt(curPoint) + parseInt(selectedPoint);
      $("#afterPoint").text(afterPoint);
    })
</script>
<body id="page-top">
<%@ include file="/WEB-INF/views/common/navbar.jsp" %>
<!-- Services-->
<section class="page-section" id="services">
    <div class="container">
        <div class="text-center">
            <h2 class="section-heading text-uppercase">Membership</h2>
            <h3 class="section-subheading text-muted">충전하기</h3>
        </div>
        <div class="form-group">
            현재 잔액 : <span id="beforePoint"><c:out value="${point}" default="0"></c:out></span>원
        </div>
        <form action="${pageContext.request.contextPath}/membership/charge?userNo=${sessionScope.loginUser.userNo}" method="post">
            <div class="row">
                <div class="col-md-4">
                    <select name="price" id="point" class="form-control">
                        <option selected="">충전 금액 선택하기</option>
                        <option value="10000">10000원</option>
                        <option value="50000">50000원</option>
                        <option value="100000">100000원</option>
                        <option value="300000">300000원</option>
                    </select>
                </div>
                <div class="col-md-2">
                    <button type="submit" class="btn btn-outline-primary" id="charge_btn">충전하기</button>
                </div>
            </div>
        </form>
        <br/>
        <br/>
        <div class="form-group">
            충전 후 잔액 : <span id="afterPoint"></span>원
        </div>
    </div>
</section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>