package com.sol.mall.sale.delivery.excel;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.util.CellReference;
import org.apache.poi.xssf.usermodel.XSSFCell;

public class CellRef {

	public static String getName(Cell cell, int cellIndex) {
		int cellNum = 0;
		if (cell != null) {
			cellNum = cell.getColumnIndex();
		} else {
			cellNum = cellIndex;
		}

		return CellReference.convertNumToColString(cellNum);
	}

	public static String getValue(Cell cell) {
		String value = "";
		System.out.println("ㅋㅋㅋㅋㅋㅋㅋ");
		if (cell != null) {
			switch (cell.getCellType()) {
			case XSSFCell.CELL_TYPE_FORMULA:
				value = cell.getCellFormula();
				break;
			case XSSFCell.CELL_TYPE_NUMERIC:
				// 숫자일 경우, String형으로 변경하여 값을 읽는다.
				cell.setCellType(HSSFCell.CELL_TYPE_STRING);
				value = cell.getStringCellValue();
				break;
			case XSSFCell.CELL_TYPE_STRING:
				value = cell.getStringCellValue();
				break;
			case XSSFCell.CELL_TYPE_BLANK:
				// value = cell.getBooleanCellValue()+"";
				value = " ";
				break;
			case XSSFCell.CELL_TYPE_ERROR:
				value = cell.getErrorCellValue() + "";
				break;
			}
		}
		return value;
	}
}
