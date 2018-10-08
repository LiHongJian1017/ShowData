package com.neuedu.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.neuedu.pojo.Weather;
import com.neuedu.service.weather.IweatherService;

@Controller
public class WeatherController {
	@Resource
	IweatherService weatherService;
	
	@RequestMapping("/getWeather.do")
	@ResponseBody
	public String getWeather(ModelMap map){
		List<Weather> weather= weatherService.getWeathers();
		//map.addAttribute("weather", weather);
		return JSONObject.toJSONString(weather);
	}
}
