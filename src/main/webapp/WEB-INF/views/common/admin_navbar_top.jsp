<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <script type="text/javascript">
      function logoutCheck() {
        var logoutFlag = confirm('로그아웃 하시겠습니까?');
        if (logoutFlag) {
          location.href = '${pageContext.request.contextPath}/logout';
        }
        return false;
      }
    </script>

    <title>관리자 페이지</title>

    <link href="../../../resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="../../../resources/font-awesome/css/font-awesome.css" rel="stylesheet">

    <link href="../../../resources/css/animate.css" rel="stylesheet">
    <link href="../../../resources/css/style.css" rel="stylesheet">

</head>
<body>
<div class="row border-bottom">
    <nav class="navbar navbar-static-top white-bg" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i
                    class="fa fa-bars"></i> </a>

            <form role="search" class="navbar-form-custom" action="#">
                <div class="form-group">
                    <input type="text" placeholder="Search for something..." class="form-control"
                           name="top-search" id="top-search">
                </div>
            </form>
        </div>
        <ul class="nav navbar-top-links navbar-right">
            <li>
                <a class="navbar-brand js-scroll-trigger" href="${pageContext.request.contextPath}/">홈으로</a>
            </li>
            <li>
                <a class="nav-link js-scroll-trigger" href="javascript:logoutCheck()"> <i
                        class="fa fa-sign-out"></i>로그아웃</a>
            </li>
        </ul>

    </nav>
</div>


</body>

</html>