/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.90
 * Generated at: 2023-07-25 21:39:04 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("java.sql");
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET, POST or HEAD. Jasper also permits OPTIONS");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\n");
      out.write("<html>\n");
      out.write("    <style>\n");
      out.write("      div \n");
      out.write("      {\n");
      out.write("         background-color: #fdebb5;\n");
      out.write("         border-width: 50px;\n");
      out.write("         border-style: solid;\n");
      out.write("         border-color: #ea8607;\n");
      out.write("         margin: 20px;\n");
      out.write("      }\n");
      out.write("      h1\n");
      out.write("      {\n");
      out.write("         font-size: 80px;\n");
      out.write("         font-family: Jockey One;\n");
      out.write("      }\n");
      out.write("      form\n");
      out.write("      {\n");
      out.write("         font-size: 30px;\n");
      out.write("         font-family: Jockey One;\n");
      out.write("      }\n");
      out.write("      a\n");
      out.write("      {\n");
      out.write("         font-size: 30px;\n");
      out.write("         font-family: Jockey One;\n");
      out.write("         background-color: #ea8607;\n");
      out.write("         box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);\n");
      out.write("      }\n");
      out.write("      label\n");
      out.write("      {\n");
      out.write("        font-size: 30px;\n");
      out.write("        font-family: Jockey One;\n");
      out.write("      }\n");
      out.write("    </style>\n");
      out.write("    <head>\n");
      out.write("	   <title>User Login</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <center>\n");
      out.write("            <div>\n");
      out.write("                <h1>\n");
      out.write("            ");

                String profile = request.getParameter("profile");
                String zip = request.getParameter("zip");
                String db = "cs157aprojectteam6";
                String user; // assumes database name is the same as username
                    user = "root";
                String password = "Halo4mlg!"; //Change password if needed

                try
                {  
                    java.sql.Connection con; 
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157aprojectteam6?autoReconnect=true&useSSL=false",user, password);
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM User WHERE profileName = '" + profile + "'");
                    if (rs.next()) 
                    {
                    	if(rs.getString(3).equals(zip))
                    	{
                    		out.println("Welcome " + profile);
                    	}
                    }
                    else
                    {
                        out.println("Invalid profile name");
                    }
                    rs.close();
                    stmt.close();
                    con.close();
                } 
                catch(SQLException e) { 
                    out.println("SQLException caught: " + e.getMessage()); 
                }
        	
      out.write("\n");
      out.write("                </h1>\n");
      out.write("        	<br>\n");
      out.write("        	   <a href=\"search.html\">Search</a><br><br>\n");
      out.write("        	   <a href=\"watchlist.jsp\">WatchList</a><br><br>\n");
      out.write("            </div>\n");
      out.write("        </center>\n");
      out.write("	</body>\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}