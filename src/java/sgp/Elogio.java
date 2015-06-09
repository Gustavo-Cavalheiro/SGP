package sgp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

public class Elogio {

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
            String SQL = "INSERT INTO ELOGIOS ";
            SQL += "(USUARIO, SECRETARIA, MENSAGEM, DATA) ";
            SQL += "VALUES (?,?,?,?)";
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

    public boolean delete(String id) throws Exception {
        try {
            Conexao.executeStatement("DELETE FROM ELOGIOS WHERE ID = " + id);
            return true;
        } catch (Exception ex) {
            throw ex;
        }
    }

    public String getElogios() {
        return getElogios("", "");
    }

    public String getElogios(int id) {
        String html = "";
        try {
            String SQL = "SELECT s.NOME, e.MENSAGEM, e.DATA FROM ELOGIOS e JOIN SECRETARIAS s ON(e.SECRETARIA = s.ID) WHERE e.USUARIO=" + id + " ORDER BY e.ID";
            ArrayList<Object[]> result = Conexao.getQuery(SQL);
            if (result.size() > 0) {
                html += "<table class='tabela'>";
                html += "<th class='tabela'>Secretaria</th><th class='tabela'>Mensagem</th><th class='tabela'>Data do Elogio</th>";
                for (Object[] reg : result) {
                    Date date = (Date) reg[2];
                    html += "<tr>";
                    html += "<td>" + reg[0] + "</td>";
                    html += "<td>" + reg[1] + "</td>";
                    html += "<td>" + date.toLocaleString() + "</td>";
                    html += "</tr>";
                }
                html += "</table>";
            } else {
                html = "<span class='secretariaobs'><b>Você não possui elogios cadastrados.</b></span><br>";
            }
        } catch (Exception ex) {
            html = "<span style='color:red;'>" + ex.getLocalizedMessage() + "</span>";
        }
        return html;
    }

    public String getElogios(String pesquisa, String campo) {
        String html = "";
        try {
            String SQL = "SELECT e.ID, CONCAT(u.NOME,' ',u.SOBRENOME), u.EMAIL, u.CPF, s.NOME, e.MENSAGEM, e.DATA "
                    + "FROM ELOGIOS e JOIN USUARIOS u ON (e.USUARIO = u.ID) "
                    + "JOIN SECRETARIAS s ON (e.SECRETARIA = s.ID)";

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
                        SQL += " WHERE UPPER(e.MENSAGEM) LIKE UPPER('%" + pesquisa + "%')";
                        break;
                }
            }
            SQL += " ORDER BY e.ID";

            ArrayList<Object[]> result = Conexao.getQuery(SQL);
            if (result.size() > 0) {
                html += "<table class='tabela'>";
                html += "<th></th><th></th>";
                html += "<th>USUÁRIO</th> <th>E-MAIL</th> <th>CPF</th> <th>SECRETARIA</th> <th>MENSAGEM</th> <th>DATA DO ELOGIO</th>";
                for (Object[] reg : result) {
                    Date date = (Date) reg[6];
                    html += "<tr>";
                    html += "<td><a href='?delete&ID=" + reg[0] + "'><img src='../_imagens/excluir.png' alt='excluir' onmouseover='Tip(\"Excluir\")' onmouseout='UnTip()'></a></td>";
                    html += "<td><a href='editar_elogio.jsp?ID=" + reg[0] + "'><img src='../_imagens/editar.png' alt='editar' onmouseover='Tip(\"Editar\")' onmouseout='UnTip()'></a></td>";
                    html += "<td>" + reg[1] + "</td>";
                    html += "<td>" + reg[2] + "</td>";
                    html += "<td>" + reg[3] + "</td>";
                    html += "<td>" + reg[4] + "</td>";
                    html += "<td>" + reg[5] + "</td>";
                    html += "<td>" + date.toLocaleString() + "</td>";
                    html += "</tr>";
                }
                html += "</table>";
            } else {
                if (pesquisa.equals("")) {
                    html = "<span class='secretariaobs'><b>Não existem elogios cadastrados no sistema.</b></span><br>";
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
