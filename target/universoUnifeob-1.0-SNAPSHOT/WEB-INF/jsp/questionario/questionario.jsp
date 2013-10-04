<%-- 
    Document   : questionario.jsp
    Created on : Oct 3, 2013, 10:19:06 PM
    Author     : osvaldogusmao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Olá ${nome}</h1>
        
        <h3>Perguntas</h3>
        
        <c:forEach items="${perguntas}" var="pergunta">
            ${pergunta.descricao}
        </c:forEach>

    </body>
</html>
