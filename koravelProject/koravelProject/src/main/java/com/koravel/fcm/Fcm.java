package com.koravel.fcm;

import java.io.IOException;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Repository;

@Repository
public class Fcm {
	public static void sendMessage(String title, String content) throws IOException {
		// FCM 서버에서 보낸 토큰값 :   FirebaseInstanceId.getInstance().getToken()
		// 콘솔에 출력하고는 그 값을 복사해서 사용해야 한다
		//userDeviceIdKey 안드로이드스튜디오에서 앱을 실행시겨 카져와야한다. 
		String usrDeviceIdKey = "eSzgAVe0R2KPFP4n2788ih:APA91bEmSRgRuDCHYof4DNGnVOEL0z9cFwy768A9K3IzIcfdQv5devCBKgQBcXtGgSvO1ZmAZO1cZlRBlsOxO8KOhI2_-gIQ247V6h2csBL8sGviWN8DoW1-HDX9YRNkmYlgUwW8_Tcv";
		 
		 // firebase.google.com 사이트에서 해당 프로젝트 > 설정 > 클라우드 메세지 > 서버 키 토큰 복사
		String AUTH_KEY_FCM = "AAAAJcIS6FQ:APA91bEp97uqrE2jFgPeF4dQTmP9xd29lgG4VLL_AaG9nxv_XGeiq0sGnrgNke3KfY9SZ0FRqsGON7FrOYNrs1_jLO-jEIKyzUuywFqCOmg5ErIMTH_joDAtF2K-T-08liWQ5BLCYto-";
		String API_URL_FCM = "https://fcm.googleapis.com/fcm/send";

		  

		URL url = new URL(API_URL_FCM);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();

		conn.setUseCaches(false); 
		conn.setDoInput(true);
		conn.setDoOutput(true);

		conn.setRequestMethod("POST");
		conn.setRequestProperty("Authorization","key="+AUTH_KEY_FCM);
		conn.setRequestProperty("Content-Type","application/json");

		JSONObject json = new JSONObject();
		json.put("to",usrDeviceIdKey.trim());
		JSONObject info = new JSONObject();
		info.put("title", title);   //알림 타이틀에 들어갈 메세지 
		info.put("body", content); // 알림 내용에 들어갈 메세지 
		json.put("notification", info);



		OutputStreamWriter wr = new OutputStreamWriter(conn.getOutputStream());
		System.out.println(">" + json.toString());
		wr.write(json.toString());
		wr.flush();
		conn.getInputStream(); 
	}
}
