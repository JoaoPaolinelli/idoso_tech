package johnny_tech.idosotech.app_idoso_tech.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import johnny_tech.idosotech.app_idoso_tech.model.Categoria;
import johnny_tech.idosotech.app_idoso_tech.service.CategoriaService;

@RestController
@RequestMapping("/categoria")
public class CategoriaController {


    @Autowired
    private CategoriaService categoriaService;
    
    @GetMapping("/listar")
     public List<Categoria> listarCategorias() {
        return categoriaService.listarCategorias(); // Retorna os dados do MongoDB
    }

     @GetMapping("/print")
    public String ping() {
        return "Controller funcionou Viva";
    }
}
