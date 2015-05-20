<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>SGP - Recuperar Senha</title>
        <link href="_estilos/default.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <div id="conteudo-container">
            <%@include file="_templates/header.jsp"%>
            <%@include file="_templates/menu.jsp"%>
            <div id="containerinterno">
                <span class="sobre">RECUPERAR SENHA<img src="IMG/sobre.png" alt="" onmouseover="Tip('Esqueceu sua senha? Digite seu e-mail ou CPF para recuperar.')" onmouseout="UnTip()"></span>
                <br><br>
                <%if (request.getParameter("recuperar") != null) {%>
                <span style="color:red">Você receberá um e-mail com instruções para gerar uma nova senha.</span>
                <%} else {%>
                <form method="POST" action="">
                    <span class="secretariaobs">Informe seu e-mail ou seu CPF: </span><br>
                    <input type="text" size="57" name="recuperar"  title="Insira o seu e-mail ou seu CPF"><br><br>
                    <input type="submit" class="botao" value="Continuar">
                    <input type="reset" class="botao" value="Limpar">
                </form>
                <%}%>
            </div>
            <%@include file="_templates/footer.jsp"%>
        </div>
    </body>
</html>