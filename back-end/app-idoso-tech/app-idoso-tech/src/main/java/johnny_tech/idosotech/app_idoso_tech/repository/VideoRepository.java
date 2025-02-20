package johnny_tech.idosotech.app_idoso_tech.repository;

import java.util.List;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;
import org.springframework.stereotype.Repository;

import johnny_tech.idosotech.app_idoso_tech.model.Video;


@Repository
public interface VideoRepository extends MongoRepository<Video,String> {
    @Query("{ 'id_categoria' : ?0 }")
    List<Video> findByIdCategoria(String idCategoria);
}

