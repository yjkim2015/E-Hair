<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js" 
        integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" 
        crossorigin="anonymous">
</script>
<script src="../../../resources/js/jquery.starrating.js"></script>
<style>
ul {
  list-style: none;
  padding: 0;
}

li {
  display: inline-block;
  font-size: 40px;
  color: #ccc;
  cursor: pointer;
}

li.active, li.hover { color: orange; }

ul.hover li.active:not(.hover) { color: #ccc }
</style>
</head>
<body>
<script>
var starRate = 0;

$(function(){
	$('#starRating').starRating();
	

});
</script>
<ul id="starRating"></ul>

</body>
</html>