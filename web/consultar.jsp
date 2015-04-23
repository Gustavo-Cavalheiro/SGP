<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                    if (session.getAttribute("username") == null) {
                %>
                <div class="texto">Efetue login para ter acesso ao seu histórico de pedidos, consultas, elogios e reclamações.</div><br>
                <%@include file="_templates/login.jsp"%>
                <%} else {%>
                <span class="secretariaobs">Nome: </span><br>
                <input type='text' size='59' class='secretariaobs' name='nome' readonly value='<%= session.getAttribute("username")%>'><br>
                <p class="secretariaobs">Não é você? <span class="link"><a href="?logoff">Clique aqui.</a></span></p><br>
                <span class="sobre">Serviços solicitados:</span><br>
                <%
                    // Resgatando histórico de solicitações de serviços do usuário
                    String texto = "";
                    try {
                        String SQL = "SELECT se.TIPO, so.ENDERECO, so.INFO_ADICIONAL, so.DATA FROM SOLICITACOES so JOIN SERVICOS se ON(so.SERVICO = se.ID) WHERE so.USUARIO=" + session.getAttribute("id") + " ORDER BY so.ID";
                        ArrayList<Object[]> result = Conexao.getQuery(SQL);
                        if (result.size() > 0) {
                            texto += "<table class='tabela'>";
                            texto += "<th class='tabela'>Tipo de Serviço</th><th class='tabela'>Endereço</th><th class='tabela'>Informação Adicional</th><th class='tabela'>Data da Solicitação</th>";
                            for (Object[] reg : result) {
                                Date date = (Date) reg[3];
                                texto += "<tr>";
                                texto += "<td>" + reg[0] + "</td>";
                                texto += "<td>" + reg[1] + "</td>";
                                texto += "<td>" + reg[2] + "</td>";
                                texto += "<td>" + date.toLocaleString() + "</td>";
                                texto += "</tr>";
                            }
                            texto += "</table>";
                        } else {
                            texto = "<span class='secretariaobs'> <b>Você não solicitou serviços.</b></span><br>";
                        }
                    } catch (Exception ex) {
                        texto = "<span style='color:red;'>" + ex.getLocalizedMessage() + "</span>";
                    }
                    out.println(texto);
                %>
                <br>
                <span class="sobre">Consultas marcadas:</span><br>
                <%
                    // Resgatando histórico de consultas agendadas pelo usuário
                    texto = "";
                    try {
                        String SQL = "SELECT s.NOME, c.ASSUNTO, c.DATA_PEDIDO, c.DATA_AGENDADA FROM CONSULTAS c JOIN SECRETARIAS s ON(c.SECRETARIA = s.ID) WHERE c.USUARIO=" + session.getAttribute("id") + " ORDER BY c.ID";
                        ArrayList<Object[]> result = Conexao.getQuery(SQL);
                        if (result.size() > 0) {
                            texto += "<table class='tabela'>";
                            texto += "<th class='tabela'>Secretaria</th><th class='tabela'>Assunto</th><th class='tabela'>Data da Solicitação</th><th class='tabela'>Data Agendada</th>";
                            for (Object[] reg : result) {
                                Date date = (Date) reg[2];
                                texto += "<tr>";
                                texto += "<td>" + reg[0] + "</td>";
                                texto += "<td>" + reg[1] + "</td>";
                                texto += "<td>" + date.toLocaleString() + "</td>";
                                texto += "<td>" + reg[3] + "</td>";
                                texto += "</tr>";
                            }
                            texto += "</table>";
                        } else {
                            texto = "<span class='secretariaobs'><b>Você não possui consultas marcadas.</b></span><br>";
                        }
                    } catch (Exception ex) {
                        texto = "<span style='color:red;'>" + ex.getLocalizedMessage() + "</span>";
                    }
                    out.println(texto);
                %>
                <br>
                <span class="sobre">Últimas reclamações:</span><br>
                <%
                    // Resgatando histórico de reclamações realizadas pelo usuário
                    texto = "";
                    try {
                        String SQL = "SELECT s.NOME, r.MENSAGEM, r.DATA FROM RECLAMACOES r JOIN SECRETARIAS s ON(r.SECRETARIA = s.ID) WHERE r.USUARIO=" + session.getAttribute("id") + " ORDER BY r.ID";
                        ArrayList<Object[]> result = Conexao.getQuery(SQL);
                        if (result.size() > 0) {
                            texto += "<table class='tabela'>";
                            texto += "<th class='tabela'>Secretaria</th><th class='tabela'>Mensagem</th><th class='tabela'>Data da Reclamação</th>";
                            for (Object[] reg : result) {
                                Date date = (Date) reg[2];
                                texto += "<tr>";
                                texto += "<td>" + reg[0] + "</td>";
                                texto += "<td>" + reg[1] + "</td>";
                                texto += "<td>" + date.toLocaleString() + "</td>";
                                texto += "</tr>";
                            }
                            texto += "</table>";
                        } else {
                            texto = "<span class='secretariaobs'><b>Você não possui reclamações cadastradas.</b></span><br>";
                        }
                    } catch (Exception ex) {
                        texto = "<span style='color:red;'>" + ex.getLocalizedMessage() + "</span>";
                    }
                    out.println(texto);
                %>
                <br>
                <span class="sobre">Últimos elogios:</span><br>
                <%
                    // Resgatando histórico de elogios realizados pelo usuário
                    texto = "";
                    try {
                        String SQL = "SELECT s.NOME, e.MENSAGEM, e.DATA FROM ELOGIOS e JOIN SECRETARIAS s ON(e.SECRETARIA = s.ID) WHERE e.USUARIO=" + session.getAttribute("id") + " ORDER BY e.ID";
                        ArrayList<Object[]> result = Conexao.getQuery(SQL);
                        if (result.size() > 0) {
                            texto += "<table class='tabela'>";
                            texto += "<th class='tabela'>Secretaria</th><th class='tabela'>Mensagem</th><th class='tabela'>Data do Elogio</th>";
                            for (Object[] reg : result) {
                                Date date = (Date) reg[2];
                                texto += "<tr>";
                                texto += "<td>" + reg[0] + "</td>";
                                texto += "<td>" + reg[1] + "</td>";
                                texto += "<td>" + date.toLocaleString() + "</td>";
                                texto += "</tr>";
                            }
                            texto += "</table>";
                        } else {
                            texto = "<span class='secretariaobs'><b>Você não possui elogios cadastrados.</b></span><br>";
                        }
                    } catch (Exception ex) {
                        texto = "<span style='color:red;'>" + ex.getLocalizedMessage() + "</span>";
                    }
                    out.println(texto);
                %>
                <br>
                <%}%>
            </div>
            <%@include file="_templates/footer.jsp"%>
        </div>
    </body>
</html>