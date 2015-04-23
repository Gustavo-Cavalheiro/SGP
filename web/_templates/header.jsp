<div id="topo">
    <a href="<%=request.getContextPath()%>/index.jsp"><img src="<%=request.getContextPath()%>/_imagens/logo.png" width="433" height="140" alt="SGP - Sistema de Gerenciamento Politico"></a>
</div>
<div class="login">
    <%
        // Desconnecta usuário caso seja encontrado o paramentro "logoff"
        if (request.getParameter("logoff") != null) {
            session.removeAttribute("id");
            session.removeAttribute("username");
            session.removeAttribute("tipo");
            response.sendRedirect(request.getContextPath());
            return;
        }
        // Caso usuário esteja logado, exibe o nome de usuário e opçao para sair
        if (session.getAttribute("username") != null) {%>
    <span class="cargo">Bem vindo, <%=session.getAttribute("username")%> [ <a class="cargo" href="?logoff">Sair</a> ]</span>
    <%} else {%>
    <span class="cargo">Bem vindo, Visitante [ <a class="cargo" href="<%=request.getContextPath()%>/login.jsp?returnto=<%=request.getRequestURI()%>">Fazer Login</a> / <a class="cargo" href="<%=request.getContextPath()%>/cadastro.jsp">Cadastrar</a> ]</span>
    <%}%>
</div>
<div id="menu-superior">
    <table>
        <tr>
            <td><a href="<%=request.getContextPath()%>/solicitar.jsp">SOLICITAR SERVIÇOS</a></td>
            <td><a href="<%=request.getContextPath()%>/elogio.jsp">ELOGIO</a></td>
            <td><a href="<%=request.getContextPath()%>/marcar.jsp">MARCAR CONSULTA</a></td>
            <td><a href="<%=request.getContextPath()%>/reclamacao.jsp">RECLAMAÇÃO</a></td>
            <td><a href="<%=request.getContextPath()%>/consultar.jsp">CONSULTAR</a></td>
        </tr>
    </table>
</div>
<script type="text/javascript" src="<%=request.getContextPath()%>/_scripts/wz_tooltip.js"></script>