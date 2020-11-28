package com.board.service;

import java.io.File;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileItemFactory;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.RequestContext;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;

import com.board.dao.BoardDAO;
import com.board.dto.BoardDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import controller.CommandAction;

public class BoardInsertService implements CommandAction{
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String realFolder="C:\\Users\\`User\\OatJang\\OatJang\\web\\images"; // 파일이 저장될 주소 => 나중에 서버로 쓰면 서버로 바꾸면됨
		String file="";
		FileItemFactory factory = new DiskFileItemFactory();
	 	ServletFileUpload upload = new ServletFileUpload(factory);
		BoardDTO dto = new BoardDTO();
	 	
	 	try {
	 		List items = upload.parseRequest(new ServletRequestContext(request));

	 		Iterator iterator = items.iterator();
	 		while(iterator.hasNext()) {
	 			FileItem item = (FileItem)iterator.next();
	 			if(!item.isFormField()) {
	 				String fileName = item.getName();
	 				File path = new File(realFolder);
	 				if(!path.exists()) {
	 					path.mkdirs();
	 				}
	 				File uploadfile = new File(path+"/"+fileName);
	 				int n=0;
 					int place = fileName.indexOf('.');
	 				while(uploadfile.exists()) {
	 					n++;
	 					uploadfile = new File(path+"/"+fileName.substring(0,place)+n+fileName.substring(place));
	 				}
	 				if(fileName!="") {
	 					file+=uploadfile.getName()+",";
	 					item.write(uploadfile);
	 				}
	 			}else {
	 				String fileName = item.getFieldName();
	 				if(fileName.equals("userid")) {
	 				 	dto.setUserid(Integer.parseInt(item.getString()));
	 				}else if(fileName.equals("title")) {
	 					dto.setTitle(item.getString());
	 				}else if(fileName.equals("price")) {
	 				 	dto.setPrice(Integer.parseInt(item.getString()));
	 				}else if(fileName.equals("description")) {
	 				 	dto.setDescription(item.getString());
	 				}else if(fileName.equals("chk_ca")) {
	 				 	String cate = item.getString();
	 				 	int a;
	 				 	if(cate.equals("상의")) {
	 				 		a=0;
	 				 	}else if(cate.equals("하의")) {
	 				 		a=1;
	 				 	}else if(cate.equals("아우터")) {
	 				 		a=2;
	 				 	}else if(cate.equals("원피스")) {
	 				 		a=3;
	 				 	}else if(cate.equals("신발")) {
	 				 		a=4;
	 				 	}else {
	 				 		a=5;
	 				 	}
	 				 	dto.setCategory(a);
	 				}
	 			}
	 		}
	 		
	 	}catch(FileUploadException e) {
	 		e.printStackTrace();
	 	}catch(Exception e) {
	 		e.printStackTrace();
	 	}

	 	dto.setSuccess(0);
	 	dto.setImages(file);

	 	BoardDAO dao = new BoardDAO();
	 	dao.boardInsert(dto);
		return "boardList.do?pg=1";
	}
}
