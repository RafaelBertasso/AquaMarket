# Guia de Contribuição — AquaMarket

Agradecemos o interesse em contribuir para o **AquaMarket**! Este projeto segue rigorosamente a metodologia **Spec Driven Development (SDD)**.

---

## 🔄 Fluxo de Desenvolvimento SDD

No AquaMarket, **nenhuma linha de código de funcionalidade é escrita sem uma especificação prévia aprovada**. O fluxo de trabalho segue os passos:

```text
Spec ──> Revisão ──> Aprovação ──> Implementação ──> Testes ──> Pull Request (PR)
```

1. **Spec**: Criação do documento de especificação funcional e técnica.
2. **Revisão**: Discussão e refinamento do documento pela equipe.
3. **Aprovação**: Mudança do status da spec para `Aprovada`.
4. **Implementação**: Desenvolvimento do código estritamente alinhado com a spec.
5. **Testes**: Cobertura de testes unitários e de integração obrigatória.
6. **PR**: Abertura de Pull Request vinculado à spec correspondente.

---

## 📝 Como Criar uma Nova Spec

Para submeter uma nova funcionalidade ou alteração significativa de arquitetura:

1. Consulte as orientações completas em [`docs/specs/README.md`](docs/specs/README.md).
2. Utilize os templates oficiais localizados em `docs/specs/templates/`.
3. Registre novos termos no glossário em `docs/glossario.md`.

---

## 💻 Convenções de Código

### C# / .NET
- **PascalCase**: Classes, Interfaces (`IUserService`), Métodos, Propriedades, Namespaces (`AquaMarket.Domain`).
- **camelCase**: Parâmetros de métodos e variáveis locais.
- **_camelCase**: Campos privados (`private readonly IUserRepository _userRepository`).
- **Async/Await**: Utilize sufixo `Async` em métodos assíncronos (`GetUserByIdAsync`).
- **Domínio isolado**: Não utilize dependências de frameworks externos (ex: EF Core, ASP.NET) em `AquaMarket.Domain`.

### React / TypeScript
- **PascalCase**: Componentes React (`UserProfile.tsx`), Interfaces/Types (`UserProps`).
- **camelCase**: Funções, hooks (`useAuth`), variáveis e instâncias.
- **kebab-case**: Nomes de arquivos de estilo ou utilitários não-componentes.
- **TypeScript**: Evite o uso de `any`; defina tipos/interfaces claros para todas as props e DTOs.

---

## 🔀 Estrutura de Branches

- `main`: Código em produção, estável.
- `develop`: Branch de integração para funcionalidades aprovadas.
- `feature/<nome-da-feature>`: Branches para desenvolvimento de novas specs aprovadas.
- `bugfix/<nome-do-bug>`: Branches para correção de defeitos.

---

## 📦 Convenções de Commits (Conventional Commits)

Todas as mensagens de commit devem seguir o padrão [Conventional Commits](https://www.conventionalcommits.org/):

- `feat:` Nova funcionalidade (associada a uma spec aprovada)
- `fix:` Correção de um bug
- `docs:` Alterações na documentação ou specs
- `style:` Formatação, ponto e vírgula ausentes, etc. (sem alteração de código produtivo)
- `refactor:` Refatoração de código sem alterar comportamento
- `test:` Adição ou correção de testes
- `chore:` Atualizações de tarefas de build, pacotes, etc.

*Exemplo*: `feat(auth): adiciona caso de uso para login com credenciais`

---

## 🚀 Como Rodar o Projeto Localmente

*(Instruções detalhadas de ambiente e execução serão adicionadas conforme a estrutura de scripts for consolidada)*

1. Clone o repositório.
2. Certifique-se de ter o **.NET 8.0 SDK** e **Node.js 18+** instalados.
3. Configure as variáveis de ambiente baseadas nos arquivos de exemplo (`.env.example`).
