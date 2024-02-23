import model.Customer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(value = "/customer")
public class DisplayCustomerServlet extends HttpServlet {
    private static List<Customer> customerList = new ArrayList<>();
    static {
        customerList.add( new Customer("John Doe", "05/15/1985", "123 Maple St", "../assets/1.jpg"));
        customerList.add(new Customer("Alice Smith", "08/21/1990", "456 Oak St", "../assets/2.jpg"));
        customerList.add(new Customer("Bob Johnson", "03/10/1980", "789 Pine St", "../assets/3.jpg"));
        customerList.add(new Customer("Nguyen Van C", "03/03/1992", "789 Pine St", "../assets/4.jpg"));
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("customerList", customerList);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("list.jsp");
        requestDispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }
}
