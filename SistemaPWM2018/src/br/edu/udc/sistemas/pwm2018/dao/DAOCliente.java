package br.edu.udc.sistemas.pwm2018.dao;

import java.sql.Connection;

import br.edu.udc.sistemas.pwm2018.infra.DAO;

public class DAOCliente extends DAO {
	
	public DAOCliente() throws Exception {
		super();
	}
	
	public DAOCliente(Connection connection) {
		super(connection);
	}

}
