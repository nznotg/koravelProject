<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="stylesheet" type="text/css" href="../resources/css/style2.css">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">

    <title>Tip Page</title>
    <!-- <script type="text/javascript" src="main.js" defer></script> -->
</head>

        <!-- chatbot api -->
    <!-- Channel Plugin Scripts -->
<script>
    (function() {
    var w = window;
    if (w.ChannelIO) {
        return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
    }
    var ch = function() {
        ch.c(arguments);
    };
    ch.q = [];
    ch.c = function(args) {
        ch.q.push(args);
    };
    w.ChannelIO = ch;
    function l() {
        if (w.ChannelIOInitialized) {
        return;
        }
        w.ChannelIOInitialized = true;
        var s = document.createElement('script');
        s.type = 'text/javascript';
        s.async = true;
        s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
        s.charset = 'UTF-8';
        var x = document.getElementsByTagName('script')[0];
        x.parentNode.insertBefore(s, x);
    }
    if (document.readyState === 'complete') {
        l();
    } else if (window.attachEvent) {
        window.attachEvent('onload', l);
    } else {
        window.addEventListener('DOMContentLoaded', l, false);
        window.addEventListener('load', l, false);
    }
    })();
    ChannelIO('boot', {
    "pluginKey": "f8d38dd3-5fce-4786-bd3e-461970ec4f97"
    });
</script>
<!-- End Channel Plugin -->
<body>
<header>
    <!-- <a href="https://www.naver.com"><img class="chatbot"src="image/chatbot.png"></a> -->
    
    

    <div class="header" id="header">
            <div class="logo">
                <a href=#header><img src="../resources/images/koravel.png"></a>
            </div>
        
            <ul class="nav">
                <li id="weather">날씨</li>
                <li id="currency">환율</li>
            </ul>

            <div class="login">
                <a href="login.jsp">로그인 </a>
            </div>
    </div>
