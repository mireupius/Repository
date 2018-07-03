package com.sol.mall.goods;

import java.io.File;
import java.io.IOException;
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


import com.sol.mall.common.ImageResize;
import com.sol.mall.member.MemberDAO;
import com.sol.mall.member.Seller;

@Controller
public class GoodsController {

	@Autowired
	private GoodsDAO gdsDAO;

	@Autowired
	private MemberDAO mDAO;
	
	@Autowired
	private CategoryDAO cDAO;
	
	// 상품등록화면 처음
	@RequestMapping(value = "/goodsReg.go", method = RequestMethod.GET)
	public String goodsReg(HttpServletRequest request, HttpServletResponse response) {
		//판매자 세션 확인
		if(mDAO.slLoginCheck(request, response)) {
			
			gdsDAO.getAllcategory(request, response);
			
			request.setAttribute("contentPage", "../goods/goodsReg.jsp");
			return "sale/saleIndex";
		}else {
			request.setAttribute("loginInfo", "loginArea.jsp");
			return "member/loginPage";
		}
	}

	// 전체 상품 조회
	@RequestMapping(value = "/shop", method = RequestMethod.GET)
	public String getAllGoods(HttpServletRequest request, HttpServletResponse response) {
		cDAO.getAllCategory(request, response);

		gdsDAO.getAllGoods(request);
		request.setAttribute("contentPage", "goods/shop.jsp");
		return "main";
	}
	
	// 카테고리 상품 조회
	@RequestMapping(value = "/shop.Category", method = RequestMethod.GET)
	public String getGoodsByCate(Category category, HttpServletRequest request, HttpServletResponse response) {
		cDAO.getAllCategory(request, response);
		
		gdsDAO.getGoodsByCate(category, request, response);
		request.setAttribute("contentPage", "goods/shop.jsp");
		return "main";
	}
	
	// 검색창에 입력받은 값으로 상품 이름과 키워드를 검색
	@RequestMapping(value = "/shop.search", method = RequestMethod.GET)
	public String searchGoods(Goods goods, HttpServletRequest request, HttpServletResponse response) {
		cDAO.getAllCategory(request, response);
		
		gdsDAO.searchGoods(goods, request, response);
		request.setAttribute("contentPage", "goods/shop.jsp");
		return "main";
	}
	
