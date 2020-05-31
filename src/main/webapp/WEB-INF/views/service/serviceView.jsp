<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <%@ include file="/WEB-INF/views/common/header.jsp" %>

</head>
<body>
<script>

  var shopNo = '${loginUser.shopNo}';
  var adminNo = '${loginUser.adminNo}';
  var searchParams = {};

  $(function () {
    initComponent();
    initData();
    initEvent();
  });

  function initComponent() {

  }

  function initData() {
    var param = {};
    param.shopNo = shopNo;
    param.adminNo = adminNo;
    goAjaxGet('/allService', param, function (result) {
      console.log(result);
    });
  }

  function initEvent() {

  }
</script>
<%@ include file="/WEB-INF/views/common/navbar.jsp" %>

<section class="page-section bg-light" id="team" style="height:1053px;">
    <div class="container" style="margin-top:100px;">
        <div class="text-center">
            <br><br>
            <h2 class="section-heading text-uppercase">서비스 관리</h2>
            <br><br>
        </div>
        <div class="row">
            <form id="serviceForm" style="width:250px; margin-left:200px;">
                <label for="serviceName">서비스명</label><input type="text" name="serviceName"
                                                            id="serviceName"/>
                <label for="servicePrice">가격</label><input type="text" name="servicePrice"
                                                           id="servicePrice"/>
                <label for="memo">메모</label><input type="text" id="memo" name="memo">
                <input type="hidden" id="shopNo" name="shopNo" value="${loginUser.shopNo}">
                <button type="button" class="btn-primary" style="margin-top:10px;">서비스 등록</button>
            </form>
            <table id="serviceList" border="1" style="width:500px;">
                <tr>
                    <th>등록 된 서비스명</th>
                    <th>가격</th>
                    <th>메모</th>
                </tr>
                <tr>
                    <td>11</td>
                    <td>22</td>
                    <td>33</td>
                </tr>
            </table>
        </div>


    </div>
</section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>