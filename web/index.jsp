<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>SGP - Sistema de Gerenciamento Político</title>
        <link href="_estilos/default.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <div id="conteudo-container">
            <%@include file="_templates/header.jsp"%>
            <%@include file="_templates/menu.jsp"%>
            <div id="containerinterno">
                <span class="sobre"><img src="_imagens/noticias.jpg" width="21" height="18" alt="">NOTÍCIAS<img src="_imagens/sobre.png" alt="" onmouseover="Tip('Verifique as últimas notícias da Prefeitura de Praia Grande.')" onmouseout="UnTip()"></span>
                <br><br>
                <table>
                    <tr class="tabela2">
                        <th class="tabela2"><a href="http://www.praiagrande.sp.gov.br/pgnoticias/noticias/noticia_01.asp?cod=32379" target="_blank"><img src="_imagens/noticias/not1.png" alt=""></a> </th>
                        <th class="tabela2"><a href="http://www.praiagrande.sp.gov.br/pgnoticias/noticias/noticia_01.asp?cod=32442" target="_blank"><img src="_imagens/noticias/not2.png" alt=""></a></th>
                        <th class="tabela2"><a href="http://praiagrande.sp.gov.br/pgnoticias/noticias/noticia_01.asp?cod=32351" target="_blank"><img src="_imagens/noticias/not3.png" alt=""></a></th>
                    </tr>
                    <tr class="tabela3">
                        <th class="tabela3"><a href="http://www.praiagrande.sp.gov.br/pgnoticias/noticias/noticia_01.asp?cod=32379" target="_blank"> Praia Grande realiza o Ação Cidadania no Caieiras. São esperadas 10 mil pessoas. </a></th>
                        <th class="tabela3"><a href="http://www.praiagrande.sp.gov.br/pgnoticias/noticias/noticia_01.asp?cod=32442" target="_blank"> Sehab constata diversas irregularidades em conjuntos habitacionais.</a></th>
                        <th class="tabela3"><a href="http://praiagrande.sp.gov.br/pgnoticias/noticias/noticia_01.asp?cod=32351" target="_blank"> Tablets e lousas digitais modernizam ensino em Praia Grande.</a></th>
                </table>
                <br>
                <span class="secretaria"><a href="http://www.praiagrande.sp.gov.br/portal.asp?cd_pagina=75" target="_blank"> <b>+ NOTÍCIAS</b></a></span>
                <br><br><br><br>
                <span class="sobre"><img src="_imagens/servicos.jpg" width="21" height="18" alt="">SERVIÇOS<img src="_imagens/sobre.png" alt="" onmouseover="Tip('Verifique alguns serviços disponíveis para consulta.')" onmouseout="UnTip()"></span>
                <table>
                    <tr class="tabela2">
                        <th class="tabela2"><a href="http://www.praiagrande.sp.gov.br/atendimento/dipam.asp" target="_blank"> <img src="_imagens/servicos/dipam.png" alt=""></a></th>
                        <th class="tabela2"><a href="http://www.praiagrande.sp.gov.br/atendimento/tributo_item.asp?cd_tributo=29" target="_blank"><img src="_imagens/servicos/divida.png" alt=""></a></th>
                        <th class="tabela2"><a href="http://www.praiagrande.sp.gov.br/PraiaGrande/Cameras.asp?cd_pagina=290" target="_blank"><img src="_imagens/servicos/aovivo.png" alt=""></a></th>
                    </tr>
                </table>
                <span class="secretaria"><a href="http://www.praiagrande.sp.gov.br/portal.asp?cd_pagina=328" target="_blank"> <b>+ SERVIÇOS</b></a></span>
                <br><br>
            </div>
            <%@include file="_templates/footer.jsp"%>
        </div>
    </body>
</html>
