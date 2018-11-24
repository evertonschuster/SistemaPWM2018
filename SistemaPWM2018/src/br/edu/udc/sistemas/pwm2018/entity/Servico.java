package br.edu.udc.sistemas.pwm2018.entity;

import br.edu.udc.sistemas.pwm2018.infra.annotation.Column;
import br.edu.udc.sistemas.pwm2018.infra.annotation.DataType;
import br.edu.udc.sistemas.pwm2018.infra.annotation.Entity;
import br.edu.udc.sistemas.pwm2018.infra.annotation.GeneratedValue;
import br.edu.udc.sistemas.pwm2018.infra.annotation.Id;
import br.edu.udc.sistemas.pwm2018.infra.annotation.Table;

@Entity
@Table(name="servico")
public class Servico {
	
	@Id
	@GeneratedValue
	@Column(name="idservico",type=DataType.INTEGER)
	private Integer idServico;
	
	@Column(name="descricao",type=DataType.STRING,orderBy=true)
	private String descricao;

	@Column(name="valor",type=DataType.FLOAT)
	private Float valor;
	
	public Servico() {
		this.descricao = null;
	}

	public Integer getIdServico() {
		return idServico;
	}

	public void setIdServico(Integer idServico) {
		this.idServico = idServico;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getDescricao() {
		return this.descricao;
	}
	
	public Float getValor() {
		return valor;
	}

	public void setValor(Float valor) {
		this.valor = valor;
	}

	@Override
	public boolean equals(Object obj) {
		if (obj != null) {
			if (obj instanceof Servico) {
				Servico servico = (Servico) obj;
				if (servico.getIdServico() == this.idServico) {
					return true;
				}
			}
		}
		return false;
	}

	@Override
	public String toString() {
		return this.idServico + " - " + this.descricao;
	}
}
