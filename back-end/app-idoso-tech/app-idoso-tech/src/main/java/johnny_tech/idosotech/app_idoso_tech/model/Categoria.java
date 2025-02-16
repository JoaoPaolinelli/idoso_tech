package johnny_tech.idosotech.app_idoso_tech.model;

import java.util.List;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Document(collection = "categoria") // Define a coleção do MongoDB
public class Categoria {
    
    @Id
    private String id;
    private String nome_categoria;
    private String id_categoria;
    private List<String> videos;
    

}
