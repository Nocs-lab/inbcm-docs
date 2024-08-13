
# Guia de contribuição

Obrigado por considerar contribuir para o projeto INBCM! Este guia irá ajudá-lo a contribuir de forma eficiente e a seguir as melhores práticas para garantir a qualidade do código e a facilidade de colaboração.

## Boas práticas de codificação

Para manter um código limpo, organizado e fácil de manter, siga estas boas práticas de codificação:

### Estilo de código
- **Indentação**: Use 2 espaços para indentação de código.
- **Nomes de variáveis e funções**: Utilize o padrão camelCase para nomes de variáveis e funções (ex.: `minhaVariavel`, `minhaFuncao`).
- **Constantes**: Use o padrão UPPER_SNAKE_CASE para nomes de constantes (ex.: `MINHA_CONSTANTE`).
- **Comentários**: Comente o código de forma clara e objetiva, explicando o que cada parte do código faz. Use comentários `//` para linhas de código e `/* */` para blocos de código.
- **Arquivos**: Mantenha os arquivos organizados em pastas de acordo com suas funcionalidades (ex.: controllers, services, models).
- **Linting**: Use ESLint para verificar e aplicar automaticamente as regras de estilo. Certifique-se de que seu código não apresente erros de linting antes de fazer commits.

### Convenções
- **Commits**: Faça commits pequenos e significativos, com mensagens claras e descritivas no presente do indicativo (ex.: "Adiciona funcionalidade X", "Corrige bug em Y").
- **Branches**: Crie branches para novas funcionalidades ou correções de bugs com nomes descritivos (ex.: `feature/adicionar-autenticacao`, `fix/corrigir-erro-login`).

## Como reportar issues

Se você encontrou um bug ou tem uma sugestão para melhoria, siga as etapas abaixo para reportar uma issue:

1. **Verifique se já existe uma issue aberta**: Antes de abrir uma nova issue, verifique se alguém já reportou o problema ou sugeriu a melhoria.
2. **Descreva o problema claramente**: Se for uma issue nova, forneça uma descrição detalhada do problema. Inclua passos para reproduzir o problema, qual comportamento você esperava, e o que ocorreu em vez disso.
3. **Forneça o ambiente de execução**: Informe o sistema operacional, navegador, e outras especificidades que possam ajudar na resolução do problema.
4. **Adicione labels**: Ao abrir uma issue, use labels para categorizar (ex.: bug, enhancement, question).
5. **Assigne a issue**: Se você estiver disposto a resolver a issue, atribua-se a ela. Caso contrário, deixe-a sem atribuição.

## Fluxo de trabalho para contribuição

Siga as etapas abaixo para contribuir com o projeto através de pull requests (PRs):

1. **Fork o repositório**: Comece forkeando o repositório [inbcm-backend](https://github.com/Nocs-lab/inbcm-backend.git) para sua conta GitHub.
2. **Clone o repositório**: Clone seu fork localmente para começar a trabalhar.

   ```bash
   git clone https://github.com/seu-usuario/inbcm-backend.git
   cd inbcm-backend
   ```

3. **Crie uma Branch**: Crie uma nova branch para sua funcionalidade ou correção.

   ```bash
   git checkout -b feature/nome-da-sua-feature
   ```

4. **Implemente sua Mudança**: Faça as alterações necessárias no código. Certifique-se de seguir as boas práticas de codificação mencionadas acima.

5. **Adicione Testes**: Se possível, adicione testes para cobrir as mudanças feitas. Isso ajuda a garantir que a nova funcionalidade não quebre o código existente.

6. **Faça Commit e Push**: Após fazer suas alterações, faça commit das mesmas e envie para o seu fork no GitHub.

   ```bash
   git add .
   git commit -m "Descrição clara da mudança"
   git push origin feature/nome-da-sua-feature
   ```

7. **Abra um Pull Request (PR)**: No repositório original (upstream), abra um PR da sua branch para a branch `main` ou `develop`. Certifique-se de que o PR tenha uma descrição clara do que foi feito e, se possível, faça referência às issues relacionadas.

8. **Aguarde Revisão**: Um dos mantenedores do projeto revisará seu PR. Esteja preparado para fazer alterações, se necessário.

9. **Integração**: Assim que seu PR for aprovado, ele será integrado ao repositório principal. Parabéns, você contribuiu para o projeto INBCM!

## Dúvidas?

Se tiver alguma dúvida durante o processo de contribuição, sinta-se à vontade para abrir uma issue ou entrar em contato com os mantenedores do projeto.

