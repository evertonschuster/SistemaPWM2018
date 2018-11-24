package br.edu.udc.sistemas.pwm2018.session;

import br.edu.udc.sistemas.pwm2018.dao.DAOFuncionario;
import br.edu.udc.sistemas.pwm2018.dao.DAOMarca;
import br.edu.udc.sistemas.pwm2018.dao.DAOOS;
import br.edu.udc.sistemas.pwm2018.dao.DAOServico;
import br.edu.udc.sistemas.pwm2018.dao.DAOVeiculo;
import br.edu.udc.sistemas.pwm2018.entity.Funcionario;
import br.edu.udc.sistemas.pwm2018.entity.Marca;
import br.edu.udc.sistemas.pwm2018.entity.OS;
import br.edu.udc.sistemas.pwm2018.entity.Servico;
import br.edu.udc.sistemas.pwm2018.entity.Veiculo;
import br.edu.udc.sistemas.pwm2018.infra.Session;

public class SessionOS extends Session {

	public SessionOS() {
		super(DAOOS.class);
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
		OS os = new OS();
		os.setIdOS(id);
		this.remove(os, bCommit);
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
		
		DAOVeiculo daoVeiculo = new DAOVeiculo(this.getDAOInstance().getConnection());
		DAOServico daoServico = new DAOServico(this.getDAOInstance().getConnection());
		DAOFuncionario daoFuncionario = new DAOFuncionario(this.getDAOInstance().getConnection());
		
		
		for (int i = 0; i < result.length; i++) {
			OS os = (OS) result[i];
			os.setVeiculo((Veiculo) daoVeiculo.findByPrimaryKey(os.getVeiculo()));
			
			os.setServico((Servico) daoServico.findByPrimaryKey(os.getServico()));
	
			os.setFuncionario((Funcionario) daoFuncionario.findByPrimaryKey(os.getFuncionario()));
		}
		
		this.getDAOInstance().releaseConnection();
		return result;
	}

	@Override
	public Object detail(Integer id) throws Exception {
		OS os = new OS();
		os.setIdOS(id);
		return this.detail(os);
	}

	@Override
	public Object detail(Object obj) throws Exception {
		Object result = this.getDAOInstance().findByPrimaryKey(obj);
		OS os = (OS) result;
		
		DAOVeiculo daoVeiculo = new DAOVeiculo(this.getDAOInstance().getConnection());
		DAOServico daoServico = new DAOServico(this.getDAOInstance().getConnection());
		DAOFuncionario daoFuncionario = new DAOFuncionario(this.getDAOInstance().getConnection());

		os.setVeiculo((Veiculo) daoVeiculo.findByPrimaryKey(os.getVeiculo()));
		os.setServico((Servico) daoServico.findByPrimaryKey(os.getServico()));
		os.setFuncionario((Funcionario) daoFuncionario.findByPrimaryKey(os.getFuncionario()));
		
		this.getDAOInstance().releaseConnection();
		return result;
	}

}