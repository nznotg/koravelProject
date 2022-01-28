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
    
<title>맞춤추천</title>
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
            <h3><em class="col_tit">맞춤추천</em></h3>
            <p class="col_desc">성향에 맞는 관광지 유형입니다.</p>
        <!-- contents -->
        <div id="customizing">
            <div class="container">                
                <div class="row">
                    <div id="options" class="gridly">
                        <ul class="filter option-set" data-filter-group="color">
                            <li><a href="#filter-color-any" data-filter-value="" class="selected">전체</a></li>
                            <li class="webstandard"><a href="#filter-color-webstandard" data-filter-value=".one">유적지</a></li>
                            <li class="webstandard"><a href="#filter-color-webstandard" data-filter-value=".two">익스트림</a></li>
                            <li class="webstandard"><a href="#filter-color-webstandard" data-filter-value=".thr">조용한</a></li>
                            <li class="webstandard"><a href="#filter-color-webstandard" data-filter-value=".fou">활기찬</a></li>
                        </ul>
                    </div>
                </div>    
                <div class="row" id="middle" style="margin-left:16px;">
                    <div id="container" class="clearfix">    
                        <!-- box -->                       
						
						<c:forEach var="region" items="${regionList}" varStatus="loop" begin="0" end="2">																	
								<section class="color-shape one">
								<a href="detailRegion.do?regionIdx=${region.regionIdx}">
                                <div class="image-wrap">
                                    <div class="hover-wrap">
                                        <span class="overlay-img-donut">${region.regionName}</span>
                                        <span class="overlay-text-thumb-donut">${region.regionSumAddr}</span>
                                        <span class="overlay-text-thumb1-donut">${region.regionStar}</span>
                                        <span class="overlay-text-thumb2-donut">${region.regionPhone}</span>
                                    </div>
                                    <img src="../resources/images/region/${region.regionMainImgFile}" alt="portfolio">
                                    <div class="img-text donutImg">
                                        <h5>${region.regionName}</h5>
                                        <span>${region.regionSumAddr}</span>
                                        <p>${region.regionStar}</p>
                                        <p>${region.regionPhone}</p>
                                    </div>
                                </div>
                            	</a>
								</section>
                        <!-- //box -->						
						</c:forEach>
						
						
						<c:forEach var="region" items="${regionList}" varStatus="loop" begin="3" end="5">																	
								<section class="color-shape two">
								<a href="detailRegion.do?regionIdx=${region.regionIdx}">
                                <div class="image-wrap">
                                    <div class="hover-wrap">
                                        <span class="overlay-img-donut">${region.regionName}</span>
                                        <span class="overlay-text-thumb-donut">${region.regionSumAddr}</span>
                                        <span class="overlay-text-thumb1-donut">${region.regionStar}</span>
                                        <span class="overlay-text-thumb2-donut">${region.regionPhone}</span>
                                    </div>
                                    <img src="../resources/images/region/${region.regionMainImgFile}" alt="portfolio">
                                    <div class="img-text donutImg">
                                        <h5>${region.regionName}</h5>
                                        <span>${region.regionSumAddr}</span>
                                        <p>${region.regionStar}</p>
                                        <p>${region.regionPhone}</p>
                                    </div>
                                </div>
                            	</a>
								</section>
                        <!-- //box -->						
						</c:forEach>
						
						
						<c:forEach var="region" items="${regionList}" varStatus="loop" begin="6" end="8">																	
								<section class="color-shape thr">
								<a href="detailRegion.do?regionIdx=${region.regionIdx}">
                                <div class="image-wrap">
                                    <div class="hover-wrap">
                                        <span class="overlay-img-donut">${region.regionName}</span>
                                        <span class="overlay-text-thumb-donut">${region.regionSumAddr}</span>
                                        <span class="overlay-text-thumb1-donut">${region.regionStar}</span>
                                        <span class="overlay-text-thumb2-donut">${region.regionPhone}</span>
                                    </div>
                                    <img src="../resources/images/region/${region.regionMainImgFile}" alt="portfolio">
                                    <div class="img-text donutImg">
                                        <h5>${region.regionName}</h5>
                                        <span>${region.regionSumAddr}</span>
                                        <p>${region.regionStar}</p>
                                        <p>${region.regionPhone}</p>
                                    </div>
                                </div>
                            	</a>
								</section>
                        <!-- //box -->						
						</c:forEach>
						
						
						<c:forEach var="region" items="${regionList}" varStatus="loop" begin="9" end="12">																	
								<section class="color-shape fou">
								<a href="detailRegion.do?regionIdx=${region.regionIdx}">
                                <div class="image-wrap">
                                    <div class="hover-wrap">
                                        <span class="overlay-img-donut">${region.regionName}</span>
                                        <span class="overlay-text-thumb-donut">${region.regionSumAddr}</span>
                                        <span class="overlay-text-thumb1-donut">${region.regionStar}</span>
                                        <span class="overlay-text-thumb2-donut">${region.regionPhone}</span>
                                    </div>
                                    <img src="../resources/images/region/${region.regionMainImgFile}" alt="portfolio">
                                    <div class="img-text donutImg">
                                        <h5>${region.regionName}</h5>
                                        <span>${region.regionSumAddr}</span>
                                        <p>${region.regionStar}</p>
                                        <p>${region.regionPhone}</p>
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
	

   
    
   <%--  <!-- 키워드 영역 -->
    <div class="keyword">
        <c:set var="j" value="4"/>
        <c:forEach var="keyword" items="${keywordList}" varStatus="loop">
			<c:set var="i" value="${loop.index }"/>
			<c:if test="${i%j == 0 }">
        		<div class="keyword_line">
		            <ul class="keyword_menu">
        	</c:if>
		                <li><a href="">#${keyword.mood}</a></li>
		                <li><a href="">#${keyword.theme}</a></li>
		                <li><a href="">#${keyword.area}</a></li>
		                <li><a href="">#${keyword.place}</a></li>
		     <c:if test="${i%j == j-1 }">
		            </ul>
	    		</div>
	    	 </c:if>
	    </c:forEach>
    </div>
 --%>
	
	
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