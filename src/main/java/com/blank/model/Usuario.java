package com.blank.model;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import java.util.Set;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

@Entity
@Table(name = "usuario", schema = "public")
public class Usuario implements Serializable, UserDetails {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1935209665550903080L;

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id", updatable = false)
    private Integer id;

	@Column(name="usuario")
    private String usuario;
	
	@Column(name="senha")
    private String senha;
	
	@DateTimeFormat(pattern = "dd/MM/yyyy HH:mm:ss")
	@Column(name = "ultimo_login")
	@Temporal(TemporalType.TIMESTAMP)
    private Date lastLogin;
	
	@Column
	private Integer attempts;
	
	@Column
	private Boolean bloqueado;
	
	@Transient
	private String confirmacaoSenha;
	
	@Transient
	private Set<Integer> perfisTemp;
	
	@Transient
	private Set<Integer> filiaisTemp;
	
	@Transient
	private boolean enabled;
	@Transient
	private boolean accountNonExpired;
	@Transient
	private boolean credentialsNonExpired;
	@Transient
	private boolean accountNonLocked;
	@Transient
	private Collection<GrantedAuthority> authorities;
	
    public Usuario() { }

    public Usuario(Integer id) {
		this.id = id;
	}
    
	public Usuario(Integer id, String usuario, String senha, boolean enabled,
			boolean accountNonExpired, boolean credentialsNonExpired,
			boolean accountNonLocked, Collection<GrantedAuthority> authorities) {
		this.id = id;
		this.usuario = usuario;
		this.senha = senha;
		this.enabled = enabled;
		this.accountNonExpired = accountNonExpired;
		this.credentialsNonExpired = credentialsNonExpired;
		this.accountNonLocked = accountNonLocked;
		this.authorities = authorities;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	@Override
	public Collection<GrantedAuthority> getAuthorities() {
		return authorities;
	}

	@Override
	public String getPassword() {
		return senha;
	}

	@Override
	public String getUsername() {
		return usuario;
	}

	@Override
	public boolean isAccountNonExpired() {
		return accountNonExpired;
	}

	@Override
	public boolean isAccountNonLocked() {
		return accountNonLocked;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return credentialsNonExpired;
	}

	@Override
	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public void setAccountNonExpired(boolean accountNonExpired) {
		this.accountNonExpired = accountNonExpired;
	}

	public void setCredentialsNonExpired(boolean credentialsNonExpired) {
		this.credentialsNonExpired = credentialsNonExpired;
	}

	public void setAccountNonLocked(boolean accountNonLocked) {
		this.accountNonLocked = accountNonLocked;
	}

	public void setAuthorities(Collection<GrantedAuthority> authorities) {
		this.authorities = authorities;
	}

	public String getConfirmacaoSenha() {
		return confirmacaoSenha;
	}

	public void setConfirmacaoSenha(String confirmacaoSenha) {
		this.confirmacaoSenha = confirmacaoSenha;
	}

	public Set<Integer> getPerfisTemp() {
		return perfisTemp;
	}

	public void setPerfisTemp(Set<Integer> perfisTemp) {
		this.perfisTemp = perfisTemp;
	}

	public Set<Integer> getFiliaisTemp() {
		return filiaisTemp;
	}

	public void setFiliaisTemp(Set<Integer> filiaisTemp) {
		this.filiaisTemp = filiaisTemp;
	}

	public Integer getAttempts() {
		return attempts;
	}

	public void setAttempts(Integer attempts) {
		this.attempts = attempts;
	}

	public Boolean getBloqueado() {
		return bloqueado;
	}

	public void setBloqueado(Boolean bloqueado) {
		this.bloqueado = bloqueado;
	}

	public Date getLastLogin() {
		return lastLogin;
	}

	public void setLastLogin(Date lastLogin) {
		this.lastLogin = lastLogin;
	}

}
