# Tecnologias uilizadas no backend do projeto INBCM

O backend do projeto INBCM, denominado inbcm-backend, utiliza uma ampla gama de tecnologias modernas para criar uma plataforma robusta e segura. Abaixo está um resumo das principais tecnologias e bibliotecas utilizadas, divididas em categorias de acordo com sua função no projeto.

## Frameworks e bibliotecas principais

- **Express**: Framework web para Node.js que facilita a criação de servidores web e APIs.
- **Mongoose**: Biblioteca para modelagem de dados MongoDB que proporciona uma solução baseada em esquemas para modelar os dados da aplicação.
- **Body-parser, Cookie-parser, Multer**: Utilitários para parsing de corpo de requisição, cookies e handling de uploads de arquivos, respectivamente.

## Segurança

- **Helmet**: Conjunto de middlewares para Express que configura cabeçalhos HTTP para proteger contra algumas vulnerabilidades conhecidas.
- **Dotenv e Dotenv-expand**: Gerenciam a configuração de variáveis de ambiente do projeto.
- **Express-rate-limit**: Middleware para limitar requisições repetidas a APIs públicas e/ou endpoints.
- **Jsonwebtoken**: Implementação de JSON Web Tokens para autenticação e transmissão segura de informações.

## Validação e documentação

- **Zod**: Biblioteca de parsing e validação para TypeScript que oferece segurança de tipo em runtime.
- **Swagger-jsdoc e Swagger-ui-express**: Ferramentas para documentar a API utilizando Swagger, facilitando a geração e visualização da documentação da API.

## Desenvolvimento e testes

- **Jest, @jest/globals, jest-mock, ts-jest**: Ferramentas de teste para JavaScript/TypeScript que permitem a escrita de testes unitários e de integração.
- **Supertest**: Biblioteca para testar APIs HTTP ao simular requisições.
- **Nodemon e sucrase**: Ferramentas que auxiliam no desenvolvimento, reiniciando automaticamente o servidor durante o desenvolvimento e compilando TypeScript para JavaScript.

## Performance e otimização

- **Compression**: Middleware que compacta as respostas do servidor, reduzindo o tempo de transmissão.
- **Msgpackr**: Biblioteca que oferece serialização e deserialização eficiente de dados.

## Utilitários e helpers

- **Date-fns**: Biblioteca para manipulação de datas de forma simples e consistente.
- **Inquirer**: Ferramenta para criação de interfaces de linha de comando interativas.
- **Pdfmake**: Biblioteca para geração de documentos PDF a partir do servidor.

## DevOps e Manutenção de Código

- **Eslint, Prettier, Husky, Lint-staged, Commitizen**: Conjunto de ferramentas para garantir a qualidade do código, formatando e validando o código conforme as melhores práticas antes de commits e durante o desenvolvimento.

## Integração e Deployment

- **Docker, Concurrently**: Ferramentas para facilitar o deployment e a execução de múltiplas tarefas em paralelo, como subir containers Docker e executar o servidor simultaneamente.

Este conjunto de tecnologias demonstra uma infraestrutura bem pensada e projetada para escalabilidade, segurança e manutenibilidade, apoiando o projeto INBCM no manejo eficiente de informações culturais e museológicas.