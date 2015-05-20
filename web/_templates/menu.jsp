<div id="menu-lateral-cont">
    <br>
    <ul>
        <li class="sobre"><span style="cursor:pointer" onclick="location.href = '<%=request.getContextPath()%>/index.jsp'"><img src="<%=request.getContextPath()%>/_imagens/mini.jpg" width="21" height="18" alt=""> SOBRE A PREFEITURA</span></li>
    </ul>
    <ul>
        <%  // Verifica se o usuário está logado e se possui privilégios de administrador
            // caso positivo exibe as opções da área administrativa do site
            if (session.getAttribute("tipo") != null && session.getAttribute("tipo").toString().equals("1")) {
        %>
        <li class='admin'><a href="<%=request.getContextPath()%>/admin/usuarios.jsp">ÁREA DE ADMINISTRAÇÃO</a>
            <ul>
                <li><a href="<%=request.getContextPath()%>/admin/usuarios.jsp">Usuários Cadastrados</a></li>
                <li><a href="<%=request.getContextPath()%>/admin/adicionar_usuario.jsp">Adicionar Usuário</a></li>
                <li><a href="<%=request.getContextPath()%>/admin/solicitacoes.jsp">Solicitações de Serviços</a></li>
                <li><a href="<%=request.getContextPath()%>/admin/consultas.jsp">Consultas Marcadas</a></li>
                <li><a href="<%=request.getContextPath()%>/admin/reclamacoes.jsp">Reclamações</a></li>
                <li><a href="<%=request.getContextPath()%>/admin/elogios.jsp">Elogios</a></li>
            </ul>
        </li>
        <%}%>

        <li><a href="<%=request.getContextPath()%>/gabinete.jsp?1">GABINETE DO PREFEITO</a>
            <ul>
                <li><a href="<%=request.getContextPath()%>/gabinete.jsp?1">O Prefeito</a></li>
                <li><a href="<%=request.getContextPath()%>/gabinete.jsp?2">Vice-Prefeita</a></li>
                <li><a href="<%=request.getContextPath()%>/gabinete.jsp?3">Chefe de Gabinete</a></li>
            </ul>
        </li>
        <li><a href="<%=request.getContextPath()%>/secretarias.jsp?1">SECRETARIAS</a>
            <ul>
                <li><a href="<%=request.getContextPath()%>/secretarias.jsp?1">Administração</a></li>
                <li><a href="<%=request.getContextPath()%>/secretarias.jsp?2">Comunicação Social</a></li>
                <li><a href="<%=request.getContextPath()%>/secretarias.jsp?3">Cultura e Turismo</a></li>
                <li><a href="<%=request.getContextPath()%>/secretarias.jsp?4">Desenvolvimento</a></li>
                <li><a href="<%=request.getContextPath()%>/secretarias.jsp?5">Educação</a></li>
                <li><a href="<%=request.getContextPath()%>/secretarias.jsp?6">Esporte e Lazer</a></li>
                <li><a href="<%=request.getContextPath()%>/secretarias.jsp?7">Finanças</a></li>
                <li><a href="<%=request.getContextPath()%>/secretarias.jsp?8">Governo</a></li>
                <li><a href="<%=request.getContextPath()%>/secretarias.jsp?9">Habitação</a></li>
                <li><a href="<%=request.getContextPath()%>/secretarias.jsp?10">Meio Ambiente</a></li>
                <li><a href="<%=request.getContextPath()%>/secretarias.jsp?11">Obras</a></li>
                <li><a href="<%=request.getContextPath()%>/secretarias.jsp?12">Planejamento</a></li>
                <li><a href="<%=request.getContextPath()%>/secretarias.jsp?13">Promoção Social</a></li>
                <li><a href="<%=request.getContextPath()%>/secretarias.jsp?14">Saúde</a></li>
                <li><a href="<%=request.getContextPath()%>/secretarias.jsp?15">Segurança Pública</a></li>
                <li><a href="<%=request.getContextPath()%>/secretarias.jsp?16">Serviços Urbanos</a></li>
                <li><a href="<%=request.getContextPath()%>/secretarias.jsp?17">Trânsito</a></li>
                <li><a href="<%=request.getContextPath()%>/secretarias.jsp?18">Transportes</a></li>
                <li><a href="secretarias.jsp?19">Urbanismo</a></li>
            </ul>
        </li>
        <li><a href="<%=request.getContextPath()%>/braeban.jsp">BRASÃO E BANDEIRA</a></li>
        <li><a href="<%=request.getContextPath()%>/histehin.jsp">HISTÓRIA E HINO</a></li>
        <li><a href="<%=request.getContextPath()%>/mapa.jsp">MAPA DA CIDADE</a></li>
    </ul>
</div>