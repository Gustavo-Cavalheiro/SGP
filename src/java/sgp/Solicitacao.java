package sgp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

public class Solicitacao {

    private int id;
    private int usuario;
    private int servico;
    private String endereco;
    private String info;
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

    public int getServico() {
        return servico;
    }

    public void setServico(int servico) {
        this.servico = servico;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    public boolean inserir() throws Exception {
        try {
            String SQL = "INSERT INTO SOLICITACOES "
                    + "(USUARIO, SERVICO, ENDERECO, INFO_ADICIONAL, DATA) "
                    + "VALUES (?,?,?,?,?)";
            Connection con = Conexao.getConnection();
            PreparedStatement ps = con.prepareStatement(SQL);
            ps.setInt(1, this.usuario);
            ps.setInt(2, this.servico);
            ps.setString(3, this.endereco);
            ps.setString(4, this.info);
            ps.setTimestamp(5, new Timestamp(System.currentTimeMillis()));
            ps.execute();
            ps.close();
            return true;
        } catch (Exception ex) {
            throw ex;
        }
    }

    public boolean delete() throws Exception {
        try {
            Conexao.executeStatement("DELETE FROM SOLICITACOES WHERE ID = " + this.id);
            return true;
        } catch (Exception ex) {
            throw ex;
        }
    }

    public static boolean delete(String id) throws Exception {
        try {
            Conexao.executeStatement("DELETE FROM SOLICITACOES WHERE ID = " + id);
            return true;
        } catch (Exception ex) {
            throw ex;
        }
    }

    public static String getSolicitacoes() {
        return getSolicitacoes("", "");
    }

    public static String getSolicitacoes(int id) {
        String html = "";
        try {
            String SQL = "SELECT se.TIPO, so.ENDERECO, so.INFO_ADICIONAL, so.DATA FROM SOLICITACOES so JOIN SERVICOS se ON(so.SERVICO = se.ID) WHERE so.USUARIO=" + id + " ORDER BY so.ID";
            ArrayList<Object[]> result = Conexao.getQuery(SQL);
            if (result.size() > 0) {
                html += "<table class='tabela'>"
                        + "<th class='tabela'>Tipo de Serviço</th><th class='tabela'>Endereço</th><th class='tabela'>Informação Adicional</th><th class='tabela'>Data da Solicitação</th>";
                for (Object[] reg : result) {
                    Date date = (Date) reg[3];
                    html += "<tr>"
                            + "<td>" + reg[0] + "</td>"
                            + "<td>" + reg[1] + "</td>"
                            + "<td>" + reg[2] + "</td>"
                            + "<td>" + date.toLocaleString() + "</td>"
                            + "</tr>";
                }
                html += "</table>";
            } else {
                html = "<span class='secretariaobs'> <b>Você não solicitou serviços.</b></span><br>";
            }
        } catch (Exception ex) {
            html = "<span style='color:red;'>" + ex.getLocalizedMessage() + "</span>";
        }
        return html;
    }

    public static String getSolicitacoes(String pesquisa, String campo) {
        String html = "";
        try {
            String SQL = "SELECT so.ID, CONCAT(u.NOME,' ',u.SOBRENOME), u.EMAIL, u.CPF, se.TIPO, so.ENDERECO, so.INFO_ADICIONAL, so.DATA "
                    + "FROM SOLICITACOES so JOIN USUARIOS u ON (so.USUARIO = u.ID) "
                    + "JOIN SERVICOS se ON (so.SERVICO = se.ID)";

            if (!pesquisa.equals("")) {
                switch (campo) {
                    case "usuario":
                        SQL += " WHERE UPPER(u.NOME) LIKE UPPER('%" + pesquisa + "%') OR UPPER(u.SOBRENOME) LIKE UPPER('%" + pesquisa + "%')";
                        break;
                    case "email":
                        SQL += " WHERE UPPER(u.EMAIL) LIKE UPPER('%" + pesquisa + "%')";
                        break;
                    case "servico":
                        SQL += " WHERE UPPER(se.TIPO) LIKE UPPER('%" + pesquisa + "%')";
                        break;
                    case "endereco":
                        SQL += " WHERE UPPER(so.ENDERECO) LIKE UPPER('%" + pesquisa + "%')";
                        break;
                    case "informacoes":
                        SQL += " WHERE UPPER(so.INFO_ADICIONAL) LIKE UPPER('%" + pesquisa + "%')";
                        break;
                }
            }
            SQL += " ORDER BY so.ID";

            ArrayList<Object[]> result = Conexao.getQuery(SQL);
            if (result.size() > 0) {
                html += "<table class='tabela'>"
                        + "<th></th><th></th>"
                        + "<th>USUÁRIO</th> <th>E-MAIL</th> <th>SERVICO</th> "
                        + "<th>ENDERECO</th> <th>INFORMAÇÕES</th> <th>DATA DA SOLICITAÇÃO</th>";
                for (Object[] reg : result) {
                    Date date = (Date) reg[7];
                    html += "<tr>"
                            + "<td><a href='?delete&ID=" + reg[0] + "'><img src='../_imagens/excluir.png' alt='excluir' onmouseover='Tip(\"Excluir\")' onmouseout='UnTip()'></a></td>"
                            + "<td><a href='editar_solicitacao.jsp?ID=" + reg[0] + "'><img src='../_imagens/editar.png' alt='editar' onmouseover='Tip(\"Editar\")' onmouseout='UnTip()'></a></td>"
                            + "<td>" + reg[1] + "</td>"
                            + "<td>" + reg[2] + "</td>"
                            + "<td>" + reg[4] + "</td>"
                            + "<td>" + reg[5] + "</td>"
                            + "<td>" + reg[6] + "</td>"
                            + "<td>" + date.toLocaleString() + "</td>"
                            + "</tr>";
                }
                html += "</table>";
            } else {
                if (pesquisa.equals("")) {
                    html = "<span class='secretariaobs'><b>Não existem solicitações cadastradas no sistema.</b></span><br>";
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
