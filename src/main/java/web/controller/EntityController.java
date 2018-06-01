package web.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import web.data.EntityContactRepository;
import web.data.EntityInfoRepository;
import web.data.UserRepository;
import web.data.UserRoleRepository;
import web.data.model.EntityContact;
import web.data.model.EntityInfo;
import web.data.model.User;
import web.data.model.UserRole;
import web.util.USER_ROLE;

@Controller
public class EntityController {

	@Autowired
	private HttpSession httpSession;
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private UserRoleRepository userRoleRepository;

	@Autowired 
	private EntityInfoRepository entityInfoRepository;
	
	@Autowired 
	private EntityContactRepository entityContactRepository;
	
	@RequestMapping(value = { "/entity**" }, method = RequestMethod.GET)
	public ModelAndView entity(Model model, HttpServletRequest request) {
		Principal principal = request.getUserPrincipal();
		String userName = principal.getName();
		List<User> users = userRepository.findByUserName(userName);
		if(users != null && !users.isEmpty())
		{
			User user = users.get(0);
			EntityInfo entityInfo = entityInfoRepository.findOne(user.getId());
			EntityContact entityContact = entityContactRepository.findOne(user.getId());
			if(entityInfo == null){
				entityInfo = new EntityInfo(user.getId());
			}
			if(entityContact == null){
				entityContact = new EntityContact(user.getId());
			}
			ModelAndView modelAndView = new ModelAndView("entity");
			modelAndView.addObject("entityInfo", entityInfo);
			modelAndView.addObject("entityContact", entityContact);
			
			return modelAndView;
		}
		return new ModelAndView("error");
		
	}

	@RequestMapping(value = { "/saveAccountInfo" }, method = RequestMethod.POST)
	public @ResponseBody EntityInfo saveAccountInfo(@ModelAttribute("entityInfo") EntityInfo entityInfo,
			BindingResult result, ModelMap model) {

		entityInfoRepository.save(entityInfo);

		model.addAttribute("msg", "Saved... ");

		return entityInfo;
	}
	
	@RequestMapping(value = { "/saveAccountContact" }, method = RequestMethod.POST)
	public @ResponseBody EntityContact saveAccountContact(@ModelAttribute("entityContact") EntityContact entityContact,
			BindingResult result, ModelMap model) {

		entityContactRepository.save(entityContact);

		model.addAttribute("msg", "Saved... ");

		return entityContact;
	}
	
	@RequestMapping(value = "/registration", method = RequestMethod.GET)
	public ModelAndView registration() {
		return new ModelAndView("registration", "user", new User());
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public ModelAndView register(@ModelAttribute("user") User user, BindingResult result, ModelMap model) {
		
		user.setEnabled(true);
		userRepository.save(user);
		
		//User Role addition
		String roleName = user.getAdminFlag() ? USER_ROLE.ROLE_ADMIN.name() : USER_ROLE.ROLE_USER.name();
		UserRole userRole = new UserRole(user.getUserName(), roleName);
		userRoleRepository.save(userRole);
		
		model.addAttribute("msg", "You have been registered!, Please login ");
		
		return new ModelAndView("redirect:/home", model);
	}

}
