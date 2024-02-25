package database;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static String URL = "jdbc:mqsql://localhost:3306/product_management";
    private static String USERNAME = "root";
    private static String PASSWORD = "Lullaby2206";
    private static final String INSERT_USERS_SQL = "INSERT INTO product" + "  (name, price, description) VALUES " +
            " (?, ?, ?);";
    private static final String SELECT_USER_BY_ID = "select id,name,price,description from product where id =?";
    private static final String SELECT_ALL_USERS = "select * from product";
    private static final String DELETE_USERS_SQL = "delete from product where id = ?;";
    private static final String UPDATE_USERS_SQL = "update product set name = ?,price= ?, description =? where id = ?;";
    public static Connection getConnection() throws SQLException {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(URL, USERNAME,PASSWORD);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return connection;
    }
}
