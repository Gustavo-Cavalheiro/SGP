<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="br.com.sgp.Conexao"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.ArrayList"%>
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
        <title>SGP - Cadastrar Novo Usuário</title>
        <link href="../_estilos/default.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <%
            // Declaração da variável que conterá as possíveis mensagens de erro
            String mensagem = "";

            // Declaração das variáveis que vão armazenar os dados do usuário
            String id = "";
            String nome = "";
            String sobrenome = "";
            String email = "";
            String cpf = "";
            String endereco = "";
            String numero = "";
            String complemento = "";
            String cep = "";
            String bairro = "";
            String cidade = "";
            String estado = "";
            String telefone = "";
            String celular = "";
            String tipo = "";
            String senha = "";
            String senha2 = "";

            // Verificando se existem parametros para atualizar os dados do usuário
            if (request.getParameter("update") != null) {
                // Pegando os parametros e removendo espaços desnecessários
                id = request.getParameter("id");
                nome = request.getParameter("nome").trim();
                sobrenome = request.getParameter("sobrenome").trim();
                email = request.getParameter("email").trim();
                cpf = request.getParameter("cpf").trim();
                endereco = request.getParameter("endereco").trim();
                numero = request.getParameter("numero").trim();
                complemento = request.getParameter("complemento").trim();
                cep = request.getParameter("cep").trim();
                bairro = request.getParameter("bairro").trim();
                cidade = request.getParameter("cidade").trim();
                estado = request.getParameter("estado").trim();
                telefone = request.getParameter("telefone").trim();
                celular = request.getParameter("celular").trim();
                tipo = request.getParameter("tipo").trim();
                senha = request.getParameter("senha").trim();
                senha2 = request.getParameter("senha2").trim();

                // Verificando se foi deixado vazio algum campo de preenchimento obrigatório
                ArrayList<String> erro = new ArrayList<String>();
                if (nome.equals("")) erro.add("\"Nome\"");
                if (sobrenome.equals("")) erro.add("\"Sobrenome\"");
                if (email.equals("")) erro.add("\"E-mail\"");
                if (cpf.equals("")) erro.add("\"CPF\"");
                if (endereco.equals("")) erro.add("\"Endereço\"");
                if (cep.equals("")) erro.add("\"CEP\"");
                if (bairro.equals("")) erro.add("\"Bairro\"");
                if (cidade.equals("")) erro.add("\"Cidade\"");
                if (estado.equals("")) erro.add("\"Estado\"");
                if (tipo.equals("")) erro.add("\"Tipo de Usuário\"");
                if (senha.equals("")) erro.add("\"Senha\"");
                if (senha2.equals("")) erro.add("\"Confirme a Senha\"");

                // Caso haja campos vazios o array erro irá conter ao menos um elemento
                if (erro.size() > 0) {
                    // Escrevendo mensagem de erro de acordo com a quantidade de campos deixados em branco
                    if (erro.size() == 1) {
                        mensagem = "O campo " + erro.get(0) + " é de preenchimento obrigatório.";
                    } else {
                        mensagem = "Os campos ";
                        for (int i = 0; i < erro.size(); ++i) {
                            mensagem += erro.get(i);
                            if (i < erro.size() - 2) mensagem += ", ";
                            else if (i < erro.size() - 1) mensagem += " e ";
                        }
                        mensagem += " são de preenchimento obrigatório.";
                    }

                // Verificando se os campos "Senha" e "Confirmar Senha" são iguais
                } else if (!senha.equals(senha2)) {
                    mensagem = "As senhas digitadas são diferentes.";

                // Verificando o tamanho da senha (necessário ao menos 6 caracteres)
                } else if (senha.length() < 6) {
                    mensagem = "A senha precisa ter no mínimo 6 caracteres.";

                } else {
                    try {
                        // Inserindo os dados do novo usuário
                        String SQL = "UPDATE USUARIOS SET ";
                        SQL += "NOME=?, SOBRENOME=?, EMAIL=?, CPF=?, ENDERECO=?, NUMERO=?, COMPLEMENTO=?, CEP=?, ";
                        SQL += "BAIRRO=?, CIDADE=?, ESTADO=?, TELEFONE=?, CELULAR=?, SENHA=?, TIPO=? ";
                        SQL += "WHERE ID=?";
                        Connection con = Conexao.getConnection();
                        PreparedStatement ps = con.prepareStatement(SQL);
                        ps.setString(1, nome);
                        ps.setString(2, sobrenome);
                        ps.setString(3, email);
                        ps.setString(4, cpf);
                        ps.setString(5, endereco);
                        ps.setString(6, numero);
                        ps.setString(7, complemento);
                        ps.setString(8, cep);
                        ps.setString(9, bairro);
                        ps.setString(10, cidade);
                        ps.setInt(11, Integer.parseInt(estado));
                        ps.setString(12, telefone);
                        ps.setString(13, celular);
                        ps.setString(14, senha);
                        ps.setInt(15, Integer.parseInt(tipo));
                        ps.setInt(16, Integer.parseInt(id));
                        ps.execute();
                        ps.close();

                        // Após inserir os dados, redireciona para a página de usuários cadastrados
                        response.sendRedirect(request.getContextPath() + "/admin/usuarios.jsp");
                        return;
                    } catch (Exception ex) {
                        mensagem = "ERRO: " + ex.getLocalizedMessage();
                    }
                }

            } else if (request.getParameter("ID") != null && request.getParameter("ID") != "") {
                //Pegando os dados do usuário da tabela "USUARIOS" de acordo com o parâmetro "ID"
                try {
                    id = request.getParameter("ID");
                    String SQL = "SELECT * FROM USUARIOS WHERE ID = " + id;
                    Statement stmt = Conexao.getConnection().createStatement();
                    ResultSet rs = stmt.executeQuery(SQL);

                    rs.next();
                    nome = rs.getString("NOME");
                    sobrenome = rs.getString("SOBRENOME");
                    email = rs.getString("EMAIL");
                    cpf = rs.getString("CPF");
                    endereco = rs.getString("ENDERECO");
                    numero = rs.getString("NUMERO");
                    complemento = rs.getString("COMPLEMENTO");
                    cep = rs.getString("CEP");
                    bairro = rs.getString("BAIRRO");
                    cidade = rs.getString("CIDADE");
                    estado = rs.getString("ESTADO");
                    telefone = rs.getString("TELEFONE");
                    celular = rs.getString("CELULAR");
                    senha = rs.getString("SENHA");
                    senha2 = rs.getString("SENHA");
                    tipo = rs.getString("TIPO");
                } catch (Exception ex) {
                    mensagem = "ERRO: " + ex.getLocalizedMessage();
                }

            } else {
                // Se o parâmetro ID não for encontrado redireciona para a página de usuários cadastrados
                response.sendRedirect(request.getContextPath() + "/admin/usuarios.jsp");
                return;
            }
        %>
        <div id="conteudo-container">
            <%@include file="../_templates/header.jsp"%>
            <%@include file="../_templates/menu.jsp"%>
            <div id="containerinterno">
                <span class="sobre">ALTERAR CADASTRO DE USUÁRIO<img src="../_imagens/sobre.png" alt="" onmouseover="Tip('Permite alterar os dados de usuários cadastrados.')" onmouseout="UnTip()"></span>
                <br><br>
                <% // Verificando se existe alguma mensagem de erro à ser exibida
                    if (!mensagem.equals("")) out.println("<span style='color:red;'>" + mensagem + "</span><br><br>");
                %>
                <span class="obrigatorio2">*Campos obrigatórios.</span><br>
                <form method="POST" action="">
                    <input type="hidden" name="update">
                    <table cellspacing="10">
                        <tr>
                            <td colspan="3">
                                <label class="secretariaobs">Tipo de Usuário:</label><span class="obrigatorio">*</span>
                                <br><select id="tipo" name="tipo">
                                    <%
                                        // Populando o elemento select com os dados da tabela TIPO_USUARIO
                                        try {
                                            String query = "SELECT * FROM TIPO_USUARIO";
                                            for (Object[] reg : Conexao.getQuery(query)) {
                                                String selected = "";
                                                if (tipo != null && tipo.equals(reg[0].toString())) {
                                                    selected = " selected";
                                                }
                                                out.println("<option value='" + reg[0] + "'" + selected + ">" + reg[1] + "</option>");
                                            }
                                        } catch (Exception ex) {
                                            out.println("<option>Erro: " + ex.getLocalizedMessage() + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                            <td colspan="3">
                                <label class="secretariaobs">ID:</label><span class="obrigatorio">*</span>
                                <br><input type='text' name='id' value='<%=id%>' readonly/>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <label class="secretariaobs">Nome:</label><span class="obrigatorio">*</span>
                                <br><input type="text" size="33" name="nome" value="<%=nome%>" title="Insira o seu nome">
                            </td>
                            <td colspan="3">
                                <label class="secretariaobs">Sobrenome:</label><span class="obrigatorio">*</span>
                                <br><input type="text" size="33" name="sobrenome" value="<%=sobrenome%>" title="Insira o seu sobrenome">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <label class="secretariaobs">E-mail:</label><span class="obrigatorio">*</span>
                                <br><input type="text" size="33" name="email" value="<%=email%>" title="Insira o seu e-mail">
                            </td>
                            <td colspan="3">
                                <label class="secretariaobs">CPF:</label><span class="obrigatorio">*</span>
                                <br><input type="text" size="33" name="cpf" value="<%=cpf%>" title="Insira o seu CPF">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <label class="secretariaobs">Endereço:</label><span class="obrigatorio">*</span>
                                <br><input type="text" size="72" name="endereco" value="<%=endereco%>" title="Insira o seu endereço">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <label class="secretariaobs">Número:</label>
                                <br><input type="text" name="numero" value="<%=numero%>" title="Insira o número de seu endereço">
                            </td>
                            <td colspan="2">
                                <label class="secretariaobs">Complemento:</label>
                                <br><input type="text" name="complemento" value="<%=complemento%>" title="Insira o complemento, caso haja">
                            </td>
                            <td colspan="2">
                                <label class="secretariaobs">CEP:</label><span class="obrigatorio">*</span>
                                <br><input type="text" name="cep" value="<%=cep%>" title="Insira o número do CEP de seu endereço">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <label class="secretariaobs">Bairro:</label><span class="obrigatorio">*</span>
                                <br><input type="text" name="bairro" value="<%=bairro%>" title="Insira o bairro onde mora">
                            </td>
                            <td colspan="2">
                                <label class="secretariaobs">Cidade:</label><span class="obrigatorio">*</span>
                                <br><input type="text" name="cidade" value="<%=cidade%>" title="Insira a cidade onde mora">
                            </td>
                            <td colspan="2">
                                <label class="secretariaobs">Estado:</label><span class="obrigatorio">*</span>
                                <br><select id="estado" name="estado">
                                    <%
                                        // Populando o elemento select com os dados da tabela ESTADOS
                                        try {
                                            String query = "SELECT ID,SIGLA FROM ESTADOS";
                                            for (Object[] reg : Conexao.getQuery(query)) {
                                                String selected = "";
                                                if (estado != null && estado.equals(reg[0].toString())) {
                                                    selected = " selected";
                                                }
                                                out.println("<option value='" + reg[0] + "'" + selected + ">" + reg[1] + "</option>");
                                            }
                                        } catch (Exception ex) {
                                            out.println("<option>Erro: " + ex.getLocalizedMessage() + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <label class="secretariaobs">Telefone Residencial:</label>
                                <br><input type="text" name="telefone" value="<%=telefone%>" title="Insira o número do seu telefone residencial">
                            </td>
                            <td colspan="2">
                                <label class="secretariaobs">Telefone Móvel:</label>
                                <br><input type="text" name="celular" value="<%=celular%>" title="Insira o número do seu telefone móvel">
                            </td>
                            <td colspan="2"></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <label class="secretariaobs">Senha:</label><span class="obrigatorio">*</span>
                                <br><input type="password" name="senha" value="<%=senha%>" title="Insira uma senha">
                            </td>
                            <td colspan="2">
                                <label class="secretariaobs">Confirme a senha:</label><span class="obrigatorio">*</span>
                                <br><input type="password" name="senha2" value="<%=senha2%>" title="Confirme a sua senha">
                            </td>
                            <td colspan="2"></td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <input type="submit" class="botao" value="Atualizar">
                                <input type="reset" class="botao" value="Limpar">
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
            <%@include file="../_templates/footer.jsp"%>
        </div>
    </body>
</html>