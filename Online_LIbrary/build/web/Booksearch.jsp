<%-- 
    Document   : Booksearch
    Created on : Oct 29, 2023, 1:39:01 PM
    Author     : Rik(^_^)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" import="java.sql.*" %>
<%
    Class.forName("");
    Connection con = null;
    ResultSet rst = null;
    Statement stmt = null;
    try{
        con = DriverManager.getConnection("j");
        stmt = con.createStatement();
    }
    catch(Exception e){
        System.out.println(e.getMessage());
    }
    if(request.getParameter("action") != null){
        String memberid = request.getParameter("memberid");
        rst = stmt.executeQuery("select * form member where memberid ='"+memberid+"'");
%>
<html>
    <body>
        <p></p>
        <p></p>
    <center>
        <h2>Member Details</h2>
        <table border="1" cellspacing ="0" cellpadding="0" width=80%>
            <tr>
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
                memberid=request.getParameter("memberid");
                rst = stmt.executeQuery("select * from member");
                while(rst.next()){
            %>
            <tr>
                        <td><%=rst.getString("memberid")%></td>
                        <td><%=rst.getString("membername")%></td>
                        <td><%=rst.getString("address")%></td>
                        <td><%=rst.getString("phone")%></td>
                        <td><%=rst.getString("date_join")%></td>
                        <td><%=rst.getString("date_expire")%></td>
                        <td><%=rst.getString("deposit")%></td>
                        <td><%=rst.getString("book_in_hand")%></td>
            </tr>
            <%
                }
                rst.close();
                stmt.close();
                con.close();
                %>
                <h2>Record successfully Deleted</h2>
        </table>
    </center>
    </body>
</html>
<%}else{%>
<html>
    <title>Member Delete Form Document</title>
    <script language ="javascript">
        function validate(objForm){
            if(objForm.memberid.value.length==0){
                alert("Please enter member id!");
                objForm.memberid.focus();
                return false;
            }
            return true;
        }
    </script>
 </head>
    <body bgcolor =" pink ">
        <p></p>
        <p></p>
        <p></p>
    <center>
        <form action ="memberdelete.jsp" method ="post" name ="deleterecord" onsubmit="return validate(this)">
            <input type="hidden" value="list" name="action">
            <table border="1" cellpading ="0" cellspacing="0" width=50%>
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td>
                <center>
                    <table>
                        <tr colspan="2" bgcolor="green">
                            <td colspan="2" align="center">
                                <h2>Member Search for Delete</h2>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td>Member Id:</td>
                            <td><input name="memberid" type="text" size="5"></td>
                        </tr>
                        <tr>
                            <td colspan="2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan ="2" align ="center">
                                <input type="submit" value="Delete Record">
                            </td>
                            <td colspan="2 align =center">
                                <input type="reset" value="Reset">
                            </td>
                          </tr>
                      </table>
                   </center>
                 </td>
               </tr>
            </table>
        </form>
      </center>
    </body>
</html>
    