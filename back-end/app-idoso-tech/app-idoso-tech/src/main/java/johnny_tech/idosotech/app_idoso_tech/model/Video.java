package johnny_tech.idosotech.app_idoso_tech.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
@Document(collection = "video")
public class Video {

    @Id
    private String id;

    private String id_categoria;
    private String nome;
    private String link_youtube;

    
}
