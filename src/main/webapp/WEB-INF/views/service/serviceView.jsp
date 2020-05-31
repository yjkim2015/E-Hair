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

  var shopNo = '${loginUser.shopNo}';
  var adminNo = '${loginUser.adminNo}';
  var searchParams = {};

  $(function () {
    initData();
    initEvent();
  });

  function initData() {
    var param = {};
    param.shopNo = shopNo;
    param.adminNo = adminNo;
    goAjaxGet('/allService', param, function (result) {
      var html = "";
      html = "<thead class='thead-dark'>"
      html += "<tr>" +
          "<th width='40%'>등록된 서비스명</th>" +
          "<th width='20%'>가격</th>" +
          "<th width='30%'>메모</th>" +
          "<th width='10%'></th>" +
          "</tr>";
      html +="</thead>"
      html += "<tbody>"
      $(result).each(function (k, v) {
        html += "<tr>" +
            "<td>" + v.serviceName + "</td>" +
            "<td>" + v.servicePrice + "</td>" +
            "<td>" + v.memo + "</td>" +
            "<td>삭제/수정 </td>" +
            "</tr>"
      });
      html += "</tbody>"

      $("#serviceList").html(html);
    });
  }

  function initEvent() {
    $('#register').on('click', function (e) {
      e.preventDefault();

      var serviceName = $('#serviceName').val();
      var servicePrice = $('#servicePrice').val();
      var memo = $('#memo').val();
      var shopNo = $('#shopNo').val();

      var searchParam = {};

      if (shopNo == null || shopNo == '') {
        alert("로그인 후 이용해주세요");
        return;
      }

      if (serviceName == null || serviceName == '') {
        alert("서비스명을 입력해주세요 ");
        return;
      }

      if (servicePrice == null || servicePrice == '') {
        alert("가격을 입력해주세요");
      }

      searchParam.serviceName = serviceName;
      searchParam.servicePrice = servicePrice;
      searchParam.memo = memo;
      searchParam.shopNo = shopNo;

      goAjaxPost('/insertService', searchParam, function (result) {

        if (result.status == 'OK') {
          alert('서비스가 등록되었습니다');
          initData();
        }
      });
    });
  }
</script>
<body class="fixed-navigation">
<div id="wrapper">
    <%@ include file="/WEB-INF/views/common/admin_navbar_left.jsp" %>
    <div id="page-wrapper" class="gray-bg">
        <%@ include file="/WEB-INF/views/common/admin_navbar_top.jsp" %>
        <div class="text-left">
            <h2>서비스 관리</h2>
        </div>
        <hr/>
        <div class="form-group">
            <h3>서비스 등록</h3>
        </div>
        <div class="col-md-12">
            <form id="serviceForm">
                <div class="form-group">
                    <label for="serviceName" class="col-form-label">서비스명</label>
                    <input type="text" name="serviceName" id="serviceName" class="form-control" placeholder="서비스명"/>
                </div>
                <div class="form-group">
                    <label for="servicePrice" class="col-form-label">가격</label>
                    <input type="text" name="servicePrice" id="servicePrice" class="form-control" placeholder="숫자만 가능"/>
                </div>
                <div class="form-group">
                    <label for="memo" class="col-form-label" >메모</label>
                    <input type="text" id="memo" name="memo" class="form-control"  placeholder="메모">
                </div>
                <input type="hidden" id="shopNo" name="shopNo" value="${sessionScope.loginUser.shopNo}">
                <div class="form-group">
                    <button type="button" class="btn btn-block btn-primary" id="register">
                        서비스 등록
                    </button>
                </div>
            </form>
        </div>
        <hr/>
        <div class="form-group">
            <h3>등록된 서비스 리스트 </h3>
            <div class="col-md-12">
                <table id="serviceList" class="table table-bordered table-striped table-hover">
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>