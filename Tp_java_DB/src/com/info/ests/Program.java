package com.info.ests;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


// ORM est un concept qui permet de faire passer des lignes/Tupes (d'une base de données relationnelle) vers le monde orienté objet.

//Différence entre preparedStatement et Statement et aussi la différence entre les méthodes Execute, ExecuteUpdate, ExecuteQuery

//Bibliothèques graphiques java

//TUI (Text User Interface)

//Design Pattern

//Introspection ou reflection (en anglais)

//La bibliothèque Java.lang.reflect

public class Program {

	public static void main(String[] args) {
		String query = "SELECT * FROM produits";
		try {

			Connection conx = DriverManager.getConnection("jdbc:sqlite:ventes.db");
			Statement stmnt = conx.createStatement();
			ResultSet rs = stmnt.executeQuery(query);
			
			System.out.println("Les noms des produits sont :");
			while(rs.next()) {
				System.out.println(" - "+rs.getString("nom")+" "+rs.getDouble("prix")+"DH");
			}
			
			rs.close();
			stmnt.close();
			conx.close();
		} catch (SQLException e) {
			
			System.out.println("Table inconnue dans la base de données, ou base de données inconnue");
		}
		
		
	}

}
