package br.edu.udc.sistemas.pwm2018.session;

import br.edu.udc.sistemas.pwm2018.dao.DAOCliente;
import br.edu.udc.sistemas.pwm2018.dao.DAOMarca;
import br.edu.udc.sistemas.pwm2018.dao.DAOVeiculo;
import br.edu.udc.sistemas.pwm2018.entity.Cliente;
import br.edu.udc.sistemas.pwm2018.entity.Marca;
import br.edu.udc.sistemas.pwm2018.entity.Modelo;
import br.edu.udc.sistemas.pwm2018.entity.Veiculo;
import br.edu.udc.sistemas.pwm2018.infra.Session;

public class SessionVeiculo extends Session {

	public SessionVeiculo() {
		super(DAOVeiculo.class);
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
		Veiculo veiculo = new Veiculo();
		veiculo.setIdVeiculo(id);
		this.remove(veiculo, bCommit);
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
		DAOCliente daoCliente = new DAOCliente(this.getDAOInstance().getConnection());
		
		for (int i = 0; i < result.length; i++) {
			Veiculo veiculo = (Veiculo) result[i];
			veiculo.setModelo((Modelo) daoMarca.findByPrimaryKey(veiculo.getModelo()));
			veiculo.setCliente((Cliente) daoCliente.findByPrimaryKey(veiculo.getCliente()));
		}
		
		this.getDAOInstance().releaseConnection();
		return result;
	}

	@Override
	public Object detail(Integer id) throws Exception {
		Veiculo veiculo = new Veiculo();
		veiculo.setIdVeiculo(id);
		return this.detail(veiculo);
	}

	@Override
	public Object detail(Object obj) throws Exception {
		Object result = this.getDAOInstance().findByPrimaryKey(obj);
		
		DAOMarca daoMarca = new DAOMarca(this.getDAOInstance().getConnection());
		DAOCliente daoCliente = new DAOCliente(this.getDAOInstance().getConnection());
		
		Veiculo veiculo = (Veiculo) result;
		veiculo.setModelo((Modelo) daoMarca.findByPrimaryKey(veiculo.getModelo()));
		veiculo.setCliente((Cliente) daoCliente.findByPrimaryKey(veiculo.getCliente()));
		
		this.getDAOInstance().releaseConnection();
		return result;
	}

}