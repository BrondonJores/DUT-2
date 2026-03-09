package com.info.ests;

import java.awt.GridBagLayout;
import java.awt.GridLayout;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;

public class Program {
	public static void main(String[] args) {
		JFrame frame = new JFrame("Fomulaire de connexion");
		frame.setSize(400, 150);
		
		JLabel nom_label = new JLabel("Nom :");
		JLabel email_label = new JLabel("Email :");
		JLabel temp = new JLabel();
		JLabel temp2 = new JLabel();
		JLabel temp3 = new JLabel();
		JTextField nom_field = new JTextField();
		JTextField email_field = new JTextField();
		JButton valider = new JButton("Valider");
		
		JPanel panel = new JPanel();
		panel.setLayout(new GridLayout(4,2));
		panel.add(nom_label);
		panel.add(nom_field);
		panel.add(email_label);
		panel.add(email_field);
		panel.add(temp2);
		panel.add(temp3);
		panel.add(temp);
		panel.add(valider);
		frame.getContentPane().add(panel);
		frame.setVisible(true);
	}
}
