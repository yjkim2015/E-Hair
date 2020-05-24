<%--
  Created by IntelliJ IDEA.
  User: 박진영
  Date: 2020-05-24
  Time: 오후 11:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원별 메모 등록</title>
    <title>매출 등록</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<body>

<form action="/admin/add/sales">
    <div class="input-group">
        <span class="input-group-addon" id="sizing-addon2">매출 등록</span>
        <input type="text" class="form-control" placeholder="50000 (숫자만 입력)" aria-describedby="sizing-addon2" name="sales">
        <input type="hidden" value="${sessionScope.loginUser.adminNo}" name="adminNo">
    </div>
    <button type="submit" class="btn btn-default">등록</button>
</form>

</body>
</html>
