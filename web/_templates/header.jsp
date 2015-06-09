<%@page import="sgp.Usuario"%>
<%
    String home = request.getContextPath();
    // Desconnecta usu�rio caso seja encontrado o paramentro "logoff"
    if (request.getParameter("logoff") != null) {
        session.removeAttribute("user");
        response.sendRedirect(home + "/index.jsp");
        return;
    }
%>
<div id="topo">
    <a href="<%=home%>/index.jsp"><img src="<%=home%>/_imagens/logo.png" width="433" height="140" alt="home - Sistema de Gerenciamento Politico"></a>
</div>
<div class="login">
    <%  // Caso usu�rio esteja logado, exibe o nome de usu�rio e op�ao para sair
        Usuario u = (Usuario) session.getAttribute("user");
        if (u != null) {
    %>
    <span class="cargo">Bem vindo, <%=u.getNome()%> [ <a class="cargo" href="?logoff">Sair</a> ]</span>
    <%} else {%>
    <span class="cargo">Bem vindo, Visitante [ <a class="cargo" href="<%=home%>/login.jsp?returnto=<%=request.getRequestURI()%>">Fazer Login</a> / <a class="cargo" href="<%=home%>/cadastro.jsp">Cadastrar</a> ]</span>
    <%}%>
</div>
<div id="menu-superior">
    <table>
        <tr>
            <td><a href="<%=home%>/solicitar.jsp">SOLICITAR SERVI�OS</a></td>
            <td><a href="<%=home%>/elogio.jsp">ELOGIO</a></td>
            <td><a href="<%=home%>/marcar.jsp">MARCAR CONSULTA</a></td>
            <td><a href="<%=home%>/reclamacao.jsp">RECLAMA��O</a></td>
            <td><a href="<%=home%>/consultar.jsp">CONSULTAR</a></td>
        </tr>
    </table>
</div>
<script type="text/javascript" src="<%=home%>/_scripts/wz_tooltip.js"></script>