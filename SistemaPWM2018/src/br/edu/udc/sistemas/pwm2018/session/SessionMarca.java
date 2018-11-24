package br.edu.udc.sistemas.pwm2018.session;

import br.edu.udc.sistemas.pwm2018.dao.DAOMarca;
import br.edu.udc.sistemas.pwm2018.entity.Marca;
import br.edu.udc.sistemas.pwm2018.infra.Session;

public class SessionMarca extends Session {

	public SessionMarca() {
		super(DAOMarca.class);
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
		Marca marca = new Marca();
		marca.setIdMarca(id);
		this.remove(marca, bCommit);
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
		Marca marca = new Marca();
		marca.setIdMarca(id);
		return this.detail(marca);
	}

	@Override
	public Object detail(Object obj) throws Exception {
		Object result = this.getDAOInstance().findByPrimaryKey(obj);
		this.getDAOInstance().releaseConnection();
		return result;
	}

}