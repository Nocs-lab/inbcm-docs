# Guia de desenvolvimento do backend do projeto INBCM

Este guia detalhado fornece informações essenciais sobre a configuração e o desenvolvimento do backend para o projeto INBCM. É destinado a auxiliar tanto desenvolvedores atuais quanto novos colaboradores no entendimento da arquitetura do sistema, bem como na realização de tarefas de desenvolvimento e manutenção.

## Configuração do ambiente de desenvolvimento

Para configurar o ambiente de desenvolvimento e iniciar o servidor de desenvolvimento, siga estes passos:

### Clonar o repositório

```bash
git clone https://github.com/Nocs-lab/inbcm-backend.git
```
### Criar o arquivo .env

Na pasta do projeto, caso ainda não exista, crie um arquivo .env e adicione as variáveis de ambiente conforme listado no final deste documento.

### Iniciar os containers docker para desenvolvimento

```bash
npm run start:docker:dev
```

### Iniciar o servidor em ambiente de desenvolvimento:

```bash
npm run dev
```

### Criar pasta de uploads

Caso ainda não exista, crie manualmente uma pasta uploads na raiz do projeto para armazenar arquivos recebidos pelo servidor.

**Observação**: A solução mais comum para o problema de escalabilidade de uploads de arquivos é utilizar um serviço de armazenamento em nuvem, ou seja, a abordagem de salvar arquivos diretamente no sistema de arquivos local do servidor não é escalável, especialmente quando você começa a lidar com um volume maior de uploads.

## Estrutura de pastas e arquivos principais

### A organização de pastas do projeto 

```bash
/backend-inbcm
    /node_modules
    /src
        /controllers        
        /models
        /routes
        /middlewares
        /configs
        /services
        /scripts
    /tests
    .env
    .gitignore
    config.ts
    package.json
    README.md
```

### compose.dev.yaml
Este arquivo Docker Compose define a configuração para os serviços de desenvolvimento, incluindo MongoDB e Mongo Express:

```yaml
services:
  mongo:
    ports:
      - "64000:27017"

  mongo-express:
    image: mongo-express
    ports:
      - 8081:8081
    environment:
      ME_CONFIG_BASICAUTH_USERNAME: admin
      ME_CONFIG_BASICAUTH_PASSWORD: admin
      ME_CONFIG_MONGODB_PORT: 27017
      ME_CONFIG_MONGODB_ADMINUSERNAME: ${DB_USER}
      ME_CONFIG_MONGODB_ADMINPASSWORD: ${DB_PASS}
      ME_CONFIG_MONGODB_SERVER: mongo
    depends_on:
      - mongo
```

## package.json
Define as dependências, scripts e configurações do projeto Node.js.
```yaml
{
  "name": "inbcm-uploud-planilha-mongo",
  "version": "1.0.0",
  "description": "",
  "main": "server.ts",
  "scripts": {
    "dev": "nodemon server.ts",
    "start:docker:dev": "docker compose -f compose.yaml -f compose.dev.yaml up",
    "build": "sucrase --transforms typescript,imports -d dist .",
    "start": "sucrase-node server.ts",
    "create:admin-user": "sucrase-node scripts/createAdminUser.ts",
    "create:data": "sucrase-node scripts/generateMockData.ts",
    "list:users": "sucrase-node scripts/listUsers.ts"
  },
  "keywords": [],
  "author": "",
  "license": "ISC",
  "dependencies": {
    "@faker-js/faker": "^8.4.1",
    "@node-rs/argon2": "^1.8.3",
    "amqplib": "^0.10.4",
    "compression": "^1.7.4",
    "cookie-parser": "^1.4.6",
    "crypto": "^1.0.1",
    "date-fns": "^3.6.0",
    "dotenv": "^16.4.5",
    "dotenv-expand": "^11.0.6",
    "ejs": "^3.1.10",
    "express": "^4.19.2",
    "express-async-errors": "^3.1.1",
    "fastest-validator": "^1.18.0",
    "helmet": "^7.1.0",
    "html-pdf": "^3.0.1",
    "inquirer": "^9.2.22",
    "jsonwebtoken": "^9.0.2",
    "mongoose": "^8.4.0",
    "mongoose-sequence": "^6.0.1",
    "morgan": "^1.10.0",
    "msgpackr": "^1.10.2",
    "multer": "1.4.5-lts.1",
    "pdfkit": "^0.15.0",
    "puppeteer": "^22.10.0",
    "sucrase": "^3.35.0",
    "uuidv4": "^6.2.13",
    "xlsx": "^0.18.5",
    "zod": "^3.23.8"
  },
  "devDependencies": {
    "@eslint/eslintrc": "^3.1.0",
    "@eslint/js": "^9.3.0",
    "@types/amqplib": "^0.10.5",
    "@types/compression": "^1.7.5",
    "@types/cookie-parser": "^1.4.7",
    "@types/cors": "^2.8.17",
    "@types/ejs": "^3.1.5",
    "@types/express": "^4.17.21",
    "@types/html-pdf": "^3.0.3",
    "@types/jsonwebtoken": "^9.0.6",
    "@types/morgan": "^1.9.9",
    "@types/multer": "^1.4.11",
    "@types/node": "^20.12.12",
    "@types/pdfkit": "^0.13.4",
    "@typescript-eslint/eslint-plugin": "^6.21.0",
    "commitizen": "^4.3.0",
    "concurrently": "^8.2.2",
    "cz-conventional-changelog": "^3.3.0",
    "eslint": "^8.57.0",
    "eslint-config-prettier": "^9.1.0",
    "eslint-config-standard-with-typescript": "^43.0.1",
    "eslint-plugin-import": "^2.29.1",
    "eslint-plugin-n": "^16.6.2",
    "eslint-plugin-prettier": "^5.1.3",
    "eslint-plugin-promise": "^6.2.0",
    "globals": "^15.3.0",
    "husky": "^9.0.11",
    "lint-staged": "^15.2.5",
    "nodemon": "^3.1.1",
    "prettier": "3.2.5",
    "ts-node": "^10.9.2",
    "typescript": "^5.4.5"
  },
  "lint-staged": {
    "*.{ts,js}": "eslint --cache --fix"
  },
  "config": {
    "commitizen": {
      "path": "./node_modules/cz-conventional-changelog"
    }
  }
}

```

