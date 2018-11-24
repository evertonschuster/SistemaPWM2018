package br.edu.udc.sistemas.pwm2018.controller;

import br.edu.udc.sistemas.pwm2018.infra.Controller;

public class ControllerUsuario extends Controller {

	public ControllerUsuario() throws Exception {
		super("Usuario");
	}

	@Override
	public void goNew() throws Exception {
		this.nextPage = "./usuario/manterUsuario.jsp";
	}

	@Override
	public void goFind() throws Exception{
		this.nextPage = "./usuario/consultarUsuario.jsp";
	}

	@Override
	public void save(Object obj) throws Exception{
		request.setAttribute("msg","Usuario salva com sucesso!");
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
	
	public void login(Object obj) throws Exception{
		
		if(obj == null) {
			this.nextPage = "index.jsp";
			this.request.setAttribute("msg", "Usuario/Senha invalido");
		}else {
			this.nextPage = "menu.jsp";
		}
		this.request.getSession().setAttribute("login", obj);
	}
}