</header>

    <div class="explain" id="explain">
        
        <div class="explain_wrap" id ="explain_wrap">
            <h1>INTRODUCTION</h1>

            <div class="explain_text0" id="explain_text0">
                <h3>
                    KORAVEL은 여행자를 위한 빅데이터기반 국내 여행 맞춤 정보사이트입니다.<br>
                    기존 여행 사이트는 한국으로 특화하기에는 정보 분산이 되어 있고,<br>
                    광고의 범람으로 인해 신뢰성이 저하되어 있고
                    여행자에게는 고질적인 '선택의 어려움'이 있습니다.<br>
                    KORAVEL은 기존의 신뢰성 문제를 보완하고,
                    고객의 취향을 파악한 빅데이터 맞춤 기반 서비스를 통해
                    한국 여행지 선택에 도움을 줍니다.
                </h3>
            </div>
            <div class="explain_img" id="explain_img">
                <img src="../resources/images/tip/form_icon.png">
                <h4>회원가입 시 Form을 작성합니다.</h4>
                <h5>Fill out the form when you sign up.</h5>    
            </div>
            
            <!-- <div class="explain_arrow" id="explain_arrow"> -->
                <img src= "../resources/images/tip/next_arrow.png">
            <!-- </div> -->
            
            <div class="explain_img" id="explain_img">
                <img src="../resources/images/tip/analysis_icon.png">
                <h4>입력 정보를 분석합니다.</h4>
                <h5>We analyze the input information.</h5>
                
            </div>

            <!-- <div class="explain_arrow" id="explain_arrow"> -->
                <img src= "../resources/images/tip/next_arrow.png">
            <!-- </div> -->
        
            <div class="explain_img" id="explain_img">
                <img src="../resources/images/tip/offer.png">
                <h4>맞춤 정보를 제공합니다.</h4>
                <h5>We provide customized information.</h5>
            </div>
        </div>


        
    </div>

    <div class="tip_wrapper">
        <h1>Tips for foreigners</h1><br>

        <h2>Understanding Korean Culture</h2><br><br><br>

        <h4>Korea is not an extremely closed country but there are several unique Korean cultures that only Korea has. There are several situations when traveling Korea in which you don't know what to do. So you may feel uneasy as there aren't people who answer your questions or offer advice on how to act during those situations    
            Now, shall we take some time to get to know more about Korea?</h3>

        <h2>1. Restaurant Culture in Korea</h2>

        <h3>Q1. How do you order in a restaurant in Korea?</h3>
        <div class="tip_explain">
                <img src="../resources/images/tip/order.jpg">

                <h4>When traveling abroad you will start feeling nervous from when you call the waiter/waitress~ Because you are worried that you cannot speak Korean or may not be able to understand what they are trying to say to you.<br><br>
                    Fortunately, most restaurants especially newly built ones in Korea have a call bell in which you can press and the waiter/waitress will come to you. It may be located in places hard to find like on the side of the table but having the call bell is convenient as there is no need to call the waiter/waitress out loud.
                </h4>
                
        </div>

        <h3>Q2. The dish came out not cooked yet, what do I do?</h3>
        <div class="tip_explain">
                <img src="../resources/images/tip/food.jpg">

                <h4>There are many Korean dishes in which you have to fry, cook, boil it on the spot. In this case there are a lot of cases in which you have to cook the food yourself! If it is a dish you are trying for the first time you will be confused on what to do.<br><br>
                    This case happens to Koreans a lot as well. I also don't know what to do when going to a restaurant I haven't been to yet. If this happens, ask in basic english how to cook the dish! They will then either cook the dish for you or kindly tell you what to do.

                    When curious of when the dish is ready to eat it would be best to press the call bell and ask the "Sajangnim" if it is ready to eat right?
                </h4>
                
        </div>

        <h3>Q3. Do you have to tip at a Korean restaurant?</h3>
        <div class="tip_explain">
                <img src="../resources/images/tip/tip.jpg">

                <h4>You may be curious if you have to tip someone that has provided you with a service such as at a restaurant, hotel or any other service place.

                    To tell you the conclusion first, it is that THERE IS NO NEED TO!<br><br>
                    In most restaurants in Korea, you pay the bill at the counter and use a lot of credit cards. So there are almost no cases in which you pay the bill at your seat and so no need to tip them or do they expect you to tip them~ The service fee is thought to be included in the bill so the tip culture in Korea does not exist.

                </h4>

        </div>

        <h2>2. Korea Transportation Culture</h2>

        <h3>Q1. Korean Transportation is too complicated, I don't know how to reach my final destination! </h3>
        <div class="tip_explain">
                <img src="../resources/images/tip/transportation.png">

                <h4>When traveling Korea, you will notice that the public transportation system in Korea is well organized. But because it is complicated it is often that you don't know which subway or bus to ride to reach your final destination.

                    This is the same for Koreans. Thankfully, because people can connect to WiFi and LTE quickly in Korea, it is convenient to search how to reach their destination through their phone.<br><br>
                    Especially, if you use applications such as Naver Maps, you can know the estimated arrival time and which public transportation you have to use so even locals use this application a lot. If you want to know how to use Naver maps check out this blog linked.
                </h4>
                
        </div>

        <h3>Q2. The reason why you tap you transportation card</h3>
        <div class="tip_explain">
                <img src="../resources/images/tip/tab_buscard.jpg">

                <h4>The reason why you tap you transportation card when getting off is because<br><br>

                    1. You can receive the transit benefit. You can receive a discount on the next mode of public transportation you use when tapping your transportation card when getting off.<br><br>
                    2. If you don't tap your card when getting off, there is an extra charge! The transportation fee is calculated by how far you have traveled and if you don't tap your card they will assume you went to the farthest place possible and charge you. To use the next mode of public transportation, they add this amount and charge you so don't get surprised. To save the most amount of money you shouldn't forget to tap your card when getting off right?


                </h4>
                
        </div>

        <h2>3. Koreans and Foreigners</h2>

        <h3>Q1. I can't speak a single word of Korean what do I do?</h3>
        <div class="tip_explain">
                <img src="../resources/images/tip/no_communication.png">

                <h4>You are bound to run into Koreans when going to restaurants of traveling. But if you can't speak Korean at all or cannot understand a word you are bound to be scared.<br><br>
                    But as told in the restaurant culture of Korea, most Koreans can speak basic English. Elderly may not speak or be that good in English but they will still try their best to deliver their message to your through gestures. Even if you don't know a single word of Korean don't worry and ask a local!
                </h4>
                
        </div>

        <h3>Q2. What do Koreans think about Foreigners?

        </h3>
        <div class="tip_explain">
                <img src="../resources/images/tip/foreigner.jpg">

                <h4>Recently, there have been an increase of foreigners in Korea but because Korea isn't that open of a country, foreigners may not be familiar with this culture. Also some Koreans may have hostility against foreigners for no reason at all.<br><br>
                    But this doesn't mean all Koreans hate foreigners and it may be just a way for them to express their fear about something they are not familiar with.<br><br>
                    You may be scared about being discriminated against for being a foreigner or actually being discriminated. But please know that there are way more Koreans that are nice toward foreigners. Ask for help to people who look nice and are willing to help.
                </h4>
                
        </div>

        <h2>Other Koreans Culture</h2>

        <h3>Q1. Koreans drink too much alcohol</h3>
        <div class="tip_explain">
                <img src="../resources/images/tip/soju2.jpg">

                <h4>If Koreans are university students or working at a company you may see them drinking excessively.<br><br>
                    You will be able to see their glasses constantly filled and drinking it all in one go.<br><br>
                    They also created a hybrid of beer and soju making them get drunk really quick and get full from it.<br><br>
                    Koreans also experience hardships from this culture.<br><br>
                    Koreans also try to avoid this if they can. They sometimes throw the alcohol on the ground in secret, or drink half when being told to drink it all in one go, or fill their glass with water or other various methods to not drink as much.
                </h4>
                
        </div>

    </div>

<footer>
    <div class="footer_wrap">
        <div class="footer_part1">
            <a href=#header><img src="../resources/images/tip/koravel.png"></a><br><br>
          			 상호명 : Koravel<br>
                	주소 : 서울시 금천구 가산동 426-5 월드메르디앙 2차 413호<br>
                	TEL : 02-AAA-BBBB<br>
                	Copyright© 2021 Koravel, All Right Reserved.<br>
                <ul class="footer_ul">
                    <li id ="introduce">Koravel 소개 |</li>
                    <li id="agreements">이용 약관  |</li>
                    <li id="policy">개인정보 처리방침</li>
                </ul>
            </div>

        <div class="footer_part1">
            <br><br><br><br>
            문의: kosmo@naver.com<br>
            FAQ (자주 묻는 질문)<br>
            운영시간 : 평일 10:00 ~ 18:00(한국시간 기준)<br>
            찾아오시는 길<br>
        </div>
    </div>
</footer>

<script>
    const header = document.querySelector("#header");
    const backImg = document.querySelector(".intro_bg")
    const backImgHeight = backImg.getBoundingClientRect().height;



    // 스크롤이 배경이미지 높이를 넘어설 때, 헤더부의 배경이
    // 불투명해지게끔 하는 코드.
window.addEventListener("scroll", () => {
  if (window.scrollY > backImgHeight) {
  header.setAttribute("style", "background:rgba(175, 224, 245, 0.986);", "width: 100%;");
} else {
  
header.setAttribute("style", "background: transparent;");
}
});


</script> 


</body>   
</html>
