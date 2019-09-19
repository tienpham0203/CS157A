<%--
  Created by IntelliJ IDEA.
  User: tienpham
  Date: 9/16/19
  Time: 8:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*"%>
<html>
<head>
  <title>JDBC Connection example</title>
</head>
<body>
<h1>JDBC Connection example</h1>
    <%
     String db = "cs157a";
        String user; // assumes database name is the same as username
          user = "root";
        String password = "h6j7k8^&*";
        try {
            java.sql.Connection con;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157a?serverTimezone=EST5EDT",user, password);
            out.println(db + " database successfully opened.<br/><br/>");

            out.println("Initial entries in table \"student\": <br/>");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM student");
            while (rs.next()) {
                out.println(rs.getInt(1) + " " + rs.getString(2) + " " + rs.getString(3) + "<br/><br/>");
            }
            rs.close();
            stmt.close();
            con.close();
        } catch(SQLException e) {
            out.println("SQLException caught: " + e.getMessage());
        }
    %>
</body>
</html>