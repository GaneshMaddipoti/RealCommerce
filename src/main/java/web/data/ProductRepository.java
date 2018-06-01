package web.data;

import org.springframework.data.repository.CrudRepository;

import web.data.model.Product;

public interface ProductRepository extends CrudRepository<Product, Integer> {

}
