package johnny_tech.idosotech.app_idoso_tech.model;

import java.util.List;
import java.util.Map;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

//@Builder
//@Getter
//@Setter
@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
@Document(collection = "categoria") // Define a coleção do MongoDB
public class Categoria {
    
    @Id
    private String id;

    @Field("nome_categoria")
    private String nomeCategoria;

    @Field("id_categoria")
    private String idCategoria;

    private List<Map<String,String>> videos;


    
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    // Getter e Setter para nomeCategoria
    public String getNomeCategoria() {
        return nomeCategoria;
    }

    public void setNomeCategoria(String nomeCategoria) {
        this.nomeCategoria = nomeCategoria;
    }

    // Getter e Setter para idCategoria
    public String getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(String idCategoria) {
        this.idCategoria = idCategoria;
    }

    // Getter e Setter para videos
    public List<Map<String,String>> getVideos() {
        return videos;
    }

    public void setVideos(List<Map<String,String>>videos) {
        this.videos = videos;
    }

}
