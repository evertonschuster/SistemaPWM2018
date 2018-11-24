package br.edu.udc.sistemas.pwm2018.dao;

import java.sql.Connection;

import br.edu.udc.sistemas.pwm2018.infra.DAO;

public class DAOModelo extends DAO {

	public DAOModelo() throws Exception {
		super();
	}

	public DAOModelo(Connection connection) {
		super(connection);
	}
}