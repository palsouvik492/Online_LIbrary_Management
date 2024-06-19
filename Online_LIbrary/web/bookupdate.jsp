<%-- 
    Document   : bookupdate
    Created on : Jul 31, 2023, 8:16:48 PM
    Author     : Rik(^_^)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" import="java.sql.*"%>\

<!DOCTYPE html>
<%
    Class.forName("hhmm");
    Connection con=null;
    ResultSet rst = null;
    Statement stmt = null;
     try{
         
        con= DriverManager.getConnection("");
        stmt = con.createStatement();
    }
    catch(Exception e){
        System.out.println(e.getMessage());
    }
     if(request.getParameter("action")!=null){
         String bookid=request.getParameter("bookid");
         rst=stmt.executeQuery("select * from book where bookid =' "+bookid+"'");
     %>
     <html>
         <body bgcolor ="lightgreen">
             <form action="bkupdate.jsp" method ="post" name="entry" onSubmit="returnvalidate(this)">
                 <center>
                     <h2>Book List</h2>
                     <table border="1" cellspacing="0"cellpadding="0" width=30%>
                         <!--<tr>
                             <td><b>S.No</b></td>
                         </tr>
                         <tr>
                             <td><b>Book Id</b></td>
                         </tr>
                         <tr>
                             <td><b>Book Name</b></td>
                         </tr>
                         <tr>
                             <td><b>Authors</b></td>
                         </tr>
                         <tr>
                             <td><b>Price</b></td>
                         </tr>
                         <tr>
                             <td><b>No of copy</b></td>
                         </tr>-->
                         <%
                             int no=1;
                             while(rst.next()){
                         %>
                         <tr>
                             <td><b>S.No</b></td>
                             <td><%=no%></td>
                         </tr>
                         <tr>
                             <td><b>Book Id</b></td>
                             <td><input type="text" name =bookid value=<%=rst.getString("bookid")%>></td>
                         </tr>
                         <tr>
                             <td><b>Book Name</b></td>
                             <td><input type="text" name =bookname value=<%=rst.getString("bookname")%>></td>
                         </tr>
                         <tr>
                             <td><b>Authors</b></td>
                             <td><input type="text" name ="authors" value=<%=rst.getString("authors")%>></td>
                         </tr>
                         <tr>
                             <td><b>Price</b></td>
                             <td><input type="text" name =price value=<%=rst.getString("price")%>></td>
                         </tr>
                         <tr>
                             <td><b>No of Ciopy</b></td>
                             <td><input type="text" name =nocopy value=<%=rst.getString("nocopy")%>></td>
                         </tr>
                         <tr>
                             <td colspan="2" align="center">
                                 <input type="submit" value="Submit">
                             </td>
                         </tr>
                         <%
                             no++;
                             }
                             rst.close();
                                stmt.close();
                                con.close();
                         %>
                     </table>
                 </center>
             </form>
         </body>
     </html>
     <%}else{%>
     <html>
         <head>
         <title>Book Found List</title>
         <script language="javascript">
             function validate(objForm){
                 if(objForm.bookname.vbalue.length==0){
                     alert("pleae enter book name!");
                     objForm.bookname.focus();
                     return false;
                 }
                 return true;
             }
             </script>
         </head>
         <body bgcolor="lightyellow">
         <center>
             
             <form action="bookupdate.jsp" method="post" name="entry" onSubmit ="returnvalidate(this)">
                 <input type="hidden" value="list" name="action">
                 <table border="1" cellpadding ="0" cellspacing ="0">
                     <tr>
                         <td>
                             <table>
                                 <tr>
                                     <td colspan="2" align="center">
                                         <h2><center>GIVE PROPER BOOK NAME</center></h2>
                                     </td>
                                 </tr>
                                 <tr>
                                     <td colspan>&nbsp;</td>
                                 </tr>
                                 <tr>
                                     <td>Book Name:</td>
                                     <td><input name="bookid"  type="text" size="30>"</td>
                                     <td><img src="browse_cd.gif" height="50" width="50"</td>
                                 </tr>
                                 <tr>
                                     <td colspan="2 " align ="center">
                                         <input type="submit" value="Submit">
                                     </td>
                                 </tr>
                             </table>
                         </td>
                     </tr>
                 </table>
             </form>
                   </center>
     </body>
             <% }%>
             
     </html>