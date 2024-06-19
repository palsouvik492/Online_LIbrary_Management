package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class Booksearch_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

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

      out.write("\n");
      out.write("<html>\n");
      out.write("    <body>\n");
      out.write("        <p></p>\n");
      out.write("        <p></p>\n");
      out.write("    <center>\n");
      out.write("        <h2>Member Details</h2>\n");
      out.write("        <table border=\"1\" cellspacing =\"0\" cellpadding=\"0\" width=80%>\n");
      out.write("            <tr>\n");
      out.write("                <td><b>Member Id</b></td>\n");
      out.write("                <td><b>Member Name</b></td>\n");
      out.write("                <td><b>Address</b></td>\n");
      out.write("                <td><b>Phone</b></td>\n");
      out.write("                <td><b>Date Join</b></td>\n");
      out.write("                <td><b>Date Expire</b></td>\n");
      out.write("                <td><b>Deposit</b></td>\n");
      out.write("                <td><b>Book In hand</b></td>\n");
      out.write("            </tr>\n");
      out.write("            ");

                memberid=request.getParameter("memberid");
                rst = stmt.executeQuery("select * from member");
                while(rst.next()){
            
      out.write("\n");
      out.write("            <tr>\n");
      out.write("                        <td>");
      out.print(rst.getString("memberid"));
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(rst.getString("membername"));
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(rst.getString("address"));
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(rst.getString("phone"));
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(rst.getString("date_join"));
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(rst.getString("date_expire"));
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(rst.getString("deposit"));
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(rst.getString("book_in_hand"));
      out.write("</td>\n");
      out.write("            </tr>\n");
      out.write("            ");

                }
                rst.close();
                stmt.close();
                con.close();
                
      out.write("\n");
      out.write("                <h2>Record successfully Deleted</h2>\n");
      out.write("        </table>\n");
      out.write("    </center>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
}else{
      out.write("\n");
      out.write("<html>\n");
      out.write("    <title>Member Delete Form Document</title>\n");
      out.write("    <script language =\"javascript\">\n");
      out.write("        function validate(objForm){\n");
      out.write("            if(objForm.memberid.value.length==0){\n");
      out.write("                alert(\"Please enter member id!\");\n");
      out.write("                objForm.memberid.focus();\n");
      out.write("                return false;\n");
      out.write("            }\n");
      out.write("            return true;\n");
      out.write("        }\n");
      out.write("    </script>\n");
      out.write(" </head>\n");
      out.write("    <body bgcolor =\" pink \">\n");
      out.write("        <p></p>\n");
      out.write("        <p></p>\n");
      out.write("        <p></p>\n");
      out.write("    <center>\n");
      out.write("        <form action =\"memberdelete.jsp\" method =\"post\" name =\"deleterecord\" onsubmit=\"return validate(this)\">\n");
      out.write("            <input type=\"hidden\" value=\"list\" name=\"action\">\n");
      out.write("            <table border=\"1\" cellpading =\"0\" cellspacing=\"0\" width=50%>\n");
      out.write("                <tr>\n");
      out.write("                    <td colspan=\"2\">&nbsp;</td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>\n");
      out.write("                <center>\n");
      out.write("                    <table>\n");
      out.write("                        <tr colspan=\"2\" bgcolor=\"green\">\n");
      out.write("                            <td colspan=\"2\" align=\"center\">\n");
      out.write("                                <h2>Member Search for Delete</h2>\n");
      out.write("                            </td>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                            <td colspan=\"2\">&nbsp;</td>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                            <td>Member Id:</td>\n");
      out.write("                            <td><input name=\"memberid\" type=\"text\" size=\"5\"></td>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                            <td colspan=\"2\">&nbsp;</td>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                            <td colspan =\"2\" align =\"center\">\n");
      out.write("                                <input type=\"submit\" value=\"Delete Record\">\n");
      out.write("                            </td>\n");
      out.write("                            <td colspan=\"2 align =center\">\n");
      out.write("                                <input type=\"reset\" value=\"Reset\">\n");
      out.write("                            </td>\n");
      out.write("                          </tr>\n");
      out.write("                      </table>\n");
      out.write("                   </center>\n");
      out.write("                 </td>\n");
      out.write("               </tr>\n");
      out.write("            </table>\n");
      out.write("        </form>\n");
      out.write("      </center>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("    ");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
