package web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DashboardController {
	
	@RequestMapping(value = { "/dashboard" }, method = RequestMethod.GET)
	public ModelAndView bodyPage() {

		ModelAndView model = new ModelAndView();
		model.setViewName("dashboard");
		return model;

	}

}
