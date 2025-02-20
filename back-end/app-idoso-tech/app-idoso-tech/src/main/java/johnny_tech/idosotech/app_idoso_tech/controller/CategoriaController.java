package johnny_tech.idosotech.app_idoso_tech.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;

import johnny_tech.idosotech.app_idoso_tech.model.Categoria;
import johnny_tech.idosotech.app_idoso_tech.service.CategoriaService;

@RestController
@RequestMapping("/categoria")
public class CategoriaController {


    @Autowired
    private CategoriaService categoriaService;
    
    // ✅ Retorna os dados do mongo
    @GetMapping("/listar")
     public List<Categoria> listarCategorias() throws JsonProcessingException {
        return categoriaService.listarCategorias();
    }

     @GetMapping("/print")
    public String ping() {
        return "Controller funcionou Viva";
    }
}
