<%@page import="br.com.sgp.Conexao"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% // Verificando se usuário já está logado, caso positivo redireciona para index
    if (session.getAttribute("username") != null) {
        response.sendRedirect(request.getContextPath());
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>SGP - Cadastro</title>
        <link href="_estilos/default.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <%
            // Declaração da variável que conterá as possíveis mensagens de erro
            String mensagem = "";

            // Verificando se existem parametros para inserir na tabela USUARIOS
            if (request.getParameter("inserir") != null) {
                // Pegando os parametros e removendo espaços desnecessários
                String nome = request.getParameter("nome").trim();
                String sobrenome = request.getParameter("sobrenome").trim();
                String email = request.getParameter("email").trim();
                String cpf = request.getParameter("cpf").trim();
                String endereco = request.getParameter("endereco").trim();
                String numero = request.getParameter("numero").trim();
                String complemento = request.getParameter("complemento").trim();
                String cep = request.getParameter("cep").trim();
                String bairro = request.getParameter("bairro").trim();
                String cidade = request.getParameter("cidade").trim();
                String estado = request.getParameter("estado").trim();
                String telefone = request.getParameter("telefone").trim();
                String celular = request.getParameter("celular").trim();
                String senha = request.getParameter("senha").trim();
                String senha2 = request.getParameter("senha2").trim();

                // Verificando se o usuário deixou vazio algum campo de preenchimento obrigatório
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
                        // Verificando se o email informado pelo usuário já está cadastrado no site
                        String SQL = "SELECT * FROM USUARIOS WHERE EMAIL='" + email + "'";
                        if (Conexao.getQuery(SQL).size() > 0) {
                            mensagem = "O e-mail informado já está cadastrado no site.";

                        } else {
                            // Inserindo os dados do novo usuário
                            SQL = "INSERT INTO USUARIOS ";
                            SQL += "(NOME, SOBRENOME, EMAIL, CPF, ENDERECO, NUMERO, COMPLEMENTO, CEP, ";
                            SQL += "BAIRRO, CIDADE, ESTADO, TELEFONE, CELULAR, SENHA, TIPO, DATA_REGISTRO) ";
                            SQL += "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
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
                            ps.setInt(15, 3);
                            ps.setTimestamp(16, new Timestamp(System.currentTimeMillis()));
                            ps.execute();
                            ps.close();

                            // Após inserir os dados, redireciona para a página de login
                            response.sendRedirect(request.getContextPath() + "/login.jsp");
                            return;
                        }
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
                <span class="sobre">CADASTRO<img src="_imagens/sobre.png" alt="" onmouseover="Tip('Cadastre-se em nosso Sistema de Gerenciamento Político, para marcar consultas e solicitar serviços.')" onmouseout="UnTip()"></span>
                <br><br>
                <% // Verificando se existe alguma mensagem de erro à ser exibida
                    if (!mensagem.equals("")) out.println("<span style='color:red;'>" + mensagem + "</span><br><br>");
                %>
                <span class="obrigatorio2">*Campos obrigatórios.</span><br>
                <form method="POST" action="">
                    <input type="hidden" name="inserir">
                    <table cellspacing="10">
                        <tr>
                            <td colspan="3">
                                <label class="secretariaobs">Nome:</label><span class="obrigatorio">*</span>
                                <br><input type="text" size="33" name="nome" value="${param.nome}" title="Insira o seu nome">
                            </td>
                            <td colspan="3">
                                <label class="secretariaobs">Sobrenome:</label><span class="obrigatorio">*</span>
                                <br><input type="text" size="33" name="sobrenome" value="${param.sobrenome}" title="Insira o seu sobrenome">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <label class="secretariaobs">E-mail:</label><span class="obrigatorio">*</span>
                                <br><input type="text" size="33" name="email" value="${param.email}" title="Insira o seu e-mail">
                            </td>
                            <td colspan="3">
                                <label class="secretariaobs">CPF:</label><span class="obrigatorio">*</span>
                                <br><input type="text" size="33" name="cpf" value="${param.cpf}" title="Insira o seu CPF">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <label class="secretariaobs">Endereço:</label><span class="obrigatorio">*</span>
                                <br><input type="text" size="72" name="endereco" value="${param.endereco}" title="Insira o seu endereço">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <label class="secretariaobs">Número:</label>
                                <br><input type="text" name="numero" value="${param.numero}" title="Insira o número de seu endereço">
                            </td>
                            <td colspan="2">
                                <label class="secretariaobs">Complemento:</label>
                                <br><input type="text" name="complemento" value="${param.complemento}" title="Insira o complemento, caso haja">
                            </td>
                            <td colspan="2">
                                <label class="secretariaobs">CEP:</label><span class="obrigatorio">*</span>
                                <br><input type="text" name="cep" value="${param.cep}" title="Insira o número do CEP de seu endereço">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <label class="secretariaobs">Bairro:</label><span class="obrigatorio">*</span>
                                <br><input type="text" name="bairro" value="${param.bairro}" title="Insira o bairro onde mora">
                            </td>
                            <td colspan="2">
                                <label class="secretariaobs">Cidade:</label><span class="obrigatorio">*</span>
                                <br><input type="text" name="cidade" value="${param.cidade}" title="Insira a cidade onde mora">
                            </td>
                            <td colspan="2">
                                <label class="secretariaobs">Estado:</label><span class="obrigatorio">*</span>
                                <br><select id="estado" name="estado">
                                    <%
                                        // Populando o elemento select com os dados da tabela ESTADOS
                                        try {
                                            String query = "SELECT ID,SIGLA FROM ESTADOS";
                                            String estado = request.getParameter("estado");
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
                                <br><input type="text" name="telefone" value="${param.telefone}" title="Insira o número do seu telefone residencial">
                            </td>
                            <td colspan="2">
                                <label class="secretariaobs">Telefone Móvel:</label>
                                <br><input type="text" name="celular" value="${param.celular}" title="Insira o número do seu telefone móvel">
                            </td>
                            <td colspan="2"></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <label class="secretariaobs">Senha:</label><span class="obrigatorio">*</span>
                                <br><input type="password" name="senha" title="Insira uma senha">
                            </td>
                            <td colspan="2">
                                <label class="secretariaobs">Confirme a senha:</label><span class="obrigatorio">*</span>
                                <br><input type="password" name="senha2" title="Confirme a sua senha">
                            </td>
                            <td colspan="2"></td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <input type="submit" class="botao" value="Incluir">
                                <input type="reset" class="botao" value="Limpar">
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
            <%@include file="_templates/footer.jsp"%>
        </div>
    </body>
</html>