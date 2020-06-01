<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

<script type="text/javascript">
  // from controller
  var adminNo = '${sessionScope.loginUser.adminNo}';

  // date format -> 추후, datepicker 대체 가능
  function getTimeStamp(readType) {
    var d = new Date();
    var s =
        leadingZeros(d.getFullYear(), 4) + '-' +
        leadingZeros(d.getMonth() + 1, 2);
    if (readType == 'salesDay') {
      s += '-' + leadingZeros(d.getDate(), 2);
    }
    return s;
  }

  function leadingZeros(n, digits) {
    var zero = '';
    n = n.toString();
    if (n.length < digits) {
      for (i = 0; i < digits - n.length; i++)
        zero += '0';
    }
    return zero + n;
  }

  function openPopUp(url) {
    window.open(url, "", "width=600, height=600, left=600");
  }


  // 일별 매출, 월별 매출, 고객 관리, 후기 관리 데이터 호출용 함수
  function callAjax(readType, searchValue, pageNum) {

    // searchValue X -> default 세팅
    if (readType == 'salesDay') {
      if (searchValue == '') {
        searchValue = getTimeStamp(readType);
      } else {
        searchValue = $('#dateValue').val();
      }
    } else if (readType == 'salesMonth') {
      if (searchValue == '') {
        searchValue = getTimeStamp(readType);
      } else {
        searchValue = $('#dateValue').val();
      }
    } else if (readType == 'user') {
      if (searchValue != '') {
        searchValue = $('#userValue').val();
      }
    }

    $.ajax({
      url: '/admin/read',
      data: {
        readType: readType,
        adminNo: adminNo,
        searchValue: searchValue,
        pageNum: pageNum
      },
      type: 'get',
      success: function (data) {
        var html = '';
        if (data.readType == 'salesDay' || data.readType == 'salesMonth') {
          html += '<thead>'
          html += '<tr>'
          html += '<th>번호</th>'
          html += '<th>매출</th>'
          html += '<th>매출내용</th>'
          html += '<th>발생일자</th>'
          html += '</tr>'
          html += '</thead>'
          html += '<tbody>'
          for (var i = 0; i < data.dataList.length; i++) {
            html += '<tr>'
            html += '<td>' + data.dataList[i].salesNo + '</td>'
            html += '<td>' + data.dataList[i].income + '</td>'
            html += '<td>' + data.dataList[i].memo + '</td>'
            html += '<td>' + new Date(data.dataList[i].insertDate).toLocaleString() + '</td>'
            html += '</tr>'
          }
        } else if (data.readType == 'user') {
          html += '<thead>'
          html += '<tr>'
          html += '<th>아이디</th>'
          html += '<th>이름</th>'
          html += '<th>성별</th>'
          html += '<th>전화번호</th>'
          html += '<th>나이</th>'
          html += '<th>가입일자</th>'
          html += '</tr>'
          html += '</thead>'
          html += '<tbody>'
          for (var i = 0; i < data.dataList.length; i++) {
            html += '<tr>'
            html += '<td>' + data.dataList[i].userId + '</td>'
            html += '<td>' + data.dataList[i].name + '</td>'
            html += '<td>' + data.dataList[i].sex + '</td>'
            html += '<td>' + data.dataList[i].phone + '</td>'
            html += '<td>' + data.dataList[i].age + '</td>'
            html += '<td>' + new Date(data.dataList[i].insertDate).toLocaleString() + '</td>'
            html += '<td><button class="btn btn-primary"' +
                'onclick="openPopUp(' + '\'/admin/add/memo?userId=' + data.dataList[i].userId
                + '&userNo=' + data.dataList[i].userNo
                + '&pageNum=1&readType=memo\')">메모 확인 및 등록</button></td>'
            html += '</tr>'
          }
        } else {
          html += '<thead>'
          html += '<tr>'
          html += '<th>번호</th>'
          html += '<th>아이디</th>'
          html += '<th>내용</th>'
          html += '<th>별점</th>'
          html += '<th>등록일자</th>'
          html += '</tr>'
          html += '</thead>'
          html += '<tbody>'
          for (var i = 0; i < data.dataList.length; i++) {
            html += '<tr>'
            html += '<td>' + data.dataList[i].reviewNo + '</td>'
            html += '<td>' + data.dataList[i].userId + '</td>'
            html += '<td>' + data.dataList[i].reviewContent + '</td>'
            html += '<td>' + data.dataList[i].star + '</td>'
            html += '<td>' + new Date(data.dataList[i].insertDate).toLocaleString() + '</td>'
            html += '</tr>'
          }
        }
        html += '</tbody>'
        $('#valueList').html(html);

        html = '';

        // 게시물이 있을 때만
        if (data.pageVo.count != 0) {
          html += '<nav>'
          html += '<ul class="pagination">'
          html += '<li class="page-item">'
          if (data.pageVo.startPage > data.pageVo.pageBlock) {
            html += '<a class="page-link" href="javascript:callAjax(' + '\'' + data.readType
                + '\'' + ',' + '\'' + data.searchValue + '\'' + ',' + (data.pageVo.startPage
                    - data.pageVo.pageBlock) + ')">'
            html += '<span aria-hidden="true">&larr;</span> Previous</a>'
          }
          html += '</li>'
          for (var i = data.pageVo.startPage; i <= data.pageVo.endPage; i++) {
            html += '<li class="page-item"><a class="page-link" href="javascript:callAjax('
                + '\'' + data.readType + '\'' + ',' + '\'' + data.searchValue + '\'' + ',' + i
                + ')">' + i + '</a></li>'
          }
          html += '<li class="page-item">'
          if (data.pageVo.endPage < data.pageVo.pageCount) {
            html += '<a class="page-link" href="javascript:callAjax(' + '\'' + data.readType
                + '\'' + ',' + '\'' + data.searchValue + '\'' + ',' + (data.pageVo.startPage
                    + data.pageVo.pageBlock) + ')">'
            html += '<span aria-hidden="true">&larr;</span> Next</a>'
          }
          html += '</li>'
          html += '</ul>'
          html += '</nav>'

          $('#pagingArea').html(html);
        } else {
          $('#pagingArea').html('');
        }

        if (data.readType == 'salesDay') {
          $('#readTitle').html('일별 매출');
          $('.input-group.date').html(
              '<input type="text" id="dateValue" class="form-control" value="'
              + data.searchValue + '" placeholder="yyyy-mm-dd">')
          // 매출 등록
          $('#addHtml').html(
              '<button class="btn btn-primary" onclick="openPopUp(' + '\'/admin/add/sales\''
              + ')">매출 등록</button>')
        } else if (data.readType == 'salesMonth') {
          $('#readTitle').html('월별 매출');
          $('.input-group.date').html(
              '<input type="text" id="dateValue" class="form-control" value="'
              + data.searchValue + '" placeholder="yyyy-mm">')
        } else if (data.readType == 'user') {
          $('#readTitle').html('고객 관리');
          $('.input-group.date').html(
              '<input type="text" id="userValue" class="form-control" value="'
              + data.searchValue + '" placeholder="회원 이름">')
        } else {
          $('#readTitle').html('후기 관리');
          $('.input-group.date').html('');
        }

        // 일별 매출 외 매출 등록 버튼 제거
        if (data.readType != 'salesDay') {
          $('#addHtml').html('')
        }
      }
    });
  }
</script>
<body class="fixed-navigation">
<div id="wrapper">
    <%@ include file="/WEB-INF/views/common/admin_navbar_left.jsp" %>
    <div id="page-wrapper" class="gray-bg sidebar-content">
        <%@ include file="/WEB-INF/views/common/admin_navbar_top.jsp" %>
        <div class="sidebar-panel"></div>
        <div class="wrapper wrapper-content">
            <div class="row">
                <div class="col-lg-12">
                    <div class="ibox ">
                        <div class="ibox-content">
                            <div>
                                <h1 class="m-b-xs" id="total"></h1>
                                <h3 class="font-bold no-margins">
                                    최근 1개년 매출액
                                </h3>
                                <small>매출액 총합</small>
                            </div>

                            <div>
                                <canvas id="lineChart" height="70"></canvas>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="wrapper wrapper-content panel">
            <div>
                <a class="btn btn-outline-danger" href="javascript:callAjax('salesDay', '', 1)">일별 매출관리 <span class="sr-only">(current)</span></a>
                <a class="btn btn-outline-danger"  href="javascript:callAjax('salesMonth', '', 1)">월별 매출관리 <span class="sr-only">(current)</span></a>
                <a class="btn btn-outline-success"  href="javascript:callAjax('user', '', 1)">고객관리 <span class="sr-only">(current)</span></a>
            </div>
            <div class="col-md-12">
                <div class="input-group date" style="margin-top: 30px; width: 200px;">
                    <input type="text" id="dateValue" class="form-control" value="${map.searchValue}"
                           placeholder="yyyy-mm-dd">
                </div>
                <h1 class="page-header" id="readTitle">일별 매출</h1>
                <div class="table-responsive">
                    <table class="table table-striped" id="valueList">
                        <thead>
                        <tr>
                            <th>번호</th>
                            <th>매출</th>
                            <th>매출내용</th>
                            <th>발생일자</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${map.salesDayList}" var="SalesVo" varStatus="status">
                            <tr>
                                <td>${status.count}</td>
                                <td>${SalesVo.income}</td>
                                <td>${SalesVo.memo}</td>
                                <td>${SalesVo.insertDate}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div id="pagingArea">
                        <c:if test="${map.pageVo.count != 0}">
                            <nav>
                                <ul class="pagination">
                                    <li class="page-item">
                                        <c:if test='${map.pageVo.startPage > map.pageVo.pageBlock }'>
                                            <a class="page-link"
                                               href="javascript:callAjax('${map.readType}', '${map.searchValue}', ${map.pageVo.startPage - map.pageVo.pageBlock})"><span
                                                    aria-hidden="true">&larr;</span> Previous</a>
                                        </c:if>
                                    </li>
                                    <!-- begin = startPage / end = endPage -->
                                    <c:forEach var="i" begin="${map.pageVo.startPage }"
                                               end="${map.pageVo.endPage }">
                                        <li class="page-item"><a class="page-link"
                                                                 href="javascript:callAjax('${map.readType}', '${map.searchValue}', ${i})">${i}</a>
                                        </li>
                                    </c:forEach>
                                    <li class="page-item">
                                        <c:if test='${map.pageVo.endPage < map.pageVo.pageCount }'>
                                            <a class="page-link"
                                               href="javascript:callAjax('${map.readType}', '${map.searchValue}', '${map.pageVo.startPage + map.pageVo.pageBlock}')">Next
                                                <span aria-hidden="true">&rarr;</span></a>
                                            <a class="page-link"
                                               href="javascript:callAjax('${map.readType}', '${map.searchValue}', '${map.pageVo.startPage + map.pageVo.pageBlock}')">Next
                                                <span aria-hidden="true">&rarr;</span></a>
                                        </c:if>
                                    </li>
                                </ul>
                            </nav>
                        </c:if>
                    </div>
                    <div id="addHtml">
                        <button class="btn btn-primary" onclick="openPopUp('/admin/add/sales')">매출 등록
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Mainly scripts -->
<script src="../../../resources/js/jquery-3.1.1.min.js"></script>
<script src="../../../resources/js/popper.min.js"></script>
<script src="../../../resources/js/bootstrap.js"></script>
<script src="../../../resources/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="../../../resources/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<!-- Flot -->
<script src="../../../resources/js/plugins/flot/jquery.flot.js"></script>
<script src="../../../resources/js/plugins/flot/jquery.flot.tooltip.min.js"></script>
<script src="../../../resources/js/plugins/flot/jquery.flot.spline.js"></script>
<script src="../../../resources/js/plugins/flot/jquery.flot.resize.js"></script>
<script src="../../../resources/js/plugins/flot/jquery.flot.pie.js"></script>
<script src="../../../resources/js/plugins/flot/jquery.flot.symbol.js"></script>
<script src="../../../resources/js/plugins/flot/curvedLines.js"></script>

<!-- Peity -->
<script src="../../../resources/js/plugins/peity/jquery.peity.min.js"></script>
<script src="../../../resources/js/demo/peity-demo.js"></script>

<!-- Custom and plugin javascript -->
<script src="../../../resources/js/inspinia.js"></script>
<script src="../../../resources/js/plugins/pace/pace.min.js"></script>

<!-- jQuery UI -->
<script src="../../../resources/js/plugins/jquery-ui/jquery-ui.min.js"></script>

<!-- Jvectormap -->
<script src="../../../resources/js/plugins/jvectormap/jquery-jvectormap-2.0.2.min.js"></script>
<script src="../../../resources/js/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>

<!-- Sparkline -->
<script src="../../../resources/js/plugins/sparkline/jquery.sparkline.min.js"></script>

<!-- Sparkline demo data  -->
<script src="../../../resources/js/demo/sparkline-demo.js"></script>

<!-- ChartJS-->
<script src="../../../resources/js/plugins/chartJs/Chart.min.js"></script>
<script>

  getMonthlySales();
  function getMonthlySales() {
    $.ajax({
      url: '/admin/read/monthly',
      type: 'get',
      success: function (data) {
        console.log(data);
        $("#total").html(data.total+"원");
        let labels = ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"];
        let data1 = [0,0,0,0,0,0,0,0,0,0,0,0];
        data.monthly.forEach((i,v)=>{
          let dateTime = i.iDate.split("-")
          let month =parseInt(dateTime[1]);
          labels[month-1] = dateTime[0]+"년 "+ dateTime[1]+"월 ";
          data1[month-1] = i.income;
        })
        var lineData = {
          labels: labels,
          datasets: [
            {
              label: "월별 매출액",
              backgroundColor: "rgba(26,179,148,0.5)",
              borderColor: "rgba(26,179,148,0.7)",
              pointBackgroundColor: "rgba(26,179,148,1)",
              pointBorderColor: "#fff",
              data: data1
            },
          ]
        };

        var lineOptions = {
          responsive: true
        };


        var ctx = document.getElementById("lineChart").getContext("2d");
        new Chart(ctx, {type: 'line', data: lineData, options:lineOptions});
      }
    })
  }
</script>
</body>
</html>
