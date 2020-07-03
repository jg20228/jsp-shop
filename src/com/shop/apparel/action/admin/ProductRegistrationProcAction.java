package com.shop.apparel.action.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.shop.apparel.action.Action;
import com.shop.apparel.model.Product;
import com.shop.apparel.repository.ProductRepositroy;
import com.shop.apparel.util.Script;

public class ProductRegistrationProcAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 현재는 프로젝트가 하나밖에 없어서 request.getServletContext()가 필요없지만
		// 나중에 여러개를 다루게 되면 꼭 필요하다.
		String realPath = request.getServletContext().getRealPath("shopimg");
		String fileNameW = null;
		String fileNameH = null;
		String contextPath = request.getServletContext().getContextPath(); // shop
		
		String thumbnailW = null; // DB에 들어갈 변수 : 위치
		String thumbnailH = null; // DB에 들어갈 변수 : 위치

		System.out.println("realPath : " + realPath);
		System.out.println("contextPath : " + contextPath);

		try {
			MultipartRequest multi = new MultipartRequest
					(
							request, 
							realPath, 
							1024 * 1024 * 2, 
							"UTF-8",
							new DefaultFileRenamePolicy()
					);
			fileNameW = multi.getFilesystemName("thumbnailW");
			fileNameH = multi.getFilesystemName("thumbnailH");
			
			String type = multi.getParameter("type");
			String name = multi.getParameter("name");
			int price = Integer.parseInt(multi.getParameter("price"));
			String titleComment = multi.getParameter("titleComment");
			String contents = multi.getParameter("contents");
			
			System.out.println(type.split(",")[0]);
			System.out.println(type.split(",")[1]);
			System.out.println(name);
			System.out.println(price);
			System.out.println(titleComment);
			System.out.println(contents);
			
			
			System.out.println("fileNameW : " + fileNameW);
			System.out.println("fileNameH : " + fileNameH);

			thumbnailW = contextPath + "/shopimg/" + fileNameW;
			thumbnailH = contextPath + "/shopimg/" + fileNameH;
			
			System.out.println(thumbnailW);
			System.out.println(thumbnailH);
			
			Product product = Product.builder()
					.name(name)
					.type(type.split(",")[0])
					.titleComment(titleComment)
					.price(price)
					.thumbnailW(thumbnailW)
					.thumbnailH(thumbnailH)
					.contents(contents)
					.categoryId(Integer.parseInt(type.split(",")[1]))
 					.build();
			
			ProductRepositroy productRepositroy = ProductRepositroy.getInstance();
			int result = productRepositroy.save(product);
			
			if(result==1) {
				Script.href("/shop/admin?cmd=index", response);
			}else {
				Script.back("물품 등록 실패", response);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			Script.getMessage("오류 : "+e.getMessage(), response);
		}
	}
}
