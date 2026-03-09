package com.info.ests;

public class Compteur {
	private int value=0;
	
	public Compteur() {
	
	}
	
	public synchronized void inc(){
		this.value++;
	}
	
	public int getValue() {
		return this.value;
	}
	
}
