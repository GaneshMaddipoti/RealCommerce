package web.data;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import web.data.model.User;

public interface UserRepository extends CrudRepository<User, Integer> {
	
	List<User> findByUserName(String userName);

}
