package com.info.ests;

import java.io.File;
import java.io.IOException;

import com.fasterxml.jackson.core.exc.StreamWriteException;
import com.fasterxml.jackson.databind.DatabindException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class TestJava {

	public static void main(String[] args) {
		
		Contact c = new Contact("Brondon", "Test@email.com");
		
		
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			mapper.writeValue(new File("Contact.json"), c);
		} catch (StreamWriteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (DatabindException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		/*
		 try {
			ObjectOutputStream stream =  new ObjectOutputStream(new FileOutputStream("C:/Users/HOUAKEU/eclipse-workspace/TP2_2/src/com/info/ests/Test.bin"));
			stream.writeObject(c);
			stream.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		*/
		
		/*
		try {
			Contact c1 = new Contact();
			ObjectInputStream streamInput = new ObjectInputStream(new FileInputStream("C:/Users/HOUAKEU/eclipse-workspace/TP2_2/src/com/info/ests/Test.bin") );
			c1 = (Contact)streamInput.readObject();
			streamInput.close();
			System.out.println(c1);
		}catch(IOException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		*/
		

	}

}
