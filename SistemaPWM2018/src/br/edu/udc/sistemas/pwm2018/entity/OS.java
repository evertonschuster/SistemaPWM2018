package br.edu.udc.sistemas.pwm2018.entity;

import java.util.Date;

import br.edu.udc.sistemas.pwm2018.infra.annotation.Column;
import br.edu.udc.sistemas.pwm2018.infra.annotation.DataType;
import br.edu.udc.sistemas.pwm2018.infra.annotation.Entity;
import br.edu.udc.sistemas.pwm2018.infra.annotation.GeneratedValue;
import br.edu.udc.sistemas.pwm2018.infra.annotation.Id;
import br.edu.udc.sistemas.pwm2018.infra.annotation.Table;

@Entity
@Table(name="os")
public class OS {

	@Id
	@GeneratedValue
	@Column(name="idos",type=DataType.INTEGER)
	private Integer idOS;
	
	@Column(name="idVeiculo",type=DataType.OBJECT)
	private Veiculo veiculo;
	
	@Column(name="idServico",type=DataType.OBJECT)
	private Servico servico;
	
	@Column(name="idFuncionario",type=DataType.OBJECT)
	private Funcionario funcionario;
	
	@Column(name="quantidade",type=DataType.INTEGER)
	private Integer quantidade;
	
	@Column(name="valor",type=DataType.FLOAT)
	private Float valor;
	
	@Column(name="dataIncusao",type=DataType.DATE)
	private Date data;
	
	@Column(name="valorTotal",type=DataType.FLOAT)
	private Float valorTotal;
	
	@Column(name="Status",type=DataType.STRING)
	private String Status;

	public OS() {
		this.Status = null;
		this.veiculo = null;
	}

	
	public Integer getIdOS() {
		return idOS;
	}


	public void setIdOS(Integer idOS) {
		this.idOS = idOS;
	}


	public Veiculo getVeiculo() {
		return veiculo;
	}


	public void setVeiculo(Veiculo veiculo) {
		this.veiculo = veiculo;
	}


	public Servico getServico() {
		return servico;
	}


	public void setServico(Servico servico) {
		this.servico = servico;
	}


	public Funcionario getFuncionario() {
		return funcionario;
	}


	public void setFuncionario(Funcionario funcionario) {
		this.funcionario = funcionario;
	}


	public Integer getQuantidade() {
		return quantidade;
	}


	public void setQuantidade(Integer quantidade) {
		this.quantidade = quantidade;
	}


	public Float getValor() {
		return valor;
	}


	public void setValor(Float valor) {
		this.valor = valor;
	}


	public Date getData() {
		return data;
	}


	public void setData(Date data) {
		this.data = data;
	}


	public Float getValorTotal() {
		return valorTotal;
	}


	public void setValorTotal(Float valorTotal) {
		this.valorTotal = valorTotal;
	}


	public String getStatus() {
		return Status;
	}


	public void setStatus(String status) {
		Status = status;
	}


	@Override
	public boolean equals(Object obj) {
		if (obj != null) {
			OS os = (OS) obj;
			if (os.getIdOS() == this.idOS) {
				return true;
			}
		}
		return false;
	}
	
	@Override
	public String toString() {
		return this.idOS + " - " + this.Status  ;
	}

}
