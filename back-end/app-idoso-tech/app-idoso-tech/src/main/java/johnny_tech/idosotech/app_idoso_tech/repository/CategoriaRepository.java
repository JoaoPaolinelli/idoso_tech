package johnny_tech.idosotech.app_idoso_tech.repository;

import johnny_tech.idosotech.app_idoso_tech.model.Categoria;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CategoriaRepository extends MongoRepository<Categoria, String> {
}