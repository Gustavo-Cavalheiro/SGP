<%@page import="sgp.Elogio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    Usuario usuario = (Usuario) session.getAttribute("user");

    // Verificando se usuário está logado e se tem permissões de administrador, caso negativo redireciona para index
    if (usuario == null || usuario.getTipo() != 1) {
        response.sendRedirect(request.getContextPath() + "/index.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>SGP - Elogios</title>
        <link href="../_estilos/default.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <div id="conteudo-container">
            <%@include file="../_templates/header.jsp"%>
            <%@include file="../_templates/menu.jsp"%>
            <div id="containerinterno">
                <span class="sobre">ELOGIOS<img src="../_imagens/sobre.png" alt="" onmouseover="Tip('Permite visualizar todos os elogios cadastrados no sistema')" onmouseout="UnTip()"></span>
                <br><br>
                <form action="" method="post">
                    <span class="secretaria">Pesquisar:</span><br>
                    <input type="text" name="pesquisa" size="40" value="${param.pesquisa}" maxlength="100">
                    <select id="campo" name="campo" class="secretariaobs">
                        <%  String campo = "";
                            if (request.getParameter("campo") != null) campo = request.getParameter("campo");
                        %>
                        <option value="usuario" <%if (campo.equals("usuario")) out.println("selected");%>>Usuário</option>
                        <option value="email" <%if (campo.equals("email")) out.println("selected");%>>E-Mail</option>
                        <option value="cpf" <%if (campo.equals("cpf")) out.println("selected");%>>CPF</option>
                        <option value="secretaria" <%if (campo.equals("secretaria")) out.println("selected");%>>Secretaria</option>
                        <option value="mensagem" <%if (campo.equals("mensagem")) out.println("selected");%>>Mensagem</option>
                    </select>
                    <input type="submit" value="OK"/>
                </form>
                <br>
                <%
                    Elogio elogio = new Elogio();

                    // Deleta elogio caso seja encontrado parâmetro "delete"
                    if (request.getParameter("delete") != null) {
                        elogio.delete(request.getParameter("ID"));
                    }

                    // Mostrando elogios cadastrados no sistema
                    if (request.getParameter("pesquisa") == null) {
                        out.println(elogio.getElogios());
                    } else {
                        String pesquisa = request.getParameter("pesquisa").trim();
                        out.println(elogio.getElogios(pesquisa, campo));
                    }
                %>
            </div>
            <%@include file="../_templates/footer.jsp"%>
        </div>
    </body>
</html>