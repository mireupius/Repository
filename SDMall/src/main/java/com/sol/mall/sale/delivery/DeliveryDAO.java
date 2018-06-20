package com.sol.mall.sale.delivery;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DeliveryDAO {

	@Autowired
	private SqlSession ss;
	private Delivery d;

	public void paging(HttpServletRequest req, HttpServletResponse res, List<Delivery> ds) {

		if (ds.size() != 0) {

			int page = 1;
			if (req.getParameter("pno") != null) {
				page = Integer.parseInt(req.getParameter("pno"));
			}

			double cnt = 10;
			int itemSize = ds.size();
			int pageCount = (int) Math.ceil(itemSize / cnt);
			req.setAttribute("pageCount", pageCount);

			int start = itemSize - ((int) cnt * (page - 1));
			int end = (page == pageCount) ? -1 : start - ((int) cnt + 1);

			ArrayList<Delivery> items2 = new ArrayList<>();

			for (int i = start - 1; i > end; i--) {
				items2.add(ds.get(i));
			}

			req.setAttribute("pageCount", pageCount - 1);
			req.setAttribute("deliverys", items2);
		} else {
			req.setAttribute("pageCount", 0);
			req.setAttribute("deliverys", 0);
		}

	}

	// ------------------- 발주주문 -----------------------------

	public List<Delivery> getAllOrder(HttpServletRequest req, HttpServletResponse res) {

		req.setAttribute("now", "sale.delivery.go");
		return ss.getMapper(DeliveryMapper.class).getAllDelivery();
	}

	public List<Delivery> getNewDeals(HttpServletRequest req, HttpServletResponse res) {
		req.setAttribute("now", "sale.selNewDeals.go");
		return ss.getMapper(DeliveryMapper.class).getNewDeliverys();
	}

	public List<Delivery> getCheckDeals(HttpServletRequest req, HttpServletResponse res) {
		req.setAttribute("now", "sale.selCheckDeals.go");
		return ss.getMapper(DeliveryMapper.class).getCheckDeliverys();
	}

	public void getAllDeliveryNum(HttpServletRequest req, HttpServletResponse res) {
		int adn = ss.getMapper(DeliveryMapper.class).getAllDeliveryNum();
		req.setAttribute("AllDeliveryNum", adn);
	}

	public void getNewDeliveryNum(HttpServletRequest req, HttpServletResponse res) {

		int ndn = ss.getMapper(DeliveryMapper.class).getNewDeliveryNum();
		req.setAttribute("NewDeliveryNum", ndn);
	}

	public void getCheckDeliveryNum(HttpServletRequest req, HttpServletResponse res) {

		int cdn = ss.getMapper(DeliveryMapper.class).getCheckDeliveryNum();
		req.setAttribute("CheckDeliveryNum", cdn);
	}

	public void deliveryCheck(HttpServletRequest req, HttpServletResponse res) {
		String str = req.getParameter("array");
		String[] array = str.split(",");
		d = new Delivery();

		for (String string : array) {
			d.setSd_delivery_pno(string);
			if (ss.getMapper(DeliveryMapper.class).deliveryCheck(d) == 1) {
				System.out.println("?��?��?���?");
			} else {
				System.out.println("?��?��?��?��");
			}
		}
	}

	public void deliverySend(HttpServletRequest req, HttpServletResponse res) {
		String send_Array = req.getParameter("send_Array");
		String cs_sendArray = req.getParameter("cs_sendArray");
		String no_sendArray = req.getParameter("no_sendArray");
		String[] sendArray = send_Array.split(",");
		String[] csSendArray = cs_sendArray.split(",");
		String[] noSendArray = no_sendArray.split(",");
		d = new Delivery();

		int success = 0;
		for (int i = 0; i < sendArray.length; i++) {
			d.setSd_delivery_pno(sendArray[i]);

			d.setSd_courier(csSendArray[i]);
			d.setSd_invoice_no(noSendArray[i]);
			success += ss.getMapper(DeliveryMapper.class).sendDeliverys(d);
		}

		req.setAttribute("all", sendArray.length);
		req.setAttribute("success", success);
	}

	// ------------------- 배송 -----------------------------

	public List<Delivery> getSendingDeliverys(HttpServletRequest req, HttpServletResponse res) {
		req.setAttribute("now", "sale.sendingDelivery.go");
		return ss.getMapper(DeliveryMapper.class).getSendingDeliverys();

	}

	public List<Delivery> getSendDoneDeliverys(HttpServletRequest req, HttpServletResponse res) {
		req.setAttribute("now", "sale.sendDoneDelivery.go");
		return ss.getMapper(DeliveryMapper.class).getSendDoneDeliverys();
	}

	public void getSendingDeliverysNum(HttpServletRequest req, HttpServletResponse res) {
		int num = ss.getMapper(DeliveryMapper.class).getSendingDeliverysNum();
		req.setAttribute("sendingDeliveryNum", num);

	}

	public void getSendDoneDeliveryNum(HttpServletRequest req, HttpServletResponse res) {
		int num = ss.getMapper(DeliveryMapper.class).getSendDoneDeliveryNum();
		req.setAttribute("sendDoneDeliveryNum", num);

	}

	// ------------------- 구매확정 -----------------------------

	public List<Delivery> getConfirmDelivery(HttpServletRequest req, HttpServletResponse res) {
		req.setAttribute("now", "sale.confirmDelivery.go");
		return ss.getMapper(DeliveryMapper.class).getConfirmDelivery();
	}

	public void getConfirmDeliveryNum(HttpServletRequest req, HttpServletResponse res) {
		int num = ss.getMapper(DeliveryMapper.class).getConfirmDeliveryNum();
		req.setAttribute("confirmDeliveryNum", num);

	}

	// ------------------- 취소관리 -----------------------------

	public List<Delivery> getCancelDelivery(HttpServletRequest req, HttpServletResponse res) {
		req.setAttribute("now", "sale.cancelDelivery.go");
		return ss.getMapper(DeliveryMapper.class).getCancelDelivery();
	}

	public void getCancelDeliveryNum(HttpServletRequest req, HttpServletResponse res) {
		int num = ss.getMapper(DeliveryMapper.class).getCancelDeliveryNum();
		req.setAttribute("cancelDeliveryNum", num);

	}

	// ------------------- 반품관리 -----------------------------

	public List<Delivery> getReturnDelivery(HttpServletRequest req, HttpServletResponse res) {
		req.setAttribute("now", "sale.returnDelivery.go");
		return ss.getMapper(DeliveryMapper.class).getReturnDelivery();
	}

	public void getReturnDeliveryNum(HttpServletRequest req, HttpServletResponse res) {
		int num = ss.getMapper(DeliveryMapper.class).getReturnDeliveryNum();
		req.setAttribute("returnDeliveryNum", num);

	}

	// ------------------- 교환관리 -----------------------------

	public List<Delivery> getExchangeDelivery(HttpServletRequest req, HttpServletResponse res) {
		req.setAttribute("now", "sale.exchangeDelivery.go");
		return ss.getMapper(DeliveryMapper.class).getExchangeDelivery();
	}

	public void getExchangeDeliveryNum(HttpServletRequest req, HttpServletResponse res) {
		int num = ss.getMapper(DeliveryMapper.class).getExchangeDeliveryNum();
		req.setAttribute("exchangeDeliveryNum", num);

	}

}
