# Rails + Cucumber + RSpec + Docker

> **Cucumber + RSpec: testes que falam e testes que garantem.**

Este projeto é o segundo episódio da série de estudos com **Ruby on Rails**, **PostgreSQL** e **Docker**.

Aqui o foco sai da infraestrutura e entra nos **testes automatizados**, mostrando como combinar:

* 🥒 **Cucumber** — especificações em linguagem natural
* 🧪 **RSpec** — testes automatizados em Ruby
* 🐘 **PostgreSQL** — banco de dados
* 🐳 **Docker** — ambiente reproduzível
* 💎 **Ruby on Rails** — aplicação

## 🎯 Objetivo

Demonstrar, de forma simples e prática, como uma mesma funcionalidade pode ser descrita em linguagem de negócio com **Cucumber** e validada tecnicamente com **RSpec**.

A ideia é aproximar:

```text
Especificação
     ↓
  Cucumber
     ↓
Implementação
     ↓
    Rails
     ↓
    RSpec
     ↓
   Sistema
```

## 📁 Estrutura

```text
.
├── app/
├── config/
├── db/
├── features/
│   ├── support/
│   │   └── tarefas_steps.rb
│   └── step_definitions/
│       └── tarefas_steps.rb
├── spec/
│   └── system/
│       └── tarefas_spec.rb
├── Dockerfile
├── compose.yaml
├── Gemfile
└── README.md
```

### Cucumber

Os arquivos `.feature` descrevem o comportamento esperado da aplicação:

```gherkin
Given eu estou na pagina principal do app
When ...
Then eu devo ver ...
```

### RSpec

Os testes de sistema verificam o comportamento diretamente através do framework de testes:

```ruby
RSpec.describe "Exibição de tarefas concluídas", type: :system do
  ...
end
```

## 🐳 Ambiente Docker

O projeto foi desenvolvido para executar dentro de containers, mantendo o ambiente de desenvolvimento reproduzível.

A aplicação utiliza:

```text
Rails
  │
  ├── Ruby
  │
  └── PostgreSQL
```

Para iniciar o ambiente:

```bash
docker compose up -d
```

Verificar os containers:

```bash
docker compose ps
```

## 🧪 Executando os testes

### RSpec

```bash
docker compose exec app bin/rspec
```

Ou diretamente pelo container:

```bash
bin/rspec
```

Para executar um arquivo específico:

```bash
bin/rspec spec/system/tarefas_spec.rb -fd
```

### Cucumber

```bash
docker compose exec app bin/cucumber
```

Ou:

```bash
bin/cucumber
```

## 🔄 Cucumber + RSpec

Um dos pontos importantes deste episódio é perceber que **Cucumber e RSpec não precisam competir**.

Eles podem cumprir papéis diferentes:

| Ferramenta | Papel                     |
| ---------- | ------------------------- |
| Cucumber   | Descrever o comportamento |
| RSpec      | Validar o comportamento   |
| Rails      | Implementar a aplicação   |
| PostgreSQL | Persistir os dados        |
| Docker     | Reproduzir o ambiente     |

O Cucumber ajuda a responder:

> **O que o sistema deve fazer?**

O RSpec ajuda a responder:

> **O sistema realmente faz isso?**

## 🧩 Organização dos Steps

Os métodos reutilizáveis ficam separados das definições do Cucumber.

```text
features/
├── support/
│   └── tarefas_steps.rb
│
└── step_definitions/
    └── tarefas_steps.rb
```

Isso permite compartilhar comportamentos entre Cucumber e RSpec sem carregar comandos `Given`, `When` e `Then` diretamente no ambiente do RSpec.

## 🚀 Subindo o projeto

Clone o repositório:

```bash
git clone https://github.com/giljr/rails-cucumber-rspec-docker.git
cd rails-cucumber-rspec-docker
```

Suba os serviços:

```bash
docker compose up -d
```

Prepare o banco:

```bash
docker compose exec app bin/rails db:prepare
```

Execute os testes:

```bash
docker compose exec app bin/rspec
```

```bash
docker compose exec app bin/cucumber
```

## 📚 Série

Este projeto faz parte de uma sequência prática:

### Episódio 1

**Rails + PostgreSQL + Docker**

Construção de um ambiente Rails reproduzível utilizando PostgreSQL e Docker.

### Episódio 2

**Cucumber + RSpec: Testes que Falam e Testes que Garantem**

Da especificação em linguagem natural aos testes automatizados.

---

## 👨‍💻 Autor

**Gilberto Oliveira Júnior**

Estudos, experimentos e documentação sobre desenvolvimento de software, automação, testes e infraestrutura.

---

> **Código simples. Ambiente reproduzível. Testes que explicam o comportamento.**
