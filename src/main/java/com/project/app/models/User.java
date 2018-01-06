package com.project.app.models;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Transient;
import javax.validation.constraints.Size;

import org.hibernate.annotations.Type;
import org.hibernate.validator.constraints.Email;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.beans.factory.annotation.Value;

@Entity
public class User{
	@Id
	@GeneratedValue
	private long id;

	@Size(min=1,max=255,message="Username must be between 1-255 characters.")
	private String username;
	public void setUsername(String username){this.username=username;}
	public String getUsername(){return username;}

	@Value("${0}")
	private int answers;
	public void setAnswers(int answers){this.answers=answers;}
	public int getAnswers(){return answers;}

	@Value("${0}")
	private int restarts;
	public void setRestarts(int restarts){this.restarts=restarts;}
	public int getRestarts(){return restarts;}

	@DateTimeFormat(pattern="MM:dd:yyyy HH:mm:ss")
	@Value("${0}")
	private Date createdAt;
	
	@DateTimeFormat(pattern="MM:dd:yyyy HH:mm:ss")
	@Value("${0}")
	private Date updatedAt;

	@PrePersist
	public void onCreate(){this.createdAt = new Date();}
	@PreUpdate
	public void onUpdate(){this.updatedAt = new Date();}
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	public User(){
		this.createdAt = new Date();
		this.updatedAt = new Date();
	}
}
