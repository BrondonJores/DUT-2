package com.info.ests;

public class TestJava {

	public static void main(String[] args) {
		Compteur c = new Compteur();
		Task task = new Task(c);
		Thread t1 = new Thread(task, "t1");
		Thread t2 = new Thread(task, "t2");
		t1.start();
		t2.start();
		try {
			t1.join();
			t2.join();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
		System.out.print("Valeur du compteur :"+c.getValue());
		
	}

}
