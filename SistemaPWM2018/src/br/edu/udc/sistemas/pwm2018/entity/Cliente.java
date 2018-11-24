package br.edu.udc.sistemas.pwm2018.entity;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import br.edu.udc.sistemas.pwm2018.infra.IOTools;
import br.edu.udc.sistemas.pwm2018.infra.MyObject;
import br.edu.udc.sistemas.pwm2018.infra.annotation.Column;
import br.edu.udc.sistemas.pwm2018.infra.annotation.DataType;
import br.edu.udc.sistemas.pwm2018.infra.annotation.Entity;
import br.edu.udc.sistemas.pwm2018.infra.annotation.GeneratedValue;
import br.edu.udc.sistemas.pwm2018.infra.annotation.Id;
import br.edu.udc.sistemas.pwm2018.infra.annotation.Table;
@Entity
@Table(name="cliente")
public class Cliente  {
	
	@Id
	@GeneratedValue
	@Column(name="idcliente",type=DataType.INTEGER)
	protected Integer idcliente;
	
	@Column(name="nome",type=DataType.STRING)
	private String nome;
	
	@Column(name="RG",type=DataType.STRING)
	private String RG;
	
	@Column(name="CPF",type=DataType.STRING)
	private String CPF;
	
	@Column(name="Email",type=DataType.STRING)
	private String Email;
	
	public Integer getIdCliente() {
		return idcliente;
	}


	public void setIdCliente(Integer idcliente) {
		this.idcliente = idcliente;
	}


	public String getNome() {
		return nome;
	}


	public void setNome(String nome) {
		this.nome = nome;
	}


	public String getRG() {
		return RG;
	}


	public void setRG(String rG) {
		RG = rG;
	}


	public String getCPF() {
		return CPF;
	}


	public void setCPF(String cPF) {
		CPF = cPF;
	}


	public String getEmail() {
		return Email;
	}


	public void setEmail(String email) {
		Email = email;
	}

	public boolean equals(Object obj) {
		if (obj == null) {
			return false;
		}

		
		System.out.println(this.toString() + " [==] " + obj.toString());
		if(!(obj instanceof Cliente)) {
			System.out.println("Safado");
			return false;
		}
		
		Cliente cliente = (Cliente) obj;
		if ((cliente.getIdCliente() != null) && (this.idcliente == cliente.getIdCliente())) {
			return true;
		}

		return false;
	}


	public String toString() {		
		return IOTools.geradorDeToString( new String[]{idcliente.toString(),nome, CPF},
				new Integer[]{3,12,14});
	}
	

}
