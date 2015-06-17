<%@page import="sgp.Usuario"%>
<%String menu = request.getContextPath();%>
<div id="menu-lateral-cont">
    <br>
    <ul>
        <li class="sobre"><span style="cursor:pointer" onclick="location.href = '<%=menu%>/index.jsp'"><img src="<%=menu%>/_imagens/mini.jpg" width="21" height="18" alt=""> SOBRE A PREFEITURA</span></li>
    </ul>
    <ul>
        <%  // Verifica se o usu�rio est� logado e se possui privil�gios de administrador, em caso positivo exibe as op��es da �rea administrativa do site
            if (session.getAttribute("user") != null && ((Usuario) session.getAttribute("user")).getTipo() == 1) {
        %>
        <li class='admin'><a href="<%=menu%>/admin/usuarios.jsp" style="color:#FF9933">�REA DE ADMINISTRA��O</a>
            <ul>
                <li><a href="<%=menu%>/admin/usuarios.jsp">Usu�rios Cadastrados</a></li>
                <li><a href="<%=menu%>/admin/adicionar_usuario.jsp">Adicionar Usu�rio</a></li>
                <li><a href="<%=menu%>/admin/solicitacoes.jsp">Solicita��es de Servi�os</a></li>
                <li><a href="<%=menu%>/admin/consultas.jsp">Consultas Marcadas</a></li>
                <li><a href="<%=menu%>/admin/reclamacoes.jsp">Reclama��es</a></li>
                <li><a href="<%=menu%>/admin/elogios.jsp">Elogios</a></li>
                <li><a href="<%=menu%>/admin/graficos.jsp">Gr�ficos</a></li>
                <li><a href="<%=menu%>/admin/relatorios.jsp">Relat�rios</a></li>
            </ul>
        </li>
        <%
            }
        %>
        <li><a href="<%=menu%>/gabinete.jsp">GABINETE DO PREFEITO</a>
            <ul>
                <li><a href="<%=menu%>/gabinete.jsp?gab=1">O Prefeito</a></li>
                <li><a href="<%=menu%>/gabinete.jsp?gab=2">Vice-Prefeita</a></li>
                <li><a href="<%=menu%>/gabinete.jsp?gab=3">Chefe de Gabinete</a></li>
            </ul>
        </li>
        <li><a href="<%=menu%>/secretarias.jsp">SECRETARIAS</a>
            <ul>
                <li><a href="<%=menu%>/secretarias.jsp?sec=1">Administra��o</a></li>
                <li><a href="<%=menu%>/secretarias.jsp?sec=2">Comunica��o Social</a></li>
                <li><a href="<%=menu%>/secretarias.jsp?sec=3">Cultura e Turismo</a></li>
                <li><a href="<%=menu%>/secretarias.jsp?sec=4">Desenvolvimento</a></li>
                <li><a href="<%=menu%>/secretarias.jsp?sec=5">Educa��o</a></li>
                <li><a href="<%=menu%>/secretarias.jsp?sec=6">Esporte e Lazer</a></li>
                <li><a href="<%=menu%>/secretarias.jsp?sec=7">Finan�as</a></li>
                <li><a href="<%=menu%>/secretarias.jsp?sec=8">Governo</a></li>
                <li><a href="<%=menu%>/secretarias.jsp?sec=9">Habita��o</a></li>
                <li><a href="<%=menu%>/secretarias.jsp?sec=10">Meio Ambiente</a></li>
                <li><a href="<%=menu%>/secretarias.jsp?sec=11">Obras</a></li>
                <li><a href="<%=menu%>/secretarias.jsp?sec=12">Planejamento</a></li>
                <li><a href="<%=menu%>/secretarias.jsp?sec=13">Promo��o Social</a></li>
                <li><a href="<%=menu%>/secretarias.jsp?sec=14">Sa�de</a></li>
                <li><a href="<%=menu%>/secretarias.jsp?sec=15">Seguran�a P�blica</a></li>
                <li><a href="<%=menu%>/secretarias.jsp?sec=16">Servi�os Urbanos</a></li>
                <li><a href="<%=menu%>/secretarias.jsp?sec=17">Tr�nsito</a></li>
                <li><a href="<%=menu%>/secretarias.jsp?sec=18">Transportes</a></li>
                <li><a href="<%=menu%>/secretarias.jsp?sec=19">Urbanismo</a></li>
            </ul>
        </li>
        <li><a href="<%=menu%>/braeban.jsp">BRAS�O E BANDEIRA</a></li>
        <li><a href="<%=menu%>/histehin.jsp">HIST�RIA E HINO</a></li>
        <li><a href="<%=menu%>/mapa.jsp">MAPA DA CIDADE</a></li>
    </ul>
</div>