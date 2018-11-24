package br.edu.udc.sistemas.pwm2018.controller;

import br.edu.udc.sistemas.pwm2018.entity.Funcionario;
import br.edu.udc.sistemas.pwm2018.entity.Servico;
import br.edu.udc.sistemas.pwm2018.entity.Veiculo;
import br.edu.udc.sistemas.pwm2018.infra.Controller;
import br.edu.udc.sistemas.pwm2018.session.SessionFuncionario;
import br.edu.udc.sistemas.pwm2018.session.SessionServico;
import br.edu.udc.sistemas.pwm2018.session.SessionVeiculo;

public class ControllerOS extends Controller {

	public ControllerOS() throws Exception {
		super("OS");
	}

	private void loadVeiculo() throws Exception {
		SessionVeiculo sessionVeiculo = new SessionVeiculo();
		Object listVeiculo[] = sessionVeiculo.find(new Veiculo());
		this.request.setAttribute("listVeiculo",listVeiculo);
		
		SessionServico sessionServico = new SessionServico();
		Object listServico[] = sessionServico.find(new Servico());
		this.request.setAttribute("listServico",listServico);		
		
		SessionFuncionario sessionFuncionario = new SessionFuncionario();
		Object listFuncionario[] = sessionFuncionario.find(new Funcionario());
		this.request.setAttribute("listFuncionario",listFuncionario);		
	}
	
	@Override
	public void goNew() throws Exception {
		this.loadVeiculo();
		this.nextPage = "./os/manterOS.jsp";
	}

	@Override
	public void goFind() throws Exception {
		this.loadVeiculo();
		this.nextPage = "./os/consultarOS.jsp";
	}

	@Override
	public void save(Object obj) throws Exception{
		this.request.setAttribute("msg","OS salvo com sucesso!");
		this.goNew();
	}

	@Override
	public void remove(Object obj) throws Exception{
		this.goFind();
	}

	@Override
	public void detail(Object obj) throws Exception{
		this.request.setAttribute("object",obj);
		this.goNew();
	}
	
	@Override
	public void find(Object obj) throws Exception{
		this.request.setAttribute("list",obj);
		this.goFind();
	}
}
