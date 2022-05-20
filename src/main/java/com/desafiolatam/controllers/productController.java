package com.desafiolatam.controllers;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.desafiolatam.models.Product;
import com.desafiolatam.services.ProductService;

@Controller
@RequestMapping("/product")
public class productController {

	@Autowired
	ProductService productService;
	
	@RequestMapping("") //http://localhost:9080/product
	public String showEntry(@ModelAttribute("product") Product product) {
		return "/product.jsp";
	}
	
	@PostMapping("")
	public String register(@Valid @ModelAttribute("product") Product product, BindingResult result,
			Model model, RedirectAttributes redirectAttributes) {
		if(!result.hasErrors()) {
			Product validationName = productService.findProductByExactName(product.getName());
			Product validationCode = productService.findProductByExactCode(product.getCode());
			
			if(validationName == null && validationCode == null ) {
				productService.save(product);
				redirectAttributes.addFlashAttribute("msgOK", "Creé el producto");
				return "redirect:/product";
			}else {
				redirectAttributes.addFlashAttribute("msgError", "El producto ya existe, no puedo volver a crearlo");
				return "redirect:/product";
			}
		}else {
			redirectAttributes.addFlashAttribute("msgError", "No puedo crear el producto, porque faltan datos");
			return "redirect:/product";
		}
	}
	
	@RequestMapping("/list") //http://localhost:9080/product/list
	public String showListProducts(@ModelAttribute("product") Product product, Model model,
		Pageable pageable, @RequestParam Map<String, Object> params) {
				
		//Condicional "corto" if - else para validar que no es null y qué hacer en caso de que sea verdadero (?) y qué hacer en caso contrario (:)
		int page = params.get("page") != null ? (Integer.valueOf(params.get("page").toString()) -1) : 0;
		//indica cuántas páginas tendrá y cuántos registros por página tendrá, en este caso, 3
		PageRequest pageRequest = PageRequest.of(page, 3);
		//instancia y llamada al productService, pasándole las páginas y la cantidad de registros
		Page<Product> pages = productService.getPage(pageRequest);
		//Pasar información al jsp	
		model.addAttribute("number", pages.getNumber());
		model.addAttribute("totalPages", pages.getTotalPages());
		model.addAttribute("totalElements", pages.getTotalElements());
		model.addAttribute("size", pages.getSize());
		model.addAttribute("listProducts", pages.getContent());
		return "/listProducts.jsp";
	}
		
	@RequestMapping("/delete/{id}") //http://localhost:9080/product/delete/{id}
	public String deleteProduct(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
		productService.deleteById(id);
		redirectAttributes.addFlashAttribute("msgOk", "Eliminé el producto");
		return "redirect:/product/list";
	}
	
	@RequestMapping("/edit/{id}") //http://localhost:9080/product/edit/{id}
	public String editProduct(@PathVariable("id") Long id, Model model) {
		Product product = productService.findById(id);
		model.addAttribute("product", product);
		return "/editProduct.jsp";
	}
	
	@PostMapping("/update")
	public String updateProduct(@Valid @ModelAttribute("product") Product product, BindingResult result,
			Model model, RedirectAttributes redirectAttributes) {
		if(!result.hasErrors()) {
				productService.save(product);
				redirectAttributes.addFlashAttribute("msgOK", "Actualicé el producto");
				return "redirect:/product/list";
		}else {
			redirectAttributes.addFlashAttribute("msgError", "No puedo actualizar el producto, porque faltan datos");
			return "redirect:/edit/Product";
		}
	}	
	
	@RequestMapping("/search") //http://localhost:9080/product/search
	public String searchProduct() {
				return "/searchProduct.jsp";
	}

	@PostMapping("/search") //http://localhost:9080/product/search
	public String searchProduct(@Param("search") String search, Model model, 
			RedirectAttributes redirectAttributes) {
		
		List<Product> products = new ArrayList<Product>();
		
		if(search.isEmpty()) {
			redirectAttributes.addFlashAttribute("msgError", "No puedo buscar si no ingresas algún dato");
			return "redirect:search";
		}else {
			products = productService.searchProducts(search);
			
			if(products.size()!=0) {
				model.addAttribute("products", products);
				redirectAttributes.addFlashAttribute("msgOk", "He encontrado los siguientes productos");
				return "/searchProduct.jsp";
			}else {
				redirectAttributes.addFlashAttribute("msgError", "No he encontrado ningún producto");
				return "redirect:search";
			}
		}
	}

}
