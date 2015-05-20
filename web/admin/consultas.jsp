<%@page import="br.com.sgp.Conexao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");
    // Verificando se usuário está logado e se tem permissões de administrador, caso negativo redireciona para index
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
                <form action="" method="post">
                    <span class="secretaria">Pesquisar:</span><br>
                    <input type="text" name="pesquisa" size="40" value="${param.pesquisa}"/>
                    <select id="campo" name="campo" class="secretariaobs">
                        <%
                            String campo = "";
                            if (request.getParameter("campo") != null) campo = request.getParameter("campo");
                        %>
                        <option value="usuario" <%if (campo.equals("usuario")) out.println("selected");%>>Usuário</option>
                        <option value="email" <%if (campo.equals("email")) out.println("selected");%>>E-Mail</option>
                        <option value="cpf" <%if (campo.equals("cpf")) out.println("selected");%>>CPF</option>
                        <option value="secretaria" <%if (campo.equals("secretaria")) out.println("selected");%>>Secretaria</option>
                        <option value="assunto" <%if (campo.equals("assunto")) out.println("selected");%>>Assunto</option>
                    </select>
                    <input type="submit" value="OK"/>
                </form>
                <br>
                <%
                    // Deleta CONSULTA caso seja encontrado parâmetro "delete" e "id"
                    if (request.getParameter("delete") != null) {
                        try {
                            Conexao.executeStatement("DELETE FROM CONSULTAS WHERE ID = " + request.getParameter("ID"));
                        } catch (Exception ex) {
                            out.println("<span style='color:red;'>" + ex.getLocalizedMessage() + "</span>");
                        }
                    }
                    // Executando query que retorna as consultas agendadas cadastradas no sistema
                    String texto = "";
                    try {
                        String SQL = "SELECT c.ID, CONCAT(u.NOME,' ',u.SOBRENOME), u.EMAIL, u.CPF, s.NOME, c.ASSUNTO, c.DATA_PEDIDO, c.DATA_AGENDADA "
                                + "FROM CONSULTAS c JOIN USUARIOS u ON (c.USUARIO = u.ID) "
                                + "JOIN SECRETARIAS s ON (c.SECRETARIA = s.ID)";

                        if (request.getParameter("pesquisa") != null) {
                            String pesquisa = request.getParameter("pesquisa");
                            if (campo.equals("usuario")) {
                                SQL += " WHERE UPPER(u.NOME) LIKE UPPER('%" + pesquisa + "%') OR UPPER(u.SOBRENOME) LIKE UPPER('%" + pesquisa + "%')";
                            } else if (campo.equals("email")) {
                                SQL += " WHERE UPPER(u.EMAIL) LIKE UPPER('%" + pesquisa + "%')";
                            } else if (campo.equals("cpf")) {
                                SQL += " WHERE UPPER(u.CPF) LIKE UPPER('%" + pesquisa + "%')";
                            } else if (campo.equals("secretaria")) {
                                SQL += " WHERE UPPER(s.NOME) LIKE UPPER('%" + pesquisa + "%')";
                            } else if (campo.equals("assunto")) {
                                SQL += " WHERE UPPER(c.ASSUNTO) LIKE UPPER('%" + pesquisa + "%')";
                            }
                        }
                        SQL += " ORDER BY c.ID";

                        ArrayList<Object[]> result = Conexao.getQuery(SQL);
                        if (result.size() > 0) {
                            texto += "<table class='tabela'>";
                            texto += "<th></th><th></th>"
                                    + "<th>USUÁRIO</th> <th>E-MAIL</th> <th>CPF</th> <th>SECRETARIA</th> "
                                    + "<th>ASSUNTO</th> <th>DATA AGENDADA</th>";
                            for (Object[] reg : result) {
                                Date date = (Date) reg[6];
                                texto += "<tr>";
                                texto += "<td><a href='?delete&ID=" + reg[0] + "'><img src='../_imagens/excluir.png' alt='excluir' onmouseover='Tip(\"Excluir\")' onmouseout='UnTip()'></a></td>";
                                texto += "<td><a href='editar_consulta.jsp?ID=" + reg[0] + "'><img src='../_imagens/editar.png' alt='editar' onmouseover='Tip(\"Editar\")' onmouseout='UnTip()'></a></td>";
                                texto += "<td>" + reg[1] + "</td>";
                                texto += "<td>" + reg[2] + "</td>";
                                texto += "<td>" + reg[3] + "</td>";
                                texto += "<td>" + reg[4] + "</td>";
                                texto += "<td>" + reg[5] + "</td>";
                                texto += "<td>" + reg[7] + "</td>";
                                texto += "</tr>";
                            }
                            texto += "</table>";
                        } else {
                            if (request.getParameter("pesquisa") != null) {
                                texto = "<span class='secretariaobs'><b>Não existem resultados que satisfaçam a pesquisa.</b></span><br>";
                            } else {
                                texto = "<span class='secretariaobs'><b>Não existem consultas agendadas no sistema.</b></span><br>";
                            }
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