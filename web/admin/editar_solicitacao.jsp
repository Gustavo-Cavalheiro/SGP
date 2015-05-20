<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Timestamp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");
    // Verificando se usuário está logado e se tem permissões de administrador, caso negativo redireciona para index
    if (session.getAttribute("username") == null || session.getAttribute("tipo") == null || !session.getAttribute("tipo").toString().equals("1")) {
        response.sendRedirect(request.getContextPath());
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>SGP - Editar Solicitação de Serviço</title>
        <link href="../_estilos/default.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <%
            // Declaração da variável que conterá as possíveis mensagens de erro
            String mensagem = "";
            String id = "";
            String servico = "";
            String endereco = "";
            String info_adicional = "";

            // Verificando se existem parametros para inserir na tabela SOLICITACOES
            if (request.getParameter("update") != null) {
                // Pegando os parametros e removendo espaços desnecessários
                id = request.getParameter("id");
                servico = request.getParameter("servico");
                endereco = request.getParameter("endereco").trim();
                info_adicional = request.getParameter("info_adicional").trim();

                // Verificando se o usuário deixou vazio o campo endereco
                if (endereco.equals("")) {
                    mensagem = "O campo \"Endereço\" é de preenchimento obrigatório.";
                } else {
                    try {
                        // Inserindo os dados do servico solicitado
                        String SQL = "UPDATE SOLICITACOES SET ";
                        SQL += "SERVICO=?, ENDERECO=?, INFO_ADICIONAL=?, DATA=? ";
                        SQL += "WHERE ID=?";
                        Connection con = Conexao.getConnection();
                        PreparedStatement ps = con.prepareStatement(SQL);
                        ps.setInt(1, Integer.parseInt(servico));
                        ps.setString(2, endereco);
                        ps.setString(3, info_adicional);
                        ps.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
                        ps.setInt(5, Integer.parseInt(id));
                        ps.execute();
                        ps.close();

                        // Após inserir os dados redireciona para a página de consultas
                        response.sendRedirect(request.getContextPath() + "/admin/solicitacoes.jsp");
                        return;
                    } catch (Exception ex) {
                        mensagem = "ERRO: " + ex.getLocalizedMessage();
                    }
                }
            } else if (request.getParameter("ID") != null && request.getParameter("ID") != "") {
                //Pegando os dados do usuário da tabela "USUARIOS" de acordo com o parâmetro "ID"
                try {
                    id = request.getParameter("ID");
                    String SQL = "SELECT * FROM SOLICITACOES WHERE ID = " + id;
                    Statement stmt = Conexao.getConnection().createStatement();
                    ResultSet rs = stmt.executeQuery(SQL);
                    rs.next();
                    id = rs.getString("ID");
                    servico = rs.getString("SERVICO");
                    endereco = rs.getString("ENDERECO");
                    info_adicional = rs.getString("INFO_ADICIONAL");
                } catch (Exception ex) {
                    mensagem = "ERRO: " + ex.getLocalizedMessage();
                }
            }
        %>
        <div id="conteudo-container">
            <%@include file="../_templates/header.jsp"%>
            <%@include file="../_templates/menu.jsp"%>
            <div id="containerinterno">
                <span class="sobre">EDITAR SOLICITAÇÃO DE SERVIÇO<img src="../_imagens/sobre.png" alt="" onmouseover="Tip('Existe algum problema? Solicite um serviço a prefeitura.')" onmouseout="UnTip()"></span>
                <br><br>
                <% // Verificando se usuário está logado, caso negativo oferece opções de login
                    if (session.getAttribute("username") == null) {
                %>
                <div class="texto">Para solicitar serviços é necessário estar logado no site.</div><br>
                <%@include file="../_templates/login.jsp"%>

                <%} else {%>
                <% // Verificando se existe alguma mensagem de erro à ser exibida
                    if (!mensagem.equals("")) out.println("<span style='color:red;'>" + mensagem + "</span><br><br>");
                %>
                <span class="obrigatorio2">*Campos obrigatórios.</span><br><br>
                <form method="post" action="">
                    <input type="hidden" name="update">
                    <input type='hidden' name='id' value='<%=id%>'>
                    <label class="secretariaobs">Selecione o serviço a ser realizado:</label> <span class="obrigatorio">*</span><br>
                    <select id="secretaria" name="servico" class="secretariaobs">
                        <%
                            // Populando o elemento select com os dados da tabela SERVICOS
                            try {
                                String query = "SELECT * FROM SERVICOS";
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
                    <input type='text' size='57' class='secretariaobs' name='endereco' value='<%=endereco%>'>
                    <br><br>
                    <label class="secretariaobs">Informações adicionais:</label><br>
                    <textarea name="info_adicional" cols="50" rows="10"><%=info_adicional%></textarea>
                    <br><br>
                    <input type="submit" class="botao" value="Enviar">
                    <input type="reset" class="botao" value="Limpar">
                </form>
                <%}%>
            </div>
            <%@include file="../_templates/footer.jsp"%>
        </div>
    </body>
</html>