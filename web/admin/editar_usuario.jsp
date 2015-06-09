<%@page import="javax.swing.text.MaskFormatter"%>
<%@page import="sgp.Validacoes"%>
<%@page import="sgp.Conexao"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    Usuario usuario = (Usuario) session.getAttribute("user");

    // Verificando se usuário está logado e se tem permissões de administrador, caso negativo redireciona para index
    if (usuario == null || usuario.getTipo() != 1) {
        response.sendRedirect(request.getContextPath() + "/index.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>SGP - Alterar Cadastro de Usuário</title>
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
                cpf = request.getParameter("cpf").trim().replaceAll("\\D", "");
                endereco = request.getParameter("endereco").trim();
                numero = request.getParameter("numero").trim();
                complemento = request.getParameter("complemento").trim();
                cep = request.getParameter("cep").trim().replaceAll("\\D", "");
                bairro = request.getParameter("bairro").trim();
                cidade = request.getParameter("cidade").trim();
                estado = request.getParameter("estado").trim();
                telefone = request.getParameter("telefone").trim().replaceAll("\\D", "");
                celular = request.getParameter("celular").trim().replaceAll("\\D", "");
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
                if (numero.equals("")) erro.add("\"Numero\"");
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

                    // Verificando Email
                } else if (!Validacoes.validaEmail(email)) {
                    mensagem = "O e-mail informado é invalido.";

                    // Verificando CPF
                } else if (!Validacoes.validaCPF(cpf)) {
                    mensagem = "O CPF informado é invalido.";

                    // Verificando Numero
                } else if (!Validacoes.isNumeric(numero)) {
                    mensagem = "O Numero informado é invalido.";

                    // Verificando CEP
                } else if (!Validacoes.validaCep(cep)) {
                    mensagem = "O CEP informado é invalido.";

                    // Verificando Telefone
                } else if (!telefone.equals("") && !Validacoes.validaTelefone(telefone)) {
                    mensagem = "O Telefone informado é invalido.";

                    // Verificando Celular
                } else if (!celular.equals("") && !Validacoes.validaCelular(celular)) {
                    mensagem = "O Celular informado é invalido.";

                    // Verificando o tamanho da senha (necessário ao menos 6 caracteres)
                } else if (senha.length() < 6) {
                    mensagem = "A senha precisa ter no mínimo 6 caracteres.";

                    // Verificando se os campos "Senha" e "Confirmar Senha" são iguais
                } else if (!senha.equals(senha2)) {
                    mensagem = "As senhas digitadas são diferentes.";

                } else {
                    try {
                        // Atualizando dados do usuário
                        Usuario u = new Usuario();
                        u.setId(Integer.parseInt(id));
                        u.setNome(nome);
                        u.setSobrenome(sobrenome);
                        u.setEmail(email);
                        u.setCpf(cpf);
                        u.setEndereco(endereco);
                        u.setNumero(Integer.parseInt(numero));
                        u.setComplemento(complemento);
                        u.setCep(cep);
                        u.setBairro(bairro);
                        u.setCidade(cidade);
                        u.setEstado(Integer.parseInt(estado));
                        u.setTelefone(telefone);
                        u.setCelular(celular);
                        u.setSenha(senha);
                        u.setTipo(Integer.parseInt(tipo));
                        u.atualizar();

                        // Após atualizar os dados, redireciona para a página de usuários cadastrados
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
                    Usuario u = usuario.getUsuario(Integer.parseInt(id));
                    if (u != null) {
                        nome = u.getNome();
                        sobrenome = u.getSobrenome();
                        email = u.getEmail();
                        cpf = u.getCpf();
                        endereco = u.getEndereco();
                        numero = Integer.toString(u.getNumero());
                        complemento = u.getComplemento();
                        cep = u.getCep();
                        bairro = u.getBairro();
                        cidade = u.getCidade();
                        estado = Integer.toString(u.getEstado());
                        telefone = u.getTelefone();
                        celular = u.getCelular();
                        senha = u.getSenha();
                        senha2 = senha;
                        tipo = Integer.toString(u.getTipo());
                    } else {
                        response.sendRedirect(request.getContextPath() + "/admin/usuarios.jsp");
                        return;
                    }
                } catch (Exception ex) {
                    mensagem = "ERRO: " + ex.getLocalizedMessage();
                }

            } else if (request.getParameter("logoff") == null) {
                // Se o parâmetro ID não for encontrado redireciona para a página de usuários cadastrados
                response.sendRedirect(request.getContextPath() + "/admin/usuarios.jsp");
                return;
            }

            // Formatando campos
            try {
                MaskFormatter formatter = new MaskFormatter();
                formatter.setValueContainsLiteralCharacters(false);

                formatter.setMask("###.###.###-##");
                cpf = formatter.valueToString(cpf);

                formatter.setMask("##.###-###");
                cep = formatter.valueToString(cep);

                if (!telefone.equals("")) {
                    formatter.setMask("(##) ####-####");
                    telefone = formatter.valueToString(telefone);
                }
                if (!celular.equals("")) {
                    formatter.setMask("(##) #####-####");
                    celular = formatter.valueToString(celular);
                }
            } catch (Exception ex) {
            }
        %>
        <div id="conteudo-container">
            <%@include file="../_templates/header.jsp"%>
            <%@include file="../_templates/menu.jsp"%>
            <script type="text/javascript" src="../_scripts/script.js"></script>
            <div id="containerinterno">
                <span class="sobre">ALTERAR CADASTRO DE USUÁRIO<img src="../_imagens/sobre.png" alt="" onmouseover="Tip('Permite alterar os dados de usuários cadastrados.')" onmouseout="UnTip()"></span>
                <br><br>
                <div id="erro" style="color:red;">
                    <% // Verificando se existe alguma mensagem de erro à ser exibida
                        if (!mensagem.equals("")) out.println(mensagem + "<br><br>");
                    %>
                </div>
                <span class="obrigatorio2">*Campos obrigatórios.</span><br>
                <form method="post" action="">
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
                                <br><input type="text" size="33" name="nome" value="<%=nome%>" title="Insira o seu nome" onkeypress="return apenasLetras(event);" maxlength="50">
                            </td>
                            <td colspan="3">
                                <label class="secretariaobs">Sobrenome:</label><span class="obrigatorio">*</span>
                                <br><input type="text" size="33" name="sobrenome" value="<%=sobrenome%>" title="Insira o seu sobrenome" onkeypress="return apenasLetras(event);" maxlength="50">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <label class="secretariaobs">E-mail:</label><span class="obrigatorio">*</span>
                                <br><input type="text" size="33" name="email" value="<%=email%>" title="Insira o seu e-mail" onkeypress="return mascaraEmail(this, event);" maxlength="50">
                            </td>
                            <td colspan="3">
                                <label class="secretariaobs">CPF:</label><span class="obrigatorio">*</span>
                                <br><input type="text" size="33" name="cpf" value="<%=cpf%>" title="Insira o seu CPF" onkeypress="return mascaraCpf(this, event);" maxlength="14">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <label class="secretariaobs">Endereço:</label><span class="obrigatorio">*</span>
                                <br><input type="text" size="72" name="endereco" value="<%=endereco%>" title="Insira o seu endereço" maxlength="100">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <label class="secretariaobs">Número:</label><span class="obrigatorio">*</span>
                                <br><input type="text" name="numero" value="<%=numero%>" title="Insira o número de seu endereço" onkeypress="return apenasNumeros(event);" maxlength="5">
                            </td>
                            <td colspan="2">
                                <label class="secretariaobs">Complemento:</label>
                                <br><input type="text" name="complemento" value="<%=complemento%>" title="Insira o complemento, caso haja" maxlength="50">
                            </td>
                            <td colspan="2">
                                <label class="secretariaobs">CEP:</label><span class="obrigatorio">*</span>
                                <br><input type="text" name="cep" value="<%=cep%>" title="Insira o número do CEP de seu endereço" onkeypress="return mascaraCep(this, event);" maxlength="10">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <label class="secretariaobs">Bairro:</label><span class="obrigatorio">*</span>
                                <br><input type="text" name="bairro" value="<%=bairro%>" title="Insira o bairro onde mora" onkeypress="return apenasLetras(event);" maxlength="30">
                            </td>
                            <td colspan="2">
                                <label class="secretariaobs">Cidade:</label><span class="obrigatorio">*</span>
                                <br><input type="text" name="cidade" value="<%=cidade%>" title="Insira a cidade onde mora" onkeypress="return apenasLetras(event);" maxlength="30">
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
                                <br><input type="text" name="telefone" value="<%=telefone%>" title="Insira o número do seu telefone residencial" onkeypress="return mascaraTelefone(this, event);" maxlength="14">
                            </td>
                            <td colspan="2">
                                <label class="secretariaobs">Telefone Móvel:</label>
                                <br><input type="text" name="celular" value="<%=celular%>" title="Insira o número do seu telefone móvel" onkeypress="return mascaraCelular(this, event);" maxlength="15">
                            </td>
                            <td colspan="2"></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <label class="secretariaobs">Senha:</label><span class="obrigatorio">*</span>
                                <br><input type="password" name="senha" value="<%=senha%>" title="Insira uma senha" maxlength="50">
                            </td>
                            <td colspan="2">
                                <label class="secretariaobs">Confirme a senha:</label><span class="obrigatorio">*</span>
                                <br><input type="password" name="senha2" value="<%=senha2%>" title="Confirme a sua senha" maxlength="50">
                            </td>
                            <td colspan="2"></td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <input type="submit" class="botao" value="Atualizar">
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
            <%@include file="../_templates/footer.jsp"%>
        </div>
    </body>
</html>