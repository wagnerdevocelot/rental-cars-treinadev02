# Rental Cars
Rental cars é uma aplicação administrativa para locação de veículos. (WIP)

##  Como rodar localmente
1. Clone ou de um fork através do git ou baixe o pacote compactado
2. Instale as dependências usando o comando`bundle install`
3. Rode no terminal `rails db:create db:migrate` para criar o bando de dados e rodar as migrações.
4. Inicie o servidor com o comando `rails s`. A aplicação irá rodar na porta http://localhost:3000/ 
5. Vá até http://localhost:3000/ no seu browser e cadastre produtos e suas categorias


## Features
    # Visitante
        - Visitante abre página inicial
        - Visitante visualiza fabricantes
    
    # Administrador
        - Administrador cadastra filiais
        - Validar dados da filial
        - Administrador visualiza filiais
        - Administrador edita filial
        - Administrador deleta filial
        - Administrador cadastra fabricante
        - Validar dados do fabricante
        - Administrador visualiza fabricante
        - Administrador edita fabricante
        - Administrador deleta fabricante
        - Administrador cadastra categorias de carros com preço padrão
        - Administrador visualiza categorias de carros
        - Administrador edita categorias de carros
        - Administrador deleta categorias de carros
        - Administrador cadastra modelo de carro
        - Administrador visualiza modelo de carro
        - Administrador edita modelo de carro
        - Administrador deleta modelo de carro

    # Usuário
        - Usuário cadastra cliente  
        - Autenticação usuário
        - Agendar uma locação
        - Buscar uma locação

    # Autorização do sistema
        - Somente Administradores podem gerir filiais
        - Somente Administradores podem gerir fabricantes    
        - Somente Administradores podem gerir modelos de carros
        - Somente Administradores podem gerir categorias
        - Usuários só podem ver locações da sua filial
        - Somente usuários da filial podem efetivar locações



  
  ## Features futuras
    - Ver status de uma locação
    - Cadastrar endereço de filial
    - Encerrar locação

## Dependências
    - Ruby
    - Rails
    - Sqlite
