Os scripts definidos no `package.json` facilitam a execução de tarefas comuns de desenvolvimento e operação diretamente através do npm. Aqui estão alguns dos scripts mais importantes:


* `dev`: Inicia o servidor usando Nodemon para reinício automático.
* `start:docker:dev`: Levanta os containers Docker necessários para o ambiente de desenvolvimento.
* `build`: Transpila o código TypeScript para JavaScript usando Sucrase, uma ferramenta alternativa ao Babel que é mais rápida para projetos TypeScript. O código resultante é colocado no diretório `dist`.
* `create:admin-user`: Script para criar um usuário administrador no sistema.
* `start`: Executa o servidor diretamente do código TypeScript, permitindo a execução em produção sem necessidade de uma etapa explícita de transpilação.
* `create:data`: Script para gerar dados de mock para desenvolvimento.

### Dependências

As dependências são bibliotecas e frameworks dos quais o projeto depende para funcionar corretamente. Algumas das principais dependências incluem:

* `express`: Framework web robusto para Node.js.
* `mongoose`: Biblioteca de modelagem de objetos MongoDB para Node.js.
* `dotenv`: Módulo que carrega variáveis de ambiente de um arquivo .env para process.env.
* `jsonwebtoken`: Implementação de JSON Web Tokens para segurança e autenticação.
* `helmet`: Ajuda a proteger aplicativos Express definindo vários cabeçalhos HTTP.

### DevDependencies

As devDependencies são utilizadas apenas durante o desenvolvimento e não são necessárias em produção. Incluem ferramentas como:

* `nodemon`: Monitora mudanças nos arquivos do projeto e reinicia o servidor automaticamente.
* `eslint`: Ferramenta de linting para identificar padrões problemáticos encontrados no código TypeScript/JavaScript.
* `typescript`: Adiciona tipagem estática ao JavaScript para melhorar a confiabilidade e a manutenibilidade do código.

## .env

Este arquivo armazena variáveis de ambiente cruciais para a configuração do sistema, incluindo credenciais e URLs para diversos serviços:

```plaintext
DB_USER="root"
DB_PASS="#######"
KEYCLOAK_DB_PASSWORD="########"
DB_URL="mongodb://${DB_USER}:${DB_PASS}@localhost:64000/INBCM?authSource=admin"
QUEUE_URL="amqp://guest:guest@localhost"
JWT_SECRET="#####"
PUBLIC_SITE_URL="https://localhost:5174/"
ADMIN_SITE_URL="https://localhost:5173/"
```

## Estrutura de arquivos e códigos importantes

### ./server.ts
Este arquivo configura e inicia o servidor Express. É o ponto de entrada do backend.

```typescript
import "./config"
import app from "./app";
import conn from "./db/conn";

conn();

const PORT = parseInt(process.env.PORT || "3000");
app.listen(PORT, () => console.log(`Servidor funcionando na porta ${PORT}`));
```

#### Explicação:

* `import "./config"`: Importa as configurações de ambiente.
* `import app from "./app"`: Importa a configuração do aplicativo Express.
* `import conn from "./db/conn"`: Importa a função de conexão ao banco de dados.
* `conn()`: Invoca a conexão com o banco de dados.
* `app.listen(...)`: Inicia o servidor na porta especificada, com feedback no console.

### ./app.ts
Configura o middleware e as rotas do aplicativo Express.

```typescript
import express, { type ErrorRequestHandler } from "express";
import helmet from "helmet";
import morgan from "morgan";
import cookieParser from "cookie-parser";
import compression from "compression"
import routes from "./routes/routes";
import config from "./config"

const app = express();
app.use(helmet());
app.use(morgan("dev"));
app.use(express.json());
app.use(cookieParser(config.JWT_SECRET));
app.use(compression());
app.use("/api", routes);

const errorHandling: ErrorRequestHandler = (err, _req, res, _next) => {
  res.status(500).json({ msg: err.message, success: false });
};
app.use(errorHandling);

export default app;
```

#### Explicação:

* Middleware como `helmet` e `compression` são usados para segurança e otimização.
* `morgan` é utilizado para logging.
* `cookieParser` é utilizado para analisar cookies com um segredo especificado.
* `/api` é o ponto de entrada base para as rotas.
* `errorHandling` captura e trata erros não capturados nas rotas.

#### ./db/conn.ts

Estabelece conexão com o MongoDB usando Mongoose.

```typescript
import mongoose from "mongoose";
import config from "../config"

async function main() {
  try {
    mongoose.set("strictQuery", true);
    await mongoose.connect(config.DB_URL!);
    console.log("Conectado ao MongoDB!");
  } catch (error) {
    console.log(`Erro: ${error}`);
  }
}

export default main;
```

#### Explicação:

* Configura o Mongoose para uso de consultas estritas.
* Conecta-se ao banco de dados usando a URL definida no arquivo de configuração.

#### ./controllers/DeclaracaoController.ts
Gerencia operações relacionadas às declarações, incluindo CRUD e lógicas específicas para manipulação de dados das declarações.

```typescript
class DeclaracaoController {
  async getDeclaracoesPorStatus(req: Request, res: Response) {
    const declaracoes = await this.declaracaoService.declaracoesPorStatus();
    return res.status(200).json(declaracoes);
  }
  ...
}
```

#### Explicação:

* `getDeclaracoesPorStatus`: Busca declarações por status usando um serviço dedicado e retorna as informações em formato JSON.


## Como adicionar novos modelos e controladores?

### Criando um novo modelo

Modelos no Express.js com Mongoose são usados para definir a estrutura dos dados que serão armazenados no MongoDB. Aqui estão os passos para criar um novo modelo:

**Passo 1**: Primeiramente, crie um novo arquivo na pasta models, por exemplo, NovoItem.ts. Dentro deste arquivo, você definirá o esquema do modelo utilizando o Mongoose.

```typescript
import mongoose from 'mongoose';

const novoItemSchema = new mongoose.Schema({
    nome: { type: String, required: true },
    descricao: String,
    preco: Number,
    disponibilidade: { type: Boolean, default: true }
});

const NovoItem = mongoose.model('NovoItem', novoItemSchema);

export default NovoItem;
```

Este esquema define um novo item com propriedades como nome, descrição, preço e disponibilidade.

**Passo 2**: Após criar o modelo, você pode usá-lo em qualquer parte do seu backend para interagir com a coleção NovoItem no banco de dados.

### Criando um novo controlador

Controladores são usados para definir a lógica de negócios do aplicativo. Eles interagem com os modelos para buscar, criar, atualizar ou deletar dados.

**Passo 1**: Criar o Arquivo do Controlador
Crie um arquivo na pasta controllers, por exemplo, NovoItemController.ts. Este arquivo conterá toda a lógica para manipular os dados dos novos itens.

```typescript
import { Request, Response } from 'express';
import NovoItem from '../models/NovoItem';

class NovoItemController {
    async criarNovoItem(req: Request, res: Response) {
        try {
            const novoItem = new NovoItem(req.body);
            await novoItem.save();
            res.status(201).send(novoItem);
        } catch (error) {
            res.status(400).json({ error: error.message });
        }
    }

    // Adicione mais métodos conforme necessário
}

export default new NovoItemController();
```

Este controlador inclui um método para criar novos itens. Métodos adicionais para buscar, atualizar e deletar itens podem ser adicionados seguindo uma estrutura similar.

**Passo 2**: Conectar o Controlador às Rotas
Para que as ações do controlador sejam acessíveis via HTTP, você precisa definir rotas que estarão associadas a esses métodos. Edite ou crie um arquivo de rotas, por exemplo, em `routes/novoItemRoutes.ts`.

```typescript
import express from 'express';
import novoItemController from '../controllers/NovoItemController';

const router = express.Router();

router.post('/novoItem', novoItemController.criarNovoItem);
// Adicionar mais rotas conforme necessário

export default router;
```

**Passo 3**: Registrar as Rotas
Finalmente, certifique-se de que as novas rotas são importadas e utilizadas no arquivo principal de rotas ou diretamente no arquivo app.ts.

```typescript
import novoItemRoutes from './routes/novoItemRoutes';
app.use('/api', novoItemRoutes);
```
Lembre-se de testar cada novo modelo e controlador para garantir que eles funcionem como esperado. Adicionar testes unitários e de integração pode ajudar a manter a qualidade e a estabilidade do aplicativo.

## Considerações finais

Este guia fornece uma visão abrangente da estrutura e dos procedimentos para o desenvolvimento do backend do projeto INBCM. A documentação deve ser atualizada regularmente para refletir quaisquer mudanças no projeto, garantindo que todos os desenvolvedores tenham acesso às informações mais atuais para sua atuação efetiva.