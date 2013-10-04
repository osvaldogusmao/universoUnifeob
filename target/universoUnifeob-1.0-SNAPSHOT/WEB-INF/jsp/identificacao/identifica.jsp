<%-- 
    Document   : identifica
    Created on : Oct 3, 2013, 9:38:21 PM
    Author     : osvaldogusmao
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <form action='<c:url value="/identificacao/iniciar"></c:url>' method="post">
            
            <input type="text" name="nome" id="nome"/>
            
            <input type="submit" value="Entrar"/>
            
        </form>
    </body>
</html>
