# AquaMarket — Instruções do Agente AI

## Regras Invioláveis

- Toda documentação e comentários DEVEM ser escritos em PT-BR
- Spec Driven Development: nenhum código de funcionalidade é escrito antes da spec correspondente ser aprovada
- Clean Architecture: a regra de dependência nunca é violada (Domain não depende de nada, Application depende só de Domain, Infra depende de Domain e Application, Api depende de todas)
- Namespaces seguem o padrão: `AquaMarket.{Camada}`
- O domínio (`AquaMarket.Domain`) nunca referencia frameworks externos (EF Core, ASP.NET, etc.)
- Testes são obrigatórios para todo caso de uso e regra de domínio
- Conventional Commits em todas as mensagens de commit
- Sempre usar `DateTimeOffset` — nunca `DateTime`
- IDs são sempre `Guid` gerados via `Guid.NewGuid()`, abstraídos por um helper `IdGenerator.NewId()` no Domain
- Padrão CQRS: Commands (escrita) e Queries (leitura) são sempre separados
- Dependências: antes de adicionar qualquer pacote, verificar que a versão é estável, livre de vulnerabilidades conhecidas, e preferencialmente com mais de 1 ano de criação

## Padrões Recorrentes

- Usar os templates de spec em `docs/specs/templates/` ao criar novas specs
- Registrar decisões arquiteturais como ADRs em `docs/architecture/`
- Novos termos de domínio devem ser adicionados ao glossário (`docs/glossario.md`)
- Backend: C# .NET 8.0, PostgreSQL via Supabase, Entity Framework Core, MediatR
- MediatR como mediador central: Controllers enviam Commands/Queries via `IMediator`, handlers processam
- Frontend: React + Vite + TypeScript
- Estrutura do backend: `AquaMarket.Api`, `AquaMarket.Application`, `AquaMarket.Domain`, `AquaMarket.Infra`, `AquaMarket.Tests`
- Usar `async`/`await` em toda operação de I/O
- DTOs para comunicação entre camadas (nunca expor entidades de domínio na API)
- Injeção de dependência para todas as dependências
- Commands retornam no máximo o ID do recurso criado/alterado; Queries retornam DTOs de leitura
- Nomear handlers como `{Ação}{Entidade}CommandHandler` e `{Ação}{Entidade}QueryHandler`

## Skills Disponíveis

| Skill | Caminho | Quando Usar |
|---|---|---|
| `planejador-spec` | `.claude/skills/planejador-spec/SKILL.md` | Planejar nova funcionalidade, criar spec, definir tasks e critérios de pronto |
| `detalhador-implementacao` | `.claude/skills/detalhador-implementacao/SKILL.md` | Pegar uma spec aprovada e destrinchar em plano de desenvolvimento granular |
| `executor-etapa` | `.claude/skills/executor-etapa/SKILL.md` | Implementar o código de UMA ÚNICA etapa do plano |
| `revisor-codigo` | `.claude/skills/revisor-codigo/SKILL.md` | Code review da implementação contra plano e spec |
| `escritor-testes` | `.claude/skills/escritor-testes/SKILL.md` | Escrever testes automatizados baseados na spec (independente do plano) |
| `validador-testes` | `.claude/skills/validador-testes/SKILL.md` | Executar testes, diagnosticar falhas, e aprovar/rejeitar a feature |

