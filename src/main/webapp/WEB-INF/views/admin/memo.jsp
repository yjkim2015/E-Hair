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
    <!-- include libraries(jQuery, bootstrap) -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <!-- include summernote css/js -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
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
    $(document).ready(function() {
      $('#memo').summernote({
        height:200
      });
    });
</script>

<form>
    <div class="col-md-6">
        <h3>
            ${map.userId} 님에 대한 메모 입력
        </h3>
    </div>
    <div class="form-group">
        <textarea type="text" class="form-control" aria-describedby="sizing-addon2" name="memo" id="memo">
        </textarea>
    </div>
    <div class="form-group">
        <input type="hidden" value="${map.userNo}" name="userNo" id="userNo">
        <button type="button" class="btn btn-default btn-block" id="btnSubmit">등록</button>
    </div>
</form>
<hr/>
<div class="form-group">
    <table class="table table-striped table-hover" id="valueList">
        <thead>
        <tr>
            <th width="10%">번호</th>
            <th width="60%">메모</th>
            <th width="30%">발생일자</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${map.dataList}" var="UserDetail">
            <tr>
                <td>${UserDetail.userDetailNo}</td>
                <td>${UserDetail.memo}</td>
                <td>${UserDetail.insertDate}</td>
                <td> <button class='btn btn-danger' data-detail=${UserDetail.userDetailNo} onclick='deleteDetail(this)'>삭제</button> </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<script>
  function deleteDetail(obj) {
      alert("씨발")
    let detailNo = $(obj).data('detail');

    $.post({
      url : "/admin/memo/delete/"+detailNo,
      type:'delete',
      headers:{
        "Content-Type":"application/json",
        "X-HTTP-Method-Override":"DELETE"},
      dataType:'text',
      processData:false,
      success:function(result){
        if(result){
          alert("삭제 되었습니다")
          window.close()
        } else {
          alert("다시 시도하여 주시기 바랍니다.")
        }

      }
    })

  }
</script>
</body>
</html>
