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
        <title>SGP - Relatórios</title>
        <link href="../_estilos/default.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <div id="conteudo-container">
            <%@include file="../_templates/header.jsp"%>
            <%@include file="../_templates/menu.jsp"%>
            <div id="containerinterno">
                <span class="sobre">RELATÓRIOS<img src="../_imagens/sobre.png" alt="" onmouseover="Tip('Geração de Relatórios.')" onmouseout="UnTip()"></span>
                <div id="conteudointerno">
                    <br>
                    <a href="relatorio?secretarias.pdf" target="_blank" style="color: #FF8000">Relatório: Secretarias</a>
                </div>
            </div>
            <%@include file="../_templates/footer.jsp"%>
        </div>
    </body>
</html>