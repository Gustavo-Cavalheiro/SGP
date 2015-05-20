<%@page import="java.sql.PreparedStatement"%>
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
        <title>SGP - Usuários Cadastrados</title>
        <link href="../_estilos/default.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <div id="conteudo-container">
            <%@include file="../_templates/header.jsp"%>
            <%@include file="../_templates/menu.jsp"%>
            <div id="containerinterno">
                <span class="sobre">USUÁRIOS CADASTRADOS<img src="../_imagens/sobre.png" alt="" onmouseover="Tip('Permite visualizar, alterar e excluir usuários cadastrados no sistema')" onmouseout="UnTip()"></span>
                <br><br>
                <form action="" method="post">
                    <span class="secretaria">Pesquisar:</span><br>
                    <input type="text" name="pesquisa" size="40" value="${param.pesquisa}"/>
                    <select id="campo" name="campo" class="secretariaobs">
                        <%
                            String campo = "";
                            if (request.getParameter("campo") != null) campo = request.getParameter("campo");
                        %>
                        <option value="nome" <%if (campo.equals("nome")) out.println("selected");%>>Nome</option>
                        <option value="sobrenome" <%if (campo.equals("sobrenome")) out.println("selected");%>>Sobrenome</option>
                        <option value="email" <%if (campo.equals("email")) out.println("selected");%>>E-Mail</option>
                        <option value="cpf" <%if (campo.equals("cpf")) out.println("selected");%>>CPF</option>
                        <option value="tipo" <%if (campo.equals("tipo")) out.println("selected");%>>Tipo de Usuário</option>
                    </select>
                    <input type="submit" value="OK"/>
                </form>
                <br>
                <%
                    // Deleta usuário caso seja encontrado parâmetro "delete" e "id"
                    if (request.getParameter("delete") != null) {
                        try {
                            Conexao.executeStatement("DELETE FROM USUARIOS WHERE ID = " + request.getParameter("ID"));
                        } catch (Exception ex) {
                            out.println("<span style='color:red;'>" + ex.getLocalizedMessage() + "</span>");
                        }
                    }

                    // Executando query que retorna os usuários cadastrados no sistema
                    String texto = "";
                    try {
                        String SQL = "SELECT u.ID, u.NOME, u.SOBRENOME, u.EMAIL, u.CPF, u.ENDERECO, u.NUMERO, u.COMPLEMENTO, "
                                + "u.CEP, u.BAIRRO, u.CIDADE, e.SIGLA, u.TELEFONE, u.CELULAR, t.TIPO, u.DATA_REGISTRO "
                                + "FROM USUARIOS u JOIN ESTADOS e ON(u.ESTADO = e.ID) "
                                + "JOIN TIPO_USUARIO t ON (u.TIPO = t.ID)";

                        if (request.getParameter("pesquisa") != null) {
                            String pesquisa = request.getParameter("pesquisa");
                            if (campo.equals("tipo")) {
                                SQL += " WHERE UPPER(u.TIPO) LIKE UPPER('%" + pesquisa + "%') OR UPPER(t.TIPO) LIKE UPPER('%" + pesquisa + "%')";
                            } else {
                                SQL += " WHERE UPPER(u." + campo + ") LIKE UPPER('%" + pesquisa + "%')";
                            }
                        }
                        SQL += " ORDER BY u.ID";

                        ArrayList<Object[]> result = Conexao.getQuery(SQL);
                        if (result.size() > 0) {
                            texto += "<table class='tabela'>";
                            texto += "<th></th><th></th>"
                                    + "<th>ID</th> <th>NOME</th> <th>SOBRENOME</th> <th>E-MAIL</th> <th>CPF</th>"
                                    + "<th>TIPO</th>";
                            for (Object[] reg : result) {
                                Date date = (Date) reg[15];
                                texto += "<tr>";
                                texto += "<td><a href='?delete&ID=" + reg[0] + "'><img src='../_imagens/excluir.png' alt='excluir' onmouseover='Tip(\"Excluir\")' onmouseout='UnTip()'></a></td>";
                                texto += "<td><a href='alterar_usuario.jsp?ID=" + reg[0] + "'><img src='../_imagens/editar.png' alt='editar' onmouseover='Tip(\"Editar\")' onmouseout='UnTip()'></a></td>";
                                texto += "<td>" + reg[0] + "</td>";
                                texto += "<td>" + reg[1] + "</td>";
                                texto += "<td>" + reg[2] + "</td>";
                                texto += "<td>" + reg[3] + "</td>";
                                texto += "<td>" + reg[4] + "</td>";
                                texto += "<td>" + reg[14] + "</td>";
                                texto += "</tr>";
                            }
                            texto += "</table>";
                        } else {
                            if (request.getParameter("pesquisa") != null) {
                                texto = "<span class='secretariaobs'><b>Não existem resultados que satisfaçam a pesquisa.</b></span><br>";
                            } else {
                                texto = "<span class='secretariaobs'><b>Não existem usuários cadastrados no sistema.</b></span><br>";
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