<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    Usuario usuario = (Usuario) session.getAttribute("user");

    // Verificando se usuário está logado e se tem permissões de administrador, caso negativo redireciona para index
    if (usuario == null || usuario.getTipo() != 1) {
        response.sendRedirect(request.getContextPath() + "/index.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>SGP - Gráficos</title>
        <link href="../_estilos/default.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <div id="conteudo-container">
            <%@include file="../_templates/header.jsp"%>
            <%@include file="../_templates/menu.jsp"%>
            <div id="containerinterno">
                <span class="sobre">GRÁFICO<img src="../_imagens/sobre.png" alt="" onmouseover="Tip('Representação gráfica da quantidade de Elogios, Reclamações, Consultas Marcadas, e Solicitações de Serviços.')" onmouseout="UnTip()"></span>
                <div id="conteudointerno">
                    <br>
                    <form action="" method="get">
                        <select id="tipo" name="tipo" class="secretariaobs" onchange="this.form.submit()">
                            <%  String tipo = "";
                                if (request.getParameter("tipo") != null) tipo = request.getParameter("tipo");
                            %>
                            <option value="elogio" <%if (tipo.equals("elogio")) out.println("selected");%>>Elogios</option>
                            <option value="reclamacao" <%if (tipo.equals("reclamacao")) out.println("selected");%>>Reclamações</option>
                            <option value="consulta" <%if (tipo.equals("consulta")) out.println("selected");%>>Consultas</option>
                            <option value="solicitacao" <%if (tipo.equals("solicitacao")) out.println("selected");%>>Solicitações</option>
                        </select>
                    </form>
                    <br>
                    <div align="center"><img src="gerarGrafico?tipo=${param.tipo}" alt=""></div>
                </div>
            </div>
            <%@include file="../_templates/footer.jsp"%>
        </div>
    </body>
</html>