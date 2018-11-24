package br.edu.udc.sistemas.pwm2018.main;

import br.edu.udc.sistemas.pwm2018.entity.Marca;
import br.edu.udc.sistemas.pwm2018.infra.Query;

public class Main {

	
	public static void main(String[] args) throws Exception {
		Marca marca = new Marca();

		marca.setIdMarca(10);
		marca.setDescricao("FORD");
		
		System.out.println(Query.getSQLInsert(marca));
		System.out.println(Query.getSQLUpdate(marca));
		System.out.println(Query.getSQLDelete(marca));
		System.out.println(Query.getSQLSelect(marca));
	}
}
