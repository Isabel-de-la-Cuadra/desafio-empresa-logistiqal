package com.desafiolatam.models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Range;

@Entity
@Table(name="products")
public class Product {

	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	private Long id;
	
	@NotNull
	@Size(min=3, max=50, message="Acepto códigos entre 3 y 50 caracteres")
	private String code;
	
	@NotNull
	@Size(min=3, max=50, message="Acepto nombres entre 3 y 50 caracteres")
	private String name;
	
	@NotNull
	@Range(min=1, message="El precio mínimo es de $1")
	private Integer price;
	
	@NotNull
	@Range(min=0, message="La existencia mínima es de 0")
	private Integer stock;

	public Product() {
		super();
	}

	public Product(@NotNull @Size(min = 3, max = 50, message = "Acepto códigos entre 3 y 50 caracteres") String code,
			@NotNull @Size(min = 3, max = 50, message = "Acepto nombres entre 3 y 50 caracteres") String name,
			@NotNull @Range(min = 1, message = "El precio mínimo es de $1") Integer price,
			@NotNull @Range(min = 0, message = "La existencia mínima es de 0") Integer stock) {
		super();
		this.code = code;
		this.name = name;
		this.price = price;
		this.stock = stock;
	}

	public Product(Long id,
			@NotNull @Size(min = 3, max = 50, message = "Acepto códigos entre 3 y 50 caracteres") String code,
			@NotNull @Size(min = 3, max = 50, message = "Acepto nombres entre 3 y 50 caracteres") String name,
			@NotNull @Range(min = 1, message = "El precio mínimo es de $1") Integer price,
			@NotNull @Range(min = 0, message = "La existencia mínima es de 0") Integer stock) {
		super();
		this.id = id;
		this.code = code;
		this.name = name;
		this.price = price;
		this.stock = stock;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public Integer getStock() {
		return stock;
	}

	public void setStock(Integer stock) {
		this.stock = stock;
	}

}
