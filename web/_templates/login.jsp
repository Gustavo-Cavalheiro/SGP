<%@page import="sgp.Usuario"%>
<%
    try {
        // Tenta efetuar o login caso seja encontrado o par�metro "email"
        if (request.getParameter("email") != null) {
            String email = request.getParameter("email").trim();
            String senha = request.getParameter("password");

            // Verificando se o usu�rio est� cadastrado no site atrav�s do e-mail e senha informados
            Usuario user = new Usuario();
            if (user.login(email, senha)) {
                session.setAttribute("user", user);
                // Redereciona para a p�gina anterior com base no parametro "returnto"
                if (request.getParameter("returnto") != null && request.getParameter("returnto") != "") {
                    response.sendRedirect(request.getParameter("returnto"));
                } else {
                    response.sendRedirect(request.getRequestURI());
                }
                return;
            } else {
                // Usu�rio n�o cadastrado, exibindo mensagem de erro
                out.println("<span class='obrigatorio2'>Usu�rio e/ou senha inv�lido(s)!</span><br><br>");
            }
        }
    } catch (Exception ex) {
        out.println("<span class='obrigatorio2'>ERRO: " + ex.getLocalizedMessage() + "</span><br><br>");
    }
%>
<form action="" method="post">
    <span class="secretariaobs">E-mail: </span><input type="text" name="email"><br><br>
    <span class="secretariaobs">Senha:  </span><input type="password" name="password"><br><br>
    <input type="submit" class="botao" value="Entrar"> <input type="reset" class="botao" value="Limpar">

    <div style="margin-top:25px">
        <p class="secretariaobs">Esqueceu sua senha? <span class="link"><a href="recuperar.jsp">Clique aqui.</a></span></p>
        <p class="secretariaobs">Ainda n�o possui cadastro? <span class="link"><a href="cadastro.jsp">Clique aqui.</a></span></p>
    </div>
</form>