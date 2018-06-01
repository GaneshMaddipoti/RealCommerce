package web.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;

import web.data.ProductRepository;
import web.data.model.Field;
import web.data.model.Product;
import web.service.ProductService;
import web.util.FieldUtil;

@Controller
@RequestMapping(value = "/product")
public class ProductController extends AbstractController {

	@Autowired
	private ProductService productService;
	
	@Autowired
	private ProductRepository productRepository;

	@RequestMapping(method = RequestMethod.GET, value = "/listproduct")
	public ModelAndView listProduct() throws InterruptedException {
		ModelAndView model = new ModelAndView();
		
		model.addObject("resultMap", productService.listProducts());
		model.setViewName("listproduct");
		return model;
	}

	@RequestMapping(method = RequestMethod.GET, value = "/addproduct")
	public ModelAndView addProduct() throws NoSuchMethodException, SecurityException, InstantiationException,
			IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		ModelAndView model = new ModelAndView();
		model.addObject("product", new Product());
		model.setViewName("addproduct");
		return model;
	}

	@RequestMapping(value = "/productdetails/{id}", method = RequestMethod.GET)
	public ModelAndView productDetails(@PathVariable Integer id)
			throws JsonParseException, JsonMappingException, IOException {
		Product product = productRepository.findOne(id);
		List<Field> fields = getMapper().readValue(product.getDetails(), new TypeReference<List<Field>>() {
		});
		for (Field field : fields) {
			field.setFieldValue(field.getFieldValue().replaceAll("\r\n", "<br/>"));
		}
		product.setFields(fields);
		return new ModelAndView("viewproduct", "product", product);
	}

	@RequestMapping(value = "/modifyproduct/{id}", method = RequestMethod.GET)
	public ModelAndView productdetail(@PathVariable Integer id)
			throws JsonParseException, JsonMappingException, IOException {
		Product product = productRepository.findOne(id);
		List<Field> fields = getMapper().readValue(product.getDetails(), new TypeReference<List<Field>>() {
		});
		product.setFields(fields);
		return new ModelAndView("addproduct", "product", product);
	}

	@RequestMapping(method = RequestMethod.POST, value = "/saveproduct")
	public ModelAndView saveProduct(@ModelAttribute Product t, BindingResult result, ModelMap modelMap)
			throws JsonParseException, JsonMappingException, IOException, InterruptedException {
		String jsonStr = getMapper().writeValueAsString(t);
		Product product = getMapper().readValue(jsonStr, Product.class);
		product.setDetails(getMapper().writeValueAsString(FieldUtil.filterFields(product.getFields())));

		productRepository.save(product);
		return listProduct();
	}

	@RequestMapping(method = RequestMethod.POST, value = "/deleteproduct")
	public ModelAndView deleteProduct(@ModelAttribute("id") Integer id) {
		productRepository.delete(id);
		ModelAndView model = new ModelAndView();
		model.addObject("list", productRepository.findAll());
		model.setViewName("listproduct");
		return model;
	}

}
