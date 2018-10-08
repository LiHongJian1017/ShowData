package com.neuedu.pojo;

public class MainBoardFactory {
	public static MainBoard getInstance(){
		I3 i3=new I3();
		I5 i5=new I5();
		MainBoard mainBoard=new MainBoard();
		mainBoard.setCpu(i5);
		return mainBoard;
	}
}
