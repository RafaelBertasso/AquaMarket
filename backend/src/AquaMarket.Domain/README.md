# AquaMarket.Domain

O projeto **AquaMarket.Domain** representa a camada mais interna da Clean Architecture no backend do AquaMarket.

## Responsabilidades

Esta camada é o coração do sistema e contém todas as regras de negócio fundamentais e modelos de domínio:

- **Entidades (`Entities/`)**: Objetos com identidade própria que possuem estado e comportamento.
- **Value Objects (`ValueObjects/`)**: Objetos imutáveis definidos por seus atributos e sem identidade única.
- **Enums (`Enums/`)**: Enumerações de domínio.
- **Interfaces de Repositório (`Interfaces/`)**: Contratos para persistência e consulta de dados, sem implementar detalhes tecnológicos.
- **Domain Events (`Events/`)**: Eventos disparados quando ocorrem mudanças significativas no estado do domínio.
- **Exceções de Domínio (`Exceptions/`)**: Exceções customizadas que representam violações de regras de negócio.

## Regras de Arquitetura

- **ZERO dependências de frameworks externos**: Esta camada não deve possuir dependência de bibliotecas de terceiros como Entity Framework Core, ASP.NET Core ou qualquer ORM/drivers de banco de dados.
- Não possui conhecimento de persistência, APIs REST ou interfaces de usuário.

## Estrutura Futura de Pastas

```
AquaMarket.Domain/
├── Entities/
├── ValueObjects/
├── Enums/
├── Interfaces/
├── Events/
└── Exceptions/
```
