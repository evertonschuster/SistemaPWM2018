package br.edu.udc.sistemas.pwm2018.controller;

import br.edu.udc.sistemas.pwm2018.entity.Marca;
import br.edu.udc.sistemas.pwm2018.infra.Controller;
import br.edu.udc.sistemas.pwm2018.session.SessionMarca;

public class ControllerModelo extends Controller {

	public ControllerModelo() throws Exception {
		super("Modelo");
	}

	private void loadMarca() throws Exception {
		SessionMarca sessionMarca = new SessionMarca();
		Object listMarca[] = sessionMarca.find(new Marca());
		this.request.setAttribute("listMarca",listMarca);		
	}
	
	@Override
	public void goNew() throws Exception {
		this.loadMarca();
		this.nextPage = "./modelo/manterModelo.jsp";
	}

	@Override
	public void goFind() throws Exception {
		this.loadMarca();
		this.nextPage = "./modelo/consultarModelo.jsp";
	}

	@Override
	public void save(Object obj) throws Exception{
		this.request.setAttribute("msg","Modelo salvo com sucesso!");
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
