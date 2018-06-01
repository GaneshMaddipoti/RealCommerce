package web.data;

import org.springframework.data.repository.CrudRepository;

import web.data.model.EntityInfo;

public interface EntityInfoRepository extends CrudRepository<EntityInfo, Integer> {

}
