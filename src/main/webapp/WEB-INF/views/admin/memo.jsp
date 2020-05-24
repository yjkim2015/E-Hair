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
    <title>$Title$</title>
</head>
<body>
    <title>회원별 메모 등록</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>

<form>
    <div class="input-group">
        <span class="input-group-addon" id="sizing-addon2">메모 입력</span>
        <input type="text" class="form-control" placeholder="Username" aria-describedby="sizing-addon2" name="memo">
        <input type="hidden" value="${userId}" name="userId">
    </div>
    <button type="submit" class="btn btn-default">등록</button>
</form>

</body>
</html>
