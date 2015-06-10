package sgp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

public class Usuario {

    private int id;
    private String nome;
    private String sobrenome;
    private String email;
    private String cpf;
    private String endereco;
    private int numero;
    private String complemento;
    private String cep;
    private String bairro;
    private String cidade;
    private int estado;
    private String telefone;
    private String celular;
    private String senha;
    private int tipo;
    private Date dataRegistro;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getSobrenome() {
        return sobrenome;
    }

    public void setSobrenome(String sobrenome) {
        this.sobrenome = sobrenome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public String getComplemento() {
        return complemento;
    }

    public void setComplemento(String complemento) {
        this.complemento = complemento;
    }

    public String getCep() {
        return cep;
    }

    public void setCep(String cep) {
        this.cep = cep;
    }

    public String getBairro() {
        return bairro;
    }

    public void setBairro(String bairro) {
        this.bairro = bairro;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public int getTipo() {
        return tipo;
    }

    public void setTipo(int tipo) {
        this.tipo = tipo;
    }

    public Date getDataRegistro() {
        return dataRegistro;
    }

    public void setDataRegistro(Date dataRegistro) {
        this.dataRegistro = dataRegistro;
    }

    public boolean login(String email, String senha) throws Exception {
        try {
            String SQL = "SELECT * FROM USUARIOS WHERE EMAIL='" + email + "' AND SENHA='" + senha + "'";
            ArrayList<Object[]> result = Conexao.getQuery(SQL);
            if (result.size() > 0) {
                for (Object[] reg : result) {
                    this.id = (int) reg[0];
                    this.nome = (String) reg[1];
                    this.sobrenome = (String) reg[2];
                    this.email = (String) reg[3];
                    this.cpf = (String) reg[4];
                    this.endereco = (String) reg[5];
                    if (reg[6] != null) this.numero = (int) reg[6];
                    this.complemento = (String) reg[7];
                    this.cep = (String) reg[8];
                    this.bairro = (String) reg[9];
                    this.cidade = (String) reg[10];
                    this.estado = (int) reg[11];
                    this.telefone = (String) reg[12];
                    this.celular = (String) reg[13];
                    this.senha = (String) reg[14];
                    this.tipo = (int) reg[15];
                    this.dataRegistro = (Date) reg[16];
                }
                return true;
            } else {
                return false;
            }
        } catch (Exception ex) {
            throw ex;
        }
    }

    public boolean inserir() throws Exception {
        try {
            // Verificando se o email do usuário já está cadastrado no site
            String SQL = "SELECT * FROM USUARIOS WHERE EMAIL='" + this.email + "'";
            if (Conexao.getQuery(SQL).size() > 0) {
                throw new Exception("O e-mail informado já está cadastrado no site.");

            } else {
                // Inserindo novo usuário
                SQL = "INSERT INTO USUARIOS ";
                SQL += "(NOME, SOBRENOME, EMAIL, CPF, ENDERECO, NUMERO, COMPLEMENTO, CEP, ";
                SQL += "BAIRRO, CIDADE, ESTADO, TELEFONE, CELULAR, SENHA, TIPO, DATA_REGISTRO) ";
                SQL += "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                Connection con = Conexao.getConnection();
                PreparedStatement ps = con.prepareStatement(SQL);
                ps.setString(1, this.nome);
                ps.setString(2, this.sobrenome);
                ps.setString(3, this.email);
                ps.setString(4, this.cpf);
                ps.setString(5, this.endereco);
                ps.setInt(6, this.numero);
                ps.setString(7, this.complemento);
                ps.setString(8, this.cep);
                ps.setString(9, this.bairro);
                ps.setString(10, this.cidade);
                ps.setInt(11, this.estado);
                ps.setString(12, this.telefone);
                ps.setString(13, this.celular);
                ps.setString(14, this.senha);
                ps.setInt(15, this.tipo);
                ps.setTimestamp(16, new Timestamp(System.currentTimeMillis()));
                ps.execute();
                ps.close();
                return true;
            }
        } catch (Exception ex) {
            throw ex;
        }
    }

    public boolean atualizar() throws Exception {
        try {
            String SQL = "UPDATE USUARIOS SET ";
            SQL += "NOME=?, SOBRENOME=?, EMAIL=?, CPF=?, ENDERECO=?, NUMERO=?, COMPLEMENTO=?, CEP=?, ";
            SQL += "BAIRRO=?, CIDADE=?, ESTADO=?, TELEFONE=?, CELULAR=?, SENHA=?, TIPO=? ";
            SQL += "WHERE ID=?";
            Connection con = Conexao.getConnection();
            PreparedStatement ps = con.prepareStatement(SQL);
            ps.setString(1, this.nome);
            ps.setString(2, this.sobrenome);
            ps.setString(3, this.email);
            ps.setString(4, this.cpf);
            ps.setString(5, this.endereco);
            ps.setInt(6, this.numero);
            ps.setString(7, this.complemento);
            ps.setString(8, this.cep);
            ps.setString(9, this.bairro);
            ps.setString(10, this.cidade);
            ps.setInt(11, this.estado);
            ps.setString(12, this.telefone);
            ps.setString(13, this.celular);
            ps.setString(14, this.senha);
            ps.setInt(15, this.tipo);
            ps.setInt(16, this.id);
            ps.execute();
            ps.close();
            return true;
        } catch (Exception ex) {
            throw ex;
        }
    }

    public static boolean delete(int id) throws Exception {
        try {
            if (id == 1) throw new Exception("Usuario ANÔNIMO não pode ser deletado!");
            Conexao.executeStatement("DELETE FROM CONSULTAS WHERE USUARIO = " + id);
            Conexao.executeStatement("DELETE FROM ELOGIOS WHERE USUARIO = " + id);
            Conexao.executeStatement("DELETE FROM RECLAMACOES WHERE USUARIO = " + id);
            Conexao.executeStatement("DELETE FROM SOLICITACOES WHERE USUARIO = " + id);
            Conexao.executeStatement("DELETE FROM USUARIOS WHERE ID = " + id);
            return true;
        } catch (Exception ex) {
            throw ex;
        }
    }

    public static boolean verificaEmail(String email) throws Exception {
        try {
            String SQL = "SELECT * FROM USUARIOS WHERE EMAIL='" + email + "'";
            return Conexao.getQuery(SQL).size() > 0;
        } catch (Exception ex) {
            throw ex;
        }
    }

    public static Usuario getUsuario(int id) throws Exception {
        try {
            String SQL = "SELECT * FROM USUARIOS WHERE ID = " + id;
            return getUser(SQL);
        } catch (Exception ex) {
            throw ex;
        }
    }

    public static String getSenha(String email) throws Exception {
        try {
            String SQL = "SELECT * FROM USUARIOS WHERE EMAIL='" + email + "'";
            Usuario usuario = getUser(SQL);
            if (usuario != null) return usuario.senha;
            else return null;
        } catch (Exception ex) {
            throw ex;
        }
    }

    private static Usuario getUser(String SQL) throws Exception {
        try {
            ArrayList<Object[]> result = Conexao.getQuery(SQL);
            if (result.size() > 0) {
                Usuario usuario = new Usuario();
                for (Object[] reg : result) {
                    usuario.id = (int) reg[0];
                    usuario.nome = (String) reg[1];
                    usuario.sobrenome = (String) reg[2];
                    usuario.email = (String) reg[3];
                    usuario.cpf = (String) reg[4];
                    usuario.endereco = (String) reg[5];
                    if (reg[6] != null) usuario.numero = (int) reg[6];
                    usuario.complemento = (String) reg[7];
                    usuario.cep = (String) reg[8];
                    usuario.bairro = (String) reg[9];
                    usuario.cidade = (String) reg[10];
                    usuario.estado = (int) reg[11];
                    usuario.telefone = (String) reg[12];
                    usuario.celular = (String) reg[13];
                    usuario.senha = (String) reg[14];
                    usuario.tipo = (int) reg[15];
                    usuario.dataRegistro = (Date) reg[16];
                }
                return usuario;
            } else {
                return null;
            }
        } catch (Exception ex) {
            throw ex;
        }
    }

    public static String getUsuarios() {
        return getUsuarios("", "");
    }

    public static String getUsuarios(String pesquisa, String campo) {
        String html = "";
        try {
            String SQL = "SELECT u.ID, u.NOME, u.SOBRENOME, u.EMAIL, u.CPF, u.ENDERECO, u.NUMERO, u.COMPLEMENTO, "
                    + "u.CEP, u.BAIRRO, u.CIDADE, e.SIGLA, u.TELEFONE, u.CELULAR, t.TIPO, u.DATA_REGISTRO "
                    + "FROM USUARIOS u JOIN ESTADOS e ON(u.ESTADO = e.ID) "
                    + "JOIN TIPO_USUARIO t ON (u.TIPO = t.ID)";

            if (!pesquisa.equals("")) {
                if (campo.equals("tipo")) {
                    SQL += " WHERE UPPER(u.TIPO) LIKE UPPER('%" + pesquisa + "%') OR UPPER(t.TIPO) LIKE UPPER('%" + pesquisa + "%')";
                } else {
                    SQL += " WHERE UPPER(u." + campo + ") LIKE UPPER('%" + pesquisa + "%')";
                }
            }
            SQL += " ORDER BY u.ID";

            ArrayList<Object[]> result = Conexao.getQuery(SQL);
            if (result.size() > 0) {
                html += "<table class='tabela'>";
                html += "<th></th><th></th>"
                        + "<th>ID</th> <th>NOME</th> <th>SOBRENOME</th> <th>E-MAIL</th> <th>CPF</th>"
                        + "<th>TIPO</th>";
                for (Object[] reg : result) {
                    html += "<tr>";
                    html += "<td><a href='?delete&ID=" + reg[0] + "'><img src='../_imagens/excluir.png' alt='excluir' onmouseover='Tip(\"Excluir\")' onmouseout='UnTip()'></a></td>";
                    html += "<td><a href='editar_usuario.jsp?ID=" + reg[0] + "'><img src='../_imagens/editar.png' alt='editar' onmouseover='Tip(\"Editar\")' onmouseout='UnTip()'></a></td>";
                    html += "<td>" + reg[0] + "</td>";
                    html += "<td>" + reg[1] + "</td>";
                    html += "<td>" + reg[2] + "</td>";
                    html += "<td>" + reg[3] + "</td>";
                    html += "<td>" + reg[4] + "</td>";
                    html += "<td>" + reg[14] + "</td>";
                    html += "</tr>";
                }
                html += "</table>";
            } else {
                if (pesquisa.equals("")) {
                    html = "<span class='secretariaobs'><b>Não existem usuários cadastrados no sistema.</b></span><br>";
                } else {
                    html = "<span class='secretariaobs'><b>Não existem resultados que satisfaçam a pesquisa.</b></span><br>";
                }
            }
        } catch (Exception ex) {
            html = "<span style='color:red;'>" + ex.getLocalizedMessage() + "</span>";
        }
        return html;
    }

}
