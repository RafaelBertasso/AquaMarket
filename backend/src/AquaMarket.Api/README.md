# AquaMarket.Api

O projeto **AquaMarket.Api** representa a camada de apresentação do backend, expondo os serviços e casos de uso por meio de uma API RESTful em ASP.NET Core.

## Responsabilidades

- **Controllers (`Controllers/`)**: Endpoints da API REST para recebimento de requisições e retorno de respostas HTTP.
- **Middlewares (`Middlewares/`)**: Componentes para tratamento global de exceções, geração de logs, autenticação e autorização.
- **Configuração e DI (`Extensions/`)**: Registro de Injeção de Dependências (DI), suporte ao Swagger/OpenAPI, CORS, Autenticação JWT e configurações de ambiente.
- **Filtros (`Filters/`)**: Filtros de ação, validação e exceção para os endpoints.

## Dependências

- Depende de todas as outras camadas (**`AquaMarket.Domain`**, **`AquaMarket.Application`**, **`AquaMarket.Infra`**) para realizar o registro e a composição das dependências do sistema no container de DI.

## Estrutura Futura de Pastas

```
AquaMarket.Api/
├── Controllers/
├── Middlewares/
├── Extensions/
└── Filters/
```
