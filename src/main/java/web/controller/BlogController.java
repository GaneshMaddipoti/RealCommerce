package web.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import web.data.BlogRepository;
import web.data.model.Blog;
import web.data.model.Field;
import web.util.FieldUtil;

@Controller
@RequestMapping(value="/blog")
public class BlogController extends AbstractController{
	
	@Autowired 
	private BlogRepository blogRepository;
	
	@RequestMapping(method = RequestMethod.GET, value = "/listblog")
	public ModelAndView listBlog() throws InterruptedException {
		ModelAndView model = new ModelAndView();
		
		Map<String, List<Blog>> resultMap = new HashMap<String, List<Blog>>();
		
		for(Blog blog : blogRepository.findAll()){
			if(resultMap.get(blog.getCategory())  == null){
				List<Blog> blogs = new ArrayList<Blog>();
				blogs.add(blog);
				resultMap.put(blog.getCategory(), blogs);
			}else{
				List<Blog> blogs = resultMap.get(blog.getCategory());
				blogs.add(blog);
			}
		}		
		
		model.addObject("resultMap", resultMap);
		model.setViewName("listblog");
		return model;
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/addblog")
	public ModelAndView addBlog() throws NoSuchMethodException, SecurityException, InstantiationException,
			IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		ModelAndView model = new ModelAndView();
		model.addObject("blogEntry", new Blog());
		model.setViewName("addblog");
		return model;
	}
	
	@RequestMapping(value = "/blogdetails/{id}", method = RequestMethod.GET)
	public ModelAndView blogDetails(@PathVariable Integer id)
			throws JsonParseException, JsonMappingException, IOException {
		Blog blog = blogRepository.findOne(id);
		List<Field> fields = getMapper().readValue(blog.getDetails(), new TypeReference<List<Field>>() {
		});
		for (Field field : fields) {
			field.setFieldValue(field.getFieldValue().replaceAll("\r\n", "<br/>"));
		}
		blog.setFields(fields);
		return new ModelAndView("viewblog", "blog", blog);
	}
	
	@RequestMapping(value = "/modifyblog/{id}", method = RequestMethod.GET)
	public ModelAndView projectdetail(@PathVariable Integer id)
			throws JsonParseException, JsonMappingException, IOException {
		Blog blog = blogRepository.findOne(id);
		List<Field> fields = getMapper().readValue(blog.getDetails(), new TypeReference<List<Field>>() {
		});
		blog.setFields(fields);
		return new ModelAndView("addblog", "blogEntry", blog);
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/saveblog")
	public ModelAndView saveBlog(@ModelAttribute Blog t, BindingResult result, ModelMap modelMap)
			throws JsonParseException, JsonMappingException, IOException, InterruptedException {
		String jsonStr = getMapper().writeValueAsString(t);
		Blog blog = getMapper().readValue(jsonStr, Blog.class);
		blog.setDetails(getMapper().writeValueAsString(FieldUtil.filterFields(blog.getFields())));
		
		blogRepository.save(blog);
		return listBlog(); 
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/deleteblog")
	public ModelAndView deleteBlog(@ModelAttribute("id") Integer id) {
		blogRepository.delete(id);
		ModelAndView model = new ModelAndView();
		model.addObject("list", blogRepository.findAll());
		model.setViewName("listblog");
		return model;
	}

}
