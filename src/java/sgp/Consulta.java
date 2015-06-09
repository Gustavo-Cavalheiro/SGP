package sgp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

public class Consulta {

    private int id;
    private int usuario;
    private int secretaria;
    private String assunto;
    private Date dataPedido;
    private String dataAgendada;

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

    public String getAssunto() {
        return assunto;
    }

    public void setAssunto(String assunto) {
        this.assunto = assunto;
    }

    public Date getDataPedido() {
        return dataPedido;
    }

    public void setDataPedido(Date dataPedido) {
        this.dataPedido = dataPedido;
    }

    public String getDataAgendada() {
        return dataAgendada;
    }

    public void setDataAgendada(String dataAgendada) {
        this.dataAgendada = dataAgendada;
    }

    public boolean inserir() throws Exception {
        try {
            String SQL = "INSERT INTO CONSULTAS ";
            SQL += "(USUARIO, SECRETARIA, ASSUNTO, DATA_PEDIDO, DATA_AGENDADA) ";
            SQL += "VALUES (?,?,?,?,?)";
            Connection con = Conexao.getConnection();
            PreparedStatement ps = con.prepareStatement(SQL);
            ps.setInt(1, this.usuario);
            ps.setInt(2, this.secretaria);
            ps.setString(3, this.assunto);
            ps.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
            ps.setString(5, this.dataAgendada);
            ps.execute();
            ps.close();
            return true;
        } catch (Exception ex) {
            throw ex;
        }
    }

    public boolean delete(String id) throws Exception {
        try {
            Conexao.executeStatement("DELETE FROM CONSULTAS WHERE ID = " + id);
            return true;
        } catch (Exception ex) {
            throw ex;
        }
    }

    public String getConsultas() {
        return getConsultas("", "");
    }

    public String getConsultas(int id) {
        String html = "";
        try {
            String SQL = "SELECT s.NOME, c.ASSUNTO, c.DATA_PEDIDO, c.DATA_AGENDADA FROM CONSULTAS c JOIN SECRETARIAS s ON(c.SECRETARIA = s.ID) WHERE c.USUARIO=" + id + " ORDER BY c.ID";
            ArrayList<Object[]> result = Conexao.getQuery(SQL);
            if (result.size() > 0) {
                html += "<table class='tabela'>";
                html += "<th class='tabela'>Secretaria</th><th class='tabela'>Assunto</th><th class='tabela'>Data da Solicitação</th><th class='tabela'>Data Agendada</th>";
                for (Object[] reg : result) {
                    Date date = (Date) reg[2];
                    html += "<tr>";
                    html += "<td>" + reg[0] + "</td>";
                    html += "<td>" + reg[1] + "</td>";
                    html += "<td>" + date.toLocaleString() + "</td>";
                    html += "<td>" + reg[3] + "</td>";
                    html += "</tr>";
                }
                html += "</table>";
            } else {
                html = "<span class='secretariaobs'><b>Você não possui consultas marcadas.</b></span><br>";
            }
        } catch (Exception ex) {
            html = "<span style='color:red;'>" + ex.getLocalizedMessage() + "</span>";
        }
        return html;
    }

    public String getConsultas(String pesquisa, String campo) {
        String html = "";
        try {
            String SQL = "SELECT c.ID, CONCAT(u.NOME,' ',u.SOBRENOME), u.EMAIL, u.CPF, s.NOME, c.ASSUNTO, c.DATA_PEDIDO, c.DATA_AGENDADA "
                    + "FROM CONSULTAS c JOIN USUARIOS u ON (c.USUARIO = u.ID) "
                    + "JOIN SECRETARIAS s ON (c.SECRETARIA = s.ID)";

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
                    case "assunto":
                        SQL += " WHERE UPPER(c.ASSUNTO) LIKE UPPER('%" + pesquisa + "%')";
                        break;
                }
            }
            SQL += " ORDER BY c.ID";

            ArrayList<Object[]> result = Conexao.getQuery(SQL);
            if (result.size() > 0) {
                html += "<table class='tabela'>";
                html += "<th></th><th></th>"
                        + "<th>USUÁRIO</th> <th>E-MAIL</th> <th>CPF</th> <th>SECRETARIA</th> "
                        + "<th>ASSUNTO</th> <th>DATA AGENDADA</th>";
                for (Object[] reg : result) {
                    Date date = (Date) reg[6];
                    html += "<tr>";
                    html += "<td><a href='?delete&ID=" + reg[0] + "'><img src='../_imagens/excluir.png' alt='excluir' onmouseover='Tip(\"Excluir\")' onmouseout='UnTip()'></a></td>";
                    html += "<td><a href='editar_consulta.jsp?ID=" + reg[0] + "'><img src='../_imagens/editar.png' alt='editar' onmouseover='Tip(\"Editar\")' onmouseout='UnTip()'></a></td>";
                    html += "<td>" + reg[1] + "</td>";
                    html += "<td>" + reg[2] + "</td>";
                    html += "<td>" + reg[3] + "</td>";
                    html += "<td>" + reg[4] + "</td>";
                    html += "<td>" + reg[5] + "</td>";
                    html += "<td>" + reg[7] + "</td>";
                    html += "</tr>";
                }
                html += "</table>";
            } else {
                if (pesquisa.equals("")) {
                    html = "<span class='secretariaobs'><b>Não existem consultas agendadas no sistema.</b></span><br>";
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
