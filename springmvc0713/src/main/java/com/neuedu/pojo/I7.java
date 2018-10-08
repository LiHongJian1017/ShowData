package com.neuedu.pojo;

import org.springframework.stereotype.Component;

@Component
public class I7 implements Cpu {
	public void method(){
		System.out.println("i7调用计算");
	}
}
