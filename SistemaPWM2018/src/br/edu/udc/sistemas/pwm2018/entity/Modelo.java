package br.edu.udc.sistemas.pwm2018.entity;

import br.edu.udc.sistemas.pwm2018.infra.annotation.Column;
import br.edu.udc.sistemas.pwm2018.infra.annotation.DataType;
import br.edu.udc.sistemas.pwm2018.infra.annotation.Entity;
import br.edu.udc.sistemas.pwm2018.infra.annotation.GeneratedValue;
import br.edu.udc.sistemas.pwm2018.infra.annotation.Id;
import br.edu.udc.sistemas.pwm2018.infra.annotation.Table;

@Entity
@Table(name="modelo")
public class Modelo {

	@Id
	@GeneratedValue
	@Column(name="idmodelo",type=DataType.INTEGER)
	private Integer idModelo;
	
	@Column(name="descricao",type=DataType.STRING,orderBy=true)
	private String descricao;
	
	@Column(name="idmarca",type=DataType.OBJECT)
	private Marca marca;

	public Modelo() {
		this.descricao = null;
		this.marca = null;
	}

	public Integer getIdModelo() {
		return idModelo;
	}

	public void setIdModelo(Integer idModelo) {
		this.idModelo = idModelo;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getDescricao() {
		return this.descricao;
	}

	public void setMarca(Marca marca) {
		this.marca = marca;
	}

	public Marca getMarca() {
		return this.marca;
	}

	@Override
	public boolean equals(Object obj) {
		if (obj != null) {
			Modelo modelo = (Modelo) obj;
			if (modelo.getIdModelo() == this.idModelo) {
				return true;
			}
		}
		return false;
	}
	
	@Override
	public String toString() {
		return this.idModelo + " - " + this.descricao + " - " + marca.getDescricao();
	}

}
