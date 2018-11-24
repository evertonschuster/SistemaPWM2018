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
@Table(name="funcionario")
public class Funcionario  {
	
	@Id
	@GeneratedValue
	@Column(name="idfuncionario",type=DataType.INTEGER)
	protected Integer idfuncionario;
	
	@Column(name="nome",type=DataType.STRING)
	private String nome;
	
	@Column(name="RG",type=DataType.STRING)
	private String RG;
	
	@Column(name="CPF",type=DataType.STRING)
	private String CPF;
	
	@Column(name="Email",type=DataType.STRING)
	private String Email;

	@Column(name="Salario",type=DataType.FLOAT)
	private Float Salario;
	
	public Integer getIdFuncionario() {
		return idfuncionario;
	}


	public void setIdFuncionario(Integer idfuncionario) {
		this.idfuncionario = idfuncionario;
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
	
	public Float getSalario() {
		return Salario;
	}


	public void setSalario(Float salario) {
		Salario = salario;
	}

	public boolean equals(Object obj) {
		if (obj == null) {
			return false;
		}

		
		System.out.println(this.toString() + " [==] " + obj.toString());
		if(!(obj instanceof Funcionario)) {
			System.out.println("Safado");
			return false;
		}
		
		Funcionario funcionario = (Funcionario) obj;
		if ((funcionario.getIdFuncionario() != null) && (this.idfuncionario == funcionario.getIdFuncionario())) {
			return true;
		}

		return false;
	}


	public String toString() {		
		return IOTools.geradorDeToString( new String[]{idfuncionario.toString(),nome, CPF},
				new Integer[]{3,12,14});
	}
	

}
