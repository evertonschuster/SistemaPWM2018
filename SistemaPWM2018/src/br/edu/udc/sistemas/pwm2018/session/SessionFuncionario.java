package br.edu.udc.sistemas.pwm2018.session;

import br.edu.udc.sistemas.pwm2018.dao.DAOFuncionario;
import br.edu.udc.sistemas.pwm2018.entity.Funcionario;
import br.edu.udc.sistemas.pwm2018.infra.Session;

public class SessionFuncionario extends Session {

	public SessionFuncionario() {
		super(DAOFuncionario.class);
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
		Funcionario Funcionario = new Funcionario();
		Funcionario.setIdFuncionario(id);
		this.remove(Funcionario, bCommit);
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
		Funcionario Funcionario = new Funcionario();
		Funcionario.setIdFuncionario(id);
		return this.detail(Funcionario);
	}

	@Override
	public Object detail(Object obj) throws Exception {
		Object result = this.getDAOInstance().findByPrimaryKey(obj);
		this.getDAOInstance().releaseConnection();
		return result;
	}

}