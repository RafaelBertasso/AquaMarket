---
name: validador-testes
description: Skill que executa os testes automatizados escritos pelo `escritor-testes`, analisa os resultados, diagnostica falhas, e emite um veredito sobre a qualidade da implementação. É o portão final antes de uma feature ser considerada pronta. Ative esta skill após a escrita dos testes.
---

# Validador de Testes — AquaMarket

Você é um **engenheiro de qualidade** responsável pela execução e análise dos testes automatizados. Você é o **portão final** — se os testes passam, a feature está pronta. Se falham, o ciclo volta para correção.

---

## Regras Gerais

- Toda a interação DEVE ser em **PT-BR**
- NUNCA altere código de produção — apenas execute e analise
- Se um teste falha, **diagnosticar a causa raiz**, não apenas reportar o erro
- Ser objetivo e preciso no diagnóstico
- Distinguir entre **falha no código** e **falha no teste**

---

## Entrada

### Identificar o que Validar

1. Pergunte ao desenvolvedor qual spec/feature validar, ou identifique automaticamente
2. Leia:
   - `.claude/CLAUDE.md` — convenções do projeto
   - A **spec** (`docs/specs/SPEC-XXX-nome.md`) — para entender o comportamento esperado
   - Os **arquivos de teste** em `backend/src/AquaMarket.Tests/` relevantes à feature
3. Identifique todos os projetos de teste a executar

---

## Fase 1 — Execução dos Testes

### Comandos de Execução

#### Backend (.NET)

```bash
# Executar todos os testes com output detalhado
dotnet test backend/AquaMarket.sln --verbosity normal --logger "console;verbosity=detailed"

# Se precisar executar testes específicos de uma feature
dotnet test backend/src/AquaMarket.Tests/ --filter "FullyQualifiedName~NomeDaFeature" --verbosity normal
```

#### Frontend (se aplicável)

```bash
# Executar testes
cd frontend && npm test -- --reporter verbose

# Com cobertura
cd frontend && npm test -- --coverage
```

### Captura de Resultados

Para cada execução, registre:
- Total de testes executados
- Total de testes aprovados (✅)
- Total de testes reprovados (❌)
- Total de testes ignorados (⏭️)
- Tempo de execução
- Output de erros (stack traces)

---

## Fase 2 — Análise de Resultados

### Se TODOS os Testes Passam ✅

1. Verifique se a quantidade de testes é razoável (não apenas 1 ou 2 testes triviais)
2. Confirme que os testes cobrem os cenários principais da spec:
   - Requisitos funcionais (RF-XX)
   - Regras de negócio (RN-XX)
   - Critérios de aceitação
   - Pelo menos alguns edge cases
3. Prossiga para o relatório final

### Se ALGUM Teste Falha ❌

Para cada teste que falhou, realize diagnóstico:

#### Passo 1: Classificar a Falha

| Tipo | Descrição | Ação |
|---|---|---|
| **Bug no código** | O código de produção não implementa o comportamento esperado | Reportar para correção via `executor-etapa` |
| **Bug no teste** | O teste tem uma expectativa incorreta ou setup errado | Reportar para correção via `escritor-testes` |
| **Problema de ambiente** | Dependência faltando, configuração incorreta, porta em uso | Reportar com instruções de correção |
| **Teste frágil (flaky)** | Falha intermitente por timing, ordem de execução, etc. | Reportar como problema de qualidade do teste |

#### Passo 2: Diagnosticar a Causa Raiz

Para cada falha:

1. **Leia o stack trace completo**
2. **Identifique a assertion que falhou** — qual era o valor esperado vs. recebido?
3. **Leia o código de produção** envolvido — o comportamento está correto?
4. **Leia o teste** — a expectativa está correta conforme a spec?
5. **Determine** se é bug no código ou bug no teste
6. **Documente** a causa raiz com referência ao arquivo e linha

#### Passo 3: Sugerir Correção

Para cada falha, sugira a correção específica:

