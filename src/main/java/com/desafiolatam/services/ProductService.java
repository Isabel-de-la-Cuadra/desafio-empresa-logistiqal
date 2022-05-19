package com.desafiolatam.services;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.desafiolatam.models.Product;
import com.desafiolatam.repositories.ProductRepository;

@Service
public class ProductService {

	@Autowired
	ProductRepository productRepository;
	
	public Product findProductByExactName(String name){
		return productRepository.findProductByExactName(name);
	}
	
	public Product findProductByExactCode(String code){
		return productRepository.findProductByExactCode(code);
	}
	
	public Product save(@Valid Product product) {
		return productRepository.save(product);
	}
	
	public List<Product>findAll(){
		return productRepository.findAll();
	}
	
	public Product findById(Long id) {
		return productRepository.findById(id).get();
	}
	
	public void deleteById(Long id) {
		productRepository.deleteById(id);
	}
	
	public List<Product> searchProducts (String search){
		return productRepository.findProductsByExactName(search);
	}
	
	public Page<Product> getPage(Pageable pageable){
		return productRepository.findAll(pageable);
	}
	
}
