#!/bin/sh
# Git commit-msg hook para o AquaMarket
# Valida se a mensagem do commit segue o padrão Conventional Commits em PT-BR

commit_msg_file=$1
commit_msg=$(cat "$commit_msg_file")

# Regex para validar Conventional Commits
# Formatos aceitos:
# tipo(escopo): descrição
# tipo: descrição
regex="^(docs|feat|fix|test|refactor|chore|style|perf|build|ci)(\([a-z0-9_\-]+\))?!?: .+$"

if ! echo "$commit_msg" | grep -Eq "$regex"; then
    echo "❌ ERROR: Mensagem de commit inválida!"
    echo "--------------------------------------------------------"
    echo "A mensagem do commit deve seguir o padrão Conventional Commits:"
    echo "  <tipo>(<escopo>): <descrição sucinta em PT-BR>"
    echo ""
    echo "Tipos permitidos: docs, feat, fix, test, refactor, chore, style, perf, build, ci"
    echo "Exemplos válidos:"
    echo "  docs(spec): adicionar SPEC-001 cadastro de vendedores"
    echo "  feat(domain): criar entidade Produto e value objects"
    echo "  test(application): adicionar testes unitarios para CreateProdutoCommand"
    echo "  chore(hooks): configurar hook de validacao de commits"
    echo "--------------------------------------------------------"
    exit 1
fi

exit 0
