<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    Usuario usuario = (Usuario) session.getAttribute("user");

    // Verificando se usuário já está logado, caso positivo redireciona para index
    if (usuario != null) {
        response.sendRedirect(request.getContextPath());
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>SGP - Login</title>
        <link href="_estilos/default.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <div id="conteudo-container">
            <%@include file="_templates/header.jsp"%>
            <%@include file="_templates/menu.jsp"%>
            <div id="containerinterno">
                <span class="sobre">EFETUAR LOGIN<img src="_imagens/sobre.png" alt="" onmouseover="Tip('Entre com seu nome de usuário e senha para ter acesso aos serviços oferecidos pelo site.')" onmouseout="UnTip()"></span>
                <br><br>
                <%@include file="_templates/login.jsp"%>
            </div>
            <%@include file="_templates/footer.jsp"%>
        </div>
    </body>
</html>