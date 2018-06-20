package com.sol.mall.sale.delivery;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DeliveryController {

	@Autowired
	private DeliveryDAO DDAO;

	@RequestMapping(value = "/saleMain.go", method = RequestMethod.GET)
	public String home(HttpServletRequest req, HttpServletResponse res) {
		req.setAttribute("contentPage", "saleHome.jsp");
		return "sale/saleIndex";
	}

	@RequestMapping(value = "/sale.delivery.go", method = RequestMethod.GET)
	public String delivery(HttpServletRequest req, HttpServletResponse res) {

		DDAO.paging(req, res, DDAO.getAllOrder(req, res));

		DDAO.getAllDeliveryNum(req, res);
		DDAO.getNewDeliveryNum(req, res);
		DDAO.getCheckDeliveryNum(req, res);

		req.setAttribute("contentPage", "delivery/deliveryContent.jsp");
		return "sale/saleIndex";
	}

	@RequestMapping(value = "/sale.deliveryCheck.do", method = RequestMethod.POST)
	public String deliveryCheck(HttpServletRequest req, HttpServletResponse res) {
		DDAO.deliveryCheck(req, res);

		DDAO.paging(req, res, DDAO.getAllOrder(req, res));

		DDAO.getAllDeliveryNum(req, res);
		DDAO.getNewDeliveryNum(req, res);
		DDAO.getCheckDeliveryNum(req, res);
		req.setAttribute("contentPage", "delivery/deliveryContent.jsp");
		return "sale/saleIndex";
	}

	@RequestMapping(value = "/sale.deliverySend.do", method = RequestMethod.POST)
	public String deliverySend(HttpServletRequest req, HttpServletResponse res) {
		DDAO.deliverySend(req, res);

		DDAO.paging(req, res, DDAO.getAllOrder(req, res));

		DDAO.getAllDeliveryNum(req, res);
		DDAO.getNewDeliveryNum(req, res);
		DDAO.getCheckDeliveryNum(req, res);
		req.setAttribute("contentPage", "delivery/deliveryContent.jsp");
		return "sale/saleIndex";
	}

	@RequestMapping(value = "/sale.selNewDeals.go", method = RequestMethod.GET)
	public String selNewDeals(HttpServletRequest req, HttpServletResponse res) {

		DDAO.paging(req, res, DDAO.getNewDeals(req, res));

		DDAO.getAllDeliveryNum(req, res);
		DDAO.getNewDeliveryNum(req, res);
		DDAO.getCheckDeliveryNum(req, res);
		req.setAttribute("contentPage", "delivery/deliveryContent.jsp");
		return "sale/saleIndex";
	}

	@RequestMapping(value = "/sale.selCheckDeals.go", method = RequestMethod.GET)
	public String selCheckDeals(HttpServletRequest req, HttpServletResponse res) {

		DDAO.paging(req, res, DDAO.getCheckDeals(req, res));

		DDAO.getAllDeliveryNum(req, res);
		DDAO.getNewDeliveryNum(req, res);
		DDAO.getCheckDeliveryNum(req, res);

		req.setAttribute("contentPage", "delivery/deliveryContent.jsp");
		return "sale/saleIndex";
	}

	// ---------------배송중----------------

	@RequestMapping(value = "/sale.goingDelivery.go", method = RequestMethod.GET)
	public String goingDelivery(HttpServletRequest req, HttpServletResponse res) {
		DDAO.getSendDoneDeliveryNum(req, res);
		DDAO.getSendingDeliverysNum(req, res);

		req.setAttribute("contentPage", "delivery/goingDeliveryContent.jsp");
		return "sale/saleIndex";
	}

	@RequestMapping(value = "/sale.sendingDelivery.go", method = RequestMethod.GET)
	public String sendingDeliverys(HttpServletRequest req, HttpServletResponse res) {

		DDAO.paging(req, res, DDAO.getSendingDeliverys(req, res));

		DDAO.getSendDoneDeliveryNum(req, res);
		DDAO.getSendingDeliverysNum(req, res);
		req.setAttribute("contentPage", "delivery/goingDeliveryContent.jsp");
		return "sale/saleIndex";
	}

	@RequestMapping(value = "/sale.sendDoneDelivery.go", method = RequestMethod.GET)
	public String sendDoneDeliverys(HttpServletRequest req, HttpServletResponse res) {

		DDAO.paging(req, res, DDAO.getSendDoneDeliverys(req, res));

		DDAO.getSendDoneDeliveryNum(req, res);
		DDAO.getSendingDeliverysNum(req, res);
		req.setAttribute("contentPage", "delivery/goingDeliveryContent.jsp");
		return "sale/saleIndex";
	}

	// ---------------구매확정----------------
	@RequestMapping(value = "/sale.confirmDelivery.go", method = RequestMethod.GET)
	public String getConfirmDelivery(HttpServletRequest req, HttpServletResponse res) {

		DDAO.paging(req, res, DDAO.getConfirmDelivery(req, res));
		DDAO.getConfirmDeliveryNum(req, res);
		req.setAttribute("contentPage", "delivery/confirmDeliveryContent.jsp");

		return "sale/saleIndex";
	}

	// ---------------취소관리----------------
	@RequestMapping(value = "/sale.cancelDelivery.go", method = RequestMethod.GET)
	public String getCancelDelivery(HttpServletRequest req, HttpServletResponse res) {

		DDAO.paging(req, res, DDAO.getCancelDelivery(req, res));
		DDAO.getCancelDeliveryNum(req, res);
		req.setAttribute("contentPage", "delivery/cancelDeliveryContent.jsp");

		return "sale/saleIndex";
	}

	// ---------------반품관리----------------
	@RequestMapping(value = "/sale.returnDelivery.go", method = RequestMethod.GET)
	public String getReturnDelivery(HttpServletRequest req, HttpServletResponse res) {

		DDAO.paging(req, res, DDAO.getReturnDelivery(req, res));
		DDAO.getReturnDeliveryNum(req, res);
		req.setAttribute("contentPage", "delivery/returnDeliveryContent.jsp");

		return "sale/saleIndex";
	}

	// ---------------교환관리----------------
	@RequestMapping(value = "/sale.exchangeDelivery.go", method = RequestMethod.GET)
	public String getExchangeDelivery(HttpServletRequest req, HttpServletResponse res) {

		DDAO.paging(req, res, DDAO.getExchangeDelivery(req, res));
		DDAO.getExchangeDeliveryNum(req, res);
		req.setAttribute("contentPage", "delivery/exchangeDeliveryContent.jsp");

		return "sale/saleIndex";

	}
}
