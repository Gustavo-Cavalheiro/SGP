<%@page import="sgp.Conexao"%>
<%@page import="sgp.Consulta"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    Usuario usuario = (Usuario) session.getAttribute("user");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>SGP - Marcar Consulta</title>
        <link href="_estilos/default.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <%
            // Declaração da variável que conterá as possíveis mensagens de erro
            String erro = "";

            // Verificando se existem parametros para inserir na tabela CONSULTAS
            if (request.getParameter("inserir") != null) {
                // Pegando os parametros e removendo espaços desnecessários
                String usuario_id = request.getParameter("id");
                String secretaria = request.getParameter("secretaria");
                String assunto = request.getParameter("assunto").trim();
                String data = request.getParameter("data").trim();

                // Verificando se o usuário deixou vazio o campo assunto
                if (assunto.equals("")) {
                    erro = "O campo \"Assunto\" é de preenchimento obrigatório.";
                } else {
                    try {
                        Consulta consulta = new Consulta();
                        consulta.setUsuario(Integer.parseInt(usuario_id));
                        consulta.setSecretaria(Integer.parseInt(secretaria));
                        consulta.setAssunto(assunto);
                        consulta.setDataAgendada(data);
                        consulta.inserir();

                        // Após inserir consulta redireciona para a página de consultas
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
                <span class="sobre">MARCAR CONSULTA<img src="_imagens/sobre.png" alt="" onmouseover="Tip('Fale com a prefeitura: marque uma consulta com a secretaria desejada.')" onmouseout="UnTip()"></span>
                <br><br>
                <% // Verificando se usuário está logado, caso negativo oferece opções de login
                    if (usuario == null) {
                %>
                <div class="texto">Para marcar consultas é necessário estar logado no site.</div><br>
                <%@include file="_templates/login.jsp"%>
                <%} else {%>
                <% // Verificando se existe alguma mensagem de erro à ser exibida
                    if (!erro.equals("")) out.println("<span style='color:red;'>" + erro + "</span><br><br>");
                %>
                <span class="obrigatorio2">*Campos obrigatórios.</span><br><br>
                <form method="post" action="">
                    <input type="hidden" name="inserir">
                    <input type='hidden' name='id' value='<%=usuario.getId()%>'>
                    <label class="secretariaobs">Nome:</label><br>
                    <input type='text' size='57' class='secretariaobs' name='nome' readonly value='<%=usuario.getNome()%>'><br>
                    <p class="secretariaobs">Não é você? <span class="link"><a href="?logoff">Clique aqui.</a></span></p><br>
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
                    <label class="secretariaobs">Selecione o assunto:</label> <span class="obrigatorio">*</span><br>
                    <select id="assunto" name="assunto" class="secretariaobs">
                        <option>Atestados e Declaracoes</option>
                        <option>Duvidas</option>
                        <option>Emergencias</option>
                        <option>Planejamento</option>
                        <option>Servicos</option>
                        <option>Social</option>
                    </select><br><br>
                    <span class="secretariaobs">Selecione uma data e horário disponível:<span class="obrigatorio">*</span></span><br>
                    <select id="horario" name="data" class="secretariaobs">
                        <%
                            Calendar date = Calendar.getInstance();
                            out.println("<option> 10/" + (date.get(Calendar.MONTH) + 1) + "/" + date.get(Calendar.YEAR) + "  09:00:00");
                            out.println("<option> 10/" + (date.get(Calendar.MONTH) + 1) + "/" + date.get(Calendar.YEAR) + "  10:00:00");
                            out.println("<option> 10/" + (date.get(Calendar.MONTH) + 1) + "/" + date.get(Calendar.YEAR) + "  11:00:00");
                            out.println("<option> 10/" + (date.get(Calendar.MONTH) + 1) + "/" + date.get(Calendar.YEAR) + "  14:00:00");
                            out.println("<option> 10/" + (date.get(Calendar.MONTH) + 1) + "/" + date.get(Calendar.YEAR) + "  15:00:00");
                            out.println("<option> 10/" + (date.get(Calendar.MONTH) + 1) + "/" + date.get(Calendar.YEAR) + "  16:00:00");
                            out.println("<option> 20/" + (date.get(Calendar.MONTH) + 1) + "/" + date.get(Calendar.YEAR) + "  09:00:00");
                            out.println("<option> 20/" + (date.get(Calendar.MONTH) + 1) + "/" + date.get(Calendar.YEAR) + "  10:00:00");
                            out.println("<option> 20/" + (date.get(Calendar.MONTH) + 1) + "/" + date.get(Calendar.YEAR) + "  11:00:00");
                            out.println("<option> 20/" + (date.get(Calendar.MONTH) + 1) + "/" + date.get(Calendar.YEAR) + "  14:00:00");
                            out.println("<option> 20/" + (date.get(Calendar.MONTH) + 1) + "/" + date.get(Calendar.YEAR) + "  15:00:00");
                            out.println("<option> 20/" + (date.get(Calendar.MONTH) + 1) + "/" + date.get(Calendar.YEAR) + "  16:00:00");
                            out.println("<option> 30/" + (date.get(Calendar.MONTH) + 1) + "/" + date.get(Calendar.YEAR) + "  09:00:00");
                            out.println("<option> 30/" + (date.get(Calendar.MONTH) + 1) + "/" + date.get(Calendar.YEAR) + "  10:00:00");
                            out.println("<option> 30/" + (date.get(Calendar.MONTH) + 1) + "/" + date.get(Calendar.YEAR) + "  11:00:00");
                            out.println("<option> 30/" + (date.get(Calendar.MONTH) + 1) + "/" + date.get(Calendar.YEAR) + "  14:00:00");
                            out.println("<option> 30/" + (date.get(Calendar.MONTH) + 1) + "/" + date.get(Calendar.YEAR) + "  15:00:00");
                            out.println("<option> 30/" + (date.get(Calendar.MONTH) + 1) + "/" + date.get(Calendar.YEAR) + "  16:00:00");
                        %>
                    </select><br><br>
                    <input type="submit" class="botao" value="Enviar">
                </form>
                <%}%>
            </div>
            <%@include file="_templates/footer.jsp"%>
        </div>
    </body>
</html>
