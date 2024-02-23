<%--
  Created by IntelliJ IDEA.
  User: anhvu
  Date: 21-Feb-24
  Time: 20:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
      <title>Title</title>
  </head>
  <body>
  <div style="text-align: center">
      <h1>Danh Sach Khach Hang</h1>
      <div class="d-flex justify-content-center align-items-center">
          <div>
              <table class="table table-striped text-center">
                  <tr>
                      <th>Name</th>
                      <th>Date of Birth</th>
                      <th>Address</th>
                      <th>Avatar</th>
                  </tr>
                  <c:forEach var="customer" items="${customerList}" varStatus="status">
                      <tr>
                          <td>${customer.getName()}</td>
                          <td>${customer.getBirthday()}</td>
                          <td>${customer.getAddress()}</td>
                          <td><img src="${customer.getAvatar()}" alt="" width="100px" height="100px"></td>
                      </tr>
                  </c:forEach>
              </table>
          </div>
      </div>
  </div>
  </body>
</html>
