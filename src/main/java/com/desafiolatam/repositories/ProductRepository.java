package com.desafiolatam.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.desafiolatam.models.Product;

public interface ProductRepository extends JpaRepository<Product, Long>, PagingAndSortingRepository<Product, Long>{
	
	@Query(value="SELECT * FROM EmpresaLogistiqal.products elp WHERE elp.name = ?1", nativeQuery=true)
	List<Product> findProductsByExactName(String name);
	
	@Query(value="SELECT * FROM EmpresaLogistiqal.products elp WHERE elp.name = ?1", nativeQuery=true)
	Product findProductByExactName(String name);
	
	@Query(value="SELECT * FROM EmpresaLogistiqal.products elp WHERE elp.code = ?1", nativeQuery=true)
	Product findProductByExactCode(String code);
	
}
