package br.edu.udc.sistemas.pwm2018.entity;

import br.edu.udc.sistemas.pwm2018.infra.annotation.Column;
import br.edu.udc.sistemas.pwm2018.infra.annotation.DataType;
import br.edu.udc.sistemas.pwm2018.infra.annotation.Entity;
import br.edu.udc.sistemas.pwm2018.infra.annotation.GeneratedValue;
import br.edu.udc.sistemas.pwm2018.infra.annotation.Id;
import br.edu.udc.sistemas.pwm2018.infra.annotation.Table;

@Entity
@Table(name="veiculo")
public class Veiculo {

	@Id
	@GeneratedValue
	@Column(name="idveiculo",type=DataType.INTEGER)
	private Integer idVeiculo;
	
	@Column(name="nome",type=DataType.STRING,orderBy=true)
	private String nome;

	@Column(name="placa",type=DataType.STRING)
	private String placa;
	
	@Column(name="chassis",type=DataType.STRING)
	private String chassis;

	@Column(name="idCliente",type=DataType.OBJECT)
	private Cliente cliente;
	
	@Column(name="idModelo",type=DataType.OBJECT)
	private Modelo modelo;

	public Veiculo() {
		this.nome = null;
		this.modelo = null;
	}

	public Integer getIdVeiculo() {
		return idVeiculo;
	}

	public void setIdVeiculo(Integer idVeiculo) {
		this.idVeiculo = idVeiculo;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getNome() {
		return this.nome;
	}

	public String getPlaca() {
		return placa;
	}

	public void setPlaca(String placa) {
		this.placa = placa;
	}

	public String getChassis() {
		return chassis;
	}

	public void setChassis(String chassis) {
		this.chassis = chassis;
	}	
	
	
	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}
	
	public void setModelo(Modelo modelo) {
		this.modelo = modelo;
	}

	public Modelo getModelo() {
		return this.modelo;
	}

	@Override
	public boolean equals(Object obj) {
		if (obj != null) {
			Veiculo veiculo = (Veiculo) obj;
			if (veiculo.getIdVeiculo() == this.idVeiculo) {
				return true;
			}
		}
		return false;
	}
	
	@Override
	public String toString() {
		return this.idVeiculo + " - " + this.nome + " - " + modelo.getDescricao();
	}

}
