package br.edu.udc.sistemas.pwm2018.session;

import br.edu.udc.sistemas.pwm2018.dao.DAOCliente;
import br.edu.udc.sistemas.pwm2018.entity.Cliente;
import br.edu.udc.sistemas.pwm2018.infra.Session;

public class SessionCliente extends Session {

	public SessionCliente() {
		super(DAOCliente.class);
	}

	@Override
	public void save(Object obj, Boolean bCommit) throws Exception {
		this.getDAOInstance().save(obj);
		if (bCommit) {
			this.getDAOInstance().commit();
		}
	}

	@Override
	public void remove(Integer id, Boolean bCommit) throws Exception {
		Cliente Cliente = new Cliente();
		Cliente.setIdCliente(id);
		this.remove(Cliente, bCommit);
	}

	@Override
	public void remove(Object obj, Boolean bCommit) throws Exception {
		this.getDAOInstance().remove(obj);
		if (bCommit) {
			this.getDAOInstance().commit();
		}
	}

	@Override
	public Object[] find(Object obj) throws Exception {
		Object result[] = this.getDAOInstance().find(obj);
		this.getDAOInstance().releaseConnection();
		return result;
	}

	@Override
	public Object detail(Integer id) throws Exception {
		Cliente Cliente = new Cliente();
		Cliente.setIdCliente(id);
		return this.detail(Cliente);
	}

	@Override
	public Object detail(Object obj) throws Exception {
		Object result = this.getDAOInstance().findByPrimaryKey(obj);
		this.getDAOInstance().releaseConnection();
		return result;
	}

}