package com.project.simeee.dto;

public class MapDTO {
	private int no;
	private int x;
	private int y;
	
	@Override
	public String toString() {
		return "MapDTO [no=" + no + ", x=" + x + ", y=" + y + "]";
	}
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getX() {
		return x;
	}
	public void setX(int x) {
		this.x = x;
	}
	public int getY() {
		return y;
	}
	public void setY(int y) {
		this.y = y;
	}

	
}
