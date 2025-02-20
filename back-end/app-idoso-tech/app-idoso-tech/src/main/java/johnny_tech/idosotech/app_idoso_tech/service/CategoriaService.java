package johnny_tech.idosotech.app_idoso_tech.service;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import johnny_tech.idosotech.app_idoso_tech.model.Categoria;
import johnny_tech.idosotech.app_idoso_tech.model.Video;
import johnny_tech.idosotech.app_idoso_tech.repository.CategoriaRepository;
import johnny_tech.idosotech.app_idoso_tech.repository.VideoRepository;

@Service
public class CategoriaService {

    @Autowired
    private CategoriaRepository categoriaRepository;

    @Autowired
    private VideoRepository videoRepository;

    public List<Categoria> listarCategorias() throws JsonProcessingException {

        // ✅ Request para as coleções do Mongo
        List<Categoria> categorias = categoriaRepository.findAll();
        List<Video> listVideo = videoRepository.findAll();

        // ✅ Iteração
        for (Categoria categoria : categorias) {
            List<Map<String, String>> videoCompilado = new ArrayList<>();

            for (Video video : listVideo) {
                if (categoria.getIdCategoria().equals(video.getIdCategoria())) {  // 🔹 Comparação correta de Strings

                    // ✅ Criando um mapa JSON válido para cada vídeo
                    Map<String, String> videoMap = new HashMap<>();
                    videoMap.put("Nome", video.getNome());
                    videoMap.put("Link", video.getLinkYoutube());

                    videoCompilado.add(videoMap);
                }
            }
            categoria.setVideos(videoCompilado);
        }
        
        
        for (Categoria cat : categorias) {
            ObjectMapper objectMapper = new ObjectMapper();
            
            String printCategoria = objectMapper.writeValueAsString(cat);
                        
            System.out.println(printCategoria);
        }

        return categorias;
    }

    public Categoria criarCategoria(Categoria categoria) {
        return categoriaRepository.save(categoria); // Salva uma nova categoria
    }
}
