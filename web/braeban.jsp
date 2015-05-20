<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>SGP - Brasão e Bandeira</title>
        <link href="_estilos/default.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <div id="conteudo-container">
            <%@include file="_templates/header.jsp"%>
            <%@include file="_templates/menu.jsp"%>
            <div id="containerinterno">
                <span class="sobre">BRASÃO<img src="_imagens/sobre.png" alt="" onmouseover="Tip('Brasão Oficial da Prefeitura de Praia Grande')" onmouseout="UnTip()"></span>
                <div id="conteudointerno">
                    <div id="conteudoint">
                        <div id="foto"><img src="_imagens/brasao.gif" alt=""></div>
                        <div class="texto">O Brasão de Armas possui as seguintes características:
                            Brasão formato redondo português, cortado e partido. No primeiro campo, de prata, as armas de Martim Afonso de Souza; no segundo do mesmo metal, uma Cruz de Cristo; no terceito de blao (azul), no alto do campo um morro de prata e, em baixo no fundo do Brasão, faixas de prata. Como suporte: à direita um ramo de louros e à esquerda um ramo de carvalho, ambos na sua cor natural. Por timbre uma coroa mural, tendo sobre a porta principal, um escudete de blao (azul), com duas chaves cruzadas, postas en santos. Num listel de goles (vermelho) a legenda latina "Mare Nostrum".
                        </div><br> <br>
                        <span class="sobre">BANDEIRA<img src="_imagens/sobre.png" alt="" onmouseover="Tip('Bandeira Oficial da Prefeitura de Praia Grande')" onmouseout="UnTip()"></span><br><br>
                        <div id="fotobrasao"><img src="_imagens/bandeira.gif" alt=""></div>
                        <div class="texto"><br><br>A Bandeira possui as seguintes características:
                            Na medida oficial tendo no campo três faixas em preto, branco e vermelho, findo no centro da faixa central a reprodução do Brasão de Armas nas suas cores e metais.
                        </div>
                    </div>
                </div>
            </div>
            <%@include file="_templates/footer.jsp"%>
        </div>
    </body>
</html>