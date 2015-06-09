package sgp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class Conexao {

    public static Connection getConnection() throws Exception {
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/sgp", user = "root", pass = "1234";
        return DriverManager.getConnection(url, user, pass);
    }

    public static int executeStatement(String SQL) throws Exception {
        Exception e = null;
        int result = 0;
        Connection con = null;
        Statement stmt = null;
        try {
            con = getConnection();
            stmt = con.createStatement();
            result = stmt.executeUpdate(SQL);
        } catch (Exception ex) {
            e = ex;
        } finally {
            try {
                stmt.close();
            } catch (Exception ex) {
            }
            try {
                con.close();
            } catch (Exception ex) {
            }
        }
        if (e != null) throw e;
        return result;
    }

    public static ArrayList<Object[]> getQuery(String SQL) throws Exception {
        Exception e = null;
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        ArrayList<Object[]> result = null;
        try {
            con = getConnection();
            stmt = con.createStatement();
            rs = stmt.executeQuery(SQL);
            result = new ArrayList<>();
            while (rs.next()) {
                Object[] reg = new Object[rs.getMetaData().getColumnCount()];
                for (int i = 0; i < rs.getMetaData().getColumnCount(); ++i)
                    reg[i] = rs.getObject(i + 1);
                result.add(reg);
            }
        } catch (Exception ex) {
            e = ex;
        } finally {
            try {
                rs.close();
            } catch (Exception ex2) {
            }
            try {
                stmt.close();
            } catch (Exception ex2) {
            }
            try {
                con.close();
            } catch (Exception ex2) {
            }
        }
        if (e != null) throw e;
        return result;
    }

}
