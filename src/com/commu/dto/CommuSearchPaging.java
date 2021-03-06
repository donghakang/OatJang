package com.commu.dto;

import com.commu.dao.CommuDAO;

public class CommuSearchPaging {

	int currentPage;   // 현재페이지
	int pageBlock;     // [이전][1][2][3][다음]
	int pageSize;      // 1페이 지당 5개씩 글 뿌리기
	int size;		   // 검색한 글 갯수
	String searchentity; //검색객체
	StringBuffer pagingHTML;
	
	public CommuSearchPaging(int currentPage, int pageBlock, int pageSize, int size, String searchentity) {
		this.currentPage = currentPage;
		this.pageBlock = pageBlock;
		this.pageSize = pageSize;
		this.size = size;
		this.searchentity=searchentity;
	}
	
	public void makePagingHTML(){
		pagingHTML=new StringBuffer();
		
		CommuDAO commuDAO=CommuDAO.getInstance();
//		int totalA=boardDAO.getTotalArticle();//총글수
		int totalA=size;//총글수
		int totalP=(totalA+pageSize-1)/pageSize;//총페이지수
		System.out.println("totalP :" +totalP);
		int startPage=((int)((currentPage-1)/pageBlock))*pageBlock+1;
		System.out.println("startPage :" +startPage);
		int endPage=startPage+pageBlock-1;
		System.out.println("startPage :" +startPage);		
		if(endPage>totalP){
			endPage=totalP;
		}		
		
		//----------------------------------------------------------------
		if(startPage>pageBlock){			
			pagingHTML.append("<a href='/oatjang/commuSearch.do?searchentity="+searchentity+"&pg="
		+(startPage-pageBlock)+"'>"+"이전</a>");
		}		
		
		for(int i=startPage;i<=endPage;i++){
			if(currentPage==i){
				pagingHTML.append("<a href='/oatjang/commuSearch.do?searchentity="+searchentity+"&pg="
			                     +i+"' id='a_back'>"+ i+ "</a>");
			
			}else{
				pagingHTML.append("<a href='/oatjang/commuSearch.do?searchentity="+searchentity+"&pg="
			                      +i+"'>"+i+"</a>");
			}
		}
				
		if(endPage<totalP){
			pagingHTML.append("<a href='/oatjang/commuSearch.do?searchentity="+searchentity+"&pg="
		+(startPage+pageBlock)+"'>"+"다음</a>");
		}
	}
	
	public String getPagingHTML() {
		return pagingHTML.toString();
	}	
}
