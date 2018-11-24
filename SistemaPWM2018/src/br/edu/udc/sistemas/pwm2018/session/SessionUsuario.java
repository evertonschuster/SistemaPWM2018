package br.edu.udc.sistemas.pwm2018.session;

import br.edu.udc.sistemas.pwm2018.dao.DAOUsuario;
import br.edu.udc.sistemas.pwm2018.entity.Usuario;
import br.edu.udc.sistemas.pwm2018.infra.Session;

public class SessionUsuario extends Session {

	public SessionUsuario() {
		super(DAOUsuario.class);
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
		Usuario usuario = new Usuario();
		usuario.setIdUsuario(id);
		this.remove(usuario, bCommit);
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
		Usuario usuario = new Usuario();
		usuario.setIdUsuario(id);
		return this.detail(usuario);
	}

	@Override
	public Object detail(Object obj) throws Exception {
		Object result = this.getDAOInstance().findByPrimaryKey(obj);
		this.getDAOInstance().releaseConnection();
		return result;
	}

	public Object login(Object obj) throws Exception {
		Object result = ((DAOUsuario)this.getDAOInstance()).login((Usuario)obj);
		this.getDAOInstance().releaseConnection();
		return result;
	}
}