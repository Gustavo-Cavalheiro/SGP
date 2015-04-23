<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String SecNome = "";
    String Nome = "";
    String Cargo = "";
    String Iniciais = "";
    String Endereco = "";
    String Horario = "";
    String Telefone = "";
    String Texto = "";
    
    int valor = Integer.parseInt(request.getQueryString());
    if (valor == 1){  
    
        SecNome = "Secretaria de Administração";
        Nome = "ESMERALDO VICENTE DOS SANTOS";
        Cargo = "Secretário de Administração";
        Iniciais = "SEAD";
        Endereco = "Av. Presidente Kennedy nº 9000 - Bairro: Vila Mirim - CEP 11.704-900";
        Horario = "Segunda a Sexta-feira, das 08:30 as 16:00hs.";
        Telefone = "(13) 3496-2000";
        Texto = "Esmeraldo Vicente dos santos, o Dinho, é ex-vereador da Cidade. Casado e pai de três filhos, Dinho é formado em Administração de Empresas pela Faculdade do Litoral Sul (FALS). Foi secret´rio e vice-presidente da Câmara entre 2009 e 2012 e presidente da Comissão de Educação, Cultura, Esporte e Turismo. Já atuou na Prefeitura de Praia Grande na Secretaria da Educação por seis anos, no Gabinete do Prefeito e como coordenador de Ação e Cidadania.Na Câmara Municipal, Dinho foi um dos responsáveis pela instalação de ponto de coletas de material reciclável, o Ecoponto, e ainda criou diversos projetos para implanatação da coleta seletiva de lixo, implantação de hortas comunitárias em terrenos baldios e orientações à população sobre a importância da reciclagem, saneamento, esgoto e deposição de resíduos sólidos.";
    } else if(valor == 2){  
    
        SecNome = "Secretaria de Comunicação";
        Nome = "KATIA GIULETTI";
        Cargo = "Secretária de Comunicação Social";
        Iniciais = "SECOM";
        Endereco = "Av. Presidente Kennedy nº 9000 - Bairro: Vila Mirim - CEP 11.704-900";
        Horario = "Segunda a Sexta-feira, das 08:30 as 16:00hs.";
        Telefone = "(13) 3496-2031";
        Texto = "Natural de Campinas e moradora de Praia Grande desde 1983, Katia tem 57 anos, é casada e mãe de um filho. É formada em Comunicação Social pela Universidade Católica de Santos (UniSantos - turma de 1978); atua como procuradora municipal da Prefeitura de Praia Grande (formada em Direito pela UniSantos há 18 anos) e é pós-graduada pela USP, em Marketing Político e Propaganda Eleitoral (2006). Trabalhou durante 14 anos no grupo A Tribuna de Comunicação, com passagens anteriores pelos jornais Cidade de Santos (estágio) e Diário da Noite (Editoria de Educação), do extindo Diários Associados. Deixou o jornal A Tribuna ao ser aprovada, em 1992, em concurso para uma vaga na Assessoria de Imprensa na Prefeitura de Cubatão. É assessora de imprensa de Alberto Mourão desde janeiro de 1993, tendo chefiado os departamentos e subsecretaria de Comunicação em seus três mandatos de prefeito. Acompanhou Mourão, também como assessora de imprensa, em seus dois mandatos como deputado federal.";
        
    } else if(valor == 3){  
    
        SecNome = "Secretaria de Cultura e Turismo";
        Nome = "CARLOS ANANIAS LOBÃO";
        Cargo = "Secretário de Cultura e Turismo";
        Iniciais = "SECTUR";
        Endereco = "Av. Presidente Kennedy nº 9000 - Bairro: Vila Mirim - CEP 11.704-900";
        Horario = "Segunda a Sexta-feira, das 08:30 as 16:00hs.";
        Telefone = "(13) 3496-5704";
        Texto = "Carlos Ananias Lobão tem 56 anos, é casado, tem três filhos e quatro netos. Lobão mora há 42 anos em Praia Grande e assumiu a Secretaria de Cultura e TUrismo em 2009. Formou-se técnico em Ótica pelo Senac, em 1979. Anos antes, morou com os pais na Alemanha, onde concluiu os estudos. Ainda na década de 1970, trabalhou por três anos na imobiliária de seu pai, que levava o nome da família. Depois de formado, assumiu a direção da Ótica Lobão, primeira de Praia Grande, onde atua há 37 anos. Membro do Rotary Club Praia Grande - Forte I Itaipu desde dezembro de 2000, foi presidente da entidade no ano rotário 2003/2004 e governador assistente do distrito (região) de 2006 a 2007.";
        
    } else if(valor == 4){  
    
        SecNome = "Secretaria de Desenvolvimento Econômico, Ciência, Tecnologia e Trabalho";
        Nome = "NILSON CARLOS DUARTE DA SILVA";
        Cargo = "Secretário de Desenvolvimento";
        Iniciais = "SEDTTRA ";
        Endereco = "Av. Presidente Kennedy nº 9000 - Bairro: Vila Mirim - CEP 11.704-900";
        Horario = "Segunda a Sexta-feira, das 08:30 as 16:00hs.";
        Telefone = "(13) 3496-2000";
        Texto = "Nilson Carlos Duarte da Silva, o professor Nilson da Fatec, tem 45 anos, possui doutorado em Engenharia de Produção pela Universidade Metodista de Piracicaba (2010), mestrado em Engenharia de Produção pela Universidade Federal de São Carlos (2001) e graduação em Análise e Desenvolvimento de Sistemas. Diretor da Fculdade de Tecnologia (Fatec) de Praia Grande, Nilson tem experiência na área de Engenharia de Produção, Administração de Empresas, Cooperação, Universidade-Empresa e desenvolve pesquisas nos seguintes temas: empreendedorismo, educação, políticas de ciência e tecnologia e Inovação. Nascido em Sertãozinho, vive em Praia Grande desde julho de 2002, quando foi designado pela Superintendência do Centro Paula Souza para implantar a Faculdade de Tecnologia de PRaia Grande. Desenvolve atividades em parceria com INPI - Instituto Nacional de Propriedade Intelectual para realização de Cursos de Propriedade Intelectual. De 1996 a 2002, foi coordenador do curso de Processamento de Dados da Faculdade de Tecnologia de Praia Grande. De 1990 a 1994, foi analista de sistemas na empresa Trautec Equipamento Cirúrgicos e, em 1994, tornou-se gerente de produção da mesma empresa até 1996.";
           
    } else if(valor == 5){  
    
        SecNome = "Secretaria de Educação";
        Nome = "SANDRA REGINA LIMA GALVÃO";
        Cargo = "Secretária de Educação";
        Iniciais = "SEDUC";
        Endereco = "Av. Presidente Kennedy nº 9000 - Bairro: Vila Mirim - CEP 11.704-900";
        Horario = "Segunda a Sexta-feira, das 08:30 as 16:00hs.";
        Telefone = "(13) 3496-2350";
        Texto = "Nascida no Paraná, Sandra tem 46 anos e mora em Praia Grande desde os 10 anos de idade. Formada em Pedagogia em 1990 pela Universidade Santa Cecília (Unisanta) e pós-graduada em Educação Infantil e Psicopedagogia, Sandra é funcionária de carreia da Seduc. Ela entrou na Prefeitura como professora e passou pelos cargos de assistente de direção escolar, direção, supervisora escolar e chefe de departamento, cargo que ocupou até junho de 2012. Paralelamente aos seus primeiros anos na Prefeitura, Sandra também atuou na rede estadual de ensino, onde chegou a ser diretora escolar. No entanto, deixou o Estado para se dedicar integralmente à rede municipal.";
        
    } else if(valor == 6){  
    
        SecNome = "Secretaria de Esporte e Lazer";
        Nome = "HUGULINO ALVES RIBEIRO";
        Cargo = "Secretário de Esporte e Lazer";
        Iniciais = "SEEL";
        Endereco = "Av. Presidente Kennedy nº 9000 - Bairro: Vila Mirim - CEP 11.704-900";
        Horario = "Segunda a Sexta-feira, das 08:30 as 16:00hs.";
        Telefone = "(13) 3496-5400";
        Texto = "Hugulino Alves Ribeiro, o Hugo Ribeiro, tem 44 anos (nasceu em 10 de fevereiro de 1969) e é natural de Condeuba, na Bahia. Chegou a Praia Grande em 1972, quando morou no Bairro Caiçara. Casado e pai de seis filhos, reside atualmente no Bairro Real (Jardim Princesa). Possui formação acadêmica em Ciêncas Contáveis, no Centro Universitário Monte Serrat (Unimonte), em Santos. Atua como empresário do ramo de contabilidade (empresa REALTEC). Ex-jogador de futebol, Ribeiro integrou a primeira comissão técnica da seleção municipal de futebol amador que disputou uma edição de Jogos Abertos do Interior, em 1985. Na eleição Municipal de 2004, ficou na suplência de vereador. Na gestão seguinte (2009 a 2012), elegeu-se pela primeira vez. Foi primeiro secretário da mesa diretora da Câmara, biênio 2011 e 2012. Em 2013, assumiria o segundo mandato no Legislativo, mas aceitou o convite feito pelo prefeito Alberto Mourão para comandar a Seel.";
        
    } else if(valor == 7){  
    
        SecNome = "Secretaria de Finanças";
        Nome = "HUGULINO ALVES RIBEIRO";
        Cargo = "Secretário de Finanças";
        Iniciais = "SEFIN";
        Endereco = "Av. Presidente Kennedy nº 9000 - Bairro: Vila Mirim - CEP 11.704-900";
        Horario = "Segunda a Sexta-feira, das 08:30 as 16:00hs.";
        Telefone = "(13) 3496-5400";
        Texto = "Roberto Lopez Franco é casado e tem uma filha, é bacharel em Administração de Empresas. Assumiu o comando da Secretaria de Finanças em 1997, permanecendo no cargo até maio de 1998 e retornando em 2001. Na Sefin, foi responsável pela modernização do atendimento ao contribuinte, o que resultou em diminuião das filas no atendimento ao público, implantação de elaboração e controle do orçamento e do sistema de acompanhamento de metas fiscais. A maneira como conduziu os trabalhos da secretaria fez com que a Praia Grande servisse de exemplo para a empresa do software financeiro da Administração Municipal testar o sistema AUDESP, a qual serviu de piloto para implantação do Plano de Contas Único, novo sistema a ser implantado a partir de 2013 e que será operado em diversas prefeituras do País. Durante sua gestão, Lopez conseguiu firmar parceria com o Poder Judiciário de modo a agilizar o processo de execuções fiscais que estavam em atraso.";
        
    } else if(valor == 8){  
    
        SecNome = "Secretaria de Governo";
        Nome = "MAURA LIGIA COSTA RUSSO";
        Cargo = "Secretária de Governo";
        Iniciais = "SEG";
        Endereco = "Av. Presidente Kennedy nº 9000 - Bairro: Vila Mirim - CEP 11.704-900";
        Horario = "Segunda a Sexta-feira, das 08:30 as 16:00hs.";
        Telefone = "(13) 3496-2000";
        Texto = "Servidora Pública de Praia Grande há 32 anos, a vice-prefeita Maura Ligia Costa Russo nasceu em Santos, em 11 de novembro de 1959. Casada, mãe de dois filhos, é graduada em Pedagogia Pelo Centro de Estudos Superiores do Carmo, com especialização em Educação de Portadores de Necessidades Especiais na área de Deficiência Mental e Audiocomunicação (1982), além de pós-graduada em Gerente de Cidades pela Fundação Armando Álvares Penteado - Faap (2000), e em formação de Gestores Municipais e Políticas na Educação, pela Universidade de Franca (2004). Maura Ligia começou a trabalhar na Administração Municipal em 1980, ocupando o cargo de professora de Educação Infantil até 1984, ano em que tornou-se assessora técnica da Secretaria de Educação, atuando até 1988. Em 1989, atuou como chefe de Divisão Pedagógica e, nos dois anos seguintes, de 1990 a 1992, trabalhou na Secretaria da Saúde na área de reabilitação de crianças portadoras de necessidades especiais. De 1993 até 2000, foi chefe do Departamento de Educação e, em 2001, assumiu a Secretaria de Educação, cargo que ocupou até junho de 2012, quando se licenciou para concorrer como vice-prefeita.";
        
    } else if(valor == 9){  
    
        SecNome = "Secretaria de Habitação";
        Nome = "ALEXANDRE RAMOS";
        Cargo = "Secretário de Habitação";
        Iniciais = "SEHAB";
        
        Endereco = "Av. Presidente Kennedy nº 9000 - Bairro: Vila Mirim - CEP 11.704-900";
        Horario = "Segunda a Sexta-feira, das 08:30 as 16:00hs.";
        Telefone = "(13) 3496-1016";
        Texto = "Alexander Ramos é engenheiro civil formado e pós-graduado em Engenharia de Segurança no Trabalho pela Universidade Santa Cecília dos Bandeirantes (UniSanta). Em 2005, concluiu o curso de perito em inferência por estatística e perito em manutenção predial e laudos em pericia-técnica de edificações pelo Instituto Brasileiro de Avaliação e Pericia de Engenharia de São Paulo (Ibape). Na área pública, exerceu cargos de relator da junta de Recursos Fiscais de natureza tributária de 2008 até 2012, e participa do Conselho Municipal do Emprego, onde é membro da bancada de empregadores. É registrado nos conselhos regionais de Engenharia e Agronomia do Estado de São Paulo (CREA) e dos Corretores de Imóveis (CRECI) e membro das entidades: Associação de Engenheiros e Arquitetos de Praia Grande (AEAPG), da União das Associações de Engenharia e Arquitetura do Litoral Paulista (UALP) e da Associação Comercial e Empresarial de Praia Grande (ACEPG).";
        
    } else if(valor == 10){  
    
        SecNome = "Secretaria de Meio Ambiente";
        Nome = "EDUARDO RODRIGUES XAVIER";
        Cargo = "Secretário de Meio Ambiente";
        Iniciais = "SEMA";
        Endereco = "Av. Presidente Kennedy nº 9000 - Bairro: Vila Mirim - CEP 11.704-900";
        Horario = "Segunda a Sexta-feira, das 08:30 as 16:00hs.";
        Telefone = "(13) 3496-2000";
        Texto = "Arquiteto e Urbanista, formado pela Universidade Santa Cecília em 2005, Eduardo Rodrigues Xavier tem vasta experiência na administração pública. Ingressou na Prefeitura de Praia Grande em 1993, como desenhista projetista, e, em 2001, assumiu a chefia da Divisão de Planejamento e Engenharia de Tráfego. Cursou diversas especializações e participou de seminários e congressos. Em 2010, assumiu a Secretaria de Trânsito e Transporte, cargo que ocupou até 2012.";
        
    } else if(valor == 11){  
    
        SecNome = "Secretaria de Obras";
        Nome = "ELOISA OJEA GOMES TAVARES";
        Cargo = "Secretária de Obras";
        Iniciais = "SEOP";
        Endereco = "Av. Presidente Kennedy nº 9000 - Bairro: Vila Mirim - CEP 11.704-900";
        Horario = "Segunda a Sexta-feira, das 08:30 as 16:00hs.";
        Telefone = "(13) 3496-2142";
        Texto = "Eloisa Ojea Gomes Tavares é engenheira civil formada pela Universidade Santa Cecília dos Bandeirantes (UniSanta). Trabalhou como profissional liberal no período de julho de 1987 a dezembro de 1992, quando manteve escritório de engenharia civil. Foi engenheira na Sabesp, de janeiro até dezembro de 1993. Em fevereiro de 1994, iniciou sua trajetória profissional na Prefeitura de Praia Garnde. Exerceu o cargo de chefia da Seção de Orçamento de 1994 até 1996. Um ano depois, passou a chefe de divisão de orçamento, onde ficou até o ano de 2000. Depois, exerceu a função de assistente da Secretaria de Obras Públicas de 2003 até 2004 e, em 2005, passou a exercer a função de secretária executiva de Obras Públicas. Faz parte do grupo técnico que desenvolveu grandes projetos na Cidade, tais como o da urbanização da orla, Via Expressa Sul e avenidas marginais, Plano de Macrodrenagem, duplicação da Avenida Presidente Kennedy, Viaduto da Avenida Ayrton Senna e de pavimentação dos bairros Quietude, Anhanguera, Nova Mirim e Ribeirópolis, entre outros. ";
        
    } else if(valor == 12){  
    
        SecNome = "Secretaria de Planejamento";
        Nome = "LUIZ FERNANDO LOPES";
        Cargo = "Secretário de Planejamento";
        Iniciais = "Secretaria de Planejamento";  
        Endereco = "Av. Presidente Kennedy nº 9000 - Bairro: Vila Mirim - CEP 11.704-900";
        Horario = "Segunda a Sexta-feira, das 08:30 as 16:00hs.";
        Telefone = "(13) 3496-2000";
        Texto = "Luiz Fernando Lopes é engenheiro civil formado pela Universidade Santa Cecília dos Bandeirantes (UniSanta) e pós-graduado em Gerente de Cidades pela Fundação Armando Álvares Penteado (Faap). Concluiu em 2009 MBA em Gestão Empresarial na Fundação Getúlio Vargas. Ingressou na Administração Municipal em 1993, como chefe do Departamento de Projetos. Em 1996, assumiu a Secretaria de Desenvolvimento Urbano e Meio Ambiente. No ano seguinte, foi responsável, entre outros projetos, pela revitalização da orla, Via Expressa Sul e pela implantação do Plano de macrodrenagem da Cidade, com a construção dos canais Praião, Xixová, Acaraú-Mirim, do projeto de revitalização dos 22 quilômetros da Avenida Presidente Kennedy, Viaduto Álvaro dos Santos (Avenida Ayrton Senna) e de pavimentação e drenagem do bairro Ribeirópolis.";
        
    } else if(valor == 13){  
    
        SecNome = "Secretaria de Promoção Social";
        Nome = "NANCI SOLANO TAVARES DE ALMEIDA";
        Cargo = "Secretária de Promoção Social";
        Iniciais = "SEPROS ";
        Endereco = "Av. Presidente Kennedy nº 9000 - Bairro: Vila Mirim - CEP 11.704-900";
        Horario = "Segunda a Sexta-feira, das 08:30 as 16:00hs.";
        Telefone = "(13) 3496-5001";
        Texto = "ormada em Letras e pós-graduada em Leituras de Produção de Sentido, Nanci Solano Tavares de Almeida é casada e mãe de um filho. Cursa atualmente nova pós-graduação em Gestão de Políticas Públicas do Sistema Único de Assistência Social. É funcionária de carreira de Praia Grande e entrou na Prefeitura junto com a primeira administração de Mourão, em 1993. Nesse período, atuou na implantação de projetos como o Conviver para a 3ª Idade, os Programas de Integração e Cidadania (PICs), Centros de Apoio à Família do Educando (Cafes), Lar São Francisco de Assis, Casa da Criança e do Adolescente, entre outros. Ganhou notoriedade ao se tornar a primeira chefe da Divisão do Idoso. Nanci atuou na efetivação do Conselho Municipal dos Direitos da Criança e do Adolescente (CMDCA), na criação do Conselho Tutelar e presidiu o Conselho Municipal de Assistência Social. Ocupou a secretaria, entre 2006 e 2008, nas licenças da titular, a então primeira-dama Maria Del Carmen Padin Mourão. E depois, novamente, no ano de 2012.";
        
    } else if(valor == 14){  
    
        SecNome = "Secretaria de Saúde";
        Nome = "FRANCISCO JAIMEZ GAGO";
        Cargo = "Secretário de Saúde";
        Iniciais = "SESAP";
        Endereco = "Av. Presidente Kennedy nº 9000 - Bairro: Vila Mirim - CEP 11.704-900";
        Horario = "Segunda a Sexta-feira, das 08:30 as 16:00hs.";
        Telefone = "(13) 3496-2400";
        Texto = "Com 48 anos de idade, Francisco é médico ginecologista e obstetra formado pela Faculdade de Medicina do ABC, em 1990, com residência médica em Tocoginecologia, em 1992. Com pós-graduações em Administração Hospitalar, pela Faculdade São Camilo, e em Medicina do Tráfego, por Pouso Alegre, e MBA Executivo em Saúde, pela Fundação Getúlio Vargas (2011), está em Praia Grande desde 2008, quando teve início a gestão do Hospital Municipal Irmã Dulce. Foi presidente da FUABC entre 2006 e 2007. Jaimez Gago é funcionário de carreira da Prefeitura de São Bernardo. Já ocupou vários cargos e integrou diversos grupos de trabalho na área de Saúde. Foi vice (2005) e Presidente da Fundação do ABC (2006-2007) e novamente vice, de 2008 até hoje. A fundação administra o Complexo de Saúde Irmã Dulce, que inclui o hospital municipal de Praia Grande e o pronto socorro central, além da Unidade de Pronto Atendimento (UPA), inaugurada em 2012 no Samambaia.";
        
    } else if(valor == 15){  
    
        SecNome = "Secretaria de Assuntos de Segurança Pública";
        Nome = "JOSE AMERICO FRANCO PEIXOTO";
        Cargo = "Secretário de Assuntos de Segurança Pública";
        Iniciais = "SEASP";
        Endereco = "Av. Presidente Kennedy nº 9000 - Bairro: Vila Mirim - CEP 11.704-900";
        Horario = "Segunda a Sexta-feira, das 08:30 as 16:00hs.";
        Telefone = "(13) 3496-5143";
        Texto = "Tenente-coronel da Reserva da Polícia Militar do Estado de São Paulo, José Américo Franco Peixoto, 56 anos, é casado e tem duas filhas. Entrou em 1978 para a Academia da Polícia Militar de Barro Branco, onde se tornou aspirante a oficial em 1980. Em 1894, formou-se na Escola de Educação Física da Polícia Militar como instrutor de educação física. Foi tenente do 10º Batalhão de Santo André de 1980 a 1984; e do 6º BPMI (Batalhão de Policiamento Militar do Interior), de 1984 a 1989, quando recebeu promoção a capitão. Peixoto atuou, de 1989 a 2000, no 29º BPMI, na área de Praia Grande. Foi nomeado, em 1994, secretário da Assistência Militar pelo prefeito Alberto Mourão, onde ficou até 1996. Em 2001, foi promovido a major, sendo classificado no 13º Batalhão da Polícia Militar Metropolitana de São Paulo e, em 2005, promovido a tenente-coronel. Em junho de 2006, voltou para o 29º BPMI em Itanhaém, já como comandante; e, em outubro do mesmo ano, designado a comandar o 45º Batalhão da Polícia Militar de Praia Grande. Em dezembro de 2008, foi para a reserva para assumir a Subsecretaria de Assuntos de Segurança de Praia Grande, onde permanece até hoje. ";
        
    } else if(valor == 16){  
    
        SecNome = "Secretaria de Serviços Urbanos";
        Nome = "KATSU YONAMINE";
        Cargo = "Secretário de Serviços Urbanos";
        Iniciais = "SESURB";
        Endereco = "Av. Presidente Kennedy nº 9000 - Bairro: Vila Mirim - CEP 11.704-900";
        Horario = "Segunda a Sexta-feira, das 08:30 as 16:00hs.";
        Telefone = "(13) 3496-2074";
        Texto = "Katsu Yonamine tem 57 aanos e é formado em Engenharia Civil pela Universidade Estadual Paulista (UNESP). Casado, é pai de dois filhos. Reside em Praia Grande desde 1960. Yonamine fez parte do Executivo de 1997 a 2000, quando atuou como chefe de departamento e gerenciamento das administração regionais, da pasta que hoje comanda. O titular da SESURB presidiu a Câmara no biênio 2009/2010. Foi reeleito em 2012 vereador pela terceira vez com 2.949 votos.";
        
    } else if(valor == 17){  
    
        SecNome = "Secretaria de Trânsito";
        Nome = "MARCELO AFONSO PRADO";
        Cargo = "Secretário de Trânsito";
        Iniciais = "SETRAN";
        Endereco = "Av. Presidente Kennedy nº 9000 - Bairro: Vila Mirim - CEP 11.704-900";
        Horario = "Segunda a Sexta-feira, das 08:30 as 16:00hs.";
        Telefone = "(13) 3496-5633";
        Texto = "Marcelo Afonso Prado é coronel da Policia Militar reformado. Com mais de 31 anos trabalhando na área de segurança e trânsito, acumula experiência de atuar em todos os batalhões da Baixada Santista. De agosto de 2012 a fevereiro de 2013, Prando comandou o CPI-6, unidade responsável pela Baixada Santista e Vale do Ribeira. Dentre os cursos realizados pelo coronel estão os de Trânsito e Gestão em Segurança Pública, da Secretria Nacional de Trânsito e Segurança Pública, de Gerenciamento de Crise e Negociação com Refém, da FBI/Acadepol, de SWAT, na Escola de Swat (em Los Angeles, Califórnia) e de Mediação de Conflitos, da Secretaria Nacional de Segurança Pública. Marcelo Prado é casado e pai de dois filhos.";
        
    } else if(valor == 18){  
    
        SecNome = "Secretaria de Transportes";
        Nome = "RAQUEL AUXILIADORA CHINI";
        Cargo = "Secretária de Transporte";
        Iniciais = "SETRANSP";
        Endereco = "Av. Presidente Kennedy nº 9000 - Bairro: Vila Mirim - CEP 11.704-900";
        Horario = "Segunda a Sexta-feira, das 08:30 as 16:00hs.";
        Telefone = "(13) 3496-6064";
        Texto = "Raquel Auxiliadora Chini formou-se em Engenharia Civil em 1982, Pela Universidade Santa Cecília dos Bandeirantes, e é pós-graduada em informática. Começou na Prefeitura no primeiro governo de Mourão, em 1993, quando foi secretária de Obras, até 1996. Foi diretora técnica da autarquia Prodepg, entre 1997 e 1998, e superintendente da mesma entidade em 1998 e 1999, acumulando ainda a Secretaria de Governo. Foi superintendente e autoridade de Trânsito, no biênio 1999/2000. De 2001 a 2004, ficou fora do serviço público, atuando como autônoma na área de projetos, construção e assessoria em documentação. Em 2005, assumiu o comando da Secretaria de Gestão Patrimonial, onde permaneceu até 31 de dezembro de 2008, cuidando da manutenção de prédios públicos e da frota. Assumiu a Secretaria de Serviços Urbanos em 2009 e ficou até o ano seguinte. De 2011 a 2012, foi secretária de Urbanismo e Meio Ambiente. ";
        
    } else if(valor == 19){  
    
        SecNome = "Secretaria de Urbanismo";
        Nome = "ARNALDO AMARAL";
        Cargo = "Secretário de Urbanismo";
        Iniciais = "SEURB";
        
        Endereco = "Av. Presidente Kennedy nº 9000 - Bairro: Vila Mirim - CEP 11.704-900";
        Horario = "Segunda a Sexta-feira, das 08:30 as 16:00hs.";
        Telefone = "(13) 3496-2031";
        Texto = "Santista de nascimento, mas morador do Município desde sua infância, Arnaldo é pai de dois filhos e servidor público de carreira. Ingressou no serviço público aos 18 anos como contínuo, na sessão de cadastro imobiliário. Passou pelos cargos de fiscal de tributos, chefe de fiscalização, chefe de gabinete na Câmara Municipal e chefe de fiscalização de obras. Em 2000, foi eleito o vereador mais votado de Praia Grande, repetindo o feito em 2004. Ocupou o cargo de presidente da Câmara nos anos de 2007 e 2008. Foi vice-prefeito na gestão de Roberto Francisco dos Santos (2008-2012), quando, paralelamente, exerceu o cargo de Assuntos Metropolitanos, pasta pioneira na Baixada Santista.";
        
    }%>

    <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>SGP - <%=SecNome%>o</title>
        <link href="_estilos/default.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <div id="conteudo-container">
            <%@include file="_templates/header.jsp"%>
            <%@include file="_templates/menu.jsp"%>
            <div id="containerinterno">
                <span class="sobre">SECRETARIAS<img src="_imagens/sobre.png" alt="" onmouseover="Tip('Entenda como funciona a administração pública municipal e conheça os seus secretários. Você está em: Secretaria de Administração ')" onmouseout="UnTip()"></span>
                <div id="conteudointerno">
                    <div id="conteudoint">
                        <div id="foto"><img src="_imagens/pessoas/mini<%=valor+3%>.gif" alt=""></div>
                        <div id="dadossec">
                            <span class="nome"><%=Nome%></span><br>
                            <span class="cargo"><%=Cargo%></span>
                            <div id="miolo"> 
                                <span class="secretaria"> <b><%=Iniciais%> - </b><%=SecNome%></span>
                                <br><br>
                                <span class="secretariaobs"> <b>Endereço:</b> <%=Endereco%>
                                    <br><br> 
                                    <b>Horário de Atendimento:</b><%=Horario%>
                                    <br><br>
                                    <b>Contato:</b> <%=Telefone%></span>
                            </div>
                        </div>
                        <div class="texto"><br><%=Texto%>
                        </div>
                    </div>
                </div>
            </div>
            <%@include file="_templates/footer.jsp"%>
        </div>
    </body>
</html>
