# Orientações para o envio de código em um repositório
## Qualidade do código
* Padronização de Estilo: Use um guia de estilo específico para a linguagem em que está trabalhando (por exemplo, PEP 8 para Python, StandardJS para JavaScript). Utilize ferramentas de formatação automática como Prettier, ESLint, ou Black para garantir a consistência.
* Comentários: Comente seu código onde necessário, explicando o propósito e a lógica complexa. Evite comentários óbvios e mantenha-os atualizados.
* Revisão de Código: Sempre faça revisão de código antes do merge. Utilize pull requests para permitir que outros revisem seu código e forneçam feedback.
* Testes Automatizados: Inclua testes unitários, de integração e, se possível, de ponta a ponta. Use frameworks de teste apropriados como JUnit, pytest, ou Jest. Garanta que todos os testes passem antes de enviar o código.
* Documentação: Documente funções, classes e módulos. Forneça um README atualizado explicando como o código funciona, como configurá-lo e como executá-lo.
* Refatoração: Refatore código regularmente para melhorar a estrutura e a eficiência. Não adie a limpeza de código técnico, pois isso pode levar a problemas maiores no futuro.
## Clareza do código
* Nomes Descritivos: Use nomes de variáveis, funções e classes que sejam descritivos e que façam sentido no contexto. Evite abreviações excessivas e nomes genéricos.
* Simplicidade: Mantenha o código o mais simples possível. Evite complexidade desnecessária e divida tarefas grandes em funções ou classes menores e mais manejáveis.
* Estrutura Clara: Organize o código de forma lógica e consistente. Siga uma estrutura de projeto que faça sentido para a equipe e para o tipo de projeto.
* Modularidade: Escreva código modular. Funções e classes devem ser projetadas para fazer uma coisa bem feita e ser reutilizáveis em diferentes contextos.
## Segurança do código
* Validação e Saneamento de Entrada: Sempre valide e sanitize entradas do usuário para evitar vulnerabilidades como SQL injection e Cross-Site Scripting (XSS).
* Gerenciamento de Dependências: Use dependências de fontes confiáveis e mantenha-as atualizadas. Verifique regularmente por vulnerabilidades conhecidas nas dependências.
* Gerenciamento de Segredos: Nunca coloque segredos, como chaves de API ou credenciais, diretamente no código. Utilize variáveis de ambiente ou gerenciadores de segredos.
* Autenticação e Autorização: Implemente e verifique autenticação e autorização adequadas para proteger recursos e dados sensíveis.
* Tratamento de Erros: Trate exceções de maneira adequada e nunca exponha mensagens de erro sensíveis para o usuário final. Log de erros deve ser implementado de forma que seja útil para debugging e não comprometa a segurança.
* Auditoria e Log: Implemente auditoria e log para monitorar atividades suspeitas e ajudar na investigação de incidentes.
## Processo de Envio de Código
* Commit Messages: Escreva mensagens de commit claras e significativas. Cada commit deve abordar uma mudança lógica específica e a mensagem deve explicar o "porquê" da mudança.
* Branching e Merging: Use uma estratégia de branching clara (por exemplo, Git Flow). Garanta que o código na branch de desenvolvimento esteja sempre em um estado que pode ser integrado na branch principal.
* Revisão de Código: Utilize pull requests para submeter mudanças. Cada pull request deve ser revisado por um ou mais membros da equipe antes de ser mesclado.
* Automatização: Configure pipelines de CI/CD para automatizar a construção, os testes e a implantação do código. Isso ajuda a detectar problemas mais cedo e facilita a entrega contínua.