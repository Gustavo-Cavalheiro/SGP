<%@page import="br.com.sgp.Conexao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% // Verificando se usuário está logado e se tem permissões de administrador, caso negativo redireciona para index
    if (session.getAttribute("username") == null || session.getAttribute("tipo") == null || !session.getAttribute("tipo").toString().equals("1")) {
        response.sendRedirect(request.getContextPath());
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>SGP - Consultas Marcadas</title>
        <link href="../_estilos/default.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <div id="conteudo-container">
            <%@include file="../_templates/header.jsp"%>
            <%@include file="../_templates/menu.jsp"%>
            <div id="containerinterno">
                <span class="sobre">CONSULTAS MARCADAS<img src="../_imagens/sobre.png" alt="" onmouseover="Tip('Permite visualizar todas as consultas agendadas no sistema')" onmouseout="UnTip()"></span>
                <br><br>    
                <%
                    // Executando query que retorna as consultas agendadas cadastradas no sistema
                    String texto = "";
                    try {
                        String SQL = "SELECT c.ID, CONCAT(u.NOME,' ',u.SOBRENOME), u.EMAIL, u.CPF, s.NOME, c.ASSUNTO, c.DATA_PEDIDO, c.DATA_AGENDADA "
                                + "FROM CONSULTAS c JOIN USUARIOS u ON (c.USUARIO = u.ID) "
                                + "JOIN SECRETARIAS s ON (c.SECRETARIA = s.ID) ORDER BY c.ID";
                        ArrayList<Object[]> result = Conexao.getQuery(SQL);
                        if (result.size() > 0) {
                            texto += "<table class='tabela'>";
                            texto += "<th>ID</th> <th>USUÁRIO</th> <th>E-MAIL</th> <th>CPF</th> <th>SECRETARIA</th> "
                                    + "<th>ASSUNTO</th> <th>DATA DA SOLICITAÇÃO</th> <th>DATA AGENDADA</th>";
                            for (Object[] reg : result) {
                                Date date = (Date) reg[6];
                                texto += "<tr>";
                                texto += "<td>" + reg[0] + "</td>";
                                texto += "<td>" + reg[1] + "</td>";
                                texto += "<td>" + reg[2] + "</td>";
                                texto += "<td>" + reg[3] + "</td>";
                                texto += "<td>" + reg[4] + "</td>";
                                texto += "<td>" + reg[5] + "</td>";
                                texto += "<td>" + date.toLocaleString() + "</td>";
                                texto += "<td>" + reg[7] + "</td>";
                                texto += "</tr>";
                            }
                            texto += "</table>";
                        } else {
                            texto = "<span class='secretariaobs'><b>Não existem consultas agendadas no sistema.</b></span><br>";
                        }
                    } catch (Exception ex) {
                        texto = "<span style='color:red;'>" + ex.getLocalizedMessage() + "</span>";
                    }
                    out.println(texto);
                %>
            </div>
            <%@include file="../_templates/footer.jsp"%>
        </div>
    </body>
</html>