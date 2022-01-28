package com.koravel.transport;

import static org.elasticsearch.index.query.QueryBuilders.geoDistanceQuery;

import java.io.IOException;
import java.math.BigDecimal;
import java.net.InetAddress;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutionException;
import java.sql.Date;

import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.transport.TransportClient;
import org.elasticsearch.common.settings.Settings;
import org.elasticsearch.common.transport.TransportAddress;
import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.sort.SortOrder;
import org.elasticsearch.transport.client.PreBuiltTransportClient;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Repository;

import com.koravel.domain.BoardVO;
import com.koravel.domain.RegionVO;

import org.elasticsearch.common.unit.DistanceUnit;

@Repository
public class Region extends TransportBase{

    public static List<RegionVO>  searchName(String queryName) throws IOException, ExecutionException, InterruptedException  {
      
        TransportClient client = connTransport();
                
        
        String INDEX_NAME = "region";
        String FIELD_NAME ="regionname";
        String QUERY_KEYWORD = modQueryKeyword(queryName);
        //queryStringQuery를 사용한 이유 
        //한국어로 검색시 붙여있는 단어도 와일드카드 *어린이* 검색이나 *어린이* AND *박물관* 같은 검색도 가능하기 때문 
//        QueryBuilder queryBuilder = QueryBuilders.queryStringQuery(QUERY_KEYWORD).field(FIELD_NAME);
        QueryBuilder queryBuilder = QueryBuilders.queryStringQuery(QUERY_KEYWORD);
        SearchResponse response = client.prepareSearch(INDEX_NAME)
                .setQuery(queryBuilder)
                .setSize(300)
                .get();
        
        JSONArray responseJASONArr = toJSONArray(response);
     
        List<RegionVO> regionList = toListVO(responseJASONArr);
//        for(RegionVO vo: regionList) {
//        	System.out.println(vo);
//        }
        return regionList;
    }
    public static RegionVO searchName(String queryName,String fieldName) throws IOException, ExecutionException, InterruptedException  {
        
        TransportClient client = connTransport();
                
        
        String INDEX_NAME = "region";
        String FIELD_NAME = fieldName;
        String QUERY_KEYWORD = modQueryKeyword(queryName);
        //queryStringQuery를 사용한 이유 
        //한국어로 검색시 붙여있는 단어도 와일드카드 *어린이* 검색이나 *어린이* AND *박물관* 같은 검색도 가능하기 때문 
        QueryBuilder queryBuilder = QueryBuilders.queryStringQuery(QUERY_KEYWORD).field(FIELD_NAME);
        SearchResponse response = client.prepareSearch(INDEX_NAME)
                .setQuery(queryBuilder)
                .setSize(300)
                .get();
        
        JSONArray responseJASONArr = toJSONArray(response);
     
        List<RegionVO> regionList = toListVO(responseJASONArr);
        RegionVO resultVO = new RegionVO();
        boolean check = true;
        for(RegionVO vo: regionList) {
        	if(check) {
        		resultVO = vo;
        		check = false;
        	}
        }
        return resultVO;
    }
    //쿼리네임 필드 정렬필드 정렬방법 시작점 출력갯수를 받아 출력한
    public static List<RegionVO>  searchKeyword(String queryName, String fieldName,String sortName, boolean sortStyle,int fromNum, int sizeNum) throws IOException, ExecutionException, InterruptedException {
        
        TransportClient client = connTransport();
        
        String INDEX_NAME = "region";
        String FIELD_NAME = fieldName;
        String SORT_NAME = sortName;
        String QUERY_KEYWORD = modQueryKeyword(queryName);
        //queryStringQuery를 사용한 이유 
        //한국어로 검색시 붙여있는 단어도 와일드카드 *어린이* 검색이나 *어린이* AND *박물관* 같은 검색도 가능하기 때문 
        QueryBuilder queryBuilder = QueryBuilders.queryStringQuery(QUERY_KEYWORD).field(FIELD_NAME);
        SearchResponse response = new SearchResponse();
        if(sortStyle) {
        	 response = client.prepareSearch(INDEX_NAME)
                .setQuery(queryBuilder)
                .addSort(SORT_NAME, SortOrder.ASC)
                .setFrom(fromNum)
                .setSize(sizeNum)
                .get();
        }else {
        	 response = client.prepareSearch(INDEX_NAME)
                .setQuery(queryBuilder)
                .addSort(SORT_NAME, SortOrder.DESC)
                .setFrom(fromNum)
                .setSize(sizeNum)
                .get();
        	
        }
        JSONArray responseJASONArr = toJSONArray(response);
        
        List<RegionVO> regionList = toListVO(responseJASONArr);

        return regionList;
    }
    //검색 하단에 보여줄 키워드 
    public static JSONArray autoCompleteWord() throws IOException, ExecutionException, InterruptedException{
        TransportClient client = connTransport();
                
        
        String INDEX_NAME = "region";
        String FIELD_NAME ="regionname";
        String QUERY_KEYWORD = "*";
        //queryStringQuery를 사용한 이유 
        //한국어로 검색시 붙여있는 단어도 와일드카드 *어린이* 검색이나 *어린이* AND *박물관* 같은 검색도 가능하기 때문 
        QueryBuilder queryBuilder = QueryBuilders.queryStringQuery(QUERY_KEYWORD).field(FIELD_NAME);
        SearchResponse response = client.prepareSearch(INDEX_NAME)
                .setQuery(queryBuilder)
                .setSize(300)
                .get();
        
        JSONArray responseJASONArr = toJSONArray(response);
    	return responseJASONArr;
    }
//좌표값을 받아와서 좌표값 반경 3km내에 있는 지역을 출력 
    public static SearchResponse geoDistance(double x, double y) throws IOException, ExecutionException, InterruptedException {
      
        TransportClient client = connTransport();


        String INDEX_NAME = "region";
        String FIELD_NAME = "regiongeo";

        QueryBuilder queryBuilder = geoDistanceQuery(FIELD_NAME)
                .point(x, y)
                .distance(3, DistanceUnit.KILOMETERS);

        SearchResponse response = client.prepareSearch(INDEX_NAME)
                .setQuery(queryBuilder)
                .setSize(30).get();
        
        return response;
    }
    
