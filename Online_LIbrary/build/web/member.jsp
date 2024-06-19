<%-- 
    Document   : member
    Created on : Jul 21, 2023, 12:50:31 AM
    Author     : Rik(^_^)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page language="java" import="java.sql.*"%>
<%
   
    String driver="com.mysql.jdbc.Driver";
    
    Class.forName(driver).newInstance();
    Connection con = null;
    ResultSet rst = null;
    String url ="jdbc:mysql://localhost:3308/";
    String db = "onlinelibrary";
    String UN = "root";
    Statement stmt = null;
    try{
        con = DriverManager.getConnection(url+db,UN,"");
        stmt = con.createStatement();
    }
    catch(Exception e){
        System.out.println(e.getMessage());
    }
    if(request.getParameter("action") != null){
        /* 
            String memberid;
           rst = stmt.executeQuery("select memberid form member");
        while(rst.next()){
            memberid = rst.getString(memberid);
        }
        memberid = Int((memberid)+1;
        */
        String memberid = request.getParameter("memberid");
        String membername = request.getParameter("membername");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String datejoin = request.getParameter("datejoin");
        String dateexpire = request.getParameter("dateexpire");
        String deposit = request.getParameter("deposit");
        String bookinhand = request.getParameter("bookinhand");
        stmt.executeUpdate("insert into onlinelibrarydb values('"+memberid+"','"+membername+"','"+address+"','"+phone+"','"+datejoin+"','"+dateexpire+"','"+deposit+"','"+bookinhand+"')");
        rst=stmt.executeQuery("select * from onlinelibrarydb");
        %>
        <html>
            <body bgcolor="lightgreen">
                <h1><a href="index.jsp">HOME</a></h1>
            <center>
                <h2>All Library Members of DIGITAL LIBRARY</h2>
                <table border ="1" cellspacing="0" cellpadding="0">
                    <tr> 
                        <td><b>S.No</b></td>
                        <td><b>Member Id</b></td>
                        <td><b>Member Name</b></td>
                        <td><b>Address</b></td>
                        <td><b>Phone</b></td>
                        <td><b>Date Join</b></td>
                        <td><b>Date Expire</b></td>
                        <td><b>Deposit</b></td>
                        <td><b>Book In hand</b></td>
                    </tr>
                    <%
                        int no = 1;
                        while(rst.next()){
                    %>
                    <tr>
                        <td><%=no%></td>
                        <td><%=rst.getInt("memberid")%></td>
                        <td><%=rst.getString("membername")%></td>
                        <td><%=rst.getInt("address")%></td>
                        <td><%=rst.getInt("phone")%></td>
                        <td><%=rst.getInt("date_join")%></td>
                        <td><%=rst.getInt("date_expire")%></td>
                        <td><%=rst.getInt("deposit")%></td>
                        <td><%=rst.getInt("book_in_hand")%></td>
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
        <%}else{%>
        <html>
            <head>
                <title>Enter New Member Form</title>
                <script language="javascript">
                    function validate(objForm){
                        if(objForm.bookname.value.length==0){
                            alert("Please enter member id");
                            odjForm.memberid.focus();
                            return false;
                        }
                        if(objForm.membername.value.length==0){
                            alert("Please enter Member Name");
                            odjForm.membername.focus();
                            return false;
                        }
                        return true;
                    }
                </script>
            </head>
            <body bgcolor="cyan">
                <h1><a href="index.jsp">HOME</a></h1>
            <center>
                <form action="member.jsp" method="post" name="entry" onSubmit="returnvalidate(this)">
                    <table border="2" cellpading="0" cellspacing="0">
                        <tr>
                            <td>
                                <table>
                                    <tr>
                                        <td colspan="2" align ="center">
                                            <h2>Enter New Member Form</h2>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>Memberd Id:</td>
                                        <td><input name="memberid" type="text" size="8"></td>
                                    </tr>
                                    <tr>
                                        <td>Member Name :</td>
                                        <td><input name="membername" type="text" size="20"></td>
                                    </tr>
                                    <tr>
                                        <td>Address :</td>
                                        <td><input name="address" type="text" size="25"></td>
                                    </tr>
                                    <tr>
                                        <td>Phone :</td>
                                        <td><input name="phone" type="text" size="15"></td>
                                    </tr>
                                    <tr>
                                        <td>Date_Join :</td>
                                        <td><input name="datejoin" type="text" size="12"></td>
                                    </tr>
                                    <tr>
                                        <td>Date_Expire :</td>
                                        <td><input name="dateexpire" type="text" size="12"></td>
                                    </tr>
                                    <tr>
                                        <td>Deposit :</td>
                                        <td><input name="deposit" type="text" size="10"></td>
                                    </tr>
                                    <tr>
                                        <td>Book In Hand :</td>
                                        <td><input name="bookinhand" type="text" size="5"></td>
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
