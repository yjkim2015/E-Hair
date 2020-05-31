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
    <title>매출 등록</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.js"></script>

    <script type="text/javascript">
        $(function(){
            $('#btnSubmit').on('click', function () {
                var income = $('#income').val()
                var adminNo = $('#adminNo').val()
                var memo = $('#memo').val()

                $.ajax({
                    url: '/admin/add/sales',
                    data:{
                        income: income,
                        adminNo: adminNo,
                        memo: memo
                    },
                    type:'post',
                    success:function (data) {
                        if(data.result == true) {
                            alert('매출을 등록하였습니다.')
                            window.close()
                        }
                    }
                })
            })
        })
    </script>
</head>
<body>
<form>
    <div class="form-group">
        <h3> 매출 등록 ${sessionScope.loginUser.name}님 (${sessionScope.loginUser.userId})</h3>
    </div>
    <hr/>
    <div class="form-group">
        <label for="income" class="col-form-label">매출액</label>
        <input type="text" class="form-control" placeholder="ex) 50000 / 숫자만 입력" aria-describedby="sizing-addon2" name="income" id="income">
        <input type="hidden" value="${sessionScope.loginUser.adminNo}" name="adminNo" id="adminNo">
    </div>
    <div class="form-group">
        <label for="memo" class="col-form-label">매출내용</label>
        <input type="text" class="form-control" placeholder="매출 내용 입력" aria-describedby="sizing-addon2" name="memo" id="memo">
    </div>
    <button type="button" class="btn btn-success btn-block" id="btnSubmit">등록</button>
</form>
</body>
</html>
