package com.koravel.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koravel.domain.RecoVO;

@Repository("recoDAO")
public class RecoDAOImpl {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int checkReco(HashMap<String, Object> hashMap){
		System.out.println("===> Mybatis checkReco() 호출");
		int recoTF = mybatis.selectOne("RecoDAO.checkReco", hashMap);
		return recoTF;
	}
	
	public void recoInsert(HashMap<String, Object> hashMap) {
		System.out.println("===> Mybatis recoInsert() 호출");
		mybatis.insert("RecoDAO.recoInsert", hashMap);
	}
	
	public void recoDelete(RecoVO Rvo) {
		System.out.println("===> Mybatis recoDelete() 호출");
		mybatis.delete("RecoDAO.recoDelete", Rvo);
	}
	
	public RecoVO findReco(HashMap<String, Object> hashMap) {
		System.out.println("===> Mybatis findReco() 호출");
		return (RecoVO) mybatis.selectOne("RecoDAO.findReco", hashMap);
	}
	
	public HashMap<String, Object> bookmark_check(HashMap<String, Object> hashMap){
		System.out.println("===> Mybatis bookmark_check() 호출");
		return mybatis.selectOne("RecoDAO.bookmark_check", hashMap);
	}
	
	public HashMap<String, Object> bookmark_check_cancel(HashMap<String, Object> hashMap){
		System.out.println("===> Mybatis bookmark_check_cancel() 호출");
		return mybatis.selectOne("RecoDAO.bookmark_check_cancel", hashMap);
	}
	
	//맞춤추천
	public int checkReco2(HashMap<String, Object> hashMap){
		System.out.println("===> Mybatis checkReco2() 호출");
		int recoTF = mybatis.selectOne("RecoDAO.checkReco2", hashMap);
		return recoTF;
	}
	
	public void recoInsert2(HashMap<String, Object> hashMap) {
		System.out.println("===> Mybatis recoInsert2() 호출");
		mybatis.insert("RecoDAO.recoInsert2", hashMap);
	}
	
	public void recoDelete2(RecoVO Rvo) {
		System.out.println("===> Mybatis recoDelete2() 호출");
		mybatis.delete("RecoDAO.recoDelete2", Rvo);
	}
	
	public RecoVO findReco2(HashMap<String, Object> hashMap) {
		System.out.println("===> Mybatis findReco2() 호출");
		return (RecoVO) mybatis.selectOne("RecoDAO.findReco2", hashMap);
	}
	
	public HashMap<String, Object> bookmark_check2(HashMap<String, Object> hashMap){
		System.out.println("===> Mybatis bookmark_check2() 호출");
		return mybatis.selectOne("RecoDAO.bookmark_check2", hashMap);
	}
	
	public HashMap<String, Object> bookmark_check_cancel2(HashMap<String, Object> hashMap){
		System.out.println("===> Mybatis bookmark_check_cancel2() 호출");
		return mybatis.selectOne("RecoDAO.bookmark_check_cancel2", hashMap);
	}
	
	//지역행사용
	public int checkReco3(HashMap<String, Object> hashMap){
		System.out.println("===> Mybatis checkReco3() 호출");
		int recoTF = mybatis.selectOne("RecoDAO.checkReco3", hashMap);
		return recoTF;
	}
		
	public void recoInsert3(HashMap<String, Object> hashMap) {
		System.out.println("===> Mybatis recoInsert3() 호출");
		mybatis.insert("RecoDAO.recoInsert3", hashMap);
	}
		
	public void recoDelete3(RecoVO Rvo) {
		System.out.println("===> Mybatis recoDelete3() 호출");
		mybatis.delete("RecoDAO.recoDelete3", Rvo);
	}
		
	public RecoVO findReco3(HashMap<String, Object> hashMap) {
		System.out.println("===> Mybatis findReco3() 호출");
		return (RecoVO) mybatis.selectOne("RecoDAO.findReco3", hashMap);
	}
		
	public HashMap<String, Object> bookmark_check3(HashMap<String, Object> hashMap){
		System.out.println("===> Mybatis bookmark_check3() 호출");
		return mybatis.selectOne("RecoDAO.bookmark_check3", hashMap);
	}
		
	public HashMap<String, Object> bookmark_check_cancel3(HashMap<String, Object> hashMap){
		System.out.println("===> Mybatis bookmark_check_cancel3() 호출");
		return mybatis.selectOne("RecoDAO.bookmark_check_cancel3", hashMap);
	}
}