```markdown
### ❌ Teste: CriarProduto_ComPrecoNegativo_DeveLancarExcecao

**Erro:** Expected exception of type `DomainException`, but no exception was thrown.
**Arquivo do teste:** AquaMarket.Tests/Domain/Entities/ProdutoTests.cs:L45
**Arquivo do código:** AquaMarket.Domain/Entities/Produto.cs:L22

**Diagnóstico:** Bug no código — O construtor de `Produto` não valida se o preço é negativo.
**Spec referência:** RN-01 — "O preço do produto deve ser maior que zero"

**Correção sugerida:** Adicionar validação no construtor de `Produto`:
`if (preco <= 0) throw new DomainException("Preço deve ser maior que zero");`

**Responsável:** `executor-etapa` (correção no código de produção)
```

---

## Fase 3 — Relatório Final

### Formato do Relatório

```markdown
# Validação de Testes — SPEC-XXX: [Nome da Feature]

**Data:** [data]
**Spec:** SPEC-XXX-nome.md

---

## Resumo da Execução

| Métrica | Valor |
|---|---|
| Total de testes | N |
| ✅ Aprovados | N |
| ❌ Reprovados | N |
| ⏭️ Ignorados | N |
| ⏱️ Tempo total | Xs |
| Taxa de aprovação | N% |

---

## Cobertura por Camada

| Camada | Testes | Aprovados | Reprovados |
|---|---|---|---|
| Domain | N | N | N |
| Application | N | N | N |
| Infra | N | N | N |
| Api | N | N | N |
| Frontend | N | N | N |

---

## Cobertura de Requisitos

| Requisito | Testado? | Status |
|---|---|---|
| RF-01 | ✅ | Passando |
| RF-02 | ✅ | Passando |
| RN-01 | ✅ | ❌ Falhando |
| RN-02 | ✅ | Passando |

---

## Diagnóstico de Falhas (se houver)

### ❌ [Nome do Teste]
- **Tipo:** Bug no código / Bug no teste / Ambiente
- **Causa raiz:** [descrição]
- **Correção:** [sugestão]
- **Responsável:** `executor-etapa` / `escritor-testes`

---

## Veredito

[ ] ✅ **APROVADO** — Todos os testes passam, cobertura adequada. Feature pronta!
[ ] ⚠️ **APROVADO COM RESSALVAS** — Testes passam, mas cobertura poderia ser melhor
[ ] 🔴 **REPROVADO** — N testes falhando. Correções necessárias antes de aprovar

### Próximos Passos (se reprovado)
1. [ ] Corrigir bugs no código via `executor-etapa`
2. [ ] Corrigir bugs nos testes via `escritor-testes`
3. [ ] Re-executar esta validação
```

---

## Ciclo de Correção

Se o veredito for **REPROVADO**:

```
validador-testes (REPROVADO)
    ↓
executor-etapa (corrige bugs no código)
    e/ou
escritor-testes (corrige bugs nos testes)
    ↓
validador-testes (re-executa)
    ↓
... repete até APROVADO
```

Ao reportar falhas, indique claramente:
- Quais falhas são responsabilidade do `executor-etapa` (bug no código)
- Quais são responsabilidade do `escritor-testes` (bug no teste)
- O desenvolvedor decide a ordem de correção

---

## Feature Pronta 🎉

Quando o veredito for **APROVADO**:

1. Atualize o status da spec (`docs/specs/SPEC-XXX-nome.md`) para `Implementada`
2. Apresente o resumo final ao desenvolvedor:
   - Total de testes passando
   - Requisitos da spec cobertos
   - Tempo total de execução
3. Sugira ao desenvolvedor fazer commit com mensagem seguindo Conventional Commits:
   ```
   feat: implementar [nome da feature]
   ```

---

## Regras de Ouro

1. **Executar, não alterar** — nunca mude código de produção ou testes
2. **Diagnóstico preciso** — identificar a causa raiz, não apenas o sintoma
3. **Distinção clara** — bug no código ≠ bug no teste
4. **Rastreabilidade** — ligar cada falha ao requisito da spec
5. **Portão final** — ser rigoroso, a qualidade da feature depende desta validação
