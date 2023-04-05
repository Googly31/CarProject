<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ page import="java.sql.*" %>
    <%
    String com = request.getParameter("company");
    String cname = request.getParameter("ncar");
    String mod = request.getParameter("model");
    String type = request.getParameter("typeOf");
    
    ResultSet rs=null;
    Connection con=null;
    PreparedStatement ps=null;
    String query ="insert into cars values(?, ?, ?, ?)";
    try{
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/car_register","root","gagan");
        ps=con.prepareStatement(query);
        ps.setString(1,com);
        ps.setString(2,cname);
        ps.setString(3,mod);
        ps.setString(4,type);
        
        int i=ps.executeUpdate();
        if(i>0){
            out.print("data uploaded successfully");
        }
        else
        {
            out.print("data not uploaded");
        }	
    }catch(Exception e){
        out.print(e);
    }
    %>
</body>
</html>