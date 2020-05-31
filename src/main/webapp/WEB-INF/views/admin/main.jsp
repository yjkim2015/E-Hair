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

    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <script type='text/javascript' src='//code.jquery.com/jquery-1.8.3.js'></script>
    <link href="../../../../resources/css/admin.css" rel="stylesheet"/>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
    <script type='text/javascript'
            src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
    <script src="../../../../resources/js/bootstrap-datepicker.kr.js" charset="UTF-8"></script>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>



</head>

<body class="fixed-navigation">
<div id="wrapper">
    <%@ include file="/WEB-INF/views/common/admin_navbar_left.jsp" %>
    <div id="page-wrapper" class="gray-bg sidebar-content">
        <%@ include file="/WEB-INF/views/common/admin_navbar_top.jsp" %>
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
</body>
</html>