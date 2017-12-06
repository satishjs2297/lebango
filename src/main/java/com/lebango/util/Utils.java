package com.lebango.util;

import java.io.FileNotFoundException;
import java.util.List;
import java.util.Random;

import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.border.Border;
import com.itextpdf.layout.element.Cell;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.element.Table;
import com.lebango.bean.SubTrace;
import com.lebango.viewmodel.InvoiceItem;
import com.lebango.viewmodel.InvoiceViewModel;
import com.lebango.viewmodel.OrderItem;

public class Utils {
	
	public int[] getIntegerArrayFromString(String array_string) {
		if (array_string.isEmpty()) 
			return null;
        String [] arrOfStr = array_string.split(",");
        int length = arrOfStr.length;
        int [] arrOfInt = new int[length];
        for (int i = 0; i < length; i++) {
        		arrOfInt[i] = Integer.parseInt(arrOfStr[i]);
        }
		return arrOfInt;
	}
	
	public static String getSaltString() {
        String SALTCHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        StringBuilder salt = new StringBuilder();
        Random rnd = new Random();
        while (salt.length() < 18) { // length of the random string.
            int index = (int) (rnd.nextFloat() * SALTCHARS.length());
            salt.append(SALTCHARS.charAt(index));
        }
        String saltStr = salt.toString();
        return saltStr;
    }
	
	public static String getInvalidateTime() {
        String result = "2017-10-11";
        
        return result;
    }
	
	public static float getPrice(SubTrace subtrace, int seat) {
		switch (seat) {
			case 7:
				return subtrace.getSeat_7s(); 
			case 14:
				return subtrace.getSeat_14s();
			case 21:
				return subtrace.getSeat_21s();
			case 25:
				return subtrace.getSeat_25s();
			case 33:
				return subtrace.getSeat_33s();
			case 45:
				return subtrace.getSeat_45s();
			case 55:
				return subtrace.getSeat_55s();
			default:
				return 0;
		}
	}
	
	public static boolean generateInvoicePDF(String path, InvoiceViewModel invoice) {
		PdfWriter writer;
		try {
			writer = new PdfWriter(path);
			PdfDocument pdf = new PdfDocument(writer);
			/*
	         * 	SET DOCUMENT
	         * */
			Document document = new Document(pdf);
			document.setMargins(35, 50, 35, 50);
			// document.add(new Paragraph("Hello World!"));
			
			/*
	         * 	SET FONT
	         * */
			// PdfFont font = PdfFontFactory.createFont(FontConstants.HELVETICA);
	        // PdfFont bold = PdfFontFactory.createFont(FontConstants.HELVETICA_BOLD);
			
			/*
	         * 	SET TABLE SIZE
	         * */
	        Table table = new Table(new float[]{6, 1, 1, 2});
	        table.setWidthPercent(100);
	        
	        /*
	         * 	SET ORDER LIST TABLE HEADER
	         * */
	        // table.addHeaderCell(new Cell().add(new Paragraph("document").setFont(font)));
	        table.addHeaderCell(new Cell().add(new Paragraph("Description")).setBorder(Border.NO_BORDER));
	        table.addHeaderCell(new Cell().add(new Paragraph("Quantity")).setBorder(Border.NO_BORDER));
	        table.addHeaderCell(new Cell().add(new Paragraph("Unit Price")).setBorder(Border.NO_BORDER));
	        table.addHeaderCell(new Cell().add(new Paragraph("Amount(AUD)")).setBorder(Border.NO_BORDER));
	        List<InvoiceItem> invoice_item_array = invoice.getInvoice_item_array();
	        for (int i = 0; i < invoice_item_array.size(); i++ ) {
	        		InvoiceItem item = invoice_item_array.get(i);
	        		List<OrderItem> order_item_array = item.getOrder_item_array();
	        		String description = new String();
	        		description= item.getTrace_name() + "\n"; 
	        		for (int j = 0; j < order_item_array.size(); j++) {
	        			OrderItem temp = order_item_array.get(j);
	        			description += "Car: " + temp.getCar_name() + ", " + temp.getCar_seat() + "s, " + "Guide: " + temp.getGuide_name() + "\n";
	        		}
	        		
	        		table.addCell(new Cell().add(new Paragraph(description)));
		        table.addCell(new Cell().add(new Paragraph(String.valueOf(item.getQuantity()))));
		        table.addCell(new Cell().add(new Paragraph(String.valueOf(item.getItem_price()))));
		        table.addCell(new Cell().add(new Paragraph((String.valueOf(item.getTotal_price())))));
	        }

	        document.add(table);
		        
			document.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
        
        return true;
    }
}
