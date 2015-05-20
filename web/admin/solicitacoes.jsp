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
        <title>SGP - Solicitações de Serviços</title>
        <link href="../_estilos/default.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <div id="conteudo-container">
            <%@include file="../_templates/header.jsp"%>
            <%@include file="../_templates/menu.jsp"%>
            <div id="containerinterno">
                <span class="sobre">SOLICITAÇÕES DE SERVIÇOS<img src="../_imagens/sobre.png" alt="" onmouseover="Tip('Permite visualizar todas as solicitações cadastradas no sistema')" onmouseout="UnTip()"></span>
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
                        <option value="servico" <%if (campo.equals("servico")) out.println("selected");%>>Serviço</option>
                        <option value="endereco" <%if (campo.equals("endereco")) out.println("selected");%>>Endereço</option>
                        <option value="informacoes" <%if (campo.equals("informacoes")) out.println("selected");%>>Informações</option>
                    </select>
                    <input type="submit" value="OK"/>
                </form>
                <br>
                <%
                    if (request.getParameter("delete") != null) {
                        try {
                            Conexao.executeStatement("DELETE FROM SOLICITACOES WHERE ID = " + request.getParameter("ID"));
                        } catch (Exception ex) {
                            out.println("<span style='color:red;'>" + ex.getLocalizedMessage() + "</span>");
                        }
                    }

                    String texto = "";
                    try {
                        String SQL = "SELECT so.ID, CONCAT(u.NOME,' ',u.SOBRENOME), u.EMAIL, u.CPF, se.TIPO, so.ENDERECO, so.INFO_ADICIONAL, so.DATA "
                                + "FROM SOLICITACOES so JOIN USUARIOS u ON (so.USUARIO = u.ID) "
                                + "JOIN SERVICOS se ON (so.SERVICO = se.ID)";

                        if (request.getParameter("pesquisa") != null) {
                            String pesquisa = request.getParameter("pesquisa");
                            if (campo.equals("usuario")) {
                                SQL += " WHERE UPPER(u.NOME) LIKE UPPER('%" + pesquisa + "%') OR UPPER(u.SOBRENOME) LIKE UPPER('%" + pesquisa + "%')";
                            } else if (campo.equals("email")) {
                                SQL += " WHERE UPPER(u.EMAIL) LIKE UPPER('%" + pesquisa + "%')";
                            } else if (campo.equals("servico")) {
                                SQL += " WHERE UPPER(se.TIPO) LIKE UPPER('%" + pesquisa + "%')";
                            } else if (campo.equals("endereco")) {
                                SQL += " WHERE UPPER(so.ENDERECO) LIKE UPPER('%" + pesquisa + "%')";
                            } else if (campo.equals("informacoes")) {
                                SQL += " WHERE UPPER(so.INFO_ADICIONAL) LIKE UPPER('%" + pesquisa + "%')";
                            }
                        }
                        SQL += " ORDER BY so.ID";

                        ArrayList<Object[]> result = Conexao.getQuery(SQL);
                        if (result.size() > 0) {
                            texto += "<table class='tabela'>";
                            texto += "<th></th><th></th>";
                            texto += "<th>USUÁRIO</th> <th>E-MAIL</th> <th>SERVICO</th> "
                                    + "<th>ENDERECO</th> <th>INFORMAÇÕES</th> <th>DATA DA SOLICITAÇÃO</th>";
                            for (Object[] reg : result) {
                                Date date = (Date) reg[7];
                                texto += "<tr>";
                                texto += "<td><a href='?delete&ID=" + reg[0] + "'><img src='../_imagens/excluir.png' alt='excluir' onmouseover='Tip(\"Excluir\")' onmouseout='UnTip()'></a></td>";
                                texto += "<td><a href='editar_solicitacao.jsp?ID=" + reg[0] + "'><img src='../_imagens/editar.png' alt='editar' onmouseover='Tip(\"Editar\")' onmouseout='UnTip()'></a></td>";
                                texto += "<td>" + reg[1] + "</td>";
                                texto += "<td>" + reg[2] + "</td>";
                                texto += "<td>" + reg[4] + "</td>";
                                texto += "<td>" + reg[5] + "</td>";
                                texto += "<td>" + reg[6] + "</td>";
                                texto += "<td>" + date.toLocaleString() + "</td>";
                                texto += "</tr>";
                            }
                            texto += "</table>";
                        } else {
                            if (request.getParameter("pesquisa") != null) {
                                texto = "<span class='secretariaobs'><b>Não existem resultados que satisfaçam a pesquisa.</b></span><br>";
                            } else {
                                texto = "<span class='secretariaobs'><b>Não existem solicitações cadastradas no sistema.</b></span><br>";
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