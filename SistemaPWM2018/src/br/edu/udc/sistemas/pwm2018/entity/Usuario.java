package br.edu.udc.sistemas.pwm2018.entity;

import br.edu.udc.sistemas.pwm2018.infra.annotation.Column;
import br.edu.udc.sistemas.pwm2018.infra.annotation.DataType;
import br.edu.udc.sistemas.pwm2018.infra.annotation.Entity;
import br.edu.udc.sistemas.pwm2018.infra.annotation.GeneratedValue;
import br.edu.udc.sistemas.pwm2018.infra.annotation.Id;
import br.edu.udc.sistemas.pwm2018.infra.annotation.Table;

@Entity
@Table(name="usuario")
public class Usuario {
	
	@Id
	@GeneratedValue
	@Column(name="idusuario",type=DataType.INTEGER)
	private Integer idUsuario;
	
	@Column(name="nome",type=DataType.STRING,orderBy=true)
	private String nome;
	
	@Column(name="email",type=DataType.STRING)
	private String email;
	
	@Column(name="senha",type=DataType.STRING)
	private String senha;
	
	@Column(name="perfil",type=DataType.STRING)
	private String perfil;
	
	//Nome*, Email*, Senha*, Confirmar Senha* e Perfil (Consulta ou Administrador);


	@Override
	public boolean equals(Object obj) {
		if (obj != null) {
			if (obj instanceof Usuario) {
				Usuario usuario = (Usuario) obj;
				if (usuario.getIdUsuario() == this.idUsuario) {
					return true;
				}
			}
		}
		return false;
	}

	public Integer getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(Integer idUsuario) {
		this.idUsuario = idUsuario;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public String getPerfil() {
		return perfil;
	}

	public void setPerfil(String perfil) {
		this.perfil = perfil;
	}

	@Override
	public String toString() {
		return this.idUsuario + " - " + this.nome ;
	}
}
