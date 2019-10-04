

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%--<%@page import="connection.connect.*" %>--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
         <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="style.css">
        <link rel="stylesheet" href="WEB-INF/style.css" type="text/css"/>
        <link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
       <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>update attendence</title>
    </head>
    <body>
       <ul class="w3-ul">
              <li class="w3-xxxlarge"><a href="content.jsp"><i class="fa fa-home"></a></i></li>
        </ul>
         <form  method="post">
             <%   Connection con=null;
                  Class.forName("com.mysql.jdbc.Driver");
                  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo", "root", "root");
//                  String s;
                  Statement st=con.createStatement();
                  ResultSet r = st.executeQuery("Select society,soc_id from society");
                  while(r.next())
                  {   
                      String sin=r.getString(1);
                                    
                       String gh=(String)request.getParameter("subject");
                       String hi=r.getString(2);
//                         String n=(String)session.getAttribute( "userid" );                      
                       
                      if(sin.equals(gh)){
//                      {    out.println("before");
                          session.setAttribute("soc", hi);
//                          session.setAttribute("uid",n);
                                                
                          response.sendRedirect("society.jsp");
                         
//                          out.println("after");
                          break;
                      }
                 }                  
                  con.close();
             %> 
             <div>Total Lectures
                 <input class="input1" type="integer" name="num"><br></div>
                 <center> <button type="submit" class="login">Submit</button></center>
             

         <% 
             //ArrayList<String> stArray = new ArrayList<String>();
           int sd,ud;
           int ch=0;
           
           
            String num=request.getParameter("num");
                 String sub = request.getParameter("subject");   
                    //out.println(sub); 
    
           
          //  out.println(sub);
            String b=(String)session.getAttribute( "userid" );
            //out.println(b);
            
//            Connection con;
         
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo", "root", "root");
            
            
            try 
                
            {
                
        
             
                         
                PreparedStatement s=con.prepareStatement("select uid from teacher where name=?");
                    s.setString(1,b);
                    ResultSet rst =s.executeQuery();
                    rst.next();
                    
                       ud = rst.getInt(1);
                        
                        session.setAttribute("useid", ud);
                        
                     
                        
                  PreparedStatement pst=con.prepareStatement("select sid from subject where sname=?");
                   pst.setString(1,sub);
                     ResultSet rs =pst.executeQuery();
                    
                     rs.next();
                     //out.println("sid");
                     sd = rs.getInt(1);
                    
                     //out.println(sd);
                     session.setAttribute("subid", sd);
                     
               
             
                    PreparedStatement t=con.prepareStatement("update demo.attendence set tl=? where sid=? and  uid=? and roll>0");
                    t.setString(1,num);
                    t.setString(2,rs.getString(1));
                    t.setString(3,rst.getString(1));
                    ch =t.executeUpdate();
              
                    //out.println(ch);
                       //uid = rest.getInt(1);
                       // out.println(uid);
             
                 con.close();
                 
//               response.sendRedirect("passpam.jsp");   
                      
         

   } 
  catch(Exception e)
            {
                out.println("exception" +e);
            }
            

        %>
        <center> <button type="submit" class="login"><a href="passpam.jsp">Update Now</a></button></center>
		
        

           </body>
</html>
