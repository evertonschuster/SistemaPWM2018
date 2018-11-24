package br.edu.udc.sistemas.pwm2018.dao;

import java.sql.Connection;
import br.edu.udc.sistemas.pwm2018.infra.DAO;

public class DAOVeiculo extends DAO {

	public DAOVeiculo() throws Exception {
		super();
	}

	public DAOVeiculo(Connection connection) {
		super(connection);
	}
}