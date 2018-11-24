package br.edu.udc.sistemas.pwm2018.dao;

import java.sql.Connection;

import br.edu.udc.sistemas.pwm2018.infra.DAO;

public class DAOOS extends DAO {

	public DAOOS() throws Exception {
		super();
	}

	public DAOOS(Connection connection) {
		super(connection);
	}
}