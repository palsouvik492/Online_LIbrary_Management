<%-- 
    Document   : bkupdate
    Created on : Jul 31, 2023, 7:36:05 PM
    Author     : Rik(^_^)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" import ="java.sql.*"%>
<!DOCTYPE html>
<html>
    <body bgcolor = "lightyellow">
        <h1><a href="index.jsp">HOME</a></h1>
    <center>
        <h2>Books List</h2>
        <table border="1" cellspacing = "0" cellpadding="0" width=60%>
            <tr>
                <td><b>S.No.</b></td>
                <td><b>BookId</b></td>
                <td><b>BookName</b></td>
                <td><b>Authors</b></td>
                <td><b>Price</b></td>
                <td><b>NoCopy</b></td>
                
            </tr>
            <%
                Connection con = null;
                Statement stmt = null;
                ResultSet rst = null;
                try{
                    Class.forName("jdbc");
                    con= DriverManager.getConnection("");
                    stmt = con.createStatement();
                   
                    String bookid = request.getParameter("bookid");
                    String bookname = request.getParameter("action");
                    String authors = request.getParameter("authors");
                    String price = request.getParameter("price");
                    String nocopy = request.getParameter("nocopy");
                    out.println(bookid);
                    //int bprice = Integer.parseInt(price);
                    //int bnocopy =  Integer.parseInt(nocopy);
                    //
                    
                    rst = stmt.executeQuery("select * from book");
                    int no = 1;
                    if(rst.next()){
                        do{
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
                        }while(rst.next());      
                    }
                }
                catch(Exception e){
                    System.out.println(e.getMessage());
                    
                }
                rst.close();
                stmt.close();
                con.close();
                %>
        </table>
    </center>
    </body>
</html>