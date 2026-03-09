package com.info.ests;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.reflect.Parameter;


public class Test_introspection {
	public static void main(String[] args) {
		Class <?> cl = OperationCommerciale.class;
		int i=1;
		for(Field f : cl.getDeclaredFields()){
			int Modif = f.getModifiers();
			StringBuffer bf =  new StringBuffer();
			if(Modifier.isPublic(Modif)) {
				bf.append("public ");
			}
			if(Modifier.isPrivate(Modif)) {
				bf.append("private ");
			}
			if(Modifier.isProtected(Modif)) {
				bf.append("protected ");
			}
			if(Modifier.isTransient(Modif)) {
				bf.append("transient ");
			}
			if(Modifier.isStatic(Modif)) {
				bf.append("static ");
			}
			
			System.out.println(bf+f.getType().getSimpleName()+" "+f.getName());
		}
		
		for(Method M : cl.getDeclaredMethods()) {
			int Modif = M.getModifiers();
			StringBuffer bf =  new StringBuffer();
			if(Modifier.isPublic(Modif)) {
				bf.append("public ");
			}
			if(Modifier.isPrivate(Modif)) {
				bf.append("private ");
			}
			if(Modifier.isProtected(Modif)) {
				bf.append("protected ");
			}
			if(Modifier.isTransient(Modif)) {
				bf.append("transient ");
			}
			if(Modifier.isStatic(Modif)) {
				bf.append("static ");
			}
			
			System.out.print(bf+M.getReturnType().getSimpleName()+" "+M.getName());
			System.out.print("(");
			for(Parameter p : M.getParameters()) {
				if(M.getParameterCount() > 2) {
					if(i==M.getParameterCount()) {
						System.out.print(p.getType().getSimpleName()+" "+p.getName());
					} 
					else {
						System.out.print(p.getType().getSimpleName()+" "+p.getName()+", ");
						i++;
					}
						
					
				}else {
					System.out.print(p.getType().getSimpleName()+" "+p.getName());
				}
			}
			System.out.println(")");
		}
	}
	
}
