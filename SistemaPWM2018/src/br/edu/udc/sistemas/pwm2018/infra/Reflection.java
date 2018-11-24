package br.edu.udc.sistemas.pwm2018.infra;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Collection;
import java.util.Vector;

import br.edu.udc.sistemas.pwm2018.infra.annotation.Column;
import br.edu.udc.sistemas.pwm2018.infra.annotation.Entity;
import br.edu.udc.sistemas.pwm2018.infra.annotation.Id;
import br.edu.udc.sistemas.pwm2018.infra.annotation.Table;
import br.edu.udc.sistemas.pwm2018.infra.annotation.Transient;

public class Reflection {

	/**
	 * Método que valida se uma classe possui as anotações para ser considerada entidade
	 * @param c
	 * @throws Exception
	 */
	private static void validate(Class<?> c) throws Exception {
		if (!c.isAnnotationPresent(Entity.class)) {
			throw new Exception("Missing @Entity");
		}
		if (!c.isAnnotationPresent(Table.class)) {
			throw new Exception("Missing @Table");
		}
	}
	
	/**
	 * Método que devolve o nome da tabela de uma classe
	 * @param c
	 * @return
	 * @throws Exception
	 */
	public static String getTableName(Class <?> c) throws Exception {
		validate(c);
		Table table = c.getAnnotation(Table.class);
		return table.name();
	}
	
	/**
	 * Método que retorna o campo que possui o @Id da um classe
	 * @param c
	 * @return
	 * @throws Exception
	 */
	public static Field getIdField(Class<?> c) throws Exception {
		validate(c);
		Field fieldList[] = c.getDeclaredFields();
		for (int i = 0; i < fieldList.length; i++) {
			Field field = fieldList[i];
			if ((field.isAnnotationPresent(Id.class)) &&
				(field.isAnnotationPresent(Column.class))) {
				return field;
			}
		}
		throw new Exception("Id Field not found.");
	}
	
	/**
	 * Método que devolve o conteúdo do atributo que possui @Id no objeto
	 * @param obj
	 * @return
	 * @throws Exception
	 */	
	public static Object getIdFieldValue(Object obj) throws Exception {
		return getFieldValue(getIdField(obj.getClass()), obj);		
	}

	/**
	 * Método que seta o conteúdo do atributo que possui @Id no objeto
	 * @param obj
	 * @param value
	 * @throws Exception
	 */
	public static void setIdFieldValue(Object obj,Object value) throws Exception {
		setFieldValue(getIdField(obj.getClass()), obj, value);
	}
	
	/**
	 * Método que devolve o valor de um campo de um objeto
	 * @param field
	 * @param obj
	 * @return
	 * @throws Exception
	 */
	public static Object getFieldValue(Field field,Object obj) throws Exception {
		Class <?> c = obj.getClass();
		Method methodList[] = c.getDeclaredMethods();
		for (int i = 0; i < methodList.length; i++) {
			if (methodList[i].getName().equalsIgnoreCase("get" + field.getName())) {
				return methodList[i].invoke(obj, new Object[0]); 
			}
		}
		System.out.println("=== getFieldValue " + field.getName() + "===");
		throw new Exception("===Method get not found: " + field.getName());
	}
	
	/**
	 * Método que devolve os campos de um objeto
	 * podem ser todos ou somente os que não são transientes
	 * @param c
	 * @param bTransient (true = todos)
	 * @return
	 * @throws Exception
	 */
	public static Field[] getFields(Class<?> c, boolean bTransient) throws Exception {
		validate(c);
		Field fieldList[] = c.getDeclaredFields();
		Collection <Field> result = new Vector <Field> ();
		for (int i = 0; i < fieldList.length; i++) {
			Field field = fieldList[i];
			if ((field.isAnnotationPresent(Column.class)) &&
				((bTransient) || (!field.isAnnotationPresent(Transient.class))) ) {
				result.add(field);
			}
		}
		return (Field[]) result.toArray(new Field[result.size()]);
	}
	
	/**
	 * Método seta em um determinado campo de um determinado objeto um determinado valor 
	 * @param field
	 * @param obj
	 * @param value
	 * @throws Exception
	 */
	public static void setFieldValue(Field field,Object obj,Object value) throws Exception {
		Class <?> c = obj.getClass();
		Method methodList[] = c.getDeclaredMethods();
		boolean bOk = false;
		for (int i = 0; i < methodList.length; i++) {
			if (methodList[i].getName().toUpperCase().equals("SET" + field.getName().toUpperCase())) {
				methodList[i].invoke(obj, value);
				bOk = true;
				break;
			}
		}
		if (!bOk) {
			throw new Exception("Method set not found");
		}
	}


}
