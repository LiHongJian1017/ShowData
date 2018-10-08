package com.neuedu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TController {
	@RequestMapping("/add.do")
	public String add(ModelMap map){
		return "add";
	}
	@RequestMapping("/index.do")
	public String index(ModelMap map){
		return "index";
	}
	@RequestMapping("/videoandarticle.do")
	public String video(ModelMap map){
		return "videoandarticle";
	}
	@RequestMapping("/city.do")
	public String city(ModelMap map){
		return "city";
	}
    @RequestMapping("/traffic.do")
    public String traffic(ModelMap map){
        return "traffic";
    }
}
