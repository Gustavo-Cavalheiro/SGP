<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>SGP - História e Hino</title>
        <link href="_estilos/default.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <div id="conteudo-container">
            <%@include file="_templates/header.jsp"%>
            <%@include file="_templates/menu.jsp"%>
            <div id="containerinterno">
                <span class="sobre">HISTÓRIA<img src="_imagens/sobre.png" alt="" onmouseover="Tip('Conheça a história de Praia Grande.')" onmouseout="UnTip()"></span>
                <div id="conteudointerno">
                    <div id="conteudoint">
                        <div class="texto">Todo lugar tem sua história, a cidade, suas ruas, bairros, caminhos, as pessoas. Clique nos links para conhecer um pouco da História de Praia Grande e de muitas pessoas que viveram e vivem nesta terra, produzindo, trabalhando, constituindo suas famílias, seus amigos, divertindo-se, sonhando...
                            Muitas pessoas chegaram, outras foram embora, mas todas deixaram e fizeram aqui um pouquinho de sua história. Essa história de todos é a memória de nossa cidade e que você também está construindo. Se você mora no Forte, na Ocian, no Quietude, em Solemar ou em qualquer outro bairro de Praia Grande, esta cidade é sua, e para viver sua cidade é preciso conhecer sua história, participar, preservar, respeitar os espaços e as pessoas deste lugar, construir, refletir e transformar. Ser cidadão é exercitar essa cidadania.
                            <br><br>
                            <span class="secretariaobs"><b>AS PESSOAS E O LUGAR</b>
                                <br>
                                As terras do rei. Capitania Hereditária. Capitania de São Vicente. Emancipação Política de Praia Grande
                                <br><br>
                                <b>CAMINHOS E MEMÓRIA</b>
                                <br>
                                Caminho do mar. Caminhos dos Rios. Esgoto na nossa praia. A venda de terrenos. As praias limpas
                            </span>
                        </div><br> <br>
                        <span class="sobre">HINO<img src="_imagens/sobre.png" alt="" onmouseover="Tip('Hino Oficial da Prefeitura de Praia Grande.')" onmouseout="UnTip()"></span><br> <br>
                        <div class="texto">
                            "Praia Grande, Praia Grande beleza e glórias mil; <br>
                            espelho do mundo inteiro e grandeza do meu Brasil;<br>
                            Praia Grande, Praia Grande, orgulho de uma nação;<br>
                            o seu lema é trabalhar com a força da união;<br>
                            Praia Grande, Praia Grande, coberta com um céu de anil (bis);<br>
                            com as estrelas brilhantes no coração do Brasil".
                        </div></div></div>
            </div>
            <%@include file="_templates/footer.jsp"%>
        </div>
    </body>
</html>