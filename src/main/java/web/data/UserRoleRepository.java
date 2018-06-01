package web.data;

import org.springframework.data.repository.CrudRepository;

import web.data.model.UserRole;

public interface UserRoleRepository extends CrudRepository<UserRole, Integer> {
	

}
