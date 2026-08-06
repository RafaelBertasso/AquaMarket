# AquaMarket.Application

O projeto **AquaMarket.Application** é a camada responsável por implementar os casos de uso da aplicação e orquestrar o fluxo de dados entre o domínio e as interfaces externas.

## Responsabilidades

- **Casos de Uso / Handlers (`UseCases/` ou `Features/`)**: Implementação das operações e fluxos de trabalho do sistema.
- **DTOs (`DTOs/`)**: Objetos de transferência de dados para entrada e saída das operações.
- **Validações (`Validators/`)**: Regras de validação de dados de entrada utilizando FluentValidation.
- **Interfaces de Serviços (`Interfaces/`)**: Contratos para serviços externos como envio de e-mails, pagamento, armazenamento de arquivos, etc.
- **Mapeamentos (`Mappings/`)**: Mapeamento entre entidades de domínio e DTOs.

## Dependências

- Depende unicamente do projeto **`AquaMarket.Domain`**.
- Não deve conter dependências diretas de banco de dados ou frameworks Web.

## Estrutura Futura de Pastas

```
AquaMarket.Application/
├── UseCases/
├── DTOs/
├── Interfaces/
├── Mappings/
└── Validators/
```
