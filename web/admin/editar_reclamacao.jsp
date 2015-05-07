<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Timestamp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>SGP - Reclamação</title>
        <link href="_estilos/default.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <%
            // Verificando se o usuário prefere enviar a mensagem como anônimo
            String nome = "";
            if (request.getParameter("anonimo") != null) {
                nome = "ANÔNIMO";
                session.setAttribute("id", 1);
                session.setAttribute("tipo", 3);
                session.removeAttribute("username");
            } else if (session.getAttribute("username") != null) {
                nome = session.getAttribute("username").toString();
            }
            
            // Declaração da variável que conterá as possíveis mensagens de erro
            String mensagem = "";

            // Verificando se existem parametros para inserir na tabela RECLAMACOES
            if (request.getParameter("inserir") != null) {
                // Pegando os parametros e removendo espaços desnecessários
                String usuario = request.getParameter("id");
                String secretaria = request.getParameter("secretaria");
                String reclamacao = request.getParameter("mensagem").trim();

                // Verificando se o usuário deixou vazio o campo mensagem
                if (reclamacao.equals("")) {
                    mensagem = "O campo \"Mensagem\" é de preenchimento obrigatório.";
                } else {
                    try {
                        // Inserindo os dados na tabela RECLAMACOES
                        String SQL = "INSERT INTO RECLAMACOES ";
                        SQL += "(USUARIO, SECRETARIA, MENSAGEM, DATA) ";
                        SQL += "VALUES (?,?,?,?)";
                        Connection con = Conexao.getConnection();
                        PreparedStatement ps = con.prepareStatement(SQL);
                        ps.setInt(1, Integer.parseInt(usuario));
                        ps.setInt(2, Integer.parseInt(secretaria));
                        ps.setString(3, reclamacao);
                        ps.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
                        ps.execute();
                        ps.close();

                        // Remove variáveis de sessão caso usuário tenha enviado a mensagem como anônimo
                        if (nome.equals("ANÔNIMO")) {
                            session.removeAttribute("id");
                            session.removeAttribute("tipo");
                        }

                        // Após inserir os dados redireciona para a página de consultas
                        response.sendRedirect(request.getContextPath() + "/consultar.jsp");
                        return;
                    } catch (Exception ex) {
                        mensagem = "ERRO: " + ex.getLocalizedMessage();
                    }
                }
            }
        %>
        <div id="conteudo-container">
            <%@include file="_templates/header.jsp"%>
            <%@include file="_templates/menu.jsp"%>
            <div id="containerinterno">
                <span class="sobre">RECLAMAÇÃO<img src="_imagens/sobre.png" alt="" onmouseover="Tip('Formalize sua reclamação para melhorararmos nosso atendimento.')" onmouseout="UnTip()"></span>
                <br><br>
                <%  // Verificando se usuário está logado, caso negativo oferece opções de login
                    if (session.getAttribute("username") == null && request.getParameter("anonimo") == null) {
                %>
                <div class="texto">Efetue login para fazer uma reclamação...</div>
                <p class="secretariaobs">Caso prefira permanecer como Anônimo, <span class="link"><a href="?anonimo">Clique aqui</a></span>.</p><br>
                <%@include file="_templates/login.jsp"%>
                <%} else {%>
                <% // Verificando se existe alguma mensagem de erro à ser exibida
                    if (!mensagem.equals("")) out.println("<span style='color:red;'>" + mensagem + "</span><br><br>");
                %>
                <span class="obrigatorio2">*Campos obrigatórios.</span><br><br>
                <form method="POST" action="">
                    <input type="hidden" name="inserir">
                    <input type='hidden' name='id' value='<%=session.getAttribute("id")%>'>
                    <label class="secretariaobs">Nome:</label><br>
                    <input type='text' size='57' class='secretariaobs' name='nome' readonly value='<%=nome%>'><br>
                    <%if (!nome.equals("ANÔNIMO")) {%>
                    <p class="secretariaobs">Não é você? <span class="link"><a href="?logoff">Clique aqui.</a></span></p>
                    <p class="secretariaobs">Deseja fazer a reclamação como anônimo? <span class="link"><a href="?anonimo">Clique aqui.</a></span></p>
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
                    <label class="secretariaobs">Informações adicionais:</label> <span class="obrigatorio">*</span><br>
                    <textarea name="mensagem" cols="50" rows="10"></textarea><br><br>
                    <input type="submit" class="botao" value="Enviar">
                    <input type="reset" class="botao" value="Limpar">
                </form>
                <%}%>
            </div>
            <%@include file="_templates/footer.jsp"%>
        </div>
    </body>
</html>