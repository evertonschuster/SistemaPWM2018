package br.edu.udc.sistemas.pwm2018.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import br.edu.udc.sistemas.pwm2018.entity.Usuario;
import br.edu.udc.sistemas.pwm2018.infra.DAO;
import br.edu.udc.sistemas.pwm2018.infra.Factory;
import br.edu.udc.sistemas.pwm2018.infra.Query;
import br.edu.udc.sistemas.pwm2018.infra.Reflection;


public class DAOUsuario extends DAO {

	public DAOUsuario() throws Exception {
		super();
	}

	public DAOUsuario(Connection connection) {
		super(connection);
	}

	public Usuario login(Usuario usuario) throws Exception {
		Statement stmt = null;
		ResultSet rst = null;
		String sql = "Select * FROM usuario WHERE nome= '" + usuario.getNome() + "' and senha = '"+usuario.getSenha()+ "'";
		try {
			stmt = this.connection.createStatement();			
			System.out.println(sql);
			rst = stmt.executeQuery(sql);
			
			Object[] usuarioFind = Factory.createByResultSet(rst, usuario.getClass());
			
			if(usuarioFind.length == 1) {
				return (Usuario) usuarioFind[0];
			}else {
				return null;
			}

		} finally {
			if (stmt != null) {
				try {
					stmt.close();
				} catch (Exception e2) {
				}
			}
		}
	}

}