	@RequestMapping(value = "/search.name", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public @ResponseBody GoodsList getGoodsByName(Goods goods, HttpServletRequest request, HttpServletResponse response) {

		return gdsDAO.getGoodsByName(goods, request, response);
	}

	// 상품등록작업
	@RequestMapping(value = "/registration.do", method = RequestMethod.POST)
	public String registrationDo(@RequestParam("gd_file1") MultipartFile multipartFile, Goods gds, GoodsDtl gdtl,
			OptionList opl, HttpServletRequest request, HttpServletResponse response){
		if(mDAO.slLoginCheck(request, response)) {
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
					//??????????????????????? 구현 하기 귀찮으 ....
				}
	
				// 저장경로
				String defaultPath = request.getSession().getServletContext().getRealPath("/"); // 서버기본경로 (프로젝트 폴더 아님)
				String path = defaultPath + "upload" + File.separator + "";
				
				// 저장경로 처리 폴더생성
				File file = new File(path);
				if (!file.exists()) { // 디렉토리 존재하지 않을경우 디렉토리 생성
					file.mkdirs();
				}
	
				// 파일 저장명 처리 (20150702091941-fd8-db619e6040d5.확장자)
				SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
				String today = formatter.format(new Date());
				String modifyName = today + "-" + UUID.randomUUID().toString().substring(20) + "." + originalNameExtension;
	
				String pathNameGd_imgl = today + "-" + UUID.randomUUID().toString().substring(20) + "." + originalNameExtension;
				String pathNameGd_imgm = today + "-" + UUID.randomUUID().toString().substring(20) + "." + originalNameExtension;
				String pathNameGd_imgs = today + "-" + UUID.randomUUID().toString().substring(20) + "." + originalNameExtension;
				String pathNameGd_imgss = today + "-" + UUID.randomUUID().toString().substring(20) + "." + originalNameExtension;
				
				// Multipart 처리
				// 서버에 파일 저장 (쓰기)
				try {
					multipartFile.transferTo(new File(path + modifyName));
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
	
				// 이미지 사이즈 변경
				ImageResize.resize(470, 470, path + modifyName, path+pathNameGd_imgl, originalNameExtension);
				ImageResize.resize(236, 236, path + modifyName, path+pathNameGd_imgm, originalNameExtension);
				ImageResize.resize(220, 220, path + modifyName, path+pathNameGd_imgs, originalNameExtension);
				ImageResize.resize(70, 70, path + modifyName, path+pathNameGd_imgss, originalNameExtension);
				
				// 상품이미지 로그
				System.out.println("** 상품이미지 upload 정보 **");
				System.out.println("** 상품이미지 path : " + path + " **");
				System.out.println("** 상품이미지 originalName : " + originalName + " **");
				System.out.println("** 상품이미지 modifyName : " + modifyName + " **");
				System.out.println("** 상품이미지 pathNameGd_imgl : " + pathNameGd_imgl + " **");
				System.out.println("** 상품이미지 pathNameGd_imgm : " + pathNameGd_imgm + " **");
				System.out.println("** 상품이미지 pathNameGd_imgs : " + pathNameGd_imgs + " **");
				System.out.println("** 상품이미지 pathNameGd_imgss : " + pathNameGd_imgss + " **");
	
				// 리사이즈된 이미지 적용
				gds.setGd_imgl(pathNameGd_imgl);
				gds.setGd_imgm(pathNameGd_imgm);
				gds.setGd_imgs(pathNameGd_imgs);
				gds.setGd_imgss(pathNameGd_imgss);
				
				// 리사이즈 원본파일 삭제
				File oldFile = new File(path + modifyName);
				oldFile.delete();
	
				try {
					gdsDAO.insertGdsInfo(gds, gdtl, opl, request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}

			gdsDAO.getAllGoodsView(gds, request);
			
			request.setAttribute("contentPage", "../goods/goodsList.jsp");
			return "sale/saleIndex";
		}else {
			request.setAttribute("loginInfo", "loginArea.jsp");
			return "member/loginPage";
		}
	}
	
	// 상품 수정 작업
	@RequestMapping(value = "/goodsUpdate.do", method = RequestMethod.POST)
	public String goodsUpdateDo(@RequestParam("gd_file1") MultipartFile multipartFile, Goods gds, GoodsDtl gdtl,
			OptionList opl, GoodsView gv, GoodsCategory gc, HttpServletRequest request, HttpServletResponse response) {

		if(mDAO.slLoginCheck(request, response)) {
			// 업로드 파일이 존재하면? 파일업로드 없이 그냥 하면?
			if (multipartFile != null && !(multipartFile.getOriginalFilename().equals(""))) {
	
				// 삭제할 기존 파일명
				String oldImgl = gds.getGd_imgl();
				String oldImgm = gds.getGd_imgm(); 
				String oldImgs  = gds.getGd_imgs();
				String oldImgss = gds.getGd_imgss();
				
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
					//??????????????????????? 구현 하기 귀찮으 ....
				}
	
				// 저장경로
				String defaultPath = request.getSession().getServletContext().getRealPath("/"); // 서버기본경로 (프로젝트 폴더 아님)
				String path = defaultPath + "upload" + File.separator + "";
	
				// 저장경로 처리
				File file = new File(path);
				if (!file.exists()) { // 디렉토리 존재하지 않을경우 디렉토리 생성
					file.mkdirs();
				}
	
				// 파일 저장명 처리 (20150702091941-fd8-db619e6040d5.확장자)
				SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
				String today = formatter.format(new Date());
				String modifyName = today + "-" + UUID.randomUUID().toString().substring(20) + "." + originalNameExtension;
	
				String pathNameGd_imgl = today + "-" + UUID.randomUUID().toString().substring(20) + "." + originalNameExtension;
				String pathNameGd_imgm = today + "-" + UUID.randomUUID().toString().substring(20) + "." + originalNameExtension;
				String pathNameGd_imgs = today + "-" + UUID.randomUUID().toString().substring(20) + "." + originalNameExtension;
				String pathNameGd_imgss = today + "-" + UUID.randomUUID().toString().substring(20) + "." + originalNameExtension;
				
				// Multipart 처리
				// 서버에 파일 저장 (쓰기)
				try {
					multipartFile.transferTo(new File(path + modifyName));
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				// 이미지 사이즈 변경
				ImageResize.resize(470, 470, path + modifyName, path+pathNameGd_imgl, originalNameExtension);
				ImageResize.resize(236, 236, path + modifyName, path+pathNameGd_imgm, originalNameExtension);
				ImageResize.resize(220, 220, path + modifyName, path+pathNameGd_imgs, originalNameExtension);
				ImageResize.resize(70, 70, path + modifyName, path+pathNameGd_imgss, originalNameExtension);
							
				// 상품이미지 로그
				System.out.println("** 상품이미지 upload 정보 **");
				System.out.println("** 상품이미지 path : " + path + " **");
				System.out.println("** 상품이미지 originalName : " + originalName + " **");
				System.out.println("** 상품이미지 modifyName : " + modifyName + " **");
				System.out.println("** 상품이미지 pathNameGd_imgl : " + pathNameGd_imgl + " **");
				System.out.println("** 상품이미지 pathNameGd_imgm : " + pathNameGd_imgm + " **");
				System.out.println("** 상품이미지 pathNameGd_imgs : " + pathNameGd_imgs + " **");
				System.out.println("** 상품이미지 pathNameGd_imgss : " + pathNameGd_imgss + " **");
	
				gds.setGd_imgl(pathNameGd_imgl);
				// 이미지 사이즈 조절 만들 때 까지 임시
				gds.setGd_imgm(pathNameGd_imgm);
				gds.setGd_imgs(pathNameGd_imgs);
				gds.setGd_imgss(pathNameGd_imgss);
				
				// 리사이즈 원본파일 삭제
				File oldFile = new File(path + modifyName);
				oldFile.delete();
				
				// 기존 이미지 삭제
				try {
					gdsDAO.fileDelete(path, oldImgl);
					gdsDAO.fileDelete(path, oldImgm);
					gdsDAO.fileDelete(path, oldImgs);
					gdsDAO.fileDelete(path, oldImgss);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				// FK 설정으로 입력이나 삭제시 주의 상품상세테이블 먼저 입력이나 삭제하고 상품테이블 삭제
				// 방금입력한 상품번호 어떻게 가져오지?
				// 입력하고 저장 누르면 저장후 입력화면으로 이동 방금입력한 내용을 다시 입력화면에 표시불가
				// 수정화면 따로 만들어야 함
			}
			// Transaction 적용
			try {
				gdsDAO.updateGdsInfo(gds, gdtl, opl, request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
	
			gdsDAO.getAllGoodsView(gds, request);
			
			request.setAttribute("contentPage", "../goods/goodsList.jsp");
			return "sale/saleIndex";
		}else {
			request.setAttribute("loginInfo", "loginArea.jsp");
			return "member/loginPage";
		}
	}

	// 상품상세 조회
	@RequestMapping(value = "/goods", method = RequestMethod.GET)
	public String getGoodsDtlByNo(Goods goods, HttpServletRequest request, HttpServletResponse response) {
		cDAO.getAllCategory(request, response);

		gdsDAO.getGoodsByNo(goods, request, response);
		request.setAttribute("contentPage", "goods/goods.jsp");
		return "main";
	}

	// 카테고리 가져오기(ajax - json)
	@RequestMapping(value = "/category.get", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public @ResponseBody Categories categoryGet(Category cg, HttpServletRequest request, HttpServletResponse response) {

		return gdsDAO.getCategory(cg, request, response);
	}

	// 상품표시화면 처음
	@RequestMapping(value = "/goods.list", method = RequestMethod.GET)
	public String goodsList(Goods gds, HttpServletRequest request, HttpServletResponse response) {
		
		if(mDAO.slLoginCheck(request, response)) {
			
			Seller dbS = (Seller) request.getSession().getAttribute("loginSeller");
			gds.setGd_sellerid(dbS.getSl_id());

			gdsDAO.getAllGoodsView(gds, request);
	
			request.setAttribute("contentPage", "../goods/goodsList.jsp");
			return "sale/saleIndex";
		}else {
			request.setAttribute("loginInfo", "loginArea.jsp");
			return "member/loginPage";
		}
	}

	// 상품키워드 검색(ajax - json)
	@RequestMapping(value = "/goods.search.keyword", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public @ResponseBody Paging gdsSearchKey2(Keywords k, int curPage, HttpServletRequest request, HttpServletResponse response) {
		
		Seller dbS = (Seller) request.getSession().getAttribute("loginSeller");
		k.setGd_sellerid(dbS.getSl_id());
		
		return gdsDAO.getGoodsViewByKey(k, curPage, request);
	}
	
	// 상품상세화면 표시
	@RequestMapping(value = "/goods.view", method = RequestMethod.GET)
	public String goodsDtlView(GoodsView gv, GoodsCategory gc, HttpServletRequest request, HttpServletResponse response) {
		
		if(mDAO.slLoginCheck(request, response)) {
			// goodsView.jsp 수정시 daumeditor의 editor.jsp안의 Editor.modify({'content': '${gdsView.gt_detail}'}); 수정필요
			// gdsView.gt_detail 다음에디터로 작성한 상세내용 
			gdsDAO.getGoodsView(gv, gc, request, response);
			
			gdsDAO.getAllcategory(request, response);
			request.setAttribute("contentPage", "../goods/goodsView.jsp");
			return "sale/saleIndex";
		}else {
			request.setAttribute("loginInfo", "loginArea.jsp");
			return "member/loginPage";
		}
	}
	
	// 상품삭제
	@RequestMapping(value = "/goods.delete", method = RequestMethod.POST)
	public String goodsDelete(Goods gds, HttpServletRequest request, HttpServletResponse response) {

		if(mDAO.slLoginCheck(request, response)) {
			// 삭제 상품코드가져와서 삭제--> 삭제 할 때는 상품에 딸려있는 상품상세 옵션도 같이 전부 삭제 해야함 이미지도
			try {
				System.out.println("셀러 아이디1"+gds.getGd_sellerid());
				gdsDAO.deleteGdsInfo(gds, request);
			} catch (Exception e) {
				e.printStackTrace();
			}
	
			gdsDAO.getAllGoodsView(gds, request);
	
			request.setAttribute("contentPage", "../goods/goodsList.jsp");
			return "sale/saleIndex";
		}else {
			request.setAttribute("loginInfo", "loginArea.jsp");
			return "member/loginPage";
		}
	}

//---------------- end -------------------
}