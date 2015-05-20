<div id="menu-lateral-cont">
    <br>
    <ul>
        <li class="sobre"><span style="cursor:pointer" onclick="location.href = '<%=request.getContextPath()%>/index.jsp'"><img src="<%=request.getContextPath()%>/_imagens/mini.jpg" width="21" height="18" alt=""> SOBRE A PREFEITURA</span></li>
    </ul>
    <ul>
        <%  // Verifica se o usu�rio est� logado e se possui privil�gios de administrador
            // caso positivo exibe as op��es da �rea administrativa do site
            if (session.getAttribute("tipo") != null && session.getAttribute("tipo").toString().equals("1")) {
        %>
        <li class='admin'><a href="<%=request.getContextPath()%>/admin/usuarios.jsp">�REA DE ADMINISTRA��O</a>
            <ul>
                <li><a href="<%=request.getContextPath()%>/admin/usuarios.jsp">Usu�rios Cadastrados</a></li>
                <li><a href="<%=request.getContextPath()%>/admin/adicionar_usuario.jsp">Adicionar Usu�rio</a></li>
                <li><a href="<%=request.getContextPath()%>/admin/solicitacoes.jsp">Solicita��es de Servi�os</a></li>
                <li><a href="<%=request.getContextPath()%>/admin/consultas.jsp">Consultas Marcadas</a></li>
                <li><a href="<%=request.getContextPath()%>/admin/reclamacoes.jsp">Reclama��es</a></li>
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
                <li><a href="<%=request.getContextPath()%>/secretarias.jsp?1">Administra��o</a></li>
                <li><a href="<%=request.getContextPath()%>/secretarias.jsp?2">Comunica��o Social</a></li>
                <li><a href="<%=request.getContextPath()%>/secretarias.jsp?3">Cultura e Turismo</a></li>
                <li><a href="<%=request.getContextPath()%>/secretarias.jsp?4">Desenvolvimento</a></li>
                <li><a href="<%=request.getContextPath()%>/secretarias.jsp?5">Educa��o</a></li>
                <li><a href="<%=request.getContextPath()%>/secretarias.jsp?6">Esporte e Lazer</a></li>
                <li><a href="<%=request.getContextPath()%>/secretarias.jsp?7">Finan�as</a></li>
                <li><a href="<%=request.getContextPath()%>/secretarias.jsp?8">Governo</a></li>
                <li><a href="<%=request.getContextPath()%>/secretarias.jsp?9">Habita��o</a></li>
                <li><a href="<%=request.getContextPath()%>/secretarias.jsp?10">Meio Ambiente</a></li>
                <li><a href="<%=request.getContextPath()%>/secretarias.jsp?11">Obras</a></li>
                <li><a href="<%=request.getContextPath()%>/secretarias.jsp?12">Planejamento</a></li>
                <li><a href="<%=request.getContextPath()%>/secretarias.jsp?13">Promo��o Social</a></li>
                <li><a href="<%=request.getContextPath()%>/secretarias.jsp?14">Sa�de</a></li>
                <li><a href="<%=request.getContextPath()%>/secretarias.jsp?15">Seguran�a P�blica</a></li>
                <li><a href="<%=request.getContextPath()%>/secretarias.jsp?16">Servi�os Urbanos</a></li>
                <li><a href="<%=request.getContextPath()%>/secretarias.jsp?17">Tr�nsito</a></li>
                <li><a href="<%=request.getContextPath()%>/secretarias.jsp?18">Transportes</a></li>
                <li><a href="secretarias.jsp?19">Urbanismo</a></li>
            </ul>
        </li>
        <li><a href="<%=request.getContextPath()%>/braeban.jsp">BRAS�O E BANDEIRA</a></li>
        <li><a href="<%=request.getContextPath()%>/histehin.jsp">HIST�RIA E HINO</a></li>
        <li><a href="<%=request.getContextPath()%>/mapa.jsp">MAPA DA CIDADE</a></li>
    </ul>
</div>