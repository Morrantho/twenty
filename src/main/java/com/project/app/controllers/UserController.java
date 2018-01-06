package com.project.app.controllers;

import java.security.Principal;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.app.services.UserService;
import com.project.app.models.User;

@Controller
public class UserController{
	private UserService userService;

	public UserController(UserService userService){
		this.userService=userService;
	}
	
	@RequestMapping("")
	public String index(Model model){
		model.addAttribute("users",userService.all());
		return "index";
	}	

	@PostMapping("/users")
	@ResponseBody
	public User create(@RequestParam("username") String username){
		User user = new User();
		user.setUsername(username);
		userService.create(user);
		return user;
	}

	@PostMapping("/users/{id}/update")
	@ResponseBody
	public User update(@RequestParam("id") long id,@RequestParam("answers") int answers,@RequestParam("restarts") int restarts){
		User user = userService.findById(id);
		user.setCreatedAt(new Date());
		user.setAnswers(answers);
		user.setRestarts(restarts);
		userService.update(user);
		return user;
	}

	@PostMapping("/users/{id}/destroy")
	@ResponseBody
	public long destroy(@RequestParam("id") long id){
		userService.destroy(id);
		return id;
	}
}
