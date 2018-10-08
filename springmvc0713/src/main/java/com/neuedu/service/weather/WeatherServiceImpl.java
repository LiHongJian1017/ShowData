package com.neuedu.service.weather;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.neuedu.dao.WeatherDao;
import com.neuedu.pojo.Weather;

@Service
public class WeatherServiceImpl implements IweatherService {

	@Resource
	WeatherDao weatherDao;

	public List<Weather> getWeathers() {
		// TODO Auto-generated method stub
		return weatherDao.getWeathers();
	}

}
