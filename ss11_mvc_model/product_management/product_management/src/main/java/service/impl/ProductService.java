package service.impl;

import model.Product;
import repository.IProductRepository;
import repository.impl.ProductRepository;
import service.IProductService;

import java.sql.SQLException;
import java.util.List;

public class ProductService implements IProductService {
    IProductRepository productRepository = new ProductRepository();
    @Override
    public List<Product> getAll() {
        return productRepository.getAll();
    }

    @Override
    public boolean add(Product product) {
        try {
            return productRepository.add(product);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public boolean delete(int id) {
        return productRepository.delete(id);
    }

    @Override
    public boolean update(Product product) throws SQLException {
        return productRepository.update(product);
    }

    @Override
    public Product getProductById(int id) throws SQLException {
        return productRepository.getProductById(id);
    }
}
