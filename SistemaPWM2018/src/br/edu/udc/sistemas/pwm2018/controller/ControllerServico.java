package br.edu.udc.sistemas.pwm2018.controller;

import br.edu.udc.sistemas.pwm2018.infra.Controller;

public class ControllerServico extends Controller {

	public ControllerServico() throws Exception {
		super("Servico");
	}

	@Override
	public void goNew() throws Exception {
		this.nextPage = "./servico/manterServico.jsp";
	}

	@Override
	public void goFind() throws Exception{
		this.nextPage = "./servico/consultarServico.jsp";
	}

	@Override
	public void save(Object obj) throws Exception{
		request.setAttribute("msg","Servico salva com sucesso!");
		this.goNew();
	}

	@Override
	public void remove(Object obj) throws Exception{
		this.goFind();
	}

	@Override
	public void detail(Object obj) throws Exception{
		request.setAttribute("object",obj);
		this.goNew();
	}
	
	@Override
	public void find(Object obj) throws Exception{
		request.setAttribute("list",obj);
		this.goFind();
	}
}
