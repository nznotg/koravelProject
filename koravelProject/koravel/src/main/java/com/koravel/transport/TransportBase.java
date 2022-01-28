package com.koravel.transport;

import java.io.IOException;
import java.net.InetAddress;
import java.util.concurrent.ExecutionException;

import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.transport.TransportClient;
import org.elasticsearch.common.settings.Settings;
import org.elasticsearch.common.transport.TransportAddress;
import org.elasticsearch.transport.client.PreBuiltTransportClient;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Repository;

@Repository
public class TransportBase {
	public static TransportClient connTransport() throws IOException, ExecutionException, InterruptedException {
        Settings settings = Settings.builder() .put("cluster.name", "koravel").build();
        TransportClient client =
                new PreBuiltTransportClient(settings)
                        .addTransportAddress(new TransportAddress(
                                InetAddress.getByName("red2moon.iptime.org"), 9300));
        return client;
	}
	//키워드를 넣으면 앞뒤로 와일드 카드를 붙여준다 띄어 쓰기일 경우는 OR을 넣어준
	public static String modQueryKeyword(String keyword) {
		String[] key = keyword.split("\\s+");
		String modKey = new String();
		boolean linkKey = true;
		for(String k : key) {
			switch (k.toUpperCase()) {
				case "AND":
					modKey += " AND ";
					linkKey = true;
					break;
				case "OR":
					modKey += " OR ";
					linkKey = true;
					break;
				default:
					System.out.println(k);
					if(linkKey) {
							modKey += "*" + k + "*";
							linkKey = false;
					}else {
							modKey += " OR *" + k + "*";
							linkKey = false;
					}
					break;
			}
		}
		return modKey;
	}
//	ElasticSearch에서 받은 자료를 JSONArray로 가공
	public static JSONArray toJSONArray(SearchResponse sR) {
        JSONObject jsonObj = null;
        JSONParser parser = new JSONParser();
        JSONArray jsonArr = new JSONArray();//sR을 받는 JSON배열
        JSONArray jsonArrR = new JSONArray();//jsonArr을 정제하여 필요부분만 추출한 배열
        try{
        	jsonObj = (JSONObject) parser.parse(sR.toString());
        	jsonObj = (JSONObject) jsonObj.get("hits");
        	jsonArr = (JSONArray) jsonObj.get("hits");
        	for(Object obj : jsonArr) {
        		JSONObject tempObj =(JSONObject)obj;
        		tempObj = (JSONObject)tempObj.get("_source");
        		
        		jsonArrR.add(tempObj);
        	}
        }catch(ParseException e) {
        	e.printStackTrace();
        }
        return jsonArrR; 
	}
}
