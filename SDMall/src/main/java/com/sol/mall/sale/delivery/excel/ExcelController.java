package com.sol.mall.sale.delivery.excel;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sol.mall.goods.CategoryDAO;
import com.sol.mall.member.MemberDAO;
import com.sol.mall.sale.delivery.Delivery;
import com.sol.mall.sale.delivery.DeliveryDAO;

@Controller
public class ExcelController {

	@Autowired
	private ExcelDAO EDAO;

	@Autowired
	private DeliveryDAO DDAO;

	@Autowired
	private CategoryDAO cDAO;

	@Autowired
	private MemberDAO MDAO;

	@RequestMapping(value = "/excel.xlsx", method = RequestMethod.GET, produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody
	public FileSystemResource download(HttpServletRequest req, HttpServletResponse res, Delivery ds) {
		File file = EDAO.MakeExcel(req, res, ds);

		return new FileSystemResource(file);

	}

	@RequestMapping(value = "/insertExcel.go", method = RequestMethod.POST)
	public String doSendDeliverys(@RequestParam("excelFile") MultipartFile multipartFile, HttpServletRequest req,
			HttpServletResponse res, Delivery d) {

		if (MDAO.slLoginCheck(req, res)) {
			EDAO.sendDeliverys(req, res, multipartFile);
			DDAO.getAllOrder(req, res, d);
			DDAO.getAllDeliveryNum(req, res, d);
			DDAO.getNewDeliveryNum(req, res, d);
			DDAO.getCheckDeliveryNum(req, res, d);

			req.setAttribute("contentPage", "delivery/deliveryContent.jsp");
			return "sale/saleIndex";
		} else {
			cDAO.getAllCategory(req, res);// 메인 카테고리 호출 메소드
			req.setAttribute("contentPage", "member/loginArea.jsp");
			return "main";
		}

	}

}
