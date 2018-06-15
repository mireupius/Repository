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
import org.springframework.web.bind.annotation.ResponseBody;

import com.sol.mall.sale.delivery.DeliveryDAO;

@Controller
public class ExcelController {

	@Autowired
	private ExcelDAO EDAO;

	@Autowired
	private DeliveryDAO DDAO;

	@RequestMapping(value = "/excel.xlsx", method = RequestMethod.GET, produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody
	public FileSystemResource download(HttpServletRequest req, HttpServletResponse res) {
		File file = EDAO.MakeExcel(req, res);

		return new FileSystemResource(file);

	}

	@RequestMapping(value = "/insertExcel.go", method = RequestMethod.POST)
	public String doSendDeliverys(HttpServletRequest req, HttpServletResponse res) {

		EDAO.sendDeliverys(req, res);
		DDAO.getAllOrder(req, res);
		DDAO.getAllDeliveryNum(req, res);
		DDAO.getNewDeliveryNum(req, res);
		DDAO.getCheckDeliveryNum(req, res);

		req.setAttribute("contentPage", "delivery/deliveryContent.jsp");
		return "sale/saleIndex";
	}

}
