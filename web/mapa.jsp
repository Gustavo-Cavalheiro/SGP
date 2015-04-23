<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>SGP - Mapa da Cidade</title>
        <link href="_estilos/default.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <div id="conteudo-container">
            <%@include file="_templates/header.jsp"%>
            <%@include file="_templates/menu.jsp"%>
            <div id="containerinterno">
                <span class="sobre">MAPA DA CIDADE<img src="_imagens/sobre.png" alt="" onmouseover="Tip('Conheça o mapa da cidade de Praia Grande.')" onmouseout="UnTip()"></span>

                <div id="conteudointerno">
                    <br>
                    <div id="fotomapa" align="center"><img src="_imagens/mapa.gif" alt=""></div>
                </div>
            </div>
            <%@include file="_templates/footer.jsp"%>
        </div>
    </body>
</html>