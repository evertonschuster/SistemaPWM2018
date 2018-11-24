package br.edu.udc.sistemas.pwm2018.dao;

import java.sql.Connection;

import br.edu.udc.sistemas.pwm2018.infra.DAO;

public class DAOFuncionario extends DAO {
	
	public DAOFuncionario() throws Exception {
		super();
	}
	
	public DAOFuncionario(Connection connection) {
		super(connection);
	}

}