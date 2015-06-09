<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<%
    String Nome = "";
    String Cargo = "";
    String Texto = "";

    int valor = 1;
    if (request.getParameter("gab") != null) valor = Integer.parseInt(request.getParameter("gab"));

    switch (valor) {
        case 1:
            Nome = "ALBERTO PEREIRA MOURÃO";
            Cargo = "Prefeito";
            Texto = "Alberto Pereira Mourão nasceu em São Paulo, no dia 26 de abril de 1954. Filho de Diamantino Cruz Ferreira Mourão e Idália da Conceição Pereira (ambos falecidos), é casado com Maria Del Carmen Adin Mourão tem duas filhas e quatro netos. Advogado, bacharel em Direito pela Universidade Católica de Santos (Uni Santos), Mourão é empresário da construção civil, sócio proprietário do Mourão Construtor. Desde 1977. Foi presidente da Associação Comercial de Praia Grande de 1986 a 1987, depois de exercer por dois anos o cargo de vice-presidente da entidade. Entre 1991 e 1992, atuou como provedor da Santa Casa de Praia Grande. Mourão iniciou sua carreira política nas eleições de 1982, como candidato a vereador pelo então MDB. Na oportunidade, era o mais jovem e foi o  mais votado entre os candidatos. Cumpriu seu mandato de vereador de 1983 a 1988, presidindo a Câmara Municipal no biênio 87/88. Em 1988, foi eleito vice-prefeito. Foi secretário municipal da Educação de janeiro a setembro de 1989. Sua primeira eleição para prefeito ocorreu em 1992. O mandato, até 1996, foi marcado pela transformação da imagem da Cidade. Foi o primeiro presidente do Comitê de Bacias Hidrográficas da Baixada Santista, escolhido em dezembro de 1995. Nas eleições de 1996, fez seu sucessor na Prefeitura de Praia Grande (seu então vice, Ricardo Yamato) com 85 %. Dos votos válidos.  De janeiro a setembro de 1997, Alberto Mourão foi superintendente da autarquia Progresso e desenvolvimento de Praia Grande (Prodesp).  Em 1997, presidiu o Instituto de Desenvolvimento e Incentivo a Ações Sociais (IDEIAS). E foi o representante de Praia Grande no Conselho de Desenvolvimento da Baixada Santista (Condes).";
            break;
        case 2:
            Nome = "MAURA LIGIA COSTA RUSSO";
            Cargo = "Vice-Prefeita";
            Texto = "Servidora Pública de Praia Grande há 32 anos, a vice-prefeita Maura Ligia Costa RUsso nasceu em Santos, em 11 de novembro de 1959. Casada, mãe de dois filhos, é graduada em Pedagogia Pelo Centro de Estudos Superiores do Carmo, com especialização em Educação de Portadores de Necessidades Especiais na área de Deficiência Mental e Audiocomunicação (1982), além de pós-graduada em Gerente de Cidades pela Fundação Armando Álvares Penteado - Faap (2000), e em formação de Gestores Municipais e Políticas na Educação, pela Universidade de Franca (2004). Maura Ligia começou a trabalhar na Administração Municipal em 1980, ocupando o cargo de professora de Educação Infantil até 1984, ano em que tornou-se assessora técnica da Secretaria de Educação, atuando até 1988. Em 1989, atuou como chefe de Divisão Pedagógica e, nos dois anos seguintes, de 1990 a 1992, trabalhou na Secretaria da Saúde na área de reabilitação de crianças portadoras de necessidades especiais. De 1993 até 2000, foi chefe do Departamento de Educação e, em 2001, assumiu a Secretaria de Educação, cargo que ocupou até junho de 2012, quando se licenciou para concorrer como vice-prefeita.";
            break;
        case 3:
            Nome = "CÁSSIO DE CASTRO NAVARRO";
            Cargo = "Chefe de Gabinete";
            Texto = "Cássio de Castro Navarro tem 34 anos, é bacharel em Direito, empresário da construção civil, foi vereador por duas vezes: a primeira em 2001, quando tinha 21 anos, sendo reeleito em 2004, logo assumindo a presidência do Legislativo Municipal para o biênio 2005/2006. Nas últimas eleições, ficou na suplência para o Legislativo Estadual com mais de 51 mil votos. Primeiro deputado estadual da história de Praia Grande, integrou a maior bancada santista da história na assembléia, de sete parlamentares. Mesmo com pouco tempo de Legislativo Estadual, assumiu vários compromissos na Casa, como membro efetuvo da Comissão Parlamentar de Inquérito (CPI) que investigou irregularidades cometidas por operadoras de seguros e participação ativa em outras CPIs, como a que tratou de mecanismos de combate à febre aftosa em São Paulo, sobre contaminações ambientais e sobre irregularidades no Ecad (direitos autorais). E foi nomeado vice-líder da bancada do PSDB na AL. Conforme propostas defendidas quando candidato a deputado estadual, em 2006, sustentou que o mandato seria pautado na luta por melhores condições nas áreas da Saúde, Segurança, Transportes, Educação, Geração de Empregos, entre outras. Dentro de uma visão metropolitana, participou de vários compromissos visando contemplar esses setores, entendendo que a solução de um problema local muitas vezes está na concretização de uma obra ou serviço na cidade vizinha.";
            break;
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>SGP - <%=Cargo%></title>
        <link href="_estilos/default.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <div id="conteudo-container">
            <%@include file="_templates/header.jsp"%>
            <%@include file="_templates/menu.jsp"%>
            <div id="containerinterno">
                <span class="sobre">GABINETE DO PREFEITO<img src="_imagens/sobre.png" alt="" onmouseover="Tip('Setor responsável por promover a ligação entre o Prefeito e as demais secretarias municipais. Você está em: Prefeito')" onmouseout="UnTip()"></span>
                <div id="conteudointerno">
                    <div id="conteudoint">
                        <div id="foto"><img src="_imagens/pessoas/mini<%=valor%>.gif" alt=""></div>
                        <span class="nome"><%=Nome%></span><br>
                        <span class="cargo"><%=Cargo%></span>
                        <div class="texto"><br><%=Texto%> </div>
                    </div>
                </div>
            </div>
            <%@include file="_templates/footer.jsp"%>
        </div>
    </body>
</html>