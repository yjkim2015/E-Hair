<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>관리자 메인 페이지</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
    <link rel="stylesheet" href="/css/jquery-ui.min.css">
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <script type='text/javascript' src='//code.jquery.com/jquery-1.8.3.js'></script>
    <link href="../../../../resources/css/admin.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
    <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
    <script src="../../../../resources/js/bootstrap-datepicker.kr.js" charset="UTF-8"></script>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>

    <script type="text/javascript">
        // from controller
        var adminNo = '${sessionScope.loginUser.adminNo}';

        // date format -> 추후, datepicker 대체 가능
        function getTimeStamp(readType) {
            var d = new Date();
            var s =
                leadingZeros(d.getFullYear(), 4) + '-' +
                leadingZeros(d.getMonth() + 1, 2);
            if(readType == 'salesDay') {
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
            if(readType == 'salesDay') {
                if(searchValue == '') {
                    searchValue = getTimeStamp(readType);
                } else {
                    searchValue = $('#dateValue').val();
                }
            } else if(readType == 'salesMonth') {
                if(searchValue == '') {
                    searchValue = getTimeStamp(readType);
                } else {
                    searchValue = $('#dateValue').val();
                }
            } else if(readType == 'user') {
                if(searchValue != '') {
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
                type:'get',
                success:function(data) {
                    var html = '';
                    if(data.readType == 'salesDay' || data.readType == 'salesMonth') {
                        html += '<thead>'
                        html += '<tr>'
                        html += '<th>번호</th>'
                        html += '<th>매출</th>'
                        html += '<th>매출내용</th>'
                        html += '<th>발생일자</th>'
                        html += '</tr>'
                        html += '</thead>'
                        html += '<tbody>'
                        for(var i = 0; i < data.dataList.length; i++) {
                            html += '<tr>'
                            html += '<td>' + data.dataList[i].salesNo + '</td>'
                            html += '<td>' + data.dataList[i].income + '</td>'
                            html += '<td>' + data.dataList[i].memo + '</td>'
                            html += '<td>' + new Date(data.dataList[i].insertDate).toLocaleString() + '</td>'
                            html += '</tr>'
                        }
                    } else if(data.readType == 'user') {
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
                        for(var i = 0; i < data.dataList.length; i++) {
                            html += '<tr>'
                            html += '<td>' + data.dataList[i].userId + '</td>'
                            html += '<td>' + data.dataList[i].name + '</td>'
                            html += '<td>' + data.dataList[i].sex + '</td>'
                            html += '<td>' + data.dataList[i].phone + '</td>'
                            html += '<td>' + data.dataList[i].age + '</td>'
                            html += '<td>' + new Date(data.dataList[i].insertDate).toLocaleString() + '</td>'
                            html += '<td><button class="btn btn-primary"' +
                                'onclick="openPopUp(' + '\'/admin/add/memo?userId=' + data.dataList[i].userId + '&userNo=' + data.dataList[i].userNo + '&pageNum=1&readType=memo\')">메모 확인 및 등록</button></td>'
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
                        for(var i = 0; i < data.dataList.length; i++) {
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
                    if(data.pageVo.count != 0) {
                        html += '<nav>'
                        html += '<ul class="pagination">'
                        html += '<li class="page-item">'
                        if(data.pageVo.startPage > data.pageVo.pageBlock) {
                            html += '<a class="page-link" href="javascript:callAjax(' + '\'' + data.readType + '\'' + ',' + '\'' + data.searchValue + '\'' + ',' + (data.pageVo.startPage - data.pageVo.pageBlock) + ')">'
                            html += '<span aria-hidden="true">&larr;</span> Previous</a>'
                        }
                        html += '</li>'
                        for(var i=data.pageVo.startPage; i<=data.pageVo.endPage; i++) {
                            html += '<li class="page-item"><a class="page-link" href="javascript:callAjax(' + '\'' + data.readType + '\'' + ',' + '\'' + data.searchValue + '\'' + ',' + i + ')">' + i + '</a></li>'
                        }
                        html += '<li class="page-item">'
                        if(data.pageVo.endPage < data.pageVo.pageCount) {
                            html += '<a class="page-link" href="javascript:callAjax(' + '\'' + data.readType + '\'' + ',' + '\'' + data.searchValue + '\'' + ',' + (data.pageVo.startPage + data.pageVo.pageBlock) + ')">'
                            html += '<span aria-hidden="true">&larr;</span> Next</a>'
                        }
                        html += '</li>'
                        html += '</ul>'
                        html += '</nav>'

                        $('#pagingArea').html(html);
                    } else {
                        $('#pagingArea').html('');
                    }

                    if(data.readType == 'salesDay') {
                        $('#readTitle').html('일별 매출');
                        $('.input-group.date').html('<input type="text" id="dateValue" class="form-control" value="' + data.searchValue + '" placeholder="yyyy-mm-dd">')
                        // 매출 등록
                        $('#addHtml').html('<button class="btn btn-primary" onclick="openPopUp(' + '\'/admin/add/sales\'' + ')">매출 등록</button>')
                    } else if(data.readType == 'salesMonth') {
                        $('#readTitle').html('월별 매출');
                        $('.input-group.date').html('<input type="text" id="dateValue" class="form-control" value="' + data.searchValue + '" placeholder="yyyy-mm">')
                    } else if(data.readType == 'user') {
                        $('#readTitle').html('고객 관리');
                        $('.input-group.date').html('<input type="text" id="userValue" class="form-control" value="' + data.searchValue + '" placeholder="회원 이름">')
                    } else {
                        $('#readTitle').html('후기 관리');
                        $('.input-group.date').html('');
                    }

                    // 일별 매출 외 매출 등록 버튼 제거
                    if(data.readType != 'salesDay') {
                        $('#addHtml').html('')
                    }
                }
            });
        }
    </script>

</head>

<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">관리자 페이지</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="${pageContext.request.contextPath}/">Home</a></li>
                <li><a href="${pageContext.request.contextPath}/profile">Profile</a></li>
                <li><a href="#">Help</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar" style="margin-top: 70px;">
            <ul class="nav nav-sidebar">
                <!-- ajax 처리 -->
                <li class="active"><a href="javascript:callAjax('salesDay', '', 1)">일별 매출관리 <span class="sr-only">(current)</span></a></li>
                <li class="active"><a href="javascript:callAjax('salesMonth', '', 1)">월별 매출관리 <span class="sr-only">(current)</span></a></li>
                <li class="active"><a href="javascript:callAjax('user', '', 1)">고객관리 <span class="sr-only">(current)</span></a></li>
                <li class="active"><a href="javascript:callAjax('review', '', 1)">후기관리 <span class="sr-only">(current)</span></a></li>
            </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" style="float: left; margin: 50px 0;">
            <div class="input-group date" style="margin-top: 30px; width: 200px;">
                <input type="text" id="dateValue" class="form-control" value="${map.searchValue}" placeholder="yyyy-mm-dd">
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
                                        <a class="page-link" href="javascript:callAjax('${map.readType}', '${map.searchValue}', ${map.pageVo.startPage - map.pageVo.pageBlock})"><span aria-hidden="true">&larr;</span> Previous</a>
                                    </c:if>
                                </li>
                                <!-- begin = startPage / end = endPage -->
                                <c:forEach var="i" begin="${map.pageVo.startPage }" end="${map.pageVo.endPage }">
                                    <li class="page-item"><a class="page-link" href="javascript:callAjax('${map.readType}', '${map.searchValue}', ${i})">${i}</a></li>
                                </c:forEach>
                                <li class="page-item">
                                    <c:if test='${map.pageVo.endPage < map.pageVo.pageCount }'>
                                        <a class="page-link" href="javascript:callAjax('${map.readType}', '${map.searchValue}', '${map.pageVo.startPage + map.pageVo.pageBlock}')">Next <span aria-hidden="true">&rarr;</span></a>
                                        <a class="page-link" href="javascript:callAjax('${map.readType}', '${map.searchValue}', '${map.pageVo.startPage + map.pageVo.pageBlock}')">Next <span aria-hidden="true">&rarr;</span></a>
                                    </c:if>
                                </li>
                            </ul>
                        </nav>
                    </c:if>
                </div>
                <div id="addHtml">
                    <button class="btn btn-primary" onclick="openPopUp('/admin/add/sales')">매출 등록</button>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>