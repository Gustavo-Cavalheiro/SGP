<%@page import="sgp.Usuario"%>
<%String menu = request.getContextPath();%>
<div id="menu-lateral-cont">
    <br>
    <ul>
        <li class="sobre"><span style="cursor:pointer" onclick="location.href = '<%=menu%>/index.jsp'"><img src="<%=menu%>/_imagens/mini.jpg" width="21" height="18" alt=""> SOBRE A PREFEITURA</span></li>
    </ul>
    <ul>
        <%  // Verifica se o usuário está logado e se possui privilégios de administrador, em caso positivo exibe as opções da área administrativa do site
            if (session.getAttribute("user") != null && ((Usuario) session.getAttribute("user")).getTipo() == 1) {
        %>
        <li class='admin'><a href="<%=menu%>/admin/usuarios.jsp" style="color:#FF9933">ÁREA DE ADMINISTRAÇÃO</a>
            <ul>
                <li><a href="<%=menu%>/admin/usuarios.jsp">Usuários Cadastrados</a></li>
                <li><a href="<%=menu%>/admin/adicionar_usuario.jsp">Adicionar Usuário</a></li>
                <li><a href="<%=menu%>/admin/solicitacoes.jsp">Solicitações de Serviços</a></li>
                <li><a href="<%=menu%>/admin/consultas.jsp">Consultas Marcadas</a></li>
                <li><a href="<%=menu%>/admin/reclamacoes.jsp">Reclamações</a></li>
                <li><a href="<%=menu%>/admin/elogios.jsp">Elogios</a></li>
                <li><a href="<%=menu%>/admin/graficos.jsp">Gráficos</a></li>
                <li><a href="<%=menu%>/admin/relatorios.jsp">Relatórios</a></li>
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
                <li><a href="<%=menu%>/secretarias.jsp?sec=1">Administração</a></li>
                <li><a href="<%=menu%>/secretarias.jsp?sec=2">Comunicação Social</a></li>
                <li><a href="<%=menu%>/secretarias.jsp?sec=3">Cultura e Turismo</a></li>
                <li><a href="<%=menu%>/secretarias.jsp?sec=4">Desenvolvimento</a></li>
                <li><a href="<%=menu%>/secretarias.jsp?sec=5">Educação</a></li>
                <li><a href="<%=menu%>/secretarias.jsp?sec=6">Esporte e Lazer</a></li>
                <li><a href="<%=menu%>/secretarias.jsp?sec=7">Finanças</a></li>
                <li><a href="<%=menu%>/secretarias.jsp?sec=8">Governo</a></li>
                <li><a href="<%=menu%>/secretarias.jsp?sec=9">Habitação</a></li>
                <li><a href="<%=menu%>/secretarias.jsp?sec=10">Meio Ambiente</a></li>
                <li><a href="<%=menu%>/secretarias.jsp?sec=11">Obras</a></li>
                <li><a href="<%=menu%>/secretarias.jsp?sec=12">Planejamento</a></li>
                <li><a href="<%=menu%>/secretarias.jsp?sec=13">Promoção Social</a></li>
                <li><a href="<%=menu%>/secretarias.jsp?sec=14">Saúde</a></li>
                <li><a href="<%=menu%>/secretarias.jsp?sec=15">Segurança Pública</a></li>
                <li><a href="<%=menu%>/secretarias.jsp?sec=16">Serviços Urbanos</a></li>
                <li><a href="<%=menu%>/secretarias.jsp?sec=17">Trânsito</a></li>
                <li><a href="<%=menu%>/secretarias.jsp?sec=18">Transportes</a></li>
                <li><a href="<%=menu%>/secretarias.jsp?sec=19">Urbanismo</a></li>
            </ul>
        </li>
        <li><a href="<%=menu%>/braeban.jsp">BRASÃO E BANDEIRA</a></li>
        <li><a href="<%=menu%>/histehin.jsp">HISTÓRIA E HINO</a></li>
        <li><a href="<%=menu%>/mapa.jsp">MAPA DA CIDADE</a></li>
    </ul>
</div>