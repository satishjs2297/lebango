package com.lebango.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*import org.apache.log4j.Logger;*/
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.lebango.util.PaypalConstants;
import com.paypal.api.payments.Amount;
import com.paypal.api.payments.Details;
import com.paypal.api.payments.Item;
import com.paypal.api.payments.ItemList;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payer;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.PaymentExecution;
import com.paypal.api.payments.RedirectUrls;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;

@Controller
public class PaypalController {
	
	/**
	 * Request checkout
	 * You can get checkout informations and then redirect paypal
	 * @param response
	 */
	/*
	 * private static final Logger LOGGER = Logger.getLogger(PaypalController.class);
	 * */
	Map<String, String> map = new HashMap<String, String>();

	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView index(HttpServletRequest req, HttpServletResponse res) {
		
		ModelAndView mvc = new ModelAndView();
		mvc.setViewName("index");
		return mvc;
	}
	
	/**
	 * Request checkout
	 * You can get checkout informations and then redirect paypal
	 * @param response
	 */
	@RequestMapping(value = "/paypal/checkouts", method = RequestMethod.GET)
	public String checkout(HttpServletRequest req, HttpServletResponse res) {
		
		APIContext apiContext = new APIContext(PaypalConstants.clientID, PaypalConstants.clientSecret, PaypalConstants.mode);
		
		// ###Details
		// Let's you specify details of a payment amount.
		Details details = new Details();
		
		int shippingCost = 1;
		int itemCost = 5;
		int taxCost = 2;
		int totalAmount = shippingCost + itemCost + taxCost;
		
		details.setShipping(Integer.toString(shippingCost)); 	// Shipping cost
		details.setSubtotal(Integer.toString(itemCost)); 		// Item cost
		details.setTax(Integer.toString(taxCost));				// Tax cost

		// ###Amount
		// Let's you specify a payment amount.
		Amount amount = new Amount();
		amount.setCurrency("USD"); // Set currency
		// Total must be equal to sum of shipping, tax and subtotal.
		amount.setTotal(Integer.toString(totalAmount));	// 
		amount.setDetails(details);

		// ###Transaction
		// A transaction defines the contract of a
		// payment - what is the payment for and who
		// is fulfilling it. Transaction is created with	
		// a `Payee` and `Amount` types
		Transaction transaction = new Transaction();
		transaction.setAmount(amount);
		transaction.setDescription("This is the payment transaction description.");

		// ### Items
		Item item = new Item();
		item.setName("Ground Coffee 40 oz").setQuantity("1").setCurrency("USD").setPrice("5");
		ItemList itemList = new ItemList();
		List<Item> items = new ArrayList<Item>();
		items.add(item);
		itemList.setItems(items);
		
		transaction.setItemList(itemList);
		
		
		// The Payment creation API requires a list of
		// Transaction; add the created `Transaction`
		// to a List
		List<Transaction> transactions = new ArrayList<Transaction>();
		transactions.add(transaction);

		// ###Payer
		// A resource representing a Payer that funds a payment
		// Payment Method
		// as 'paypal'
		Payer payer = new Payer();
		payer.setPaymentMethod("paypal");

		// ###Payment
		// A Payment Resource; create one using
		// the above types and intent as 'sale'
		Payment payment = new Payment();
		payment.setIntent("sale");
		payment.setPayer(payer);
		payment.setTransactions(transactions);
		
		
		// ###Redirect URLs
		RedirectUrls redirectUrls = new RedirectUrls();
		String guid = UUID.randomUUID().toString().replaceAll("-", "");
		redirectUrls.setCancelUrl(req.getScheme() + "://"
				+ req.getServerName() + ":" + req.getServerPort()
				+ req.getContextPath() + "/paypal/cancel?guid=" + guid);
		redirectUrls.setReturnUrl(req.getScheme() + "://"
				+ req.getServerName() + ":" + req.getServerPort()
				+ req.getContextPath() + "/paypal/return?guid=" + guid);
		payment.setRedirectUrls(redirectUrls);

		Payment createdPayment = null;
		// Create a payment by posting to the APIService
		// using a valid AccessToken
		// The return object contains the status;
		try {
			createdPayment = payment.create(apiContext);
			System.out.println("Created payment with id = "
					+ createdPayment.getId() + " and status = "
					+ createdPayment.getState());
			// ###Payment Approval Url
			Iterator<Links> links = createdPayment.getLinks().iterator();
			while (links.hasNext()) {
				Links link = links.next();
				if (link.getRel().equalsIgnoreCase("approval_url")) {
					req.setAttribute("redirectURL", link.getHref());
				}
			}
			
			/*
			res.setHeader("Location", (String) req.getAttribute("redirectURL"));*/
			
			map.put(guid, createdPayment.getId());
			return "redirect:" + (String) req.getAttribute("redirectURL");
		} catch (PayPalRESTException e) {
			
		}

		return "";
		
	}
	
	@RequestMapping("/paypal/return")
	public String returnUrl(HttpServletRequest req, HttpServletResponse res) {
		
		Payment createdPayment = null;

		// ### Api Context
		// Pass in a `ApiContext` object to authenticate
		// the call and to send a unique request id
		// (that ensures idempotency). The SDK generates
		// a request id if you do not pass one explicitly.
		APIContext apiContext = new APIContext(PaypalConstants.clientID, PaypalConstants.clientSecret, PaypalConstants.mode);
		if (req.getParameter("PayerID") != null) {
			Payment payment = new Payment();
			if (req.getParameter("guid") != null) {
				payment.setId(map.get(req.getParameter("guid")));
			}

			PaymentExecution paymentExecution = new PaymentExecution();
			paymentExecution.setPayerId(req.getParameter("PayerID"));
			try {
				
				createdPayment = payment.execute(apiContext, paymentExecution);
				
				if(createdPayment.getPayer().getStatus() == "VERIFIED") {
					//
				} else {
					//
				}
				//ResultPrinter.addResult(req, resp, "Executed The Payment", Payment.getLastRequest(), Payment.getLastResponse(), null);
			} catch (PayPalRESTException e) {
				
				int i = 0;
				i++;
				//ResultPrinter.addResult(req, resp, "Executed The Payment", Payment.getLastRequest(), null, e.getMessage());
			}
		}
		return "forward:/"; 
		
	}
	
	
	@RequestMapping("/paypal/cancel")
	public String canceled(HttpServletRequest req, HttpServletResponse res) {
		
		return "forward:/";
				
	}
}
