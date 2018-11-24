package br.edu.udc.sistemas.pwm2018.session;

import br.edu.udc.sistemas.pwm2018.dao.DAOMarca;
import br.edu.udc.sistemas.pwm2018.dao.DAOModelo;
import br.edu.udc.sistemas.pwm2018.entity.Marca;
import br.edu.udc.sistemas.pwm2018.entity.Modelo;
import br.edu.udc.sistemas.pwm2018.infra.Session;

public class SessionModelo extends Session {

	public SessionModelo() {
		super(DAOModelo.class);
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
		Modelo modelo = new Modelo();
		modelo.setIdModelo(id);
		this.remove(modelo, bCommit);
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
		
		DAOMarca daoMarca = new DAOMarca(this.getDAOInstance().getConnection());
		
		for (int i = 0; i < result.length; i++) {
			Modelo modelo = (Modelo) result[i];
			modelo.setMarca((Marca) daoMarca.findByPrimaryKey(modelo.getMarca()));
		}
		
		this.getDAOInstance().releaseConnection();
		return result;
	}

	@Override
	public Object detail(Integer id) throws Exception {
		Modelo modelo = new Modelo();
		modelo.setIdModelo(id);
		return this.detail(modelo);
	}

	@Override
	public Object detail(Object obj) throws Exception {
		Object result = this.getDAOInstance().findByPrimaryKey(obj);
		
		DAOMarca daoMarca = new DAOMarca(this.getDAOInstance().getConnection());
		Modelo modelo = (Modelo) result;
		modelo.setMarca((Marca) daoMarca.findByPrimaryKey(modelo.getMarca()));
		
		this.getDAOInstance().releaseConnection();
		return result;
	}

}