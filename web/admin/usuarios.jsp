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
                    <input type="text" name="pesquisa" size="40"  value="${param.pesquisa}" maxlength="100">
                    <select id="campo" name="campo" class="secretariaobs">
                        <%  String campo = "";
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
                <%  // Deleta usuário caso seja encontrado parâmetro "delete"
                    if (request.getParameter("delete") != null) {
                        try {
                            int id = Integer.parseInt(request.getParameter("ID"));
                            usuario.delete(id);
                        } catch (NumberFormatException ex) {
                        } catch (Exception ex) {
                            out.println("<span style='color:red;'>" + ex.getLocalizedMessage() + "</span><br><br>");
                        }
                    }

                    // Mostrando usuários cadastrados no sistema
                    if (request.getParameter("pesquisa") == null) {
                        out.println(usuario.getUsuarios());
                    } else {
                        String pesquisa = request.getParameter("pesquisa").trim();
                        out.println(usuario.getUsuarios(pesquisa, campo));
                    }
                %>
            </div>
            <%@include file="../_templates/footer.jsp"%>
        </div>
    </body>
</html>