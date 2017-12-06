package com.lebango.util;

public class GlobalConstants {
	public static final String SESSION_MANAGER_SETTINGS = "settings";
	public static final String SESSION_ROLES = "roles";
	public static final String SESSION_PERMISSIONS = "permissions";
	public static final String SESSION_LOCATIONS = "locations";
	public static final String SESSION_STATES = "states";
	
	public static final int USER_ADMIN = 1;
	public static final int USER_AGENT = 2;
	public static final int USER_SUPPLIER = 3;
	public static final int USER_ORGANIZATION = 4;
	
	public static final int DOCUMENT_CATEGORY_REGISTER = 1;
	public static final int DOCUMENT_CATEGORY_CAR = 2;
	public static final int DOCUMENT_CATEGORY_BOOKING = 3;
	
	public static final int DOCUMENT_TYPE_PHOTO = 1;
	public static final int DOCUMENT_TYPE_ZIP = 2;
	
	public static final String CAR_FRONT_IMAGE = "car_front_image";
	public static final String CAR_BACK_IMAGE = "car_back_image";
	public static final String CAR_INNER_IMAGE = "car_inner_image";
	public static final String CAR_BODY_IMAGE = "car_body_image";
		
	public static final String BUSINESS_REGISTER_CERTIFICATE = "business_register_certificate";
	public static final String PUBLIC_LIABILITY = "public_liability";
	public static final String CAR_SERVICE_OPERATING_COMPANY_CERTIFICATE = "operator_accreditation_certificate";
	
	public static final String[] STATE_NAME_ARRAY = {"NSW","VIC","QLD","SA","TAS","WA","ACT","NT"};
	
	public static final int MESSAGE_TYPE_NEW_BOOKING_REQUEST = 1;
	public static final int MESSAGE_TYPE_CANCEL_BOOKING_REQUEST = 2;
	public static final int MESSAGE_TYPE_BOOKING_ACCEPTED = 3;
	public static final int MESSAGE_TYPE_INVOICE_REQUEST = 4;
	public static final int MESSAGE_TYPE_REGISTER_REQUEST = 5;
	
	public static final int MESSAGE_STATUS_DRAFT = 1;
	public static final int MESSAGE_STATUS_MAIL_SENT = 2;
	public static final int MESSAGE_STATUS_MAIL_FAILURE = 3;
	public static final int MESSAGE_STATUS_RECEIVED = 4;
	
	public static final int TOUR_STATUS_AGENT_REQUESTED = 1;
	public static final int TOUR_STATUS_AGENT_CANCELLED = 2;
	public static final int TOUR_STATUS_BOOKING_ACCEPTED = 3;
	public static final int TOUR_STATUS_BOOKING_DENIED = 4;
	public static final int TOUR_STATUS_AGENT_PAID = 5;
	public static final int TOUR_STATUS_SERVICE_STARTED = 6;
	public static final int TOUR_STATUS_SERVICE_COMPLETED = 7;
	public static final int TOUR_STATUS_SERVICE_CANCELLED = 8;
	public static final int TOUR_STATUS_INVOICE_CREATED = 9;
	public static final int TOUR_STATUS_INVOICE_PAID = 10;
	public static final int TOUR_STATUS_INVOICE_DENIED = 11;
	
	public static final int BOOKING_STATUS_BOOKING_REQUESTED = 1;
	public static final int BOOKING_STATUS_BOOKING_ACCEPTED = 2;
	public static final int BOOKING_STATUS_BOOKING_DENIED = 3;
	public static final int BOOKING_STATUS_BOOKING_PAID = 4;
	public static final int BOOKING_STATUS_BOOKING_CANCELLED = 5;
	public static final int BOOKING_STATUS_SERVICE_STARTED = 6;
	public static final int BOOKING_STATUS_SERVICE_COMPLETED = 7;
	public static final int BOOKING_STATUS_SERVICE_CANCELLED = 8;
	
	public static final int GUIDE_GENDER_MALE = 1;
	public static final int GUIDE_GENDER_FEMALE = 2;
	
	public static final int[] SEAT_NUMBER = {7, 14, 21, 25, 33, 45, 55};
	
	public static final int INVOICE_TYPE_PAY = 1;
	public static final int INVOICE_TYPE_WITHDRAW = 2;
	
	public static final int INVOICE_STATUS_PENDING = 1;
	public static final int INVOICE_STATUS_DENIED = 2;
	public static final int INVOICE_STATUS_COMPLETED = 3;
	public static final int INVOICE_STATUS_FAILURE = 4;
	
	public static final int INVOICE_METHOD_CARD = 1;
	public static final int INVOICE_METHOD_PAYPAL = 2;
	public static final int INVOICE_METHOD_ALIPAY = 3;
	
	public static final int SUPPLIER_REGISTER_IS_RESUBMIT_YES = 1;
	public static final int SUPPLIER_REGISTER_IS_RESUBMIT_NO = 2;
	
	public static final int SUPPLIER_REGISTER_STATUS_WAITING = 1;
	public static final int SUPPLIER_REGISTER_STATUS_APPROVED = 2;
	public static final int SUPPLIER_REGISTER_STATUS_DENIED = 3;
	
	public static final float GENERAL_FEE = 5;
}
