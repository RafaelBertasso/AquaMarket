# AquaMarket.Tests

O projeto **AquaMarket.Tests** é o repositório unificado de testes automatizados para o backend do AquaMarket.

## Estratégia de Testes

- **Projeto Unificado**: Centralização de testes unitários e testes de integração em um único projeto, organizando os cenários em diretórios que espelham as camadas da arquitetura.
- **Frameworks e Bibliotecas**:
  - **xUnit**: Framework principal de testes.
  - **FluentAssertions**: Asserções expressivas e legíveis.
  - **Moq** (ou **NSubstitute**): Criação de mocks e dublês de teste para isolamento das unidades.

## Convenção de Nomenclatura dos Testes

Os métodos de teste devem seguir o padrão:
`MetodoSobTeste_Cenario_ResultadoEsperado`

*Exemplo:* `CriarProduto_ComPrecoInvalido_DeveLancarDomainException`

## Estrutura Futura de Pastas

```
AquaMarket.Tests/
├── Domain/
├── Application/
├── Infra/
└── Api/
```
