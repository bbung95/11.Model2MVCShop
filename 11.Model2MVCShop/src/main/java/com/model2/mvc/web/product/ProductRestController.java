package com.model2.mvc.web.product;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.CookieGenerator;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;

@RestController
@RequestMapping("/product/*")
public class ProductRestController {

	/// Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	// setter Method 구현 않음

	public ProductRestController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value="json/addProduct" , method = RequestMethod.POST)
	public void addProduct(@RequestBody Product product) throws Exception{
		
		System.out.println(":: Rest addProduct start....");
		
		productService.addProduct(product);
	}
	
	@RequestMapping(value="json/deleteProduct/{prodNo}", method = RequestMethod.GET)
	public void deleteProduct(@PathVariable int prodNo) throws Exception{
		
		System.out.println(":: Rest deleteProduct start....");
		
		productService.deleteProduct(prodNo);
	}
	
	@RequestMapping(value="json/getProduct/{prodNo}", method = RequestMethod.GET)
	public Product getProduct(@PathVariable int prodNo) throws Exception {
		
		System.out.println(":: Rest getProduct start....");
		
		return productService.getProduct(prodNo);
	}

	@RequestMapping(value="json/listProduct/{pageSize}/{pageUnit}/{currentPage}" , method = RequestMethod.POST)
	public Map<String, Object> listProduct(@PathVariable int pageSize, @PathVariable int pageUnit,
											@PathVariable int currentPage) throws Exception {

		System.out.println(":: Rest listProduct start....");

		Search search = new Search();
		search.setPageSize(pageSize);
		search.setPageUnit(pageUnit);
		search.setCurrentPage(currentPage);
		
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		if(search.getOrder() == null) {
			search.setOrder("reg_date");
		}

		// Business logic 수행
		return productService.getProductList(search);
	}
	
	@RequestMapping(value="json/updateProduct/{prodNo}", method=RequestMethod.POST)
	public void updateProduct(@PathVariable int prodNo,
										@RequestBody Product product) throws Exception {
		
		System.out.println(":: Rest updateProduct start....");
		
		Product returnProduct = productService.getProduct(prodNo);
		returnProduct.setProdName(product.getProdName());
		returnProduct.setPrice(product.getPrice());
		
		productService.updateProduct(returnProduct);
	}
}