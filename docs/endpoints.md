# API Documentation

## Endpoints

### Listar Itens por Tipo de Bem

- **Rota:** `GET /listar-itens/:museuId/:ano/:tipo`
- **Middleware:** `userMiddleware`
- **Descrição:** Lista os itens de inventário por tipo de bem para um museu específico.
- **Parâmetros:**
  - `museuId`: ID do museu (string)
  - `ano`: Ano de referência (string)
  - `tipo`: Tipo do bem a ser listado (string)
- **Respostas:**
  - `200`: Itens listados com sucesso.
  - `401`: Não autorizado.
  - `500`: Erro interno.

---

### Criar Museu

- **Rota:** `POST /criarMuseu`
- **Middleware:** `adminMiddleware`
- **Descrição:** Cria um novo museu.
- **Parâmetros:**
  - **Body:**
    - `nome` (string): Nome do museu.
    - `endereco` (object):
      - `cidade` (string): Nome da cidade.
      - `UF` (string): Sigla do estado.
      - `logradouro` (string): Nome da rua.
      - `numero` (string): Número do endereço.
      - `complemento` (string): Complemento do endereço (opcional).
      - `bairro` (string): Bairro.
      - `cep` (string): CEP.
      - `municipio` (string): Nome do município.
- **Respostas:**
  - `200`: Museu criado com sucesso.
  - `400`: Erro na criação do museu.

---

### Listar Museus

- **Rota:** `GET /listarMuseus`
- **Middleware:** `adminMiddleware`
- **Descrição:** Lista todos os museus cadastrados no sistema.
- **Respostas:**
  - `200`: Lista de museus retornada com sucesso.
  - `500`: Erro ao listar museus.

---

### Listar Museus do Usuário

- **Rota:** `GET /museus`
- **Middleware:** `userMiddleware`
- **Descrição:** Lista os museus associados ao usuário autenticado.
- **Respostas:**
  - `200`: Lista de museus do usuário retornada com sucesso.
  - `500`: Erro ao listar museus do usuário.

---

### Enviar Declaração

- **Rota:** `POST /uploads/:museu/:anoDeclaracao`
- **Middlewares:** `uploadMiddleware`, `userMiddleware`
- **Descrição:** Envia uma declaração para o museu especificado.
- **Parâmetros:**
  - `museu` (string): ID do museu.
  - `anoDeclaracao` (string): Ano da declaração.
  - **Body (multipart/form-data):**
    - `arquivisticoArquivo` (binary): Arquivo arquivístico.
    - `bibliograficoArquivo` (binary): Arquivo bibliográfico.
    - `museologicoArquivo` (binary): Arquivo museológico.
    - `arquivistico` (string): Dados arquivísticos.
    - `bibliografico` (string): Dados bibliográficos.
    - `museologico` (string): Dados museológicos.
- **Respostas:**
  - `200`: Declaração enviada com sucesso.
  - `400`: Museu inválido.
  - `500`: Erro ao enviar arquivos para a declaração.

---

### Retificar Declaração

- **Rota:** `PUT /retificar/:museu/:anoDeclaracao/:idDeclaracao`
- **Middlewares:** `uploadMiddleware`, `userMiddleware`
- **Descrição:** Retifica uma declaração existente.
- **Parâmetros:**
  - `museu` (string): ID do museu.
  - `anoDeclaracao` (string): Ano da declaração.
  - `idDeclaracao` (string): ID da declaração a ser retificada.
  - **Body (multipart/form-data):**
    - `arquivisticoArquivo` (binary): Novo arquivo arquivístico.
    - `bibliograficoArquivo` (binary): Novo arquivo bibliográfico.
    - `museologicoArquivo` (binary): Novo arquivo museológico.
- **Respostas:**
  - `200`: Declaração retificada com sucesso.
  - `404`: Declaração não encontrada.
  - `500`: Erro ao retificar declaração.

---

### Baixar Arquivo de Declaração

- **Rota:** `GET /download/:museu/:anoDeclaracao/:tipoArquivo`
- **Middleware:** `userMiddleware`
- **Descrição:** Baixa um arquivo de declaração para o museu e ano especificados.
- **Parâmetros:**
  - `museu` (string): ID do museu.
  - `anoDeclaracao` (string): Ano da declaração.
  - `tipoArquivo` (string): Tipo de arquivo (arquivistico, bibliografico, museologico).
- **Respostas:**
  - `200`: Arquivo de declaração baixado com sucesso.
  - `404`: Declaração ou arquivo não encontrado.
  - `500`: Erro ao baixar arquivo da declaração.

---

### Obter Declarações do Usuário

- **Rota:** `GET /declaracoes`
- **Middleware:** `userMiddleware`
- **Descrição:** Obtém todas as declarações pertencentes ao usuário autenticado.
- **Respostas:**
  - `200`: Lista de todas as declarações do usuário obtida com sucesso.
  - `500`: Erro ao buscar declarações.

---

### Obter Declaração por ID

- **Rota:** `GET /declaracoes/:id`
- **Middleware:** `userMiddleware`
- **Descrição:** Obtém uma declaração específica pelo seu ID.
- **Parâmetros:**
  - `id` (string): ID da declaração.
- **Respostas:**
  - `200`: Declaração obtida com sucesso.
  - `404`: Declaração não encontrada.
  - `500`: Erro ao buscar declaração.

---

### Obter Declarações por Museu e Ano

- **Rota:** `GET /declaracoes/:museu/:anoDeclaracao`
- **Middleware:** `userMiddleware`
- **Descrição:** Obtém declarações de um museu específico para um ano específico.
- **Parâmetros:**
  - `museu` (string): ID do museu.
  - `anoDeclaracao` (string): Ano da declaração.
- **Respostas:**
  - `200`: Declarações obtidas com sucesso.
  - `404`: Declarações não encontradas.
  - `500`: Erro ao buscar declarações.

---

### Obter Declarações Filtradas

- **Rota:** `POST /declaracoesFiltradas`
- **Middleware:** `adminMiddleware`
- **Descrição:** Obtém declarações com base em filtros especificados.
- **Respostas:**
  - `200`: Declarações filtradas obtidas com sucesso.
  - `500`: Erro ao buscar declarações com filtros.

---

### Atualizar Status de Declaração

- **Rota:** `PUT /atualizarStatus/:id`
- **Middleware:** `adminMiddleware`
- **Descrição:** Atualiza o status de uma declaração.
- **Parâmetros:**
  - `id` (string): ID da declaração.
  - **Body:**
    - `status` (string): Novo status da declaração.
- **Respostas:**
  - `200`: Status atualizado com sucesso.
  - `404`: Declaração não encontrada.
  - `500`: Erro ao atualizar status.

---

### Obter Declarações Pendentes

- **Rota:** `GET /declaracoes/pendentes`
- **Middleware:** `adminMiddleware`
- **Descrição:** Obtém declarações pendentes para processamento.
- **Respostas:**
  - `200`: Declarações pendentes obtidas com sucesso.
  - `500`: Erro ao buscar declarações pendentes.

---

### Obter Declarações por Ano para o Dashboard

- **Rota:** `GET /dashboard/anoDeclaracao`
- **Middleware:** `adminMiddleware`
- **Descrição:** Obtém declarações organizadas por ano para exibição no dashboard.
- **Respostas:**
  - `200`: Declarações organizadas por ano obtidas com sucesso.
  - `500`: Erro ao organizar declarações por ano para o dashboard.

---

### Obter Declarações por Região para o Dashboard

- **Rota:** `GET /dashboard/regiao`
- **Middleware:** `adminMiddleware`
- **Descrição:** Obtém declarações organizadas por região para exibição no dashboard.
- **Respostas:**
  - `200`: Declarações organizadas por região obtidas com sucesso.
  - `500`: Erro ao organizar declarações por região para o dashboard.

---

### Obter Declarações por UF para o Dashboard

- **Rota:** `GET /dashboard/UF`
- **Middleware:** `adminMiddleware`
- **Descrição:** Obtém declarações organizadas por UF para exibição no dashboard.
- **Respostas:**
  - `200`: Declarações organizadas por UF obtidas com sucesso.
  - `500`: Erro ao organizar declarações por UF para o dashboard.

---

### Obter Declarações por Status para o Dashboard

- **Rota:** `GET /dashboard/status`
- **Middleware:** `adminMiddleware`
- **Descrição:** Obtém declarações organizadas por status para exibição no dashboard.
- **Respostas:**
  - `200`: Declarações organizadas por status obtidas com sucesso.
  - `500`: Erro ao organizar declarações por status para o dashboard.

---

### Gerar Recibo

- **Rota:** `GET /recibo/:idDeclaracao`
- **Middleware:** `userMiddleware`
- **Descrição:** Gera um recibo para a declaração especificada.
- **Parâmetros:**
  - `idDeclaracao` (string): ID da declaração.
- **Respostas:**
  - `200`: Recibo gerado com sucesso.
  - `400`: ID inválido.
  - `500`: Erro ao gerar o recibo.

---

### Login de Usuário

- **Rota:** `POST /auth/login`
- **Middleware:** `limiter`
- **Descrição:** Realiza login de usuário.
- **Parâmetros:**
  - `email` (string): Email do usuário.
  - `password` (string): Senha do usuário.
  - **Query:**
    - `admin` (boolean): Flag para login como administrador (opcional).
- **Respostas:**
  - `200`: Login bem-sucedido.
  - `401`: Credenciais inválidas.

---

### Atualizar Token de Acesso

- **Rota:** `POST /auth/refresh`
- **Descrição:** Atualiza o token de acesso.
- **Respostas:**
  - `200`: Token atualizado com sucesso.
  - `401`: Falha ao atualizar o token.
