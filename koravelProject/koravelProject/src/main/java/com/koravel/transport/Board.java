package com.koravel.transport;

import static org.elasticsearch.index.query.QueryBuilders.geoDistanceQuery;

import java.io.IOException;
import java.net.InetAddress;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutionException;

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



@Repository
public class Board extends TransportBase {
	

    public static List<BoardVO>  searchKeyword(String queryName) throws IOException, ExecutionException, InterruptedException {
       
        TransportClient client = connTransport();
        
        String INDEX_NAME = "board";
        String QUERY_KEYWORD = modQueryKeyword(queryName);
        //queryStringQuery를 사용한 이유 
        //한국어로 검색시 붙여있는 단어도 와일드카드 *어린이* 검색이나 *어린이* AND *박물관* 같은 검색도 가능하기 때문 
        QueryBuilder queryBuilder = QueryBuilders.queryStringQuery(QUERY_KEYWORD);
        SearchResponse response = client.prepareSearch(INDEX_NAME)
                .setQuery(queryBuilder)
                .addSort("boarddate", SortOrder.DESC)
                .setSize(300)
                .get();
        
        JSONArray responseJASONArr = toJSONArray(response);
        
        List<BoardVO> boardList = toListVO(responseJASONArr);
        for(BoardVO vo: boardList) {
        	System.out.println(vo.getBoardTitle()+"   "+vo.getBoardWriter());
        }
        return boardList;
    }
    public static List<BoardVO>  searchKeyword(String queryName, String fieldName) throws IOException, ExecutionException, InterruptedException {
       
        TransportClient client = connTransport();
        
        String INDEX_NAME = "board";
        String FIELD_NAME = fieldName;
        String QUERY_KEYWORD = modQueryKeyword(queryName);
        //queryStringQuery를 사용한 이유 
        //한국어로 검색시 붙여있는 단어도 와일드카드 *어린이* 검색이나 *어린이* AND *박물관* 같은 검색도 가능하기 때문 
        QueryBuilder queryBuilder = QueryBuilders.queryStringQuery(QUERY_KEYWORD).field(FIELD_NAME);
        SearchResponse response = client.prepareSearch(INDEX_NAME)
                .setQuery(queryBuilder)
                .addSort("boarddate", SortOrder.DESC)
                .setSize(300)
                .get();
        
        JSONArray responseJASONArr = toJSONArray(response);
        
        List<BoardVO> boardList = toListVO(responseJASONArr);
        for(BoardVO vo: boardList) {
        	System.out.println(vo.getBoardIdx()+vo.getBoardTitle()+"   "+vo.getBoardWriter());
        }
        return boardList;
    }
    public static List<BoardVO>  searchKeyword(String queryName, String fieldName1, String fieldName2) throws IOException, ExecutionException, InterruptedException {
       
        TransportClient client = connTransport();
        
        String INDEX_NAME = "board";
        String FIELD_NAME1 = fieldName1;
        String FIELD_NAME2 = fieldName2;
        String QUERY_KEYWORD = modQueryKeyword(queryName);
        //queryStringQuery를 사용한 이유 
        //한국어로 검색시 붙여있는 단어도 와일드카드 *어린이* 검색이나 *어린이* AND *박물관* 같은 검색도 가능하기 때문 
        QueryBuilder queryBuilder = QueryBuilders.queryStringQuery(QUERY_KEYWORD).field(FIELD_NAME1).field(FIELD_NAME2);
        SearchResponse response = client.prepareSearch(INDEX_NAME)
                .setQuery(queryBuilder)
                .addSort("boarddate", SortOrder.DESC)
                .setSize(300)
                .get();
        
        JSONArray responseJASONArr = toJSONArray(response);
        
        List<BoardVO> boardList = toListVO(responseJASONArr);
        for(BoardVO vo: boardList) {
        	System.out.println(vo.getBoardIdx()+vo.getBoardTitle()+"   "+vo.getBoardWriter());
        }
        return boardList;
    }
    public static List<BoardVO>  searchKeyword(String queryName, String fieldName,String sortName, boolean sortStyle,int fromNum, int sizeNum) throws IOException, ExecutionException, InterruptedException {
       
        TransportClient client = connTransport();
        
        String INDEX_NAME = "board";
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
        
        List<BoardVO> boardList = toListVO(responseJASONArr);
        for(BoardVO vo: boardList) {
        	System.out.println(vo.getBoardIdx()+vo.getBoardTitle()+"   "+vo.getBoardWriter());
        }
        return boardList;
    }
  //List<VO>형태로 가공   
	public static List<BoardVO> toListVO(JSONArray jA){
		
        List<BoardVO> boardList = new ArrayList<>();
        for(Object obj : jA) {
        	JSONObject jo = (JSONObject)obj;
        	BoardVO bvo = new BoardVO();
        	bvo.setBoardIdx((int)(long)(Long)jo.get("boardidx"));//int형이 Elastic들어가면서 long로 변형되어 세번의 타입캐스팅 필요
        	if(jo.get("boardtitle") !=null)bvo.setBoardTitle((String)jo.get("boardtitle"));
        	if(jo.get("boarcontent1") !=null)bvo.setBoardContent1((String)jo.get("boarcontent1"));
        	//if(jo.get("boarcontent2") !=null)bvo.setBoardContent2((String)jo.get("boarcontent2"));
        	bvo.setBoardDate((String)jo.get("boarddate"));
        	bvo.setBoardCat((String)jo.get("boardcat"));
        	bvo.setBoardType((String)jo.get("boardtype"));
        	bvo.setBoardReco((int)(long)(Long)jo.get("boardreco"));
        	bvo.setBoardViewCount((int)(long)(Long)jo.get("boardviewcount"));
        	if(jo.get("boardwriter") !=null)bvo.setBoardWriter((String)jo.get("boardwriter"));
        	if(jo.get("b_fname") !=null)bvo.setB_fname((String)jo.get("b_fname"));
        	if(jo.get("b_realfname") !=null)bvo.setB_realfname((String)jo.get("b_realfname"));
        	if(jo.get("b_fsize") !=null)bvo.setB_fsize((Long)jo.get("b_fsize"));
        	if(jo.get("boardkeyword") !=null)bvo.setBoardKeyword((String)jo.get("boardkeyword"));
        	boardList.add(bvo);
        }
		return boardList;
		
	}
}