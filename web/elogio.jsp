<%@page import="sgp.Conexao"%>
<%@page import="sgp.Elogio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    Usuario usuario = (Usuario) session.getAttribute("user");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>SGP - Elogio</title>
        <link href="_estilos/default.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <%
            int id = 1;
            String nome = "";

            // Verificando se o usuário prefere enviar a mensagem como anônimo
            if (request.getParameter("anonimo") != null) {
                nome = "ANÔNIMO";
            } else if (usuario != null) {
                id = usuario.getId();
                nome = usuario.getNome();
            }

            // Declaração da variável que conterá as possíveis mensagens de erro
            String erro = "";

            // Verificando se existem parametros para inserir na tabela ELOGIOS
            if (request.getParameter("inserir") != null) {
                // Pegando os parametros e removendo espaços desnecessários
                String usuario_id = request.getParameter("id");
                String secretaria = request.getParameter("secretaria");
                String mensagem = request.getParameter("mensagem").trim();

                // Verificando se o usuário deixou vazio o campo mensagem
                if (mensagem.equals("")) {
                    erro = "O campo \"Mensagem\" é de preenchimento obrigatório.";
                } else {
                    try {
                        Elogio elogio = new Elogio();
                        elogio.setUsuario(Integer.parseInt(usuario_id));
                        elogio.setSecretaria(Integer.parseInt(secretaria));
                        elogio.setMensagem(mensagem);
                        elogio.inserir();

                        // Após inserir elogio redireciona para a página de consultas
                        response.sendRedirect(request.getContextPath() + "/consultar.jsp");
                        return;
                    } catch (Exception ex) {
                        erro = "ERRO: " + ex.getLocalizedMessage();
                    }
                }
            }
        %>
        <div id="conteudo-container">
            <%@include file="_templates/header.jsp"%>
            <%@include file="_templates/menu.jsp"%>
            <div id="containerinterno">
                <span class="sobre">ELOGIO<img src="_imagens/sobre.png" alt="" onmouseover="Tip('Envie um elogio a secretaria.')" onmouseout="UnTip()"></span>
                <br><br>
                <%  // Verificando se usuário está logado, caso negativo oferece opções de login
                    if (usuario == null && nome.equals("")) {
                %>
                <div class="texto">Efetue login para fazer um elogio...</div>
                <p class="secretariaobs">Caso prefira permanecer como Anônimo, <span class="link"><a href="?anonimo">Clique aqui</a></span>.</p><br>
                <%@include file="_templates/login.jsp"%>
                <%} else {%>
                <% // Verificando se existe alguma mensagem de erro à ser exibida
                    if (!erro.equals("")) out.println("<span style='color:red;'>" + erro + "</span><br><br>");
                %>
                <span class="obrigatorio2">*Campos obrigatórios.</span><br><br>
                <form method="post" action="">
                    <input type="hidden" name="inserir">
                    <input type='hidden' name='id' value='<%=id%>'>
                    <label class="secretariaobs">Nome:</label><br>
                    <input type='text' size='57' class='secretariaobs' name='nome' readonly value='<%=nome%>'><br>
                    <%if (!nome.equals("ANÔNIMO")) {%>
                    <p class="secretariaobs">Não é você? <span class="link"><a href="?logoff">Clique aqui.</a></span></p>
                    <p class="secretariaobs">Deseja fazer o elogio como anônimo? <span class="link"><a href="?anonimo">Clique aqui.</a></span></p>
                    <%}%><br>
                    <label class="secretariaobs">Selecione a secretaria:</label> <span class="obrigatorio">*</span><br>
                    <select id="secretaria" name="secretaria" class="secretariaobs">
                        <%
                            // Populando o elemento select com os dados da tabela SECRETARIAS
                            try {
                                String query = "SELECT * FROM SECRETARIAS";
                                String secretaria = request.getParameter("secretaria");
                                for (Object[] reg : Conexao.getQuery(query)) {
                                    String selected = "";
                                    if (secretaria != null && secretaria.equals(reg[0].toString())) {
                                        selected = " selected";
                                    }
                                    out.println("<option value='" + reg[0] + "'" + selected + ">" + reg[1] + "</option>");
                                }
                            } catch (Exception ex) {
                                out.println("<option>Erro: " + ex.getLocalizedMessage() + "</option>");
                            }
                        %>
                    </select><br><br>
                    <label class="secretariaobs">Mensagem:</label> <span class="obrigatorio">*</span><br>
                    <textarea name="mensagem" cols="50" rows="10" maxlength="500"></textarea><br><br>
                    <input type="submit" class="botao" value="Enviar">
                    <input type="reset" class="botao" value="Limpar">
                </form>
                <%}%>
            </div>
            <%@include file="_templates/footer.jsp"%>
        </div>
    </body>
</html>