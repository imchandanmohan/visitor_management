<%@ page import="java.sql.*" %>
<% Class.forName("sun.jdbc.odbc.JdbcOdbcDriver"); %>

<HTML>
    <HEAD>
        <TITLE>Fetching Data From a Database</TITLE>
    </HEAD>

    <BODY>
        <H1>Fetching Data From a Database</H1>

        <% 
            Connection connection = DriverManager.getConnection(
                "jdbc:odbc:data", "YourName", "password");

            Statement statement = connection.createStatement();

            String id = request.getParameter("id");  

            ResultSet resultset = 
                statement.executeQuery("select * from parent where sl_no = '" + id + "'") ; 

            if(!resultset.next()) {
                out.println("Sorry, could not find that publisher. ");
            } else {
        %>

        <TABLE BORDER="1">
            <TR>
               <TH>ID</TH>
               <TH>Name</TH>
               <TH>City</TH>
               <TH>State</TH>
               <TH>Country</TH>
           </TR>
           <TR>
               <TD> <%= resultset.getString(1) %> </TD>
               <TD> <%= resultset.getString(2) %> </TD>
               <TD> <%= resultset.getString(3) %> </TD>
               <TD> <%= resultset.getString(4) %> </TD>
               <TD> <%= resultset.getString(5) %> </TD>
           </TR>
       </TABLE>
       <BR>
       <% 
           } 
       %>
    </BODY>
</HTML>
