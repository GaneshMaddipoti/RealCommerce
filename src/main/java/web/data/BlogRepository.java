package web.data;

import org.springframework.data.repository.CrudRepository;

import web.data.model.Blog;

public interface BlogRepository extends CrudRepository<Blog, Integer> {

}
