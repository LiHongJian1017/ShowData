package com.neuedu.test;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.neuedu.dao.StudentDao;
import com.neuedu.dao.WeatherDao;
import com.neuedu.pojo.I3;
import com.neuedu.pojo.I5;
import com.neuedu.pojo.I7;
import com.neuedu.pojo.MainBoard;
import com.neuedu.pojo.MainBoardFactory;
import com.neuedu.pojo.Student;
import com.neuedu.pojo.Weather;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:applicationContext.xml")
public class MyTest {
	@Resource
	private WeatherDao dao;
	
	@Test
	public void handler(){
		
		System.out.println(dao.getWeathers());
	}
	
	public static void main(String[] args) {
		/*ApplicationContext context=new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
		MainBoard mainBoard=(MainBoard) context.getBean("mainboard");
		mainBoard.method();*/
		
	   /*MainBoard mainBoard=	MainBoardFactory.getInstance();
	   mainBoard.method();*/
	}
}
