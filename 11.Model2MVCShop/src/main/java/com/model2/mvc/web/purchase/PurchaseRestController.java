package com.model2.mvc.web.purchase;


import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.purchase.PurchaseService;

@RestController
@RequestMapping("/purchase/*")
public class PurchaseRestController {

	/// Field
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	// setter Method 구현 않음

	public PurchaseRestController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value="json/getPurchase/{tranNo}" , method = RequestMethod.GET)
	public Purchase getPurchase(@PathVariable int tranNo) throws Exception {
		
		System.out.println(":: Rest getPurchase start....");
		
		return purchaseService.getPurchase(tranNo);
	}
	
	@RequestMapping(value="json/listPurchase/{buyerId}", method=RequestMethod.POST)
	public Map<String, Object> listPurchase(@PathVariable String buyerId,
										@RequestBody Search search) throws Exception{
		
		System.out.println(":: Rest listPurchase start....");
		
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		
		return purchaseService.getPurchaseList(search, buyerId);
	}
	
	@RequestMapping(value="json/listSale", method=RequestMethod.POST)
	public Map<String, Object> listSale(@RequestBody Search search) throws Exception{
		
		System.out.println(":: Rest listSale start....");
		
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		
		return purchaseService.getSaleList(search);
	}
	
	@RequestMapping(value="json/updateTranCodeByProd/{prodNo}/{tranCode}" , method=RequestMethod.GET)
	public String updateTranCodeByProd(@PathVariable int prodNo, @PathVariable String tranCode) throws Exception {
		
		System.out.println(":: Rest updateTranCodeByProd start....");
		
		Map<String, Object> map = new HashMap<String , Object>();
		map.put("prodNo", prodNo);
		map.put("tranCode", tranCode);		
		purchaseService.updateTranCode(map);
		
		return tranCode;
	}
	
	@RequestMapping(value="json/updateTranCode/{tranNo}/{tranCode}" , method=RequestMethod.GET)
	public String updateTranCode(@PathVariable int tranNo, @PathVariable String tranCode) throws Exception {
		
		System.out.println(":: Rest updateTranCode start....");
		
		Map<String, Object> map = new HashMap<String , Object>();
		map.put("tranNo", tranNo);
		map.put("tranCode", tranCode);		
		purchaseService.updateTranCode(map);
		
		return tranCode;
	}
	
}