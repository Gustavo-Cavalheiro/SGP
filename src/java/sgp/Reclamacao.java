package sgp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

public class Reclamacao {

    private int id;
    private int usuario;
    private int secretaria;
    private String mensagem;
    private Date data;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUsuario() {
        return usuario;
    }

    public void setUsuario(int usuario) {
        this.usuario = usuario;
    }

    public int getSecretaria() {
        return secretaria;
    }

    public void setSecretaria(int secretaria) {
        this.secretaria = secretaria;
    }

    public String getMensagem() {
        return mensagem;
    }

    public void setMensagem(String mensagem) {
        this.mensagem = mensagem;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    public boolean inserir() throws Exception {
        try {
            String SQL = "INSERT INTO RECLAMACOES "
                    + "(USUARIO, SECRETARIA, MENSAGEM, DATA) "
                    + "VALUES (?,?,?,?)";
            Connection con = Conexao.getConnection();
            PreparedStatement ps = con.prepareStatement(SQL);
            ps.setInt(1, this.usuario);
            ps.setInt(2, this.secretaria);
            ps.setString(3, this.mensagem);
            ps.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
            ps.execute();
            ps.close();
            return true;
        } catch (Exception ex) {
            throw ex;
        }
    }

    public boolean delete() throws Exception {
        try {
            Conexao.executeStatement("DELETE FROM RECLAMACOES WHERE ID = " + this.id);
            return true;
        } catch (Exception ex) {
            throw ex;
        }
    }

    public static boolean delete(String id) throws Exception {
        try {
            Conexao.executeStatement("DELETE FROM RECLAMACOES WHERE ID = " + id);
            return true;
        } catch (Exception ex) {
            throw ex;
        }
    }

    public static String getReclamacoes() {
        return getReclamacoes("", "");
    }

    public static String getReclamacoes(int id) {
        String html = "";
        try {
            String SQL = "SELECT s.NOME, r.MENSAGEM, r.DATA FROM RECLAMACOES r JOIN SECRETARIAS s ON(r.SECRETARIA = s.ID) WHERE r.USUARIO=" + id + " ORDER BY r.ID";
            ArrayList<Object[]> result = Conexao.getQuery(SQL);
            if (result.size() > 0) {
                html += "<table class='tabela'>"
                        + "<th class='tabela'>Secretaria</th><th class='tabela'>Mensagem</th><th class='tabela'>Data da Reclamação</th>";
                for (Object[] reg : result) {
                    Date date = (Date) reg[2];
                    html += "<tr>"
                            + "<td>" + reg[0] + "</td>"
                            + "<td>" + reg[1] + "</td>"
                            + "<td>" + date.toLocaleString() + "</td>"
                            + "</tr>";
                }
                html += "</table>";
            } else {
                html = "<span class='secretariaobs'><b>Você não possui reclamações cadastradas.</b></span><br>";
            }
        } catch (Exception ex) {
            html = "<span style='color:red;'>" + ex.getLocalizedMessage() + "</span>";
        }
        return html;
    }

    public static String getReclamacoes(String pesquisa, String campo) {
        String html = "";
        try {
            String SQL = "SELECT r.ID, CONCAT(u.NOME,' ',u.SOBRENOME), u.EMAIL, u.CPF, s.NOME, r.MENSAGEM, r.DATA "
                    + "FROM RECLAMACOES r JOIN USUARIOS u ON (r.USUARIO = u.ID) "
                    + "JOIN SECRETARIAS s ON (r.SECRETARIA = s.ID)";

            if (!pesquisa.equals("")) {
                switch (campo) {
                    case "usuario":
                        SQL += " WHERE UPPER(u.NOME) LIKE UPPER('%" + pesquisa + "%') OR UPPER(u.SOBRENOME) LIKE UPPER('%" + pesquisa + "%')";
                        break;
                    case "email":
                        SQL += " WHERE UPPER(u.EMAIL) LIKE UPPER('%" + pesquisa + "%')";
                        break;
                    case "cpf":
                        SQL += " WHERE UPPER(u.CPF) LIKE UPPER('%" + pesquisa + "%')";
                        break;
                    case "secretaria":
                        SQL += " WHERE UPPER(s.NOME) LIKE UPPER('%" + pesquisa + "%')";
                        break;
                    case "mensagem":
                        SQL += " WHERE UPPER(r.MENSAGEM) LIKE UPPER('%" + pesquisa + "%')";
                        break;
                }
            }
            SQL += " ORDER BY r.ID";

            ArrayList<Object[]> result = Conexao.getQuery(SQL);
            if (result.size() > 0) {
                html += "<table class='tabela'>"
                        + "<th></th><th></th>"
                        + "<th>USUÁRIO</th> <th>E-MAIL</th> <th>CPF</th> <th>SECRETARIA</th> <th>MENSAGEM</th> <th>DATA DA RECLAMAÇÃO</th>";
                for (Object[] reg : result) {
                    Date date = (Date) reg[6];
                    html += "<tr>"
                            + "<td><a href='?delete&ID=" + reg[0] + "'><img src='../_imagens/excluir.png' alt='excluir' onmouseover='Tip(\"Excluir\")' onmouseout='UnTip()'></a></td>"
                            + "<td><a href='editar_reclamacao.jsp?ID=" + reg[0] + "'><img src='../_imagens/editar.png' alt='editar' onmouseover='Tip(\"Editar\")' onmouseout='UnTip()'></a></td>" + "<td>" + reg[1] + "</td>"
                            + "<td>" + reg[2] + "</td>"
                            + "<td>" + reg[3] + "</td>"
                            + "<td>" + reg[4] + "</td>"
                            + "<td>" + reg[5] + "</td>"
                            + "<td>" + date.toLocaleString() + "</td>"
                            + "</tr>";
                }
                html += "</table>";
            } else {
                if (pesquisa.equals("")) {
                    html = "<span class='secretariaobs'><b>Não existem reclamações cadastradas no sistema.</b></span><br>";
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
