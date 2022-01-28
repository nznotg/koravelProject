
package com.koravel.esTestClient;

/*
import org.apache.http.HttpHost;
import org.elasticsearch.action.admin.cluster.health.ClusterHealthRequest;
import org.elasticsearch.action.admin.cluster.health.ClusterHealthResponse;
import org.elasticsearch.client.RestClient;
import org.elasticsearch.client.RestHighLevelClient;

public class EsTestClient {

	public RestHighLevelClient esClient = null;
	
	// 생성자 (instance 생성시 호출되면 반환타입 x)
	public EsTestClient() {
		// cluster의 node가 x개이면 x개 만큼 기술
		// localhost : node 주소
		// 9200 : node의 tcp port 주소
		// http : elasticsearch protocol 물론 tls/ssl 설정되면 https로 바뀌어야 한다.
		this.esClient = new RestHighLevelClient(RestClient.builder(new HttpHost("localhost", 9200, "http")));
	}
	
	public void clusterHealthCheck() {
		ClusterHealthRequest request = new ClusterHealthRequest();
		ClusterHealthResponse response = null;
	}
}
*/