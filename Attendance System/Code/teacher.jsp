<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="style.css">
        <link rel="stylesheet" href="WEB-INF/style.css" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        hello world;
        <%
            String uname = request.getParameter("uname");
            String pass = request.getParameter("psw");
            Connection con;
         
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo", "root", "root");
            
             int a;
            
            try {
                out.println("try");
                Statement ps = con.createStatement();
                ResultSet theResult = ps.executeQuery("select * from teacher where name='" + uname + "' and pass='" + pass + "'");
                if(theResult.next())
                {
                    session.setAttribute("userid", uname);
                    
                    response.sendRedirect("content.jsp");
                }
                else
                {
                    
                    response.sendRedirect("login.html");
                }
               
            }
            catch(Exception e)
            {
                out.println(e);
            }

           
            %>
        
    </body>
</html>
