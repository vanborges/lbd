# Ambiente Para Execução das Atividades de LBD
Este repositório é um *fork* do ambiente previamente disponibilizado pela Professora Vanessa Borges (FACOM - UFMS) durante as aulas de Laboratório de Banco de Dados.

Este ambiente contém apenas algumas modificações para melhor usabilidade e produtividade durante a execução das atividades.

## **Atenção!!!**
- **Este ambiente não contém o banco de dados disponibilizado pela Professora.**

- **Apenas um banco vazio, com o *schema public* e sem nenhuma tabela.**

---

# Requisitos Mínimos

# Docker
Docker é um software para facilitar e agilizar a criação e administração de ambientes isolados. Isso é feito através dos *containers*.

Utilizamos esta ferramenta para implementar as aplicações em um ambiente separado da máquina *host*. Criando os chamados *containers*, que são, grosseiramente resumido, uma máquina virtual (VM) que compartilha as funções básicas do sistema operacional. Funções como: código, bibliotecas, runtime, etc. Isso evita a necessidade de virtualizar todos os componentes de uma máquina, consumindo muito menos recursos.

## Docker on The Web
É possível utilizar a ferramenta online através de serviços como [Docker Play](https://labs.play-with-docker.com/) ou [Katacoda](https://www.katacoda.com/courses/docker-orchestration/playground)

Porém, para o funcionamento correto deste ambiente (visando a **PERSISTÊNCIA** das edições realizadas durante as atividades) é altamente recomendável a instalação da ferramenta Docker em sua máquina.

## Instalação do Docker (Linux)
Para sistemas UNIX como Linux (recomendo 👍), a execução do *script* de instalação é mais do que suficiente.

```shell
curl -fsSL https://get.docker.com | sudo sh
```

Para utilizar o Docker com seu usuário, para não ter que digitar *sudo* e então entrar com o usuário *root* o tempo todo, considere adicionar seu usuário ao grupo "docker".

```shell
sudo usermod -aG docker ${USER}
```

Para a efetivar a alteração é necessário realizar ***LOGOUT*** na máquina.

## Windows ou Mac? Sem problemas :)
### Mac
Como Mac é também baseado em UNIX, a instalação é tão fácil quanto no linux. [Aqui](https://docs.docker.com/docker-for-mac/install/)

### Windows
Já aqui as coisas podem complicar um pouco... Mas também é perfeitamente possível, claro!

A instalação vai variar dependendo da versão do Windows que você possui.
- [Windows 10 Pro, Enterprise, and Education](https://docs.docker.com/docker-for-windows/install/)

- [Windows 10 Home](https://docs.docker.com/docker-for-windows/install-windows-home/)

- [Windows 8 or 8.1 and Windows 7](https://docs.docker.com/toolbox/toolbox_install_windows/) ¹

¹ Windows 8 e 7 funcionam utilizando o Docker Toolbox, que debaixo dos panos é uma VM do Oracle VirtualBox

E por último, mas não menos importante, também é possível instalar uma VM com Linux e seguir por aqui. A versão mínima do Ubuntu ([mini.iso](http://archive.ubuntu.com/ubuntu/dists/focal/main/installer-amd64/current/legacy-images/netboot/mini.iso)) é mais que suficiente para isso. Se for o caso, **NÃO se esqueça** de criar uma ponte entre a interface de rede da sua máquina e da interface de rede da VM.

---

# Docker-Compose
Já o Docker-Compose é responsável por agilizar a criação, integração e configuração de um ou mais *containers*.

Ele cria os *conteiners* e seus serviços integrando com os demais conforme configurado. Tudo isso, com um único comando. Tanto na criação como na destruição do ambiente.

## Instalação (Linux)
Para realizar a instalação, tão simples como a do Docker, basta executar os seguintes comandos:

Para baixar o binário:

```shell
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
```

Para conceder as devidas permissões de execução:

```shell
sudo chmod +x /usr/local/bin/docker-compose
```

Criar *link-simbólico* para execução do comando em um terminal: 

```shell
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
```

[Outro Sistema Operacional?](https://docs.docker.com/compose/install/#install-compose)

---

# Ambiente
Para execução das atividades iremos utilizar como banco de dados o *PostgreSQL* junto ao *pgAdmin*.

## Como Subir o Ambiente
Para iniciar o ambiente basta executar o *docker-compose.yml* com o programa (adivinha 💁) docker-compose.

### **Atenção!!!**

- **Para o funcionamento correto deste ambiente, a execução dos comandos devem ser realizadas dentro do diretório em que este repositório foi clonado!**

Na primeira execução é necessário construir os *containers*, e, pensando em uma instalação limpa do Docker, é necessário adiquirir as imagens do serviços [*PostgresSQL*](https://hub.docker.com/_/postgres) e [*pgAdmin*](https://hub.docker.com/r/dpage/pgadmin4). Irei utilizar ambas em suas versões estáveis.

### Primeira Execução


```shell
docker-compose up --build -d
```

### Demais Execuções

```shell
docker-compose up -d
```

## Algumas Dicas
- O argumento ```-d``` faz com que o processo seja executado em *background*.

- O seguinte comando permite visualizar o *log* de execução do compose após executado com ```-d```.
    ```shel
    docker-compose logs --follow
    ```

## Como Parar o Ambiente
Após a realização das atividades é possível destruir todos o *containers*, *networks* e *volumes* criados.

Mas não se preocupe, é possível voltar a utilizar todo ambiente novamente sem perder nenhuma alteração realizada, tanto no banco quanto no *pgAdmin*, com o comando para subir o *compose* (```docker-compose up -d```).

## Acessar o Ambiente

### *pgAdmin*
Para abrir o *pgAdmin* deverá acessar o IP do *container*. No caso, é um IP estático e a porta é do serviço é a padrão (80).

- *pgAdmin*: http://172.20.0.3

### **Configurações de Permissão!!!**
Se você subiu o serviço e tentou acessar o *pgAdmin*, provavelmente se deparou com um problema (foi mal 😕). Isso ocorre devido a um erro de permissão, pois para NÃO perder os dados da sessão, estou *linkando* os arquivos dela na máquina *host* e assim eles persistem mesmo após a destruição do *container*. O que permite não ter que realizar a conexão com *postgres* sempre que subir o *compose*.

Se você abrir os *logs* do *compose* vai conseguir visualizar tudo isso.

Para corrigir o problema é necessário alterar o dono e o grupo do volume montado. Execute o seguinte comando:

**Para realizar esta alteração, é necessário que o ambiente esteja *up* primeiro!**

```shell
sudo chown -R 5050:5050 pgadmin-data
```

O ID ```5050``` é o ID do usuário *pgadmin* que tem as permissões necessárias para lidar com os arquivos da sessão.

Após a alteração o serviço irá funcionar normalmente.


### Configurando *pgAdmin*

Realize *login*:

```
Email Address/Username: pgadmin4@pgadmin.org
Password: pgadmin4
```

Para conectar o banco *postgres* ao *pgAdmin* é preciso selecionar:
- Server
    - (Botão Direito) Create
        - Server

Após isso, configure o banco de dados:
- *General*
    - *Name*
        - Defina o nome do banco
- *Connection*
    - Host name/address
        - http://172.20.0.2
    - Username
        - postgres
    - Password
        - postgres
    - Save password
        - ✓

---

# Mantendo Seus Projetos
Todas as alterações realizadas tanto no banco quanto no *pgAdmin* estarão armazenadas nas pastas *pgadmin-data* e *postgres-data*.

- ***pgadmin-data***: dados e configurações da sessão no *pgAdmin*
- ***postgres-data***: dados e configurações do banco de dados *PostgreSQL*

Caso deseje acessar esses diretórios você deve utilizar o usuário *root*.

```shell
# altera para usuário root
sudo su
```

Para então acessar os diretórios:

```shell
# pgadmin-data
cd pgadmin-data

# postgres-data
cd postgres-data
```

### Uma Dica 😉
- Execute ```ls -l``` para visualizar os usuários e os grupos aos quais o conteúdo pertence.

### **Atenção!!!**
- **Mantenha esses diretórios para não perder seu progresso!**


---

# Bons Estudos
É isso pessoal, bons estudos 👋