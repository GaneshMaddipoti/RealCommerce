package web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import web.data.UserRepository;
import web.data.model.User;

@RestController
public class EntityRestController {
	
	@Autowired 
	private UserRepository userRepository;

	@GetMapping(path = "/add") 
	public @ResponseBody String addNewUser(@RequestParam String name, @RequestParam String password) {
		User n = new User();
		n.setUserName(name);
		n.setPassword(password);
		userRepository.save(n);
		return "Saved";
	}

	@GetMapping(path = "/all")
	public @ResponseBody Iterable<User> getAllUsers() {
		return userRepository.findAll();
	}


}