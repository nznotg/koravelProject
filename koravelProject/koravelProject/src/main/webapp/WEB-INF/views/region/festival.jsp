<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">	
	
	<link rel="stylesheet" href="../resources/css/detail.css">
	
    <link rel="stylesheet" href="../resources/css/festival_style.css">
    <link rel="stylesheet" href="../resources/css/festival_isotope.css">
	
	<!-- JavaScript Libraries -->
    <script src="../resources/js/jquery.min.js"></script>
        
    <script src="../resources/js/festival_jquery.isotope.min.js"></script>
    
<title>지역행사</title>
</head>
<body>
	<nav class="navbar">
    <div class="navbar_logo">          
      <a href="../index.jsp">koravel</a>
    </div>
    <ul class="navbar_menu">
      <li><a href="../region/recommand.do">맞춤추천</a></li>
      <li><a href="../region/festival.do">지역행사</a></li>
      <li><a href="../board/getBoardMain.do">커뮤니티</a></li>
      <li><a href="../main/tip.do">팁</a></li>
      <li><a href="">북마크</a></li>
    </ul>        
	</nav>
	<!-- 헤더 -->

	
	<section class="container">
        <article class="column col5">
            <h3><em class="col_tit">지역행사</em></h3>
            <p class="col_desc">22년도 가장 인기 있는 행사 유형입니다.</p>
        <!-- contents -->
        <div id="customizing">
            <div class="container">                
                <div class="row">
                    <div id="options" class="gridly">
                        <ul class="filter option-set" data-filter-group="color">
                            <li><a href="#filter-color-any" data-filter-value="" class="selected">전체</a></li>
                            <li class="webstandard"><a href="#filter-color-webstandard" data-filter-value=".jan">1월</a></li>
                            <li class="webstandard"><a href="#filter-color-webstandard" data-filter-value=".feb">2월</a></li>
                            <li class="webstandard"><a href="#filter-color-webstandard" data-filter-value=".mar">3월</a></li>
                            <li class="webstandard"><a href="#filter-color-webstandard" data-filter-value=".dec">12월</a></li>
                        </ul>
                    </div>
                </div>    
                <div class="row" id="middle" style="margin-left:16px;">
                    <div id="container" class="clearfix">    
                        <!-- box -->                       
						
						<c:forEach var="festival" items="${festivalList}" varStatus="loop" begin="0" end="18">																	
								<section class="color-shape jan">
								<a href="detailFestival.do?festivalIdx=${festival.festivalIdx}">
                                <div class="image-wrap">
                                    <div class="hover-wrap">
                                        <span class="overlay-img-donut">${festival.festivalTitle}</span>
                                        <span class="overlay-text-thumb-donut">${festival.festivalAddr}</span>
                                        <span class="overlay-text-thumb1-donut">${festival.festivalStart}</span>
                                        <span class="overlay-text-thumb2-donut">${festival.festivalEnd}</span>
                                    </div>
                                    <img src="../resources/images/region/festival/${festival.festivalIdx}.jpeg" alt="portfolio">
                                    <div class="img-text donutImg">
                                        <h5>${festival.festivalTitle}</h5>
                                        <span>${festival.festivalAddr}</span>
                                        <p>${festival.festivalStart}</p>
                                        <p>${festival.festivalEnd}</p>
                                    </div>
                                </div>
                            	</a>
								</section>
                        <!-- //box -->						
						</c:forEach>                        
                       
						<c:forEach var="festival" items="${festivalList}" varStatus="loop" begin="19" end="34">										
								<section class="color-shape feb">
								<a href="detailFestival.do?festivalIdx=${festival.festivalIdx}">
                                <div class="image-wrap">
                                    <div class="hover-wrap">
                                        <span class="overlay-img-donut">${festival.festivalTitle}</span>
                                        <span class="overlay-text-thumb-donut">${festival.festivalAddr}</span>
                                        <span class="overlay-text-thumb1-donut">${festival.festivalStart}</span>
                                        <span class="overlay-text-thumb2-donut">${festival.festivalEnd}</span>
                                    </div>
                                    <img src="../resources/images/region/festival/${festival.festivalIdx}.jpeg" alt="portfolio">
                                    <div class="img-text donutImg">
                                        <h5>${festival.festivalTitle}</h5>
                                        <span>${festival.festivalAddr}</span>
                                        <p>${festival.festivalStart}</p>
                                        <p>${festival.festivalEnd}</p>
                                    </div>
                                </div>
                            	</a>
								</section>
                        <!-- //box -->
                        </c:forEach>
                        
                        <c:forEach var="festival" items="${festivalList}" varStatus="loop" begin="35" end="38">										
								<section class="color-shape mar">
								<a href="detailFestival.do?festivalIdx=${festival.festivalIdx}">
                                <div class="image-wrap">
                                    <div class="hover-wrap">
                                        <span class="overlay-img-donut">${festival.festivalTitle}</span>
                                        <span class="overlay-text-thumb-donut">${festival.festivalAddr}</span>
                                        <span class="overlay-text-thumb1-donut">${festival.festivalStart}</span>
                                        <span class="overlay-text-thumb2-donut">${festival.festivalEnd}</span>
                                    </div>
                                    <img src="../resources/images/region/festival/${festival.festivalIdx}.jpeg" alt="portfolio">
                                    <div class="img-text donutImg">
                                        <h5>${festival.festivalTitle}</h5>
                                        <span>${festival.festivalAddr}</span>
                                        <p>${festival.festivalStart}</p>
                                        <p>${festival.festivalEnd}</p>
                                    </div>
                                </div>
                            	</a>
								</section>
                        <!-- //box -->
                        </c:forEach>
                        
                        <c:forEach var="festival" items="${festivalList}" varStatus="loop" begin="39" end="50">										
								<section class="color-shape dec">
								<a href="detailFestival.do?festivalIdx=${festival.festivalIdx}">
                                <div class="image-wrap">
                                    <div class="hover-wrap">
                                        <span class="overlay-img-donut">${festival.festivalTitle}</span>
                                        <span class="overlay-text-thumb-donut">${festival.festivalAddr}</span>
                                        <span class="overlay-text-thumb1-donut">${festival.festivalStart}</span>
                                        <span class="overlay-text-thumb2-donut">${festival.festivalEnd}</span>
                                    </div>
                                    <img src="../resources/images/region/festival/${festival.festivalIdx}.jpeg" alt="portfolio">
                                    <div class="img-text donutImg">
                                        <h5>${festival.festivalTitle}</h5>
                                        <span>${festival.festivalAddr}</span>
                                        <p>${festival.festivalStart}</p>
                                        <p>${festival.festivalEnd}</p>
                                    </div>
                                </div>
                            	</a>
								</section>
                        <!-- //box -->
                        </c:forEach>                    
                        
                    
                    </div>
                    <!-- //container-->
                </div>
                <!-- //row -->
            </div>
            <!-- //container-->
        </div>
        <!-- //contents -->
        </article>
        </section>
        
        

	
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
	
    
    <script>       
        // 박스
        $(function() {
            var $container = $('#container'),
                filters = {};

            $container.isotope({
                itemSelector: '.color-shape',
                masonry: {
                    columnWidth: 57
                }
            });
            // filter buttons
            $('.filter a').click(function() {
                var $this = $(this);
                // don't proceed if already selected
                if ($this.hasClass('selected')) {
                    return;
                }
                var $optionSet = $this.parents('.option-set');
                // change selected class
                $optionSet.find('.selected').removeClass('selected');
                $this.addClass('selected');
                // store filter value in object
                // i.e. filters.color = 'red'
                var group = $optionSet.attr('data-filter-group');
                filters[group] = $this.attr('data-filter-value');
                // convert object into array
                var isoFilters = [];
                for (var prop in filters) {
                    isoFilters.push(filters[prop])
                }
                var selector = isoFilters.join('');
                $container.isotope({
                    filter: selector
                });
                return false;
            });
            $('.tit_btn').on('click', function(e) {
                e.preventDefault();
                $('.nav_container').toggleClass('on');
            });
            $(".click").click(function() {
                $(".view").fadeToggle();
            });
        });        
    </script>
</body>
</html>