DOCKER CURSO UDEMY

INSTALAÇÃO 
DOCKER WINDOWS (Interface para trabalhar com docker)  https://docs.docker.com/desktop/windows/install/

	docker ps (saber se esta instalado)
	
VS CODE (Install plugin Docker)


CONTAINER
   HELP
	docker comando --help  ex: docker pull --help
	
   PESQUISA
	docker <ps ou ls>     = listar todas imagens que estao rodando
	docker ps -a   = todos que foram baixados e estao no seu pc rodando e parado status
	docker top nomeContainer (verificar mais informaçoes)
	docker inspect nomeContainer (com muito detalhe)
	docker stats (informação consumos )
	
	//OBS: tag nas images é como branch no git 
	docker images = mostrar todas imagens instaladas no computador cada linha uma imagem 
		
   INICIAR 
	docker start nomeContainer
	docker start -i nomeContainer (roda modo iterativo)
   BAIXAR 
	docker pull nomeImagem = baixar a imagem
	docker pull nomeImagem:nomeTag = baixa a imagem na versao da tag 
        docker pull hsvsystem/nomeRepo (nomeUsuario/nomeImagem)
	
   SUBIR Enviar para dockerHub
        docker login  (vai solicitar user senha )
	entra no https://hub.docker.com/ (user: hsvsystem  pass:) > Repositorios > Criar Repositorio > nomeRepo  
	(bash) docker build -t hsvsystem/nomeRepo:nomeTag . (criar a imagem com o msm nome do repositorio )
	docker push hsvsystem/nomeRepo = enviar a imagem
	docker logout = encerrar connecxao com dockerhub
   
   CRIAR UM NOVO
        docker rum <nomeContainer ou idContainer> 
	docker run  -d  nomeContainer(rodar container e continua rodando)
	docker rum -p 8080:80 nomeContainer  = 8080 porta que vai chamar na maquina / 80 porta que o projeto vai esta no docker
        docker rum -d -p 8080:80 nomeContainer = de forma desataxada do terminal só não mostra as informaçoes dele baixando no terminal
	docker rum -d -p --rm 8080:80 nomeContainer ( rm apaga o container quando ele para bom para testes sem deixar sujeira)
	
	//Criar imagens(git bash tem que esta aberto dentro diretorio arquivo Dockerfile)
	docker build
	docker build -t nomeImagem .   (criar imagem e coloca o nome nela)
	docker build -t nomeImagem:nomeTag .   (criar imagem e coloca o nome e nomeTag)
        
   RENOMEAR
	docker rum -d -p 8080:80 --name gugu nomeContainer  (altera o nome container para gugu)	
	
	docker tab idImagem nomeRenomeado (docker images - para listar todas imagens)
	docker tab idImagem nomeRenomeado:nomeTag (renomeia nome da imagem e da tag)
	
   PARA
	docker stop nomeContainer = parar de rodar
   
   COPIAR ARQUIVO DE CONTAINERS RODANDO 
	docker cp nomeContainer:/caminhoArquivo.js ./caminhoVaiSerCopiado
   LOG 
   APAGAR
	docker system prune (remove imagens, containers e networks que não estao sendo utilizados ocupando espaços)
	
	docker rm chaveContainer  OU docker rm nomeContainer  (apagar a imagem do computador)
	docker rm -f chaveContainer = formatar o container (-f forçar apagar msm que esteja rodando)
	
	docker rmi nomeImagem = remover a imagem computador
        docker rmi nomeImagem -f = força remoção
   
REDES(Conectar container)
   Drivers	
	Externo (conectar com API)
	Host (Conectar com maquina que esta executando o docker)
	Bridge (Entre containers driver bridge)
	none (remove todas connections do conteiner deixa isolado)
	plugins (permite extensões de terceiros para criar outras redes)
	
   Comandos 
   
   LISTAR VISUALIZAR
	docker network ls 
	
   CRIAR 
	docker network create nomeDaRede
	docker network create -d nomeDriver nomeDaRede (cria a rede driver especifico)
	
   REMOVER 
	docker network rm nomeDaRede
	docker network prune (remove todas que não estao sendo utilizadas)
	
   CRIAR CONECXAO EXTERNA	
	(Bash no Dockerfile) docker build -t nomeImagem .   (criar a imagem)
	docker run -d -p 5000:5000 --name nomeContainer nomeImagem ( rodar container baseado na imagem criada ) 
	(postman) http://localhost:5000/  (Acessa o container api na raiz)
	

	


YAML (arquivo.yaml)
	Comentario #
	nome: Heliton ou "Heliton"
	versao: 2
	Versao_completa: 3.14
	nulos: ~ ou null
	boolean: True ou On  False ou Off
	
	Arrays   lista:[1,2,33,4,5]
	    ou   (obrigatorio - espaço depois do traço)
	    lista: 
               - teste
               - 2
               - True 
	       
	Objetos:{a: 1, b: 3, c: 3}
	Objetos:{a: 1, b: 3, c: 3, ObjetosInternos:{d: 1, b: 3, c: 3}}

	
DOCKER COMPOSE 	(docker-compose.yml)
-----------------------ex de arquivo docker-compose.yml------------------------------------
services:
  db:
    image: mysql:5.7
    hostname: mysql
    container_name: mysql
    restart: always
    ports:
      - "3306:3306"
    environment:
      MYSQL_DATABASE: miniautorizador
      MYSQL_ROOT_PASSWORD:
      MYSQL_ALLOW_EMPTY_PASSWORD: "yes"
    volumes:
      - db_data:/var/lib/mysql
      
----------------------------------------------------------------------
   RODAR 
	docker-compose up 
	docker-compose up -d ( rodar em background)
	
   PARAR	
        docker-compose down
	docker stop nomeContainer
   LISTAR 
	docker <ps ou ls>     = listar todas imagens que estao rodando
	docker ps -a   = todos que foram baixados e estao no seu pc rodando e parado status	
	docker inspect nomeContainer (com muito detalhe)
	
	
	
  	




	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	