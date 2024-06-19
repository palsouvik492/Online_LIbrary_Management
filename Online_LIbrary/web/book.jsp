<%-- 
    Document   : book
    Created on : Jul 21, 2023, 12:50:46 AM
    Author     : Rik(^_^)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" import="java.sql.*"%>
<%
    Class.forName("jdbc");
    Connection con= null;
    ResultSet rst = null;
    Statement stmt = null;
    try{
        con= DriverManager.getConnection("");
        stmt = con.createStatement();
    }
    catch(Exception e){
        System.out.println(e.getMessage());
    }
    if(request.getParameter("action") != null){
        String bookid = request.getParameter("bookid");
        String bookname = request.getParameter("action");
        String authors = request.getParameter("authors");
        String price = request.getParameter("price");
        String nocopy = request.getParameter("nocopy");
        //int bprice = Integer.paseInt(price);
        //int bcopy = Integer.parseInt(nocopy);
        stmt.executeUpdate("insert into book(bookid,bookname,authors,price,nocopy) values('"+bookid+"','"+bookname+"','"+authors+"','"+price+"','"+nocopy+"')");
        rst = stmt.executeQuery("select* from book");
    %>
    <html>
        <body bgcolor = "&H00FFC0HH&">
            <h1><a href="index.jsp">HOME</a></h1>
        <center>
            <h2>Books List</h2>
            <table border="1" cellspacing ="0" cellpadding ="0" width=60%>
                <tr>
                    <td><b>S.No.</b></td>
                    <td><b>BookId</b></td>
                    <td><b>BookName</b></td>
                    <td><b>Authors</b></td>
                    <td><b>Price</b></td>
                    <td><b>NoCopy</b></td>
                </tr>
                <%
                    int no = 1;
                    while(rst.next()){
                 %>
                 <tr>
                     <td><%=no%></td>
                     <td><%=rst.getString("bookid")%></td>
                     <td><%=rst.getString("bookname")%></td>
                     <td><%=rst.getString("authors")%></td>
                     <td><%=rst.getString("price")%></td>
                     <td><%=rst.getString("nocopy")%></td>
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
            
        </body>
    </html>
   <% }   else{%>
   <html>
       <head>
           <title>Book Entry Form Document</title>
           <script language="javascript">
               function validate(objForm){
                   if(objForm.bookid.value.length==0){
                       alert("Please enter member id!");
                       objForm.bookid.focus();
                       return False;
                   }
                   if(objForm.bookname.value.length==0){
                       alert("Please enter Book Name!");
                       objForm.bookname.focus();
                       return False;
                   }
                   return true;
                   
               }
           </script>
       </head>
       <body bgcolor="lightgreen">
           <h1><a href="index.jsp">HOME</a></h1>
       <center>
           <form action ="book.jsp" method ="post" name ="entry" onSubmit="return validate(this)">
               <input type ="hidden" value =" list " name="action">
               <table border="1" cellpadding ="0">
                   <tr>
                       <td>
                           <table>
                               <tr>
                                   <td colspan="2" align="center">
                                       <h2>Book Entry Form</h2>
                                   </td>
                               </tr>
                               <tr>
                                   <td colspan="2" >&nbsp;</td>
                               </tr>
                               <tr>
                                   <td>Book Id:</td>
                                   <td><input name="bookid" type="text" size="10"</td>
                               </tr>
                               <tr>
                                   <td>Book Name:</td>
                                   <td><input name="bookname" type="text" size="30"</td>
                               </tr>
                               <tr>
                                   <td>Author Name:</td>
                                   <td><input name="authors" type="text" size="20"</td>
                               </tr>
                               <tr>
                                   <td>Price:</td>
                                   <td><input name="price" type="text" size="10"</td>
                               </tr>
                               <tr>
                                   <td>No of Copy:</td>
                                   <td><input name="nocopy" type="text" size="10"</td>
                               </tr>
                               <tr>
                                   <td colspan="2" align="center">
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
   </html>
   <%}%>