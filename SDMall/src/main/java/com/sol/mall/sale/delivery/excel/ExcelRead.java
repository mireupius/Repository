package com.sol.mall.sale.delivery.excel;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

public class ExcelRead {

	public static List<Map<String, String>> read(ReadOption readOption) {

		/*
		 * ���� ���� ��ü ���������� �о� ���δ�. FileType.getWorkbook() : ������ Ȯ���ڸ� �����ؼ� �����´�.
		 */
		Workbook wb = FileType.getWorkbook(readOption.getFilePath());

		// ���� ���Ͽ��� ù��° ��Ʈ�� ������ �´�.
		Sheet sheet = wb.getSheetAt(0);

		/*
		 * 3 ��Ʈ���� ��ȿ��(�����Ͱ� �ִ�) ���� ������ �����´�.
		 */
		int numOfRows = sheet.getPhysicalNumberOfRows();
		int numOfCells = 0;

		Row row = null;
		Cell cell = null;

		String cellName = "";

		// key : �÷� / value: ������
		/*
		 * �� Row������ ���� ������ �� ��ü ����Ǵ� ������ ������ ���� put("A","�̸�"); put("B","���Ӹ�");
		 */
		Map<String, String> map = null;

		/*
		 * �� Row�� ����Ʈ�� ��´� �ϳ��� Row�� �ϳ��� Map���� ǥ���Ǹ� List���� ��� Row�� ���Ե� ���̴�.
		 */
		List<Map<String, String>> result = new ArrayList<Map<String, String>>();

		/*
		 * Row��ŭ �ݺ��� �Ѵ�.
		 */
		for (int rowIndex = readOption.getStartRow() - 1; rowIndex < numOfRows; rowIndex++) {

			/*
			 * ��ũ�Ͽ��� ������ ��Ʈ���� rowIndex�� �ش��ϴ� Row�� �����´�. �ϳ��� Row�� �������� Cell�� ������.
			 */
			row = sheet.getRow(rowIndex);

			if (row != null) {

				// ��ȿ�� ���� ����
				/*
				 * ������ Row�� Cell�� ������ ���Ѵ�.
				 */
				numOfCells = row.getPhysicalNumberOfCells();

				/*
				 * �����͸� ���� �� ��ü �ʱ�ȭ
				 */
				map = new HashMap<String, String>();

				/*
				 * Cell�� �� ��ŭ �ݺ�
				 */
				for (int cellIndex = 0; cellIndex < numOfCells; cellIndex++) {

					/*
					 * Row���� CellIndex�� �ش��ϴ� Cell�� �����´�.
					 */
					cell = row.getCell(cellIndex);

					/*
					 * ���� Cell�� �̸��� �����´�. �̸��� �� : A,B,C,D,E.....
					 */
					cellName = CellRef.getName(cell, cellIndex);

					/*
					 * ���� ��� �÷����� Ȯ���Ѵ�. ���� ��� �÷��� �ƴ϶�� for�� �ٽ� �ö󰣴�.
					 */
					if (!readOption.getOutputColumns().contains(cellName)) {
						continue;
					}

					/*
					 * �� ��ü�� Cell�� �̸��� Ű(Key)�� �����͸� ��´�.
					 */
					map.put(cellName, CellRef.getValue(cell));
				}

				/*
				 * ������� Map ��ü�� List�� �ִ´�.
				 */
				result.add(map);

			}

		}

		return result;

	}

}
