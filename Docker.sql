DOCKER  https://www.youtube.com/watch?v=yb2udL9GG2U&t=3988s

Namespaces = isola os processos 
CGroups = Controla os recursos 
File System = As imagens dos arquivos que contem em cada container 

Deve se tratar cada vez que roda um docker como uma imagem onde vc
	coloca tudo que vai utilizar dentro dela
 ______________________________________________________________
|IMAGEM:                                                        |
|                                  My APP:v1                    |
|                                      |                        |
|	       BASH                  SSH.d                      |
|	         |________      ______|                         |
|		          |     |                               |
|		          UMBUNTU                               |
|			     |                                  |
|			   SCRATCH  (quando esta vazio)         |
|______________________________________________________________	|


IMAGEM (estado Imutavel)    READ/WRITE  


COMANDOS DO DOCKER 

docker pull = baixar a imagem
docker push = enviar a imagem

docker rum nomeImagem          = rodar na maquina
docker rum -p 8080:80 nginx    = baixa o nginx toda vez que acessar porta localhost:8080 docker redireciona para porta 80 do nginx
docker rum -d -p 8080:80 nginx = de forma desataxada do terminal só não mostra as informaçoes dele baixando no terminal
docker rum --name ngins -d -p 8080:80 nginx =  O --name nomeContainer  vc define um nome para o seu container

docker ps      = listar todas imagens que estao rodando
docker ps -a   = todos que foram baixados e estao no seu pc 

docker stop = parar de rodar 

docker rm chaveContainer  OU docker rm nomeContainer  (apagar a imagem do computador)
docker rm -f chaveContainer = formatar o container (-f forçar apagar msm que esteja rodando)

docker exec nginx ls = Rodar um comando dentro do (docker nginx) exec=executar  ls=listar 
docker exec -it ngi bash = entrar dentro do container camada READ/WRITE  onde vc consegue alterar os arquivos 
CTRL + D = sair do container

docker images = mostrar todas imagens instaladas no computador cada linha uma imagem 
docker rmi nginx = remover a imagem computador


Na pratica 

Junto ao projeto cria um arquivo nome Dockerfile (vai gerar a imagem no caso com golang:1.14 programa que quem baixar não vai precisar instalar)
arquivo deve conter:
	
	FROM golang:1.14
	
	COPY. .
	
	RUM go build main.go
	
	EXPOSE 8080
	
	ENTRYPOINT ["./main]


	
Explicação:
        FROM golang:1.14 (a imagem que vai estar no meu docker)	
	COPY. .	 (instrução para pegar a imagem e copiar para docker)
	RUM go build main.go (gerar o executavel do go)	
	EXPOSE 8080	(porta que vai responder)
	ENTRYPOINT ["./main]  (quando rodar o container executar o arquivo main)

docker build -t helitonvieira/treinamento-docker . 
docker run helitonvieira/treinamento-docker:latest
docker run -p 8080:8080 helitonvieira/treinamento-docker:latest
docker push helitonvieira/treinamento-docker:latest

Comando Terminal p/ criar a imagem: 
	docker build -t helitonvieira/treinamento-docker . 

executar a imagem criada 
	docker run helitonvieira/treinamento-docker:latest 	
	
Verificar se funcionou 	
	docker run -p 8080:8080 helitonvieira/treinamento-docker:latest 
	
Pode acessar porta e sua aplicação estara lá

Subir a imagem para dockerHub todos podem pegar a imagem e todos vai estar com msm ambiente de desenvolvimento
	docker push helitonvieira/treinamento-docker:latest 

***********************************************************************
DOCKER COMPOSE (gerenciar varios container docker atraves de um unico arquivo)	
***********************************************************************
Pratica junto ao projeto 
1 - cria o arquivo docker-compose.yaml

	version: '3'
	
	services:
		nginx:
			image: nginx
			volumes: 
				- ./nginx:/usr/share/nginx/html  
			ports:
				- 8080:80
				
		redis:
			image: redis:alpine
			expose: 
				- 6379 
				
				
---------------------------------------------	    
Explicação			
	

	version: '3'  (versao)
	
	services:
		nginx: (nome do container)
			image: nginx (vai ter uma imagem chamada nginx)
			volumes: (referenciar que tudo que mudar no computador muda no containe e vise versa)
				- ./nginx:/usr/share/nginx/html  
			ports: (acessa porta 8080 e direcionado para porta 80)
				- 8080:80

		redis:(nome do container)
			image: redis:alpine
			expose: 
				- 6379	(vai usar esta porta)	


Unico arquivo sobe todo projeto mysql,node,php,etc...				
---------------------------------------------

docker-compose up  = busca o arquivo e sobe os serviços


extensao gogle cloud close




http://maratona.fullcycle.com.br


















		   
			   
			   