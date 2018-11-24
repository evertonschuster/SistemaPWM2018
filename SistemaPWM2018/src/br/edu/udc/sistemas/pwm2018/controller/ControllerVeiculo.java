package br.edu.udc.sistemas.pwm2018.controller;

import br.edu.udc.sistemas.pwm2018.entity.Cliente;
import br.edu.udc.sistemas.pwm2018.entity.Marca;
import br.edu.udc.sistemas.pwm2018.entity.Modelo;
import br.edu.udc.sistemas.pwm2018.infra.Controller;
import br.edu.udc.sistemas.pwm2018.session.SessionCliente;
import br.edu.udc.sistemas.pwm2018.session.SessionMarca;
import br.edu.udc.sistemas.pwm2018.session.SessionModelo;

public class ControllerVeiculo extends Controller {

	public ControllerVeiculo() throws Exception {
		super("Veiculo");
	}

	private void loadModelo() throws Exception {
		SessionModelo sessionModelo = new SessionModelo();
		Object listModelo[] = sessionModelo.find(new Modelo());
		this.request.setAttribute("listModelo",listModelo);	
		
		SessionCliente sessionCliente = new SessionCliente();
		Object listCliente[] = sessionCliente.find(new Cliente());
		this.request.setAttribute("listCliente", listCliente);
		
	}
	
	@Override
	public void goNew() throws Exception {
		this.loadModelo();
		this.nextPage = "./veiculo/manterVeiculo.jsp";
	}

	@Override
	public void goFind() throws Exception {
		this.loadModelo();
		this.nextPage = "./veiculo/consultarVeiculo.jsp";
	}

	@Override
	public void save(Object obj) throws Exception{
		this.request.setAttribute("msg","Veiculo salvo com sucesso!");
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
