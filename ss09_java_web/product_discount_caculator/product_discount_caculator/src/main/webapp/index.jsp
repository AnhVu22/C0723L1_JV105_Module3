<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Product Discount Caculator</title>
</head>
<body>

<form action="/display-discount" method="post">
  <input name="productdescription" placeholder="Product Description">
  <input name="listprice" placeholder="List Price">
  <input name="discountpercent" placeholder="Discount Price">
  <button type="submit">Caculate Discount</button>
</form>

</body>
</html>