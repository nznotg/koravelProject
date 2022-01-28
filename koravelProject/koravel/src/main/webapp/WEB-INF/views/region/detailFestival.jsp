<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="../resources/css/detail_bootstrap-grid.min.css">
	<link rel="stylesheet" href="../resources/css/detail.css">
	<link rel="stylesheet" href="../resources/css/detail_font-awesome.css">
	<link rel="stylesheet" href="../resources/css/detail_slick.css">
	<link rel="stylesheet" href="../resources/css/detail_lightgallery.css">	
	<!-- JavaScript Libraries -->
    <script src="../resources/js/jquery.min.js"></script>    
    <script src="../resources/js/detail_slick.min.js"></script>
    <script src="../resources/js/detail_lightgallery.min.js"></script>   
    <style>
		.markerName{
		padding:5px;
		text-align:center;
		width:150px;
		}        
    </style>

<title>상세보기</title>
</head>
<body>
	<nav class="navbar">
    <div class="navbar_logo">          
      <a href="../index.jsp">koravel</a>
    </div>
    <ul class="navbar_menu">
      <li><a href="">Home</a></li>
      <li><a href="">갤러리</a></li>
      <li><a href="">여행지</a></li>
      <li><a href="">질문</a></li>
      <li><a href="">북마크</a></li>
    </ul>        
	</nav>
	<!-- 헤더 -->
	
	
		<section class="container">
			<div class="column row">
				<div class="slider_info col-md-6">
					<!-- 이미지 슬라이드 -->
					<div class="slider">
						<div>
							<figure>
								<img src="https://www.royalpalace.go.kr/content/images/leedeokman/spring/sp07.jpg" alt="이미지1">
								<figcaption><em>관광지1</em><span>그림1</span></figcaption>
							</figure>
						</div>
						<div>
							<figure>
								<img src="https://www.royalpalace.go.kr/content/images/leedeokman/spring/sp13.jpg" alt="이미지2">
								<figcaption><em>관광지2</em><span>그림2</span></figcaption>
							</figure>
						</div>
						<div>
							<figure>
								<img src="https://www.royalpalace.go.kr/content/images/leedeokman/spring/sp15.jpg" alt="이미지3">
								<figcaption><em>관광지3</em><span>그림3</span></figcaption>
							</figure>
						</div>
						<div>
							<figure>
								<img src="https://www.royalpalace.go.kr/content/images/leedeokman/spring/sp17.jpg" alt="이미지4">
								<figcaption><em>관광지4</em><span>그림4</span></figcaption>
							</figure>
						</div>
						<div>
							<figure>
								<img src="https://www.royalpalace.go.kr/content/images/leedeokman/spring/sp21.jpg" alt="이미지5">
								<figcaption><em>관광지5</em><span>그림5</span></figcaption>
							</figure>
						</div>
					</div>
					<!--//이미지 슬라이드 -->
					

						
						<div class="region_info justify-content-between">						
						<button class="bookmark">북마크</button>
						</div>
						<h1 class="col_tit">${festival.festivalTitle }</h1>
						<h4>${festival.festivalDate }</h4>
						<h4>${festival.festivalAddr }</h4>
						<h4>${festival.festivalAddr2 }</h4>
						<h4>${festival.festivalPay }</h4>
						<h4>${festival.festivalTel }</h4>
						<h4>${festival.festivalInfo }</h4>
					
				</div>

			</div>
		</section>
	

    
    


	<section class="container">
		<article class="column col5">
					<h3><em class="col_tit">리뷰</em></h3>
					<table class="review1">
						<th class="col_desc">번호</th>
						<th class="col_desc">내용</th>
						<th class="col_desc">별점</th>
						<th class="col_desc">작성일</th>
						<c:forEach var="review" items="${regionReview}" varStatus="loop">
							<c:set var="j" value="1" />
							<c:set var="i" value="${loop.index}" />
							<c:if test="${i%j == 0}">
								<tr class="reivew_specs jumbotron">
							</c:if>
							<td>${review.reviewIdx}</td>
							<td>${review.reviewContent}</td>
							<td>${review.reviewStar}</td>
							<td><fmt:formatDate pattern="yyyy/MM/dd"
									value="${review.reviewDate}" /></td>
							<c:if test="${i%j == j-1 }">
								</tr>
							</c:if>
						</c:forEach>
					</table>
				</div>
				

				<!--//리-->
			
		
	</section>


	<section class="container">
        <article class="column col5">
            <h3><em class="col_tit">여행지</em></h3>
            <p class="col_desc">가장 인기 있는 여행지 유형입니다.</p>
            <!-- 오버효과 -->
            <div class="notice_hover2">
                <ul>
                    <li>
                        <a href="#">
                            <span><img src="https://www.royalpalace.go.kr/content/images/leedeokman/summer/sm01.jpg" alt="이미지1"><em>바로가기</em></span>
                            <strong>경복궁1</strong>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <span><img src="https://www.royalpalace.go.kr/content/images/leedeokman/summer/sm02.jpg" alt="이미지2"><em>바로가기</em></span>
                            <strong>경복궁2</strong>
                        </a>
                    </li>
                    <li class="last">
                        <a href="#">
                            <span><img src="https://www.royalpalace.go.kr/content/images/leedeokman/summer/sm03.jpg" alt="이미지3"><em>바로가기</em></span>
                            <strong>경복궁3</strong>
                        </a>
                    </li>
                </ul>
            </div>
            <!-- //오버효과 -->
            <!-- 오버효과2 -->
            <div class="notice_hover2 mt15">
                <ul>
                    <li>
                        <a href="#">
                            <span><img src="https://www.royalpalace.go.kr/content/images/leedeokman/summer/sm04.jpg" alt="이미지1"><em>바로가기</em></span>
                            <strong>경복궁4</strong>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <span><img src="https://www.royalpalace.go.kr/content/images/leedeokman/summer/sm05.jpg" alt="이미지2"><em>바로가기</em></span>
                            <strong>경복궁5</strong>
                        </a>
                    </li>
                    <li class="last">
                        <a href="#">
                            <span><img src="https://www.royalpalace.go.kr/content/images/leedeokman/summer/sm06.jpg" alt="이미지3"><em>바로가기</em></span>
                            <strong>경복궁6</strong>
                        </a>
                    </li>
                </ul>
            </div>
            <!-- //오버효과2 -->
        </article>
        <!-- //col4 -->
        </section>
        


	<section class="container">
		<article class="column col5">
			<h4 class="col_tit">추천 코스</h4>
			<p class="col_desc">주변 관광지를 빠르게 찾아줍니다.</p>
			<!-- lightbox -->
			<div class="lightbox square clearfix">
				<a href="https://www.royalpalace.go.kr/content/images/season/winter/1.jpg"><img src="https://www.royalpalace.go.kr/content/images/season/winter/1.jpg" alt="경복궁1"><em>경복궁1</em></a>
				<a href="https://www.royalpalace.go.kr/content/images/season/winter/2.jpg"><img src="https://www.royalpalace.go.kr/content/images/season/winter/2.jpg" alt="경복궁2"><em>경복궁2</em></a>
				<a href="https://www.royalpalace.go.kr/content/images/season/winter/3.jpg"><img src="https://www.royalpalace.go.kr/content/images/season/winter/3.jpg" alt="경복궁3"><em>경복궁3</em></a>
				<a href="https://www.royalpalace.go.kr/content/images/season/winter/4.jpg"><img src="https://www.royalpalace.go.kr/content/images/season/winter/4.jpg" alt="경복궁4"><em>경복궁4</em></a>
				<a href="https://www.royalpalace.go.kr/content/images/season/winter/5.jpg"><img src="https://www.royalpalace.go.kr/content/images/season/winter/5.jpg" alt="경복궁5"><em>경복궁5</em></a>
				<a href="https://www.royalpalace.go.kr/content/images/season/winter/6.jpg"><img src="https://www.royalpalace.go.kr/content/images/season/winter/6.jpg" alt="경복궁6"><em>경복궁6</em></a>
				<a href="https://www.royalpalace.go.kr/content/images/season/winter/7.jpg"><img src="https://www.royalpalace.go.kr/content/images/season/winter/7.jpg" alt="경복궁7"><em>경복궁7</em></a>
				<a href="https://www.royalpalace.go.kr/content/images/season/winter/8.jpg"><img src="https://www.royalpalace.go.kr/content/images/season/winter/8.jpg" alt="경복궁8"><em>경복궁8</em></a>
				<a href="https://www.royalpalace.go.kr/content/images/season/winter/9.jpg"><img src="https://www.royalpalace.go.kr/content/images/season/winter/9.jpg" alt="경복궁9"><em>경복궁9</em></a>
				<a href="https://www.royalpalace.go.kr/content/images/season/winter/10.jpg"><img src="https://www.royalpalace.go.kr/content/images/season/winter/10.jpg" alt="경복궁10"><em>경복궁10</em></a>
			</div>
			<!--//lightbox -->
		</article>
		<!-- //col5 -->
	</section>

   





	<section class="container">
	<footer>
		<div class="footer1">
			<div class="navbar_logo">
				<i class="fab fa-accusoft"></i>
			</div>
			<div>
				Koravel <br> Addr. 서울특별시 금천구 가산디지털1로 151 2F<br> Tel.
				02 - 123 - 4567<br> COPYRIGHT 2021. Koravel. ALL RIGHT
				RESERVED.
			</div>
		</div>
	</footer>
	</section>



	
    
    <script>       
        //라이트 박스
        $(".lightbox").lightGallery({
            thumbnail: true,
            autoplay: true,
            pause: 3000,
            progressBar: true
        }); 
        //이미지 슬라이더
        $(".slider").slick({
			dots: true,
			autoplay: true,
			autoplaySpeed: 3000,
			arrows: true,
			responsive: [
			    {
				    breakpoint: 768,
				    settings: {
				        autoplay: false,
			      	}
			    }
			]
		});       
    </script>
</body>
</html>