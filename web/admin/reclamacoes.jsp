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
        <title>SGP - Reclamações</title>
        <link href="../_estilos/default.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <div id="conteudo-container">
            <%@include file="../_templates/header.jsp"%>
            <%@include file="../_templates/menu.jsp"%>
            <div id="containerinterno">
                <span class="sobre">RECLAMAÇÕES<img src="../_imagens/sobre.png" alt="" onmouseover="Tip('Permite visualizar todas as reclamações cadastradas no sistema')" onmouseout="UnTip()"></span>
                <br><br>    
                <%
                    
                    if (request.getParameter("delete") != null) {
                        try {
                            Conexao.executeStatement("DELETE FROM RECLAMACOES WHERE ID = " + request.getParameter("ID"));
                        } catch (Exception ex) {
                            out.println("<span style='color:red;'>" + ex.getLocalizedMessage() + "</span>");
                        }
                    }
                
                    String texto = "";
                    try {
                        String SQL = "SELECT r.ID, CONCAT(u.NOME,' ',u.SOBRENOME), u.EMAIL, u.CPF, s.NOME, r.MENSAGEM, r.DATA "
                                + "FROM RECLAMACOES r JOIN USUARIOS u ON (r.USUARIO = u.ID) "
                                + "JOIN SECRETARIAS s ON (r.SECRETARIA = s.ID) ORDER BY r.ID";
                        ArrayList<Object[]> result = Conexao.getQuery(SQL);
                        if (result.size() > 0) {
                            texto += "<table class='tabela'>";
                            texto += "<th></th><th></th>";
                            texto += "<th>USUÁRIO</th> <th>E-MAIL</th> <th>CPF</th> <th>SECRETARIA</th> <th>MENSAGEM</th> <th>DATA DA RECLAMAÇÃO</th>";
                            for (Object[] reg : result) {
                                Date date = (Date) reg[6];
                                texto += "<tr>";
                                texto += "<td><a href='?delete&ID=" + reg[0] + "'><img src='../_imagens/excluir.png' alt='excluir' onmouseover='Tip(\"Excluir\")' onmouseout='UnTip()'></a></td>";
                                texto += "<td><a href='editar_reclamacao.jsp?ID=" + reg[0] + "'><img src='../_imagens/editar.png' alt='editar' onmouseover='Tip(\"Editar\")' onmouseout='UnTip()'></a></td>";
                                texto += "<td>" + reg[1] + "</td>";
                                texto += "<td>" + reg[2] + "</td>";
                                texto += "<td>" + reg[3] + "</td>";
                                texto += "<td>" + reg[4] + "</td>";
                                texto += "<td>" + reg[5] + "</td>";
                                texto += "<td>" + date.toLocaleString() + "</td>";
                                texto += "</tr>";
                            }
                            texto += "</table>";
                        } else {
                            texto = "<span class='secretariaobs'><b>Não existem reclamações cadastradas no sistema.</b></span><br>";
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