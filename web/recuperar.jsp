<%@page import="sgp.Email"%>
<%@page import="sgp.Validacoes"%>
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
            <script type="text/javascript" src="_scripts/script.js"></script>
            <div id="containerinterno">
                <span class="sobre">RECUPERAR SENHA<img src="_imagens/sobre.png" alt="" onmouseover="Tip('Esqueceu sua senha? Digite seu e-mail ou CPF para recuperar.')" onmouseout="UnTip()"></span>
                <br><br>
                <%  if (request.getParameter("recuperar") != null && !request.getParameter("recuperar").equals("")) {
                        String email = request.getParameter("recuperar").trim();
                        String voltar = "/recuperar.jsp";
                        if (!Validacoes.validaEmail(email)) {
                            out.println("<span style='color:red'>O e-mail informado é invalido.</span><br><br>");
                        } else if (Usuario.verificaEmail(email)) {
                            try {
                                Email.send(email, Usuario.getSenha(email));
                                out.println("<span style='color:red'>Você receberá um e-mail com instruções para gerar uma nova senha.</span><br><br>");
                                voltar = "/login.jsp";
                            } catch (Exception ex) {
                                out.println("<span style='color:red'>Desculpe, houve um problema ao tentar recuperar sua senha. Por favor tente novamente mais tarde.</span><br><br>");
                            }
                        } else {
                            out.println("<span style='color:red'>Não existe nenhum usuário cadastrado com o e-mail informado.</span><br><br>");
                        }
                        out.println("<form action='" + request.getContextPath() + voltar + "'>");
                        out.println("<input type='submit' class='botao' value='Voltar'>");
                        out.println("</form>");
                    } else {
                %>
                <form method="post" action="">
                    <span class="secretariaobs">Informe seu e-mail: </span><br>
                    <input type="text" size="57" name="recuperar"  title="Insira o seu e-mail" onkeypress="return mascaraEmail(this, event);" maxlength="50"><br><br>
                    <input type="submit" class="botao" value="Continuar">
                    <input type="reset" class="botao" value="Limpar">
                </form>
                <%}%>
            </div>
            <%@include file="_templates/footer.jsp"%>
        </div>
    </body>
</html>