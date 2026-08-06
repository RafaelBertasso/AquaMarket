# AquaMarket.Infra

O projeto **AquaMarket.Infra** provê a implementação concreta dos detalhes de infraestrutura e serviços externos necessários para a aplicação.

## Responsabilidades

- **Acesso a Dados (`Data/`)**:
  - Configuração do **DbContext** com Entity Framework Core.
  - Mapeamentos de entidades via Fluent API (`Configurations/`).
  - Histórico e arquivos de **Migrations**.
- **Repositórios Concretos (`Repositories/`)**: Implementação das interfaces de repositório definidas na camada de Domínio.
- **Serviços Externos (`Services/`)**: Implementações concretas das interfaces de serviços externos definidas na camada de Aplicação (integrações HTTP, gateway de pagamentos, notificações, storage).

## Banco de Dados

- **PostgreSQL** hospedado via **Supabase**.

## Dependências

- Depende dos projetos **`AquaMarket.Domain`** e **`AquaMarket.Application`**.

## Estrutura Futura de Pastas

```
AquaMarket.Infra/
├── Data/
│   ├── Configurations/
│   └── Migrations/
├── Repositories/
└── Services/
```
