// api 접근! weather..
$(document).ready(function(){
    // geolocation API에 엑세스 할 수 있는지 확인
    if(navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function(pos) {
            let lat = pos.coords.latitude;
            let lon = pos.coords.longitude; 
            let url = 'http://api.openweathermap.org/data/2.5/weather';
            let apikey = 'ef86b9dd6706f9c5fb4541d249ca81f1';
            let weather_url =  url + '?' + 'lat=' + lat + '&' + 'lon=' + lon + '&' + 'appid=' + apikey;
            $.ajax({
                url : weather_url,
                dataType: 'json',
                type: 'GET',
                success : function(data) {
                    let $icon = "http://openweathermap.org/img/wn/" + data.weather[0].icon + "@2x.png"; 
                    let $temp = Math.round(data.main.temp - 273.15)+ '도'; // 화씨-> 섭씨로 바꾼 뒤 반올림함 성공
                    let $city = data.name; 
            
                        $('.icon_weather').attr('src', $icon);
                        $('.temp').prepend($temp);
                        $('.city').append($city);
                } // end of  success function
        }) // end of ajax
        }); // end of if
    } else {
        alert("경로를 잡을 수 없음");
    }

}) 

