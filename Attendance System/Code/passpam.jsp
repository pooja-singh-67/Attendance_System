<%-- 
    Document   : passpam
    Created on : 11 Nov, 2016, 3:16:14 PM
    Author     : Awesome
--%>


<%@page import="java.util.ArrayList"%>
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
                    <th scope="col" width="25%">Roll Number</th>
                    <th scope ="col" width="25%">Total Lectures</th>
                    <th scope ="col" width="25%">Lectures attended</th>
                     <th scope="col" width="25%">Waivers</th>
                    </tr>
         </table>
        <form  method="get" name="f1"  method="post" >
 
         <% 
             ArrayList<String> stArray = new ArrayList<String>();
			 ArrayList<String> roll = new ArrayList<String>();
        int b;
            
            b=(Integer)session.getAttribute( "useid" );
            //out.println(b);
            int a,ch=0;
            a=(Integer)session.getAttribute("subid");
            //out.println(a);
            Connection con;
         
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo", "root", "root");
            try
            {
                
   PreparedStatement sn=con.prepareStatement("select roll,tl,waivers from attendence where uid=? and sid=? and roll>0");
                // ResultSet rs = ps.executeQuery("select s.sname from teacher as t,subject as s where t.name='" + b + "and t.uid=s.uid;'" );
                
                    sn.setString(1,""+ b);
                     sn.setString(2,""+a);
                ResultSet set =sn.executeQuery();
                int i=0;
                while(set.next())
                {    
                     %>
                  
                 <table border="1">
                    
                <tr>
               <td width="25%" scope="row"><%=set.getString(1) %><% roll.add(set.getString(1));%></td>
             
               <td width="25%" scope="row"><%=set.getString(2) %></td>
              
         
             <td width="25%" scope="row"> <input type="integer" name=<%=i%> required>
			 </td>
                <td width="25%" scope="row"><%=set.getString(3) %></td>
                </tr></table>
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

            PreparedStatement t=con.prepareStatement("update demo.attendence set la=? where sid=? and  uid=? and roll=?");
            t.setString(1,la);
			t.setString(2,""+ a);
            t.setString(3,""+b);

			t.setString(4,""+rollno);
                        ch =t.executeUpdate();

			}
			}
catch(Exception e)
            {
                out.println("exception" +e);
            }
             
            %>
            
            <center>    <button type="submit" class="login">Submit</button><br></center>
         </form>
         
		
          
            
    </body>
</html>
