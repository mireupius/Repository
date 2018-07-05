package com.sol.mall.sale.delivery.excel;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sol.mall.member.Seller;
import com.sol.mall.sale.delivery.Delivery;
import com.sol.mall.sale.delivery.DeliveryMapper;

@Service
public class ExcelDAO {

	@Autowired
	private SqlSession ss;

	public void sendDeliverys(HttpServletRequest req, HttpServletResponse res) {
		String path = req.getSession().getServletContext().getRealPath("resources/files/sale/temp");

		System.out.println(path);

		File selectedDir = new File(path);

		File[] innerFiles = selectedDir.listFiles();

		// 하위 디렉토리 삭제
		for (int i = 0; i < innerFiles.length; i++) {
			innerFiles[i].delete();
		}

		try {
			MultipartRequest mr = new MultipartRequest(req, path, 1024 * 1024 * 12, "utf-8",
					new DefaultFileRenamePolicy());

			String fileName = mr.getFilesystemName("excelFile");

			File excel = new File(path + "/" + fileName);

			ReadOption readOption = new ReadOption();
			readOption.setFilePath(excel.getAbsolutePath());

			readOption.setOutputColumns("A", "B", "C");

			readOption.setStartRow(0);

			Delivery d = null;

			List<Map<String, String>> excelContent = ExcelRead.read(readOption);

			int all = excelContent.size();
			int success = 0;

			for (int i = 1; i < excelContent.size(); i++) {
				d = new Delivery();

				d.setSd_delivery_pno(excelContent.get(i).get("A"));
				d.setSd_courier(excelContent.get(i).get("B"));
				d.setSd_invoice_no(excelContent.get(i).get("C") + "");

				if (ss.getMapper(DeliveryMapper.class).sendDeliverys(d) == 1) {
					success++;
				}
			}
			req.setAttribute("all", all - 1);
			req.setAttribute("success", success);

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public File MakeExcel(HttpServletRequest req, HttpServletResponse res, Delivery ds) {

		String filePath = req.getSession().getServletContext().getRealPath("resources/files/sale/temp");
		File selectedDir = new File(filePath);

		File[] innerFiles = selectedDir.listFiles();

		// 하위 디렉토리 삭제
		if (innerFiles.length != 0) {
			for (int i = 0; i < innerFiles.length; i++) {
				innerFiles[i].delete();
			}
		}

		String excelName = "excel.xlsx";
		Map<String, String> headerList = new HashMap<String, String>();
		Map<String, String> list = new HashMap<String, String>();
		
		Seller s = (Seller) req.getSession().getAttribute("loginSeller");
		ds.setSd_seller_id(s.getSl_id());
		List<Delivery> d = ss.getMapper(DeliveryMapper.class).getCheckDeliverys(ds);
		String[] titles = { "상품주문번호", "주문번호", "택배사", "구매자명", "구매자ID", "수취인명", "주문상태", "주문세부상태", "배송비", "상품번호", "상품명",
				"옵션종류", "옵션정보", "수량(구입수량)", "옵션가격", "상품가격", "판매가격", "상품별 총 주문금액", "발주확인일", "수취인연락처1", "배송지", "구매자연락처",
				"우편번호", "배송메세지", "출고지", "주문일시", "클레임상태", "결제수단", "배송방법" };

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		int num = 0;
		for (String t : titles) {
			headerList.put(num + "", t);
			num++;
		}

		XSSFWorkbook workbook = new XSSFWorkbook();
		XSSFSheet sheet = workbook.createSheet("주문조회");
		XSSFRow row = null;
		XSSFCell cell = null;
		FileOutputStream fileOutputStream = null;

		for (int i = 0; i <= d.size(); i++) {
			// data의 크기만큼 로우를 생성합니다.
			row = sheet.createRow((short) i);
			for (int k = 0; k < headerList.size(); k++) {
				// headerList의 크기만큼 i번째 row에 cell을 생성합니다.
				cell = row.createCell(k);
				// 맨윗줄에 headerList를 세팅합니다.
				if (i == 0) {
					// CellStyle은 필요에따라서 세팅합니다.
					cell.setCellValue(headerList.get(Integer.toString(k)));
				}
				// 엑셀파일에 넣을 데이터를 세팅합니다.
				else {
					// i-1을하는이유는 headerList가 i번쨰 row이기 때문.

					// 리스트의 크기만큼 세팅합니다.

					list.put("0", d.get(i - 1).getSd_delivery_pno());
					list.put("1", d.get(i - 1).getSd_delivery_no());
					list.put("2", d.get(i - 1).getSd_courier());
					list.put("3", d.get(i - 1).getSd_customer_name());
					list.put("4", d.get(i - 1).getSd_customer_id());
					list.put("5", d.get(i - 1).getSd_taker_name());
					list.put("6", d.get(i - 1).getSd_delivery_state());
					list.put("7", d.get(i - 1).getSd_state_detail());
					list.put("8", d.get(i - 1).getSd_delivery_cost() + "");
					list.put("9", d.get(i - 1).getSd_product_no());
					list.put("10", d.get(i - 1).getSd_product_name());
					list.put("11", d.get(i - 1).getSd_option_type());
					list.put("12", d.get(i - 1).getSd_option_info());
					list.put("13", d.get(i - 1).getSd_amount() + "");
					list.put("14", d.get(i - 1).getSd_option_price() + "");
					list.put("15", d.get(i - 1).getSd_product_price() + "");
					list.put("16", d.get(i - 1).getSd_product_sellprice() + "");
					list.put("17", d.get(i - 1).getSd_total_price() + "");

					if (d.get(i - 1).getSd_check_date() != null) {
						list.put("18", sdf.format(d.get(i - 1).getSd_check_date()));
					} else {
						list.put("18", "");
					}

					list.put("19", d.get(i - 1).getSd_taker_phone());
					list.put("20", d.get(i - 1).getSd_take_area());
					list.put("21", d.get(i - 1).getSd_customer_ph());
					list.put("22", d.get(i - 1).getSd_postno());
					list.put("23", d.get(i - 1).getSd_message());
					list.put("24", d.get(i - 1).getSd_out_area());

					if (d.get(i - 1).getSd_order_date() != null) {
						list.put("25", sdf.format(d.get(i - 1).getSd_order_date()));
					} else {
						list.put("25", "");
					}

					list.put("26", d.get(i - 1).getSd_claim());
					list.put("27", d.get(i - 1).getSd_pay_method());
					list.put("28", d.get(i - 1).getSd_delivery_type());

					cell.setCellValue(list.get(Integer.toString(k)));
				}
			}
		}
		// 엑셀파일 세팅 후 파일 생성
		try {
			fileOutputStream = new FileOutputStream(selectedDir + File.separator + excelName);
			// 생성한 엑셀파일을 outputStream 해줍니다.
			workbook.write(fileOutputStream);
			File file = new File(selectedDir + "/" + excelName);
			return file;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				fileOutputStream.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

}
