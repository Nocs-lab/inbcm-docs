# Boas práticas para API REST no Projeto INBCM

## Introdução

Este documento destina-se a orientar desenvolvedores e arquitetos de software envolvidos no projeto INBCM na criação e manutenção de APIs REST. As APIs REST são fundamentais para a integração de diferentes sistemas e serviços, oferecendo uma interface clara e eficiente para o acesso a recursos via HTTP. A adesão às boas práticas descritas aqui visa garantir que as APIs sejam seguras, escaláveis, e fáceis de usar.

## Conceitos básicos

### Path

O "path" é a parte da URL que identifica o recurso na API. Ele é fundamental para o roteamento das requisições até os controladores apropriados. Por exemplo, na URL `https://api.inbcm.com.br/users`, o path é `/users`.

### Resources

"Resources" ou recursos representam entidades ou objetos dentro do domínio da aplicação. Uma API REST deve ser projetada em torno de recursos, que são manipulados através de métodos HTTP. Por exemplo, um recurso pode ser um usuário, acessado via `GET /users/{id}` para obter informações desse usuário.

### Query string

A "query string" é utilizada para passar parâmetros adicionais para a API, como filtros, ordenação ou paginação. Esses parâmetros são adicionados à URL após um `?`. Por exemplo, `GET /users?active=true&sort=asc` filtra por usuários ativos e os ordena em ordem ascendente.

## Boas práticas em APIs REST

### URLs claras e intuitivas

Utilize URLs que sejam intuitivas e fáceis de entender, o que facilita a compreensão e o uso da API. Prefira o uso de substantivos e mantenha um padrão consistente em toda a API.

### Padronização de métodos HTTP

Use os métodos HTTP de maneira padronizada:
- `GET` para buscar dados.
- `POST` para criar novos recursos.
- `PUT` para atualizar recursos inteiramente.
- `PATCH` para atualizações parciais.
- `DELETE` para excluir recursos.

### Códigos de status HTTP apropriados

Empregue códigos de status HTTP para comunicar o resultado das operações claramente:
### Códigos de sucesso (2xx)

`200 OK`: Indica que a requisição foi bem-sucedida. É o código mais comum para uma resposta HTTP bem-sucedida, especialmente após um GET.

`201 Created`: Usado quando um novo recurso é criado com sucesso, típico após um POST.

`202 Accepted`: Indica que a requisição foi aceita para processamento, mas o processamento ainda não foi concluído. Comum em operações que são processadas de forma assíncrona.

`204 No Content`: Resposta para uma operação bem-sucedida que não retorna dados, como após um DELETE.

### Códigos de redirecionamento (3xx)

`301 Moved Permanently`: Este e outros códigos de redirecionamento são menos comuns em APIs mas úteis para indicar que um recurso foi movido permanentemente para uma nova URL.

`303 See Other`: Indica que o recurso pode ser encontrado em outra URI usando o método GET.

### Códigos de erro do cliente (4xx)

`400 Bad Request`: Indica que o servidor não pode ou não vai processar a requisição devido a algo que foi percebido como um erro do cliente (e.g., formato de requisição inválido).

`401 Unauthorized`: Usado quando a autenticação é necessária e falhou ou ainda não foi fornecida.

`403 Forbidden`: O servidor entendeu a requisição, mas se recusa a autorizá-la. Diferente do 401, nesse caso a autenticação não faria diferença.

`404 Not Found`: O servidor não encontrou nada que corresponda ao URI da requisição.

`405 Method Not Allowed`: Um método solicitado é conhecido pelo servidor, mas foi desativado e não pode ser usado.

`409 Conflict`: Indica que a requisição não pôde ser completada devido a um conflito com o estado atual do recurso.

### Códigos de erro do servidor (5xx)

`500 Internal Server Error`: Um erro genérico que indica que o servidor encontrou uma condição inesperada.

`501 Not Implemented`: O servidor não suporta a funcionalidade necessária para atender a requisição.

`503 Service Unavailable`: O servidor está incapaz de lidar com a requisição devido a uma manutenção temporária ou sobrecarga.

### Suporte para filtragem, paginação e ordenação

Forneça mecanismos para filtragem, paginação e ordenação dos dados, o que melhora a usabilidade e eficiência da API especialmente em conjuntos de dados grandes.

### Segurança e autenticação

Garanta a segurança da API implementando autenticação e autorização adequadas. Utilize protocolos como OAuth, tokens JWT, e sempre use HTTPS.

### Documentação clara e abrangente

Forneça uma documentação detalhada e acessível para a API, incluindo informações sobre endpoints, parâmetros, formatos de resposta e exemplos de uso.

### Versionamento da API

Implemente o versionamento da API para permitir a evolução da interface sem impactar negativamente os clientes existentes. Utilize URLs versionadas, como `/api/v1`.

### Negociação de conteúdo

Suporte diferentes formatos de resposta, como JSON e XML, utilizando cabeçalhos HTTP para negociação de conteúdo (`Accept` e `Content-Type`).

## Conclusão

Seguindo estas práticas recomendadas, a API REST do projeto INBCM será robusta, segura e fácil de integrar, promovendo uma arquitetura escalável e flexível. A adesão a esses princípios assegura que nossa API atenda às necessidades dos desenvolvedores e contribua positivamente para o sucesso do projeto.
