package repository.impl;

import model.Product;
import repository.IProductRepository;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {

    @Override
    public List<Product> getAll() {
        List<Product> productList = new ArrayList<>();

    }

    @Override
    public boolean add(Product product) throws SQLException {
    }

    @Override
    public boolean delete(int id) {
    }

    @Override
    public boolean update(Product product) throws SQLException {
    }

    @Override
    public Product getProductById(int id) throws SQLException {
    }
}
