<%-- 
    Document   : questionario.jsp
    Created on : Oct 3, 2013, 10:19:06 PM
    Author     : osvaldogusmao
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link rel="stylesheet" media="screen" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css"/>
        <script src="/universoUnifeob/bootstrap/js/jquery.min.js" ></script>
        <script src="/universoUnifeob/bootstrap/js/bootstrap.js" ></script>

    </head>
    <body>
        <h1>Olá ${nome}</h1>

        <h3>Perguntas</h3>

        <c:forEach items="${perguntas}" var="pergunta">

            <form action="#" method="post" id="frm_${pergunta.id}">

                ${pergunta.descricao} <br/>
                <div id="msg_${pergunta.id}" class="msg"></div>
                <c:forEach items="${pergunta.opcoes}" var="opcao">
                    <p>
                        <input type="radio" name="perguntaOpcao_${pergunta.id}" id="${opcao.id}" value="${opcao.correta}"/> ${opcao.descricao}
                    </p>
                </c:forEach>

                <input type="button" value="Enviar" class="btn btn-success envia" id="${pergunta.id}"/>

            </form>
            <hr/>
        </c:forEach>

        <script type="text/javascript">

            $(document).ready(function() {

                $('.msg').hide();

                $('.envia').click(function() {

                    var idPergunta = $(this).attr('id');

                    var opcaoId = $('#frm_' + idPergunta + ' input[type="radio"]:checked').attr('id');

                    var opcaoEscolhida = $('#frm_' + idPergunta + ' input[type="radio"]:checked').val();

                    var url = "/universoUnifeob/questionario/salva/" + idPergunta + '/' + opcaoId + '/' + opcaoEscolhida;

                    var botao = $(this);

                    $.ajax({
                        method: 'GET',
                        url: url
                    }).success(function(result) {

                        if (result === 'RESPONDIDA') {
                            botao.attr('disabled', 'disabled');
                            $('#msg_' + idPergunta).html('Pergunta já respondida pelo oponente');
                            $('#frm_' + idPergunta + ' input[type="radio"]').attr('disabled', 'disabled');
                            $('#msg_' + idPergunta).fadeIn('fast');
                        } else if (result === 'PONTO') {
                            if (opcaoEscolhida === 'true') {
                                botao.attr('disabled', 'disabled');
                                $('#msg_' + idPergunta).html('Parabéns, você acertou!');
                                $('#frm_' + idPergunta + ' input[type="radio"]').attr('disabled', 'disabled');
                                $('#msg_' + idPergunta).fadeIn('fast');
                            } else {
                                botao.attr('disabled', 'disabled');
                                $('#msg_' + idPergunta).html('Que pena, você errou!');
                                $('#frm_' + idPergunta + ' input[type="radio"]').attr('disabled', 'disabled');
                                $('#msg_' + idPergunta).fadeIn('fast');
                            }
                        } else if (result === 'ERROR') {
                            alert('Erro ao responder, tente novamente');
                        }

                    }).fail(function() {
                        alert("Error");
                    });
                });


            });

        </script>


    </body>
</html>
