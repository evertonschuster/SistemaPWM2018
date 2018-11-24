package br.edu.udc.sistemas.pwm2018.main;

import br.edu.udc.sistemas.pwm2018.infra.annotation.Table;

public class TesteReflexao {

	public void testeReflexao(Object obj,String name, Object value) throws Exception {
		
		Class <?> c = obj.getClass();
		
		System.out.println(c.getCanonicalName());
		
//		Field listFields[] = c.getDeclaredFields();
//		for (int i = 0; i < listFields.length; i++) {
//			if (listFields[i].getName().equals(name)) {
//				listFields[i].setAccessible(true);
//				listFields[i].set(obj,value);
//			}
//		}

//		Method listMethods[] = c.getMethods();
//		for (int i = 0; i < listMethods.length; i++) {
//			if (listMethods[i].getName().equalsIgnoreCase("set" + name)) {
//				listMethods[i].invoke(obj, value);
//			}
//		}

		Table t = c.getAnnotation(Table.class);
		System.out.println(t.name());
	}
	
}
