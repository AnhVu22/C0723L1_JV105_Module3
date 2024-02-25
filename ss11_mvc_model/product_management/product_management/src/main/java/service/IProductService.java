package service;

import model.Product;

import java.sql.SQLException;
import java.util.List;

public interface IProductService {
    List<Product> getAll();
    boolean add(Product product) throws SQLException;
    boolean delete(int id);
    boolean update(Product product) throws SQLException;
    Product getProductById(int id) throws SQLException;
}
