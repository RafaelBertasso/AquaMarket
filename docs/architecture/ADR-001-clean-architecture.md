# ADR-001: Clean Architecture como Padrão Arquitetural

- **Status:** Aceito
- **Data:** 2026-08-04
- **Autor:** Equipe de Arquitetura AquaMarket

---

## Contexto

O AquaMarket é uma plataforma de marketplace em expansão que exige alta manutenibilidade, testabilidade e desacoplamento de tecnologias externas (como frameworks web, bancos de dados e serviços de terceiros). 

Para garantir que o negócio evolua sem que as regras de domínio sejam impactadas por decisões de infraestrutura ou detalhes de implementação, é necessária uma arquitetura estruturada que promova a separação clara de responsabilidades e permita a evolução independente das camadas.

## Decisão

Decidimos adotar a **Clean Architecture** (Arquitetura Limpa) como padrão estrutural para os projetos do AquaMarket. A aplicação será dividida em 4 camadas principais:

1. **Domain (Domínio):**
   - Contém as entidades de negócio, objetos de valor (Value Objects), exceções de domínio e interfaces de repositório/serviços.
   - Não possui nenhuma dependência externa de frameworks ou bibliotecas de infraestrutura.

2. **Application (Aplicação):**
   - Contém os casos de uso (Use Cases / Application Services), DTOs, mapeadores e interfaces de serviços da aplicação.
   - Coordena a execução dos fluxos de negócio utilizando os componentes da camada de Domínio.

3. **Infra (Infraestrutura):**
   - Implementa as interfaces definidas no Domínio e na Aplicação (acesso a banco de dados, provedores de pagamento, mensageria, gateways externos, etc.).
   - Contém detalhes tecnológicos e mapeamentos de ORM/persistência.

4. **Api (Apresentação / Entrada):**
   - Ponto de entrada da aplicação HTTP/REST, controllers, middlewares, validação de requisições e serialização de respostas.

### Regra de Dependência

A regra fundamental da arquitetura é a **Regra de Dependência**: as dependências de código-fonte devem apontar apenas para dentro, em direção ao Domínio.
- **Domain** não conhece nenhuma outra camada.
- **Application** conhece apenas **Domain**.
- **Infra** e **Api** conhecem **Application** e **Domain** (mas Domain e Application nunca dependem de Infra ou Api diretamente; a inversão de dependência é aplicada via interfaces).

```
[ Api ]      \
              +--> [ Application ] --> [ Domain ]
[ Infra ]    /
```

## Consequências

### Positivas

- **Testabilidade:** As regras de negócio (Domain) e casos de uso (Application) podem ser testados de forma isolada sem dependência de banco de dados ou servidor HTTP.
- **Flexibilidade e Desacoplamento:** Mudanças de frameworks, bibliotecas ou banco de dados impactam apenas a camada de Infra/Api, mantendo o núcleo da aplicação intacto.
- **Manutenibilidade:** Separação clara de responsabilidades facilita a localização de código, refatorações e onboarding de novos desenvolvedores.

### Negativas

- **Boilerplate Inicial:** Exige maior número de classes, interfaces, DTOs e mapeadores para fluxos simples.
- **Curva de Aprendizado:** Requer disciplina do time para respeitar rigorosamente as fronteiras e regras de dependência entre as camadas.
