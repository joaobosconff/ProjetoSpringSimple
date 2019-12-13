package br.facisa.lsi.ProjetoSpringSimple;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("test")
public class Controiller {
	
	@GetMapping
	ResponseEntity<String> get(){
		return new ResponseEntity<>("Funcionando o Docker",HttpStatus.OK);
	}

}
