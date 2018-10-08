package com.neuedu.pojo;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MainBoard {
	@Resource
	private Cpu cpu;

	
	public Cpu getCpu() {
		return cpu;
	}


	public void setCpu(Cpu cpu) {
		this.cpu = cpu;
	}


	public void method(){
		cpu.method();
	}
}
