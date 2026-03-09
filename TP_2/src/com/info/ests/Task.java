package com.info.ests;

public class Task implements Runnable{
	private Compteur compteur;
	
	public Task(Compteur compteur) {
		super();
		this.compteur = compteur;
	}
	
	@Override
	public void run() {
		for (int i=0; i<100; i++ ) {
			compteur.inc();
			try {
				Thread.sleep(100);
			}catch(InterruptedException e) {
				e.printStackTrace();
			}
		}	
	}
	
}
