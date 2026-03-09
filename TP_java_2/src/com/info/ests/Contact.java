package com.info.ests;

public class Contact {
	private String nom;
	private String email;
	
	public Contact(String nom, String email) {
		super();
		this.nom = nom;
		this.email = email;
	}
	
	public Contact() {
		
		this.nom = "";
		this.email = "";
	}
	
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	@Override
	public String toString() {
		return "Contact [nom=" + nom + ", email=" + email + "]";
	}
	
}
