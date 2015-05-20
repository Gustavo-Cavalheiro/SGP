<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Calendar"%>
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
        <title>SGP - Editar Consulta</title>
        <link href="../_estilos/default.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <%
            String mensagem = "";

            // Declaração das variáveis que vão armazenar os dados da consulta
            String id = "";
            String usuario = "";
            String secretaria = "";
            String assunto = "";
            String data = "";

            // Verificando se existem parametros para atualizar os dados do usuário
            if (request.getParameter("update") != null) {
                // Pegando os parametros e removendo espaços desnecessários
                id = request.getParameter("id");
                usuario = request.getParameter("id");
                secretaria = request.getParameter("secretaria");
                assunto = request.getParameter("assunto").trim();
                data = request.getParameter("data").trim();

                if (assunto.equals("")) {
                    mensagem = "O campo \"Assunto\" é de preenchimento obrigatório.";
                } else {
                    try {
                        // Inserindo os dados do novo usuário
                        String SQL = "UPDATE CONSULTAS SET ";
                        SQL += "USUARIO=?, SECRETARIA=?, ASSUNTO=?, DATA_PEDIDO=?, DATA_AGENDADA=? ";
                        SQL += "WHERE ID=?";
                        Connection con = Conexao.getConnection();
                        PreparedStatement ps = con.prepareStatement(SQL);
                        ps.setInt(1, Integer.parseInt(usuario));
                        ps.setInt(2, Integer.parseInt(secretaria));
                        ps.setString(3, assunto);
                        ps.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
                        ps.setString(5, data);
                        ps.setInt(6, Integer.parseInt(id));
                        ps.execute();
                        ps.close();

                        // Após inserir os dados, redireciona para a página de usuários cadastrados
                        response.sendRedirect(request.getContextPath() + "/admin/consultas.jsp");
                        return;
                    } catch (Exception ex) {
                        mensagem = "ERRO: " + ex.getLocalizedMessage();
                    }
                }

            } else if (request.getParameter("ID") != null && request.getParameter("ID") != "") {
                //Pegando os dados do usuário da tabela "USUARIOS" de acordo com o parâmetro "ID"
                try {
                    id = request.getParameter("ID");
                    String SQL = "SELECT * FROM CONSULTAS WHERE ID = " + id;
                    Statement stmt = Conexao.getConnection().createStatement();
                    ResultSet rs = stmt.executeQuery(SQL);
                    rs.next();
                    usuario = rs.getString("USUARIO");
                    secretaria = rs.getString("SECRETARIA");
                    assunto = rs.getString("ASSUNTO");
                    data = rs.getString("DATA_PEDIDO");
                } catch (Exception ex) {
                    mensagem = "ERRO: " + ex.getLocalizedMessage();
                }

            } else {
                // Se o parâmetro ID não for encontrado redireciona para a página de usuários cadastrados
                response.sendRedirect(request.getContextPath() + "/admin/consultas.jsp");
                return;
            }
            %>
        <div id="conteudo-container">
            <%@include file="../_templates/header.jsp"%>
            <%@include file="../_templates/menu.jsp"%>
            <div id="containerinterno">
                <span class="sobre">EDITAR CONSULTA<img src="../_imagens/sobre.png" alt="" onmouseover="Tip('Fale com a prefeitura: marque uma consulta com a secretaria desejada.')" onmouseout="UnTip()"></span>
                <br><br>
                <% // Verificando se usuário está logado, caso negativo oferece opções de login
                    if (session.getAttribute("username") == null) {
                %>
                <div class="texto">Para marcar consultas é necessário estar logado no site.</div><br>
                <%@include file="../_templates/login.jsp"%>
                <%} else {%>
                <% // Verificando se existe alguma mensagem de erro à ser exibida
                    if (!mensagem.equals("")) out.println("<span style='color:red;'>" + mensagem + "</span><br><br>");
                %>
                <span class="obrigatorio2">*Campos obrigatórios.</span><br><br>
                <form method="post" action="">
                    <input type="hidden" name="update">
                    <input type='hidden' name='id' value='<%=id%>'>
                    <label class="secretariaobs">Selecione a secretaria:</label> <span class="obrigatorio">*</span><br>
                    <select id="secretaria" name="secretaria" class="secretariaobs">
                        <%
                            // Populando o elemento select com os dados da tabela SECRETARIAS
                            try {
                                String query = "SELECT * FROM SECRETARIAS";
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
                        <%
                            String[] assuntos = {"Atestados e Declarações", "Dúvidas", "Emergências", "Planejamento", "Serviços", "Social"};
                            for (int i = 0; i < assuntos.length; ++i) {
                                if (assuntos[i].equals(assunto)) {
                                    out.println("<option selected>" + assuntos[i] + "</option>");
                                } else {
                                    out.println("<option>" + assuntos[i] + "</option>");
                                }
                            }
                        %>
                    </select><br><br>
                    <span class="secretariaobs">Selecione uma data e horário disponível:<span class="obrigatorio">*</span></span><br>
                    <select id="horario" name="data" class="secretariaobs">
                        <%
                            Calendar date = Calendar.getInstance();
                            out.println("<option> 10/" + (date.get(Calendar.MONTH) + 2) + "/" + date.get(Calendar.YEAR) + "  09:00:00");
                            out.println("<option> 10/" + (date.get(Calendar.MONTH) + 2) + "/" + date.get(Calendar.YEAR) + "  10:00:00");
                            out.println("<option> 10/" + (date.get(Calendar.MONTH) + 2) + "/" + date.get(Calendar.YEAR) + "  11:00:00");
                            out.println("<option> 10/" + (date.get(Calendar.MONTH) + 2) + "/" + date.get(Calendar.YEAR) + "  14:00:00");
                            out.println("<option> 10/" + (date.get(Calendar.MONTH) + 2) + "/" + date.get(Calendar.YEAR) + "  15:00:00");
                            out.println("<option> 10/" + (date.get(Calendar.MONTH) + 2) + "/" + date.get(Calendar.YEAR) + "  16:00:00");
                            out.println("<option> 20/" + (date.get(Calendar.MONTH) + 2) + "/" + date.get(Calendar.YEAR) + "  09:00:00");
                            out.println("<option> 20/" + (date.get(Calendar.MONTH) + 2) + "/" + date.get(Calendar.YEAR) + "  10:00:00");
                            out.println("<option> 20/" + (date.get(Calendar.MONTH) + 2) + "/" + date.get(Calendar.YEAR) + "  11:00:00");
                            out.println("<option> 20/" + (date.get(Calendar.MONTH) + 2) + "/" + date.get(Calendar.YEAR) + "  14:00:00");
                            out.println("<option> 20/" + (date.get(Calendar.MONTH) + 2) + "/" + date.get(Calendar.YEAR) + "  15:00:00");
                            out.println("<option> 20/" + (date.get(Calendar.MONTH) + 2) + "/" + date.get(Calendar.YEAR) + "  16:00:00");
                            out.println("<option> 30/" + (date.get(Calendar.MONTH) + 2) + "/" + date.get(Calendar.YEAR) + "  09:00:00");
                            out.println("<option> 30/" + (date.get(Calendar.MONTH) + 2) + "/" + date.get(Calendar.YEAR) + "  10:00:00");
                            out.println("<option> 30/" + (date.get(Calendar.MONTH) + 2) + "/" + date.get(Calendar.YEAR) + "  11:00:00");
                            out.println("<option> 30/" + (date.get(Calendar.MONTH) + 2) + "/" + date.get(Calendar.YEAR) + "  14:00:00");
                            out.println("<option> 30/" + (date.get(Calendar.MONTH) + 2) + "/" + date.get(Calendar.YEAR) + "  15:00:00");
                            out.println("<option> 30/" + (date.get(Calendar.MONTH) + 2) + "/" + date.get(Calendar.YEAR) + "  16:00:00");
                        %>
                    </select><br><br>
                    <input type="submit" class="botao" value="Enviar">
                    <input type="reset" class="botao" value="Limpar">
                </form>
                <%}%>
            </div>
            <%@include file="../_templates/footer.jsp"%>
        </div>
    </body>
</html>
