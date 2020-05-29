<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

</head>
<body>
<script>
var list = '${list}';
$(function(){
	$('#searchBtn').on('click', function(){
		self.location = "/allProfile?searchType="+$("select option:selected").val()+"&keyword="+$('#keywordInput').val();
	});
});
</script>
<%@ include file="/WEB-INF/views/common/navbar.jsp" %>

<section class="page-section bg-light" id="portfolio" style="margin-bottom:210px;">
            <div class="container">
                <div class="text-center">
                	<br>
                    <h2 class="section-subheading text-muted">The Best Designers</h2>
                    <br>
                    <div class='box-body'>
                    	<select name="searchType">
                    		<option value="n"
                    			<c:out value="${cri.searchType == null ?'selected':''}"/>>---
                    		</option>
                    		<option value="t"
                    			<c:out value="${cri.searchType eq 't' ?'selected':''}"/>>DesignerName
                    		</option>
                    			<option value="c"
                    			<c:out value="${cri.searchType eq 'c' ?'selected':''}"/>>ShopName
                    		</option>
                   			<option value="tc"
                    			<c:out value="${cri.searchType eq 'tc' ?'selected':''}"/>>Designer OR Shop Name
                    		</option>
                    	</select>
	                    <input type="text" name="keyword" id="keywordInput" value="${cri.keyword}">
	                    <button id="searchBtn">Search</button>
                    </div>
                   	<br>
                </div>
                <div class="row">
                <c:forEach var="oneDesigner" items="${list}" varStatus="status">
                    <div class="col-lg-4 col-sm-6 mb-4">
                        <div class="portfolio-item">
                            <a class="portfolio-link" href="/profile/detail?adminNo=${oneDesigner.adminNo}"
                                ><div class="portfolio-hover">
                                    <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
                                </div>
                                <img class="img-fluid" src='displayFile?fileName=${oneDesigner.imgUrl.replace("s","")}' alt="" style='width:350px; height:350px;'
                            /></a>
                            <div class="portfolio-caption">
                                <div class="portfolio-caption-heading">${oneDesigner.name } 
                                	★ ${oneDesigner.starPoint}
                                	</div>
                                <div class="portfolio-caption-subheading text-muted">매장 이름  ${oneDesigner.shopName}<br> ${oneDesigner.profile }</div>
                            </div>
                        </div>
                    </div>
				</c:forEach>
                </div>
            </div>
        </section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
        
</body>
</html>