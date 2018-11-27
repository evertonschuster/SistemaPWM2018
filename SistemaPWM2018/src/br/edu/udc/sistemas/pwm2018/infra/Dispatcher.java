package br.edu.udc.sistemas.pwm2018.infra;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;

import br.edu.udc.sistemas.pwm2018.controller.ControllerUsuario;

@WebServlet("/dispatcher")
public class Dispatcher extends HttpServlet {

	private static final long serialVersionUID = 1L;
    
    public Dispatcher() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Object login = request.getSession().getAttribute("login");
			String action = request.getParameter("newAction"); //&& login != null && login != ""
			String entityName = request.getParameter("entityName");
			
			//verefica se possui usuario logado
			if(((login != null) || action.equals("login")) && !action.equals("logout")) {
			
				if ((action != null) && (!action.trim().equals("")) &&
					(entityName != null) && (!entityName.trim().equals("")) ) {
					
					System.out.println("=== Controller: " + entityName + "===");
					Class <?> controllerClass = Class.forName("br.edu.udc.sistemas.pwm2018.controller.Controller" + entityName);
					Controller controller = (Controller) controllerClass.getConstructor().newInstance();
					String nextPage = controller.execute(request,action);
	
					String oldAction = (String)request.getSession().getAttribute("action");
					String oldEntityName = (String) request.getSession().getAttribute("entityName");
					if(!nextPage.equals("index.jsp") && oldAction != null && oldEntityName != null ) {
						request.getSession().setAttribute("action",null);
						request.getSession().setAttribute("entityName",null);
						
						controllerClass = Class.forName("br.edu.udc.sistemas.pwm2018.controller.Controller" + oldEntityName);
						controller = (Controller) controllerClass.getConstructor().newInstance();
						nextPage = controller.execute(request,oldAction);
		
					}
					
					RequestDispatcher page = request.getRequestDispatcher(nextPage);  
					page.forward(request, response);
					
				} else {
					throw new Exception("Acesso negado!");
				}
			//precisa enviar para tela de login
			}else {
				HttpServletRequestWrapper wrapper = new HttpServletRequestWrapper(request);
				request.getSession().setAttribute("wrapper",wrapper);
				
				request.getSession().setAttribute("action",action);
				request.getSession().setAttribute("entityName",entityName);
				RequestDispatcher page = request.getRequestDispatcher("index.jsp"); 
				
				page.forward(request, response);

			}
		} catch(Exception e) {
			request.setAttribute("exception",e);
			RequestDispatcher page = request.getRequestDispatcher("error.jsp");
			page.forward(request, response);
		}
	}
}
