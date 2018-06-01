package web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.util.JSONPObject;

import web.data.model.Field;

@Controller
@RequestMapping(value = "/search")
public class SearchController extends AbstractController {

	@RequestMapping(method = RequestMethod.GET, value = "/initial")
	public ModelAndView listSearch() throws InterruptedException {
		ModelAndView model = new ModelAndView();
		Field field = new Field();
		model.addObject("field", field);
		model.setViewName("listsearch");
		return model;
	}

	@RequestMapping(value = { "/searchResults" }, method = RequestMethod.POST)
	public ModelAndView saveAccountInfo(@ModelAttribute("field") Field field, BindingResult result,
			ModelMap model) {

		RestTemplate restTemplate = new RestTemplate();
		String url = "https://en.wikipedia.org/w/api.php?action=query&prop=extracts&titles=Ganesha&explaintext=true&format=json";
		JSONPObject json = restTemplate.getForObject(url, JSONPObject.class);
		

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("list", json);
		modelAndView.setViewName("searchresults");
		return modelAndView;
	}

}