  //List<VO>형태로 가공   
	public static List<RegionVO> toListVO(JSONArray jA){
		 List<RegionVO> regionList = new ArrayList<>();
	     for(Object obj : jA) {
	       	JSONObject jo = (JSONObject)obj;
	       	RegionVO rvo = new RegionVO();
	       	rvo.setRegionIdx((int)(long)(Long)jo.get("regionidx"));//int형이 Elastic들어가면서 long로 변형되어 세번의 타입캐스팅 필요
	       	rvo.setRegionName((String)jo.get("regionname"));
	       	rvo.setRegionAddr((String)jo.get("regionaddr"));
        	rvo.setRegionPhone((String)jo.get("regionphone"));
	       	rvo.setRegionInfo((String)jo.get("regioninfo"));
	       	if(jo.get("regionstar") != null)rvo.setRegionStar((float)(double)(Double)jo.get("regionstar"));
	       	if(jo.get("regionx") != null) {
	       		BigDecimal bd = BigDecimal.valueOf((Double)jo.get("regionx"));
	       			rvo.setRegionX(bd);
	       	}
	       	if(jo.get("regiony") != null) {
	       		BigDecimal bd = BigDecimal.valueOf((Double)jo.get("regiony"));
	       			rvo.setRegionY(bd);
	       	}
	       	if(jo.get("regionmainimgfile") != null)rvo.setRegionMainImgFile((String)jo.get("regionmainimgfile"));
	       	if(jo.get("regiondetailbximg1") != null)rvo.setRegionDetailBxImg1((String)jo.get("regiondetailbximg1"));
	       	if(jo.get("regiondetailbximg2") != null)rvo.setRegionDetailBxImg2((String)jo.get("regiondetailbximg2"));
	       	if(jo.get("regiondetailbximg3") != null)rvo.setRegionDetailBxImg3((String)jo.get("regiondetailbximg3"));
	       	if(jo.get("regiondetailbxthumbimg1") != null)rvo.setRegionDetailBxthumbImg1((String)jo.get("regiondetailbxthumbimg1"));
	       	if(jo.get("regiondetailbxthumbimg2") != null)rvo.setRegionDetailBxthumbImg2((String)jo.get("regiondetailbxthumbimg2"));
	       	if(jo.get("regiondetailbxthumbimg3") != null)rvo.setRegionDetailBxthumbImg3((String)jo.get("regiondetailbxthumbimg3"));
	        regionList.add(rvo);
	    }
	   
	    return regionList;
	
	}
}