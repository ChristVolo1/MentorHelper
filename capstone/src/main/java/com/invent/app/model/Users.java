package com.invent.app.model;

import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;


@Entity
@Table(name="users")
public class Users {
	
	
	public Users() {
	}
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;	
	private String fname;
	private String lname;
	private String email;
	//@Column(name="pass")
	private String password;
	@Transient
	private String password2;
	private String role;
	private String image;
	private String token;
	
	@OneToOne(mappedBy = "user", cascade = CascadeType.ALL)
	private Addresses address;
	
	@OneToMany(mappedBy="user", cascade=CascadeType.ALL)
	private List<PaymentMethod> paymentMethod;
	
	@OneToMany(mappedBy="user", cascade=CascadeType.ALL)
	private Set<PhoneBook> PhoneBook;
	
	/*
	 * @OneToMany(mappedBy="user", cascade=CascadeType.ALL) private Set<Services>
	 * Services;
	 */
	
	
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPassword2() {
		return password2;
	}
	public void setPassword2(String password2) {
		this.password2 = password2;
	}
		
	
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	
	
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}

	
	public Addresses getAddress() {
		return address;
	}
	public void setAddress(Addresses address) {
		this.address = address;
	}
	public List<PaymentMethod> getPaymentMethod() {
		return paymentMethod;
	}
	public void setPaymentMethod(List<PaymentMethod> paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
	public Set<PhoneBook> getPhoneBook() {
		return PhoneBook;
	}
	public void setPhoneBook(Set<PhoneBook> phoneBook) {
		PhoneBook = phoneBook;
	}
	
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	@Override
	public String toString() {
		return "Users [id=" + id + ", fname=" + fname + ", lname=" + lname + ", email=" + email + ", password="
				+ password + ", password2=" + password2 + ", role=" + role + ", image=" + image + ", address=" + address
				+ ", paymentMethod=" + paymentMethod + ", PhoneBook=" + PhoneBook + "]";
	}
	
	
	

}
