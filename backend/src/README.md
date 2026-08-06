# Arquitetura do Backend — AquaMarket

Este repositório contém a implementação do backend do projeto **AquaMarket**, estruturado segundo os princípios da **Clean Architecture** (Arquitetura Limpa).

A Clean Architecture visa a separação clara de responsabilidades, garantindo desacoplamento de frameworks, facilidade de testes unitários e independência das regras de negócio em relação a detalhes de infraestrutura ou apresentação.

## Camadas e Responsabilidades

| Camada | Responsabilidade | Dependências |
| :--- | :--- | :--- |
| **AquaMarket.Domain** | Entidades, Value Objects, Enums, Interfaces de repositório, Domain Events e exceções de domínio. Regras de negócio essenciais. | Nenhuma (Sem dependências externas) |
| **AquaMarket.Application** | Casos de uso, DTOs, Validações, Interfaces de serviços e mapeamentos. Orquestração das regras de negócio. | Apenas `AquaMarket.Domain` |
| **AquaMarket.Infra** | EF Core, PostgreSQL/Supabase, Repositórios concretos, Migrações e Integrações externas. | `AquaMarket.Domain` e `AquaMarket.Application` |
| **AquaMarket.Api** | Controllers, Middlewares, Configuração (DI, Swagger, CORS) e Filtros. Camada de apresentação REST. | Todas as camadas (`Domain`, `Application`, `Infra`) |

## Diagrama de Regras de Dependência

A regra fundamental da Clean Architecture é que as dependências do código apontam sempre para dentro, em direção ao Domínio:

```
[ AquaMarket.Domain ] 
       ▲
       │
[ AquaMarket.Application ]
       ▲                  ▲
       │                  │
[ AquaMarket.Infra ]   [ AquaMarket.Api ]
```

De forma simplificada:
`AquaMarket.Domain` ← `AquaMarket.Application` ← `AquaMarket.Infra` / `AquaMarket.Api`

> **Nota:** Os projetos C# (`.csproj`) serão criados e configurados via skill dedicada.
