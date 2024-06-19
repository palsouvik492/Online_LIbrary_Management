package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class book_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    
      out.write("\n");
      out.write("    <html>\n");
      out.write("        <body bgcolor = \"&H00FFC0HH&\">\n");
      out.write("            <h1><a href=\"index.jsp\">HOME</a></h1>\n");
      out.write("        <center>\n");
      out.write("            <h2>Books List</h2>\n");
      out.write("            <table border=\"1\" cellspacing =\"0\" cellpadding =\"0\" width=60%>\n");
      out.write("                <tr>\n");
      out.write("                    <td><b>S.No.</b></td>\n");
      out.write("                    <td><b>BookId</b></td>\n");
      out.write("                    <td><b>BookName</b></td>\n");
      out.write("                    <td><b>Authors</b></td>\n");
      out.write("                    <td><b>Price</b></td>\n");
      out.write("                    <td><b>NoCopy</b></td>\n");
      out.write("                </tr>\n");
      out.write("                ");

                    int no = 1;
                    while(rst.next()){
                 
      out.write("\n");
      out.write("                 <tr>\n");
      out.write("                     <td>");
      out.print(no);
      out.write("</td>\n");
      out.write("                     <td>");
      out.print(rst.getString("bookid"));
      out.write("</td>\n");
      out.write("                     <td>");
      out.print(rst.getString("bookname"));
      out.write("</td>\n");
      out.write("                     <td>");
      out.print(rst.getString("authors"));
      out.write("</td>\n");
      out.write("                     <td>");
      out.print(rst.getString("price"));
      out.write("</td>\n");
      out.write("                     <td>");
      out.print(rst.getString("nocopy"));
      out.write("</td>\n");
      out.write("                 </tr>\n");
      out.write("                 ");

                     no++;
                    }
                    rst.close();
                    stmt.close();
                    con.close();
                    
      out.write("\n");
      out.write("            </table>\n");
      out.write("        </center>\n");
      out.write("            \n");
      out.write("        </body>\n");
      out.write("    </html>\n");
      out.write("   ");
 }   else{
      out.write("\n");
      out.write("   <html>\n");
      out.write("       <head>\n");
      out.write("           <title>Book Entry Form Document</title>\n");
      out.write("           <script language=\"javascript\">\n");
      out.write("               function validate(objForm){\n");
      out.write("                   if(objForm.bookid.value.length==0){\n");
      out.write("                       alert(\"Please enter member id!\");\n");
      out.write("                       objForm.bookid.focus();\n");
      out.write("                       return False;\n");
      out.write("                   }\n");
      out.write("                   if(objForm.bookname.value.length==0){\n");
      out.write("                       alert(\"Please enter Book Name!\");\n");
      out.write("                       objForm.bookname.focus();\n");
      out.write("                       return False;\n");
      out.write("                   }\n");
      out.write("                   return true;\n");
      out.write("                   \n");
      out.write("               }\n");
      out.write("           </script>\n");
      out.write("       </head>\n");
      out.write("       <body bgcolor=\"lightgreen\">\n");
      out.write("           <h1><a href=\"index.jsp\">HOME</a></h1>\n");
      out.write("       <center>\n");
      out.write("           <form action =\"book.jsp\" method =\"post\" name =\"entry\" onSubmit=\"return validate(this)\">\n");
      out.write("               <input type =\"hidden\" value =\" list \" name=\"action\">\n");
      out.write("               <table border=\"1\" cellpadding =\"0\">\n");
      out.write("                   <tr>\n");
      out.write("                       <td>\n");
      out.write("                           <table>\n");
      out.write("                               <tr>\n");
      out.write("                                   <td colspan=\"2\" align=\"center\">\n");
      out.write("                                       <h2>Book Entry Form</h2>\n");
      out.write("                                   </td>\n");
      out.write("                               </tr>\n");
      out.write("                               <tr>\n");
      out.write("                                   <td colspan=\"2\" >&nbsp;</td>\n");
      out.write("                               </tr>\n");
      out.write("                               <tr>\n");
      out.write("                                   <td>Book Id:</td>\n");
      out.write("                                   <td><input name=\"bookid\" type=\"text\" size=\"10\"</td>\n");
      out.write("                               </tr>\n");
      out.write("                               <tr>\n");
      out.write("                                   <td>Book Name:</td>\n");
      out.write("                                   <td><input name=\"bookname\" type=\"text\" size=\"30\"</td>\n");
      out.write("                               </tr>\n");
      out.write("                               <tr>\n");
      out.write("                                   <td>Author Name:</td>\n");
      out.write("                                   <td><input name=\"authors\" type=\"text\" size=\"20\"</td>\n");
      out.write("                               </tr>\n");
      out.write("                               <tr>\n");
      out.write("                                   <td>Price:</td>\n");
      out.write("                                   <td><input name=\"price\" type=\"text\" size=\"10\"</td>\n");
      out.write("                               </tr>\n");
      out.write("                               <tr>\n");
      out.write("                                   <td>No of Copy:</td>\n");
      out.write("                                   <td><input name=\"nocopy\" type=\"text\" size=\"10\"</td>\n");
      out.write("                               </tr>\n");
      out.write("                               <tr>\n");
      out.write("                                   <td colspan=\"2\" align=\"center\">\n");
      out.write("                                        <input type=\"submit\" value=\"Submit\">\n");
      out.write("                                   </td>\n");
      out.write("                               </tr>\n");
      out.write("                           </table>\n");
      out.write("                       </td>\n");
      out.write("                   </tr>\n");
      out.write("               </table>\n");
      out.write("           </form>\n");
      out.write("       </center>\n");
      out.write("       </body>\n");
      out.write("   </html>\n");
      out.write("   ");
}
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
