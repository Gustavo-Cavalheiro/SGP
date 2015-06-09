<%@page import="sgp.Usuario"%>
<%
    try {
        // Tenta efetuar o login caso seja encontrado o parâmetro "email"
        if (request.getParameter("email") != null) {
            String email = request.getParameter("email").trim();
            String senha = request.getParameter("password");

            // Verificando se o usuário está cadastrado no site através do e-mail e senha informados
            Usuario user = new Usuario();
            if (user.login(email, senha)) {
                session.setAttribute("user", user);
                // Redereciona para a página anterior com base no parametro "returnto"
                if (request.getParameter("returnto") != null && request.getParameter("returnto") != "") {
                    response.sendRedirect(request.getParameter("returnto"));
                } else {
                    response.sendRedirect(request.getRequestURI());
                }
                return;
            } else {
                // Usuário não cadastrado, exibindo mensagem de erro
                out.println("<span class='obrigatorio2'>Usuário e/ou senha inválido(s)!</span><br><br>");
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
        <p class="secretariaobs">Ainda não possui cadastro? <span class="link"><a href="cadastro.jsp">Clique aqui.</a></span></p>
    </div>
</form>