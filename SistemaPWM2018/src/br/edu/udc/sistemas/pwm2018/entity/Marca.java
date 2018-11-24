package br.edu.udc.sistemas.pwm2018.entity;

import br.edu.udc.sistemas.pwm2018.infra.annotation.Column;
import br.edu.udc.sistemas.pwm2018.infra.annotation.DataType;
import br.edu.udc.sistemas.pwm2018.infra.annotation.Entity;
import br.edu.udc.sistemas.pwm2018.infra.annotation.GeneratedValue;
import br.edu.udc.sistemas.pwm2018.infra.annotation.Id;
import br.edu.udc.sistemas.pwm2018.infra.annotation.Table;

@Entity
@Table(name="marca")
public class Marca {
	
	@Id
	@GeneratedValue
	@Column(name="idmarca",type=DataType.INTEGER)
	private Integer idMarca;
	
	@Column(name="descricao",type=DataType.STRING,orderBy=true)
	private String descricao;

	public Marca() {
		this.descricao = null;
	}

	public Integer getIdMarca() {
		return idMarca;
	}

	public void setIdMarca(Integer idMarca) {
		this.idMarca = idMarca;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getDescricao() {
		return this.descricao;
	}

	@Override
	public boolean equals(Object obj) {
		if (obj != null) {
			if (obj instanceof Marca) {
				Marca marca = (Marca) obj;
				if (marca.getIdMarca() == this.idMarca) {
					return true;
				}
			}
		}
		return false;
	}

	@Override
	public String toString() {
		return this.idMarca + " - " + this.descricao;
	}
}
