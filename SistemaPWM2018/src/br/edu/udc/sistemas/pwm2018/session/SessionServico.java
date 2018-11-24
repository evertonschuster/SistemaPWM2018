package br.edu.udc.sistemas.pwm2018.session;

import br.edu.udc.sistemas.pwm2018.dao.DAOServico;
import br.edu.udc.sistemas.pwm2018.entity.Servico;
import br.edu.udc.sistemas.pwm2018.infra.Session;

public class SessionServico extends Session {

	public SessionServico() {
		super(DAOServico.class);
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
		Servico servico = new Servico();
		servico.setIdServico(id);
		this.remove(servico, bCommit);
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
		Servico servico = new Servico();
		servico.setIdServico(id);
		return this.detail(servico);
	}

	@Override
	public Object detail(Object obj) throws Exception {
		Object result = this.getDAOInstance().findByPrimaryKey(obj);
		this.getDAOInstance().releaseConnection();
		return result;
	}

}