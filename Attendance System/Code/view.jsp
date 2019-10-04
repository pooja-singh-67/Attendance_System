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
         <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="style.css">
        <link rel="stylesheet" href="WEB-INF/style.css" type="text/css"/>
        <link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
        <title>JSP Page</title>
    </head>
    
    <body>
        <ul class="w3-ul">
              <li class="w3-xxxlarge"><a href="content.jsp"><i class="fa fa-home"></a></i></li>
        </ul>
        <table border="1">
                    <tr>
                    <th scope="col" width="32%">Roll No</th>
                    <th scope ="col" width="24%" >Total Lectures</th>
                    <th scope ="col" width="44%" >Lectures attended</th>
                    </tr>
         </table>
        <%
            String sub=request.getParameter("sub");
            out.println(sub);            
            String b=(String)session.getAttribute("uid");
            
            Connection con;
         
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo", "root", "root");
            try
            {
                int ud,sd;
                 PreparedStatement s=con.prepareStatement("select uid from teacher where name=?");
                    s.setString(1,b);
                    ResultSet rst =s.executeQuery();
                    rst.next();
                  //  out.println("uid");
                       ud = rst.getInt(1);
                    //    out.println(ud);
                      
                        
                     
                        
                  PreparedStatement st=con.prepareStatement("select sid from subject where sname=?");
                   st.setString(1,sub);
                     ResultSet rs =st.executeQuery();
                    //out.println("hi");
                     rs.next();
                    // out.println("sid");
                     sd = rs.getInt(1);
                    
                     //out.println(sd);
                    
                     
            PreparedStatement sn=con.prepareStatement("select roll,tl,la from attendence where uid=? and sid=? and roll>0");
            sn.setString(1,""+ud);
                    
                    sn.setString(2,""+sd);
                ResultSet set =sn.executeQuery();
               
                while(set.next())
                {    
                     %>
                  
                 <table border="1">
                    
                <tr>
             <td scope="col" width="32%"><%=set.getString(1) %></td>
             <td scope="col" width="24%"><%=set.getString(2) %></td>
             <td scope="col" width="44%"> <%=set.getString(3) %></td>
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
