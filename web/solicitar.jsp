<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Timestamp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>SGP - Solicitar Serviços</title>
        <link href="_estilos/default.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <%
            // Declaração da variável que conterá as possíveis mensagens de erro
            String mensagem = "";

            // Verificando se existem parametros para inserir na tabela SOLICITACOES
            if (request.getParameter("inserir") != null) {
                // Pegando os parametros e removendo espaços desnecessários
                String usuario = request.getParameter("id");
                String servico = request.getParameter("servico");
                String endereco = request.getParameter("endereco").trim();
                String info_adicional = request.getParameter("info_adicional").trim();

                // Verificando se o usuário deixou vazio o campo endereco
                if (endereco.equals("")) {
                    mensagem = "O campo \"Endereço\" é de preenchimento obrigatório.";
                } else {
                    try {
                        // Inserindo os dados do servico solicitado
                        String SQL = "INSERT INTO SOLICITACOES ";
                        SQL += "(USUARIO, SERVICO, ENDERECO, INFO_ADICIONAL, DATA) ";
                        SQL += "VALUES (?,?,?,?,?)";
                        Connection con = Conexao.getConnection();
                        PreparedStatement ps = con.prepareStatement(SQL);
                        ps.setInt(1, Integer.parseInt(usuario));
                        ps.setInt(2, Integer.parseInt(servico));
                        ps.setString(3, endereco);
                        ps.setString(4, info_adicional);
                        ps.setTimestamp(5, new Timestamp(System.currentTimeMillis()));
                        ps.execute();
                        ps.close();

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
                <span class="sobre">SOLICITAR SERVIÇOS<img src="_imagens/sobre.png" alt="" onmouseover="Tip('Existe algum problema? Solicite um serviço a prefeitura.')" onmouseout="UnTip()"></span>
                <br><br>
                <% // Verificando se usuário está logado, caso negativo oferece opções de login
                    if (session.getAttribute("username") == null) {
                %>
                <div class="texto">Para solicitar serviços é necessário estar logado no site.</div><br>
                <%@include file="_templates/login.jsp"%>

                <%} else {%>
                <% // Verificando se existe alguma mensagem de erro à ser exibida
                    if (!mensagem.equals("")) out.println("<span style='color:red;'>" + mensagem + "</span><br><br>");
                %>
                <span class="obrigatorio2">*Campos obrigatórios.</span><br><br>
                <form method="post" action="">
                    <input type="hidden" name="inserir">
                    <input type='hidden' name='id' value='<%=session.getAttribute("id")%>'>
                    <label class="secretariaobs">Nome:</label><br>
                    <input type='text' size='57' class='secretariaobs' name='nome' readonly value='<%=session.getAttribute("username")%>'><br>
                    <p class="secretariaobs">Não é você? <span class="link"><a href="?logoff">Clique aqui.</a></span></p><br>
                    <label class="secretariaobs">Selecione o serviço a ser realizado:</label> <span class="obrigatorio">*</span><br>
                    <select id="secretaria" name="servico" class="secretariaobs">
                        <%
                            // Populando o elemento select com os dados da tabela SERVICOS
                            try {
                                String query = "SELECT * FROM SERVICOS";
                                String servico = request.getParameter("servico");
                                for (Object[] reg : Conexao.getQuery(query)) {
                                    String selected = "";
                                    if (servico != null && servico.equals(reg[0].toString())) {
                                        selected = " selected";
                                    }
                                    out.println("<option value='" + reg[0] + "'" + selected + ">" + reg[1] + "</option>");
                                }
                            } catch (Exception ex) {
                                out.println("<option>Erro: " + ex.getLocalizedMessage() + "</option>");
                            }
                        %>
                    </select><br><br>
                    <label class="secretariaobs">Informe o endereço onde o serviço deve ser realizado:</label> <span class="obrigatorio">*</span><br>
                    <input type='text' size='57' class='secretariaobs' name='endereco' value='${param.endereco}'>
                    <br><br>
                    <label class="secretariaobs">Informações adicionais:</label><br>
                    <textarea name="info_adicional" cols="50" rows="10">${param.info_adicional}</textarea>
                    <br><br>
                    <input type="submit" class="botao" value="Enviar">
                    <input type="reset" class="botao" value="Limpar">
                </form>
                <%}%>
            </div>
            <%@include file="_templates/footer.jsp"%>
        </div>
    </body>
</html>