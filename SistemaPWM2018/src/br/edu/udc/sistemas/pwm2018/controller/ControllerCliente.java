package br.edu.udc.sistemas.pwm2018.controller;

import br.edu.udc.sistemas.pwm2018.infra.Controller;

public class ControllerCliente extends Controller {

	public ControllerCliente() throws Exception {
		super("Cliente");
	}

	@Override
	public void goNew() throws Exception {
		this.nextPage = "./cliente/manterCliente.jsp";
	}

	@Override
	public void goFind() throws Exception{
		this.nextPage = "./cliente/consultarCliente.jsp";
	}

	@Override
	public void save(Object obj) throws Exception{
		request.setAttribute("msg","Cliente salva com sucesso!");
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
