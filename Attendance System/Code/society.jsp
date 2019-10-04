<%-- 
    Document   : society
    Created on : May 9, 2017, 2:29:08 PM
    Author     : Krityangan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
                    <th scope="col" width="32%">Roll Number</th>
                    <th scope ="col" width="32%">Name</th>
                    <th scope ="col" width="32%">Days Attended</th>
                    </tr>
         </table>
        <form  method="get" name="f1"  method="post" >
        
        <%
              ArrayList<String> stArray = new ArrayList<String>();
			 ArrayList<String> roll = new ArrayList<String>();
            Connection con=null;
            try
                
            {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo", "root", "root");
            String soc =(String) session.getAttribute("soc");
//            String n=(String) session.getAttribute("uid");
//            out.println(n);
            
            PreparedStatement ps= con.prepareStatement("select a.roll, s.name,a.waivers from student as s,"
                    + "attendence as a where a.sid=? and a.roll=s.roll ");
            ps.setString(1,soc);
            ResultSet res= ps.executeQuery();
            int i=0;
            while(res.next())
            {
                %>
                 <table border="1">
                    
                <tr>
               <td width="32%" scope="row"><%=res.getString(1) %><% roll.add(res.getString(1));%></td>
             
               <td width="32%" scope="row"><%=res.getString(2) %></td>
              
         
             <td width="32%" scope="row"> <input type="integer" name=<%=i%> required>
                 
			 </td></tr></table>
         <%
             
             String num1=request.getParameter(""+i);
				stArray.add(num1);
			
				i++;
				//session.setAttribute("count",i);
             }
            
			
		for(int j=0;j<i;j++)
{
			String la=stArray.get(j);
			String rollno=roll.get(j);

                        //out.println(la);
                        //out.println(rollno);
//out.println(la);

            
            PreparedStatement t=con.prepareStatement("update demo.attendence set waivers=? where roll=?");
            t.setString(1,""+la);
//			t.setString(2,soc);
//            t.setString(3,""+b);
			t.setString(2,""+rollno);
                        int ch =t.executeUpdate();

			}
}

catch(Exception e)
            {
                out.println("exception" +e);
            }
             
			              
               // out.println(res.getString(1)+res.getString(2)+res.getString(3));
                
            
          
%>
<center>    <button type="submit" class="login">Submit</button><br></center>
         </form>
    </body>
</html>
