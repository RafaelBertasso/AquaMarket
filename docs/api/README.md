# Documentação de API - AquaMarket

Este diretório armazena as especificações de API e contratos de integração da plataforma AquaMarket.

---

## Estratégia API-First

O AquaMarket adota a abordagem **API-First**. Isso significa que os contratos de API são projetados, documentados e validados **antes** da implementação do código backend e frontend. 

A abordagem API-First garante:
- Desacoplamento entre desenvolvimento frontend e backend.
- Validação antecipada dos fluxos de integração com partes interessadas.
- Geração automatizada de documentação e clientes HTTP (SDKs).

---

## Formato e Padrões

- **Padrão de Especificação:** [OpenAPI 3.0 (Swagger)](https://swagger.io/specification/).
- **Formato de Arquivo:** YAML (`.yaml` / `.yml`) ou JSON (`.json`).
- **Organização de Arquivos:** Os contratos devem ser divididos em arquivos separados por domínio/recurso (ex: `vendedores.yaml`, `produtos.yaml`, `pedidos.yaml`).
- **Versionamento de API:** O versionamento é realizado explicitamente via **URL Path**, seguindo o padrão `/api/v1/{recurso}` (ex: `/api/v1/produtos`, `/api/v2/pedidos`).

---

## Status dos Contratos

> **Nota / Placeholder:** 
> Os contratos OpenAPI serão adicionados e atualizados neste diretório à medida que as especificações funcionais ([`docs/specs/`](file:///c:/Users/Rafael/Projetos/sdd/Estudo/docs/specs/)) forem revisadas e aprovadas pelo time.
