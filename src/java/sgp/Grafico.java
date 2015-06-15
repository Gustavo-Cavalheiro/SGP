package sgp;

import java.awt.Color;
import java.awt.Font;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.CategoryAxis;
import org.jfree.chart.axis.CategoryLabelPositions;
import org.jfree.chart.axis.NumberAxis;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.renderer.category.BarRenderer;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.category.DefaultCategoryDataset;

public class Grafico extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("image/png");
        JFreeChart chart = getChart(request.getParameter("tipo"));
        OutputStream out = response.getOutputStream();
        ChartUtilities.writeChartAsPNG(out, chart, 690, 540);
    }

    public JFreeChart getChart(String tipo) {
        CategoryDataset dataset = createDataset(tipo);
        JFreeChart chart = createChart(dataset, tipo);
        return chart;
    }

    private CategoryDataset createDataset(String tipo) {
        try {
            String SQL;
            String series;
            switch (tipo) {
                case "elogio":
                    SQL = "SELECT S.NOME, COUNT(E.SECRETARIA) FROM SECRETARIAS S LEFT JOIN ELOGIOS E ON(E.SECRETARIA = S.ID) GROUP BY S.NOME";
                    series = "Elogios";
                    break;
                case "reclamacao":
                    SQL = "SELECT S.NOME, COUNT(R.SECRETARIA) FROM SECRETARIAS S LEFT JOIN RECLAMACOES R ON(R.SECRETARIA = S.ID) GROUP BY S.NOME";
                    series = "Reclamações";
                    break;
                case "consulta":
                    SQL = "SELECT S.NOME, COUNT(C.SECRETARIA) FROM SECRETARIAS S LEFT JOIN CONSULTAS C ON(C.SECRETARIA = S.ID) GROUP BY S.NOME";
                    series = "Consultas";
                    break;
                case "solicitacao":
                    SQL = "SELECT SE.TIPO, COUNT(SO.SERVICO) FROM SERVICOS SE LEFT JOIN SOLICITACOES SO ON(SO.SERVICO = SE.ID) GROUP BY SE.TIPO";
                    series = "Solicitacoes";
                    break;
                default:
                    SQL = "SELECT S.NOME, COUNT(E.SECRETARIA) FROM SECRETARIAS S LEFT JOIN ELOGIOS E ON(E.SECRETARIA = S.ID) GROUP BY S.NOME";
                    series = "Elogios";
                    break;
            }
            ArrayList<Object[]> result = Conexao.getQuery(SQL);
            if (result.size() > 0) {
                DefaultCategoryDataset dataset = new DefaultCategoryDataset();
                for (Object[] reg : result) {
                    dataset.addValue((long) reg[1], series, (String) reg[0]);
                }
                return dataset;
            } else {
                return null;
            }
        } catch (Exception ex) {
            return null;
        }
    }

    private JFreeChart createChart(CategoryDataset dataset, String tipo) {
        String title;
        String domain;
        Color color;
        switch (tipo) {
            case "elogio":
                title = "Quantidade de Elogios";
                domain = "Secretarias";
                color = Color.green;
                break;
            case "reclamacao":
                title = "Quantidade de Reclamações";
                domain = "Secretarias";
                color = Color.red;
                break;
            case "consulta":
                title = "Quantidade de Consultas Marcadas";
                domain = "Secretarias";
                color = Color.blue;
                break;
            case "solicitacao":
                title = "Quantidade de Solicitações de Serviços";
                domain = "Serviços";
                color = Color.yellow;
                break;
            default:
                title = "Quantidade de Elogios";
                domain = "Secretarias";
                color = Color.green;
                break;
        }

        JFreeChart chart = ChartFactory.createBarChart3D(
                title, // title
                domain, // domain label
                "", // range label
                dataset, // data
                PlotOrientation.VERTICAL, // orientation
                false, // include legend
                true, // tooltips
                false // URLs
        );

        CategoryPlot plot = chart.getCategoryPlot();

        // set the range axis to display integers only
        NumberAxis rangeAxis = (NumberAxis) plot.getRangeAxis();
        rangeAxis.setStandardTickUnits(NumberAxis.createIntegerTickUnits());

        // disable bar outlines
        BarRenderer renderer = (BarRenderer) plot.getRenderer();
        renderer.setDrawBarOutline(false);

        // set domain axis to display vertically
        CategoryAxis axis = plot.getDomainAxis();
        axis.setCategoryLabelPositions(CategoryLabelPositions.UP_90);

        axis.setCategoryMargin(0.4);

        renderer.setSeriesPaint(0, color);
        chart.getTitle().setPaint(Color.decode("#FF8000"));
        axis.setLabelPaint(Color.decode("#FF8000"));
        axis.setLabelFont(new Font("Verdana", Font.BOLD, 16));
        axis.setTickLabelFont(new Font("Verdana", Font.PLAIN, 12));

        return chart;
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
