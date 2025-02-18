package johnny_tech.idosotech.app_idoso_tech.service;

import johnny_tech.idosotech.app_idoso_tech.model.Categoria;
import johnny_tech.idosotech.app_idoso_tech.repository.CategoriaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoriaService {

    @Autowired
    private CategoriaRepository categoriaRepository;

    public List<Categoria> listarCategorias() {
        System.out.println("Entrei aqui");
        List<Categoria> categorias = categoriaRepository.findAll();
        

        categorias.forEach(cat -> System.out.println());


        System.out.println("Tamanho da lista de categorias: "+ categorias.size());
        return categoriaRepository.findAll(); // Busca todas as categorias do MongoDB
    }

    public Categoria criarCategoria(Categoria categoria) {
        return categoriaRepository.save(categoria); // Salva uma nova categoria
    }
}


