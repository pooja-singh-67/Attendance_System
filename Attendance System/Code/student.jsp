<%-- 
    Document   : view
    Created on : 15 Nov, 2016, 2:20:45 PM
    Author     : Awesome
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" type="text/css" href="style.css">
        <link rel="stylesheet" href="WEB-INF/style.css" type="text/css"/>
        <title>JSP Page</title>
    </head>
    
    <body>
        <form  method="post">
         
 
            <div> Roll no <input class="input1" type="integer" name="num"><br><br></div>
            <center><button type="submit" class="login">Submit</button><br></form></center>
        
        <%
            String n=request.getParameter("num");
            
            Connection con;
         
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo", "root", "root");
            try
            {
                
			PreparedStatement st= con.prepareStatement("select name,year,branch from student where roll=?");
			st.setString(1,n);
			ResultSet rs=st.executeQuery();
                        while(rs.next())
                        {
			%>
			  <p>
					Name: <%=rs.getString(1)%><br>
					Year: <%=rs.getString(2) %><br>
					Branch: <%=rs.getString(3)%><br>
					</p>
					
					<table border="1">
                    <tr>
                    <th scope="col" width="32%">Subject</th>
                    <th scope ="col" width="24%">Total Lectures</th>
                    <th scope ="col" width="44%">Lectures attended</th>
                    </tr>
         </table>
			<%
                    }
                     
            PreparedStatement sn=con.prepareStatement("select s.sname,a.tl,a.la from attendence as a, subject as s where a.uid=s.uid and a.sid=s.sid and a.roll=?");
            sn.setString(1,n);
                    
                    
                ResultSet set =sn.executeQuery();
               
                while(set.next())
                {    
                     %>
                  
                 <table border="1">
                    
                <tr>
             <td scope="col" width="32%"><%=set.getString(1) %></td>
             <td scope="col" width="24%"><%=set.getString(2) %></td>
             <td scope="col" width="44%"><%=set.getString(3) %></td>
			 </tr></table>
             <%
               
			   }
            }
catch(Exception e)
            {
                out.println("exception" +e);
            }
   %>
    </body>
</html>
