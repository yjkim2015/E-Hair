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
    $(document).ready(function () {
        let userNo = parseInt('${sessionScope.loginUser.userNo}');
        let refundResult = '${param.refundResult}';
        if(refundResult == 'true') {
            alert("포인트 환불에 성공했습니다.")
        } else if(refundResult == 'false') {
            alert("포인트 환불에 실패했습니다.")
        }

        let sum = 0;
        $(".point").each(function(){
            sum += Number($(this).val());
        });

        $("#leftPoint").html('잔여 포인트 : ' + sum);

        // 잔여 포인트 전체 환불 -> insert
        $("#btnRefund").on('click', function () {
            let refundConfirm = confirm('잔여 포인트를 환불하시겠습니까?');
            if(refundConfirm) {
                if(sum == 0) {
                    alert("잔여 포인트가 없습니다.");
                    return false;
                }
                location.href = '${pageContext.request.contextPath}/membership/refund?userNo=' + userNo + '&leftPoint=' + sum;
            }
        });
    });
</script>
<body>
<%@ include file="/WEB-INF/views/common/navbar.jsp" %>

<!-- Services-->
<section class="page-section" id="services">
    <div class="container">
        <div class="text-center">
            <h2 class="section-heading text-uppercase">Membership</h2>
            <h3 class="section-subheading text-muted">Membership</h3>
        </div>
        <div class="row text-center">
            <div>
                <h3 id="leftPoint"></h3>
            </div>
            <table class="table table-hover table-bordered">
                <thead>
                <tr>
                    <th>번호</th>
                    <th>발생금액</th>
                    <!-- 사용내역 -> 충전 or 차감 w/ 서비스 설명 (차감은 어드민이 시행) -->
                    <th>사용내역</th>
                    <th>발생일자</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${membershipUsageList}" var="MembershipUsage" varStatus="status">
                    <tr>
                        <td>${status.count}</td>
                        <td>${MembershipUsage.price}</td>
                        <input type="hidden" class="point" value="${MembershipUsage.price}">
                        <td>${MembershipUsage.description}</td>
                        <td>${MembershipUsage.insertDate}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <a href="${pageContext.request.contextPath}/membership/charge?userNo=${sessionScope.loginUser.userNo}" type="button" class="btn btn-block btn-info">멤버쉽 충전</a>
            <a href="#" type="button" class="btn btn-block btn-primary" id="btnRefund">잔여 포인트 환불</a>
        </div>
        <div>
            <nav>
                <ul class="pagination">
                    <li>
                        <a href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <li><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li>
                        <a href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>