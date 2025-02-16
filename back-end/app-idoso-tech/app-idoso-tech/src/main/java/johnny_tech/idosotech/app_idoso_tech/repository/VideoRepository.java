package johnny_tech.idosotech.app_idoso_tech.repository;

import johnny_tech.idosotech.app_idoso_tech.model.Video;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface VideoRepository extends MongoRepository<Video,String> {
}

