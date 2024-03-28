# 🐫 Turistando 🐫

O projeto Turistando é uma API de consulta sobre pontos turísticos criada para teste de ferramentas estudo.

## Instalação
- Instale o [Ruby](https://www.ruby-lang.org/pt/documentation/) 3.2.2
- Instale o [MySQL2](https://dev.mysql.com/doc/)
- Instale o Bundler:
```
gem install bundler -v '2.5.6'
```
- Instale o [Redis](https://redis.io/docs/install/install-redis)
 ```
sudo apt install redis-server
 ```
- Instale as Gems:
```
bundle install
```

## Primeiros passos
- Configure o seu arquivo `database.yml`
- Crie o banco de dados:
```
rails db:create
```
- Rode as migrations:
```
rails db:migrate
```
- Salve as informações dos pontos turísticos no banco de dados
```
rake get_data:get_data
```
- Configure as varíaveis de ambiente no arquivo `development.rb`
```ruby
# Sua chave API do google translate
ENV['API_KEY'] = "SUA CHAVE API"
```
- Inicie o servidor da API:
```
rails server
```

## Requisições e Respostas
Após instalar e configurar o projeto está na hora de consumir a API.

Você pode fazer o uso de duas maneiras

- Utilizando algum cliente de API como: Postman ou Talend API
- Consumindo a API em algum outro projeto

## Utilizando um cliente de API
Requisição por padrão trás 500 pontos turísticos diferentes em nosso banco de dados.

```
http://localhost:3000/places/
```

### Parametros
A API pode receber outros dois parametros opcionais:
- Kind
  
  Parâmetro utilizado para filtrar pelo tipo de ponto turístico que você deseja conhecer
  
  Exemplo:
  ```
  http://localhost:3000/places/religion
  ```
  Resposta:
  ```json
  [
  "Cathedral Park",
  "religion,cathedrals,gardens_and_parks,cultural,urban_environment,interesting_places"
  7,
  "[-78.8776016, 42.8819733]"
  ]
  ```

  Você pode conhecer todos os tipos de pontos turísticos aqui: [Tipos de Pontos Turísticos](https://dev.opentripmap.org/catalog)
- Language

  Parâmetro utilizado para tradução da resposta da API

  Exemplo:
  ```
  http://localhost:3000/places/historic/pt
  ```
  Resposta:
  ```json
  [
  "Indian God Rock (GPS confirma a localização)",
  "histórico,pinturas_de_cavernas,arqueologia,locais_interessantes"
  7,
  "[-79.8252869, 41.3306694]"
  ]
  ```
##

>[!NOTE]
>O parâmetro *Language* só não irá funcionar na requisição de todos os Pontos Turísticos, pois a API de tradução não suporta a quantidade de caractéres

##

## Executar os Testes

Para rodar os testes com Rpec basta executar o comando:
```
bundle exec rspec
```

