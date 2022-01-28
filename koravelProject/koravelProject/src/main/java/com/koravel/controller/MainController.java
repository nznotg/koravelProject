package com.koravel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("main")
public class MainController {

	@RequestMapping("{step}.do")
	public String viewPage(@PathVariable String step) {
		return "/main/" + step;
	}
	
	@RequestMapping("tip.do")
	public String tip() {
		return "main/tip";
	}

}
