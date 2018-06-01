package web.data;

import org.springframework.data.repository.CrudRepository;

import web.data.model.EntityContact;

public interface EntityContactRepository extends CrudRepository<EntityContact, Integer> {

}
