package com.neuedu.pojo;

import org.springframework.stereotype.Component;

@Component
public class I5 implements Cpu{
	public void method(){
		System.out.println("i5调用计算");
	}
}
