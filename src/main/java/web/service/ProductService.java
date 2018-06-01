package web.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.data.ProductRepository;
import web.data.model.Product;

@Service
public class ProductService {
	
	@Autowired
	private ProductRepository productRepository;
	
	public Map<String, List<Product>>  listProducts() {
		Map<String, List<Product>> resultMap = new HashMap<String, List<Product>>();             //electronics        smartphone, watch
																								 //fur

		for (Product product : productRepository.findAll()) {
			if (resultMap.get(product.getCategory()) == null) {
				List<Product> products = new ArrayList<Product>();
				products.add(product);
				resultMap.put(product.getCategory(), products);
			} else {
				List<Product> products = resultMap.get(product.getCategory());
				products.add(product);
			}
		}
		return resultMap;
	}

}
