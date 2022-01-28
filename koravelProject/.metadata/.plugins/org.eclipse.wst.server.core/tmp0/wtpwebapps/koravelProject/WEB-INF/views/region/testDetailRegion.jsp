<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기 페이지</title>
</head>
<body>
<h1>${region.regionName }</h1><br>
<p>${region.regionAddr }</p><br>
<p>${region.regionPhone }</p><br>
<p>${region.regionInfo }</p><br>
<p>${region.regionStar }</p><br>
<hr>
<div>
<ul>
<h1>위도와 경도</h1>
<li>위도 : ${region.regionX }</li>
<li>경도 : ${region.regionY }</li>
</ul>
</div>
</body>
</html>