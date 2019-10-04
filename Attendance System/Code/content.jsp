<%-- 
    Document   : content
    Created on : Sep 23, 2016, 10:12:55 AM
    Author     : Krityangan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <table border="1">
                     <tr>
                    <th scope="col" width="32%">Subject</th>

                    <th scope ="col" colspan="2" width="68%">Actions</th>
                    </tr>
         </table>
        <%! String a;%>
        <%  String b;
             //String a;
            b=(String)session.getAttribute( "userid" );
            session.setAttribute("uid",b);
            //out.println(b);
           Connection con;
         
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo", "root", "root");
            
            try {
                //out.println("try");
                //Statement ps = con.createStatement();
                PreparedStatement st=con.prepareStatement("select s.sname from teacher as t,subject as s where t.name=? and t.uid=s.uid;");
                // ResultSet rs = ps.executeQuery("select s.sname from teacher as t,subject as s where t.name='" + b + "and t.uid=s.uid;'" );
                st.setString(1, b);
                ResultSet rs =st.executeQuery();
                int i=0;
                while(rs.next())
                {   a=rs.getString(1);
                    
                    //out.println(a);
                   // out.println();%>
                  
                   <table border="1">
                    
                <tr>
             <td scope="row" width="32%"><%=rs.getString("sname") %></td>
                    
                <form action="modify.jsp"><td width="22%"><input type="hidden" name="subject" value="<%= a%>" method="POST"> <button  type="submit" class="button2" >Modify</button></td></form>
             <form action="view.jsp"><td width="44%"><input type="hidden" name="sub" value="<%= a%>"> <button  type="submit" class="button2" >View</button></td></form>
        
             </tr>
    </table>
                    
                   
             
          <%
            i++;   }
            }
            catch(Exception e)
            {
                out.println(e);
            }
            
            %>
             
         
         
    </body>
</html>
 