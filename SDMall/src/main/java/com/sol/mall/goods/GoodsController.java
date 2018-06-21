package com.sol.mall.goods;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sol.mall.category.CategoryDAO;

@Controller
public class GoodsController {

	@Autowired
	private GoodsDAO gdsDAO;
	
	@Autowired
	CategoryDAO cDAO;
	// 상품등록화면 처음
	@RequestMapping(value = "/goods.go", method = RequestMethod.GET)
	public String goods(HttpServletRequest request, HttpServletResponse response) {

		gdsDAO.getAllcategory(request, response);

		request.setAttribute("contentPage", "../goods/goods.jsp");
		return "sale/saleIndex";
	}
	@RequestMapping(value = "/shop", method = RequestMethod.GET)
	public String getAllGoods(HttpServletRequest request, HttpServletResponse response) {
		cDAO.getAllCategory(request, response);
		
		gdsDAO.getAllGoods(request);
		request.setAttribute("contentPage", "goods/shop.jsp");
		return "main";
	}

	// 상품등록작업
	@RequestMapping(value = "/registration.do", method = RequestMethod.POST)
	public String registrationDo(@RequestParam("gd_file1") MultipartFile multipartFile, Goods gd, GoodsDtl gdtl,
			Option op, HttpServletRequest request, HttpServletResponse response) throws Exception {

		// 업로드 파일이 존재하면
		if (multipartFile != null && !(multipartFile.getOriginalFilename().equals(""))) {

			// 확장자 제한
			String originalName = multipartFile.getOriginalFilename(); // 실제 파일명
			String originalNameExtension = originalName.substring(originalName.lastIndexOf(".") + 1).toLowerCase(); // 실제파일
																													// 확장자
			// (소문자변경)
			if (!((originalNameExtension.equals("jpg")) || (originalNameExtension.equals("gif"))
					|| (originalNameExtension.equals("png")) || (originalNameExtension.equals("bmp")))) {
				// 허용 확장자가 아닐 경우
			}
			// 파일크기제한 (5MB)
			long filesize = multipartFile.getSize(); // 파일크기
			long limitFileSize = 5 * 1024 * 1024; // 5MB
			if (limitFileSize < filesize) {
				// 제한보다 파일크기가 클 경우
			}

			// 저장경로
			String defaultPath = request.getSession().getServletContext().getRealPath("/"); // 서버기본경로 (프로젝트 폴더 아님)
			String path = defaultPath + "upload" + File.separator + "";
			// File.separator + 
			// 저장경로 처리
			File file = new File(path);
			if (!file.exists()) { // 디렉토리 존재하지 않을경우 디렉토리 생성
				file.mkdirs();
			}

			// 파일 저장명 처리 (20150702091941-fd8-db619e6040d5.확장자)
			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
			String today = formatter.format(new Date());
			String modifyName = today + "-" + UUID.randomUUID().toString().substring(20) + "." + originalNameExtension;

			// Multipart 처리
			// 서버에 파일 저장 (쓰기)
			multipartFile.transferTo(new File(path + modifyName));
			// 상품이미지 로그
			System.out.println("** 상품이미지 upload 정보 **");
			System.out.println("** 상품이미지 path : " + path + " **");
			System.out.println("** 상품이미지 originalName : " + originalName + " **");
			System.out.println("** 상품이미지 modifyName : " + modifyName + " **");

			gd.setGd_imgl(modifyName);
			// 이미지 사이즈 조절 만들 때 까지 임시
			gd.setGd_imgm(modifyName);
			gd.setGd_imgs(modifyName);
			gd.setGd_imgss(modifyName);

			// FK 설정으로 입력이나 삭제시 주의 상품상세테이블 먼저 입력이나 삭제하고 상품테이블 삭제
			// 방금입력한 상품번호 어떻게 가져오지?
			// 입력하고 저장 누르면 저장후 입력화면으로 이동 방금입력한 내용을 다시 입력화면에 표시불가
			// 수정화면 따로 만들어야 함

			// Transaction 적용
			gdsDAO.insertGdsInfo(gd, gdtl, op, request, response);

		}

		gdsDAO.getAllcategory(request, response);
		request.setAttribute("contentPage", "../goods/goods.jsp");

		return "sale/saleIndex";
	}
	@RequestMapping(value = "/goods", method = RequestMethod.GET)
	public String getGoodsDtlByNo(Goods goods,HttpServletRequest request, HttpServletResponse response) {
		cDAO.getAllCategory(request, response);
		
		gdsDAO.getGoodsByNo(goods, request, response);
		request.setAttribute("contentPage", "goods/goods.jsp");
		return "main";
	}

	// 카테고리 가져오기
	@RequestMapping(value = "/category.get", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public @ResponseBody Categories categoryGet(Category cg, HttpServletRequest request, HttpServletResponse response) {

		return gdsDAO.getCategory(cg, request, response);
	}

	// 상품표시화면 처음
	@RequestMapping(value = "/goods.list", method = RequestMethod.GET)
	public String goodsList(HttpServletRequest request, HttpServletResponse response) {

		gdsDAO.getAllGoods(request);

		request.setAttribute("contentPage", "../goods/goodsList.jsp");
		return "sale/saleIndex";
	}

	// 상품상세화면 표시
	@RequestMapping(value = "/goods.view", method = RequestMethod.GET)
	public String goodsDtlView(GoodsView gv, GoodsCategory gc, HttpServletRequest request, HttpServletResponse response) {
		// goodsView.jsp 수정시 daumeditor의 editor.jsp안의 	Editor.modify({'content': '${gdsView.gt_detail}'}); 수정필요
		// gdsView.gt_detail 다음에디터로 작성한 상세내용 
		gdsDAO.getGoodsView(gv, gc, request, response);
		
		gdsDAO.getAllcategory(request, response);
		request.setAttribute("contentPage", "../goods/goodsView.jsp");
		return "sale/saleIndex";
	}
	
	// 상품키워드 검색
	@RequestMapping(value = "/goods.search.keyword", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public @ResponseBody GoodsList gdsSearchKey(Keywords k, HttpServletRequest request, HttpServletResponse response) {
		return gdsDAO.getGoodsByKey(k, request);
	}
	
}