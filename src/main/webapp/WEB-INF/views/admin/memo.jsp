<%--
  Created by IntelliJ IDEA.
  User: 박진영
  Date: 2020-05-24
  Time: 오후 11:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>회원별 메모 등록</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
</head>
<body>

<script type="text/javascript">
    $(function(){
        $('#btnSubmit').on('click', function () {
            var memo = $('#memo').val()
            var userNo = $('#userNo').val()

            $.ajax({
                url: '/admin/add/memo',
                data:{
                    memo: memo,
                    userNo: userNo,
                },
                type:'post',
                success:function (data) {
                    if(data.result == true) {
                        alert('메모를 등록하였습니다.')
                        window.close()
                    }
                }
            })
        })
    })
</script>

<form>
    <div class="input-group">
        <span class="input-group-addon" id="sizing-addon2">${map.userId} 님에 대한 메모 입력</span>
        <input type="text" class="form-control" placeholder="Username" aria-describedby="sizing-addon2" name="memo" id="memo">
        <input type="hidden" value="${map.userNo}" name="userNo" id="userNo">
    </div>
    <button type="button" class="btn btn-default" id="btnSubmit">등록</button>
</form>

<div>
    <table class="table table-striped" id="valueList">
        <thead>
        <tr>
            <th>번호</th>
            <th>메모</th>
            <th>발생일자</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${map.dataList}" var="UserDetail">
            <tr>
                <td>${UserDetail.userDetailNo}</td>
                <td>${UserDetail.memo}</td>
                <td>${UserDetail.insertDate}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
