<%@page import="sgp.Consulta"%>
<%@page import="sgp.Elogio"%>
<%@page import="sgp.Reclamacao"%>
<%@page import="sgp.Solicitacao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    Usuario usuario = (Usuario) session.getAttribute("user");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>SGP - Consultar</title>
        <link href="_estilos/default.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <div id="conteudo-container">
            <%@include file="_templates/header.jsp"%>
            <%@include file="_templates/menu.jsp"%>
            <div id="containerinterno">
                <span class="sobre">CONSULTAR<img src="_imagens/sobre.png" alt="" onmouseover="Tip('Consulte suas últimas reclamações, elogios, consultas e serviços.')" onmouseout="UnTip()"></span>
                <br><br>
                <% // Verificando se usuário está logado, caso negativo oferece opções de login
                    if (usuario == null) {
                %>
                <div class="texto">Efetue login para ter acesso ao seu histórico de pedidos, consultas, elogios e reclamações.</div><br>
                <%@include file="_templates/login.jsp"%>
                <%} else {%>
                <span class="secretariaobs">Nome: </span><br>
                <input type='text' size='59' class='secretariaobs' name='nome' readonly value='<%=usuario.getNome()%>'><br>
                <p class="secretariaobs">Não é você? <span class="link"><a href="?logoff">Clique aqui.</a></span></p><br>
                <span class="sobre">Serviços solicitados:</span><br>
                <%  // Resgatando histórico de solicitações do usuário
                    out.println(Solicitacao.getSolicitacoes(usuario.getId()));
                %>
                <br>
                <span class="sobre">Consultas marcadas:</span><br>
                <%  // Resgatando histórico de consultas agendadas pelo usuário
                    out.println(Consulta.getConsultas(usuario.getId()));
                %>
                <br>
                <span class="sobre">Últimas reclamações:</span><br>
                <%  // Resgatando histórico de reclamações realizadas pelo usuário
                    out.println(Reclamacao.getReclamacoes(usuario.getId()));
                %>
                <br>
                <span class="sobre">Últimos elogios:</span><br>
                <%  // Resgatando histórico de elogios realizados pelo usuário
                    out.println(Elogio.getElogios(usuario.getId()));
                %>
                <br>
                <%}%>
            </div>
            <%@include file="_templates/footer.jsp"%>
        </div>
    </body>
</html>