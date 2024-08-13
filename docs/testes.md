
# Testes

## Ambiente de Testes

Para configurar o ambiente de testes, este projeto utiliza o Jest, um framework de testes em JavaScript. O Jest é configurado para trabalhar com TypeScript e Express, permitindo testar controladores, modelos e outros componentes do sistema.

### Passos para configurar o ambiente de testes:

#### Instalação das Dependências:
Certifique-se de que as dependências do Jest e os tipos para TypeScript estão instalados no seu projeto. Você pode instalar as dependências necessárias usando o npm ou yarn:

```bash
npm install --save-dev jest @types/jest ts-jest
```

#### Configuração do Jest:
Adicione uma configuração básica do Jest no seu `package.json` ou crie um arquivo `jest.config.js` para definir as opções do Jest, incluindo o uso do `ts-jest` para compilar arquivos TypeScript:

```json
{
  "jest": {
    "transform": {
      "^.+\.tsx?$": "ts-jest"
    },
    "testEnvironment": "node",
    "moduleFileExtensions": ["ts", "tsx", "js", "jsx", "json", "node"]
  }
}
```

#### Scripts de Teste:
Adicione um script de teste no seu `package.json` para rodar os testes usando Jest:

```json
{
  "scripts": {
    "test": "jest"
  }
}
```

## Tipos de Testes

Neste projeto, os testes são classificados como **testes unitários**. Os testes unitários são escritos para verificar o comportamento de funções e métodos individuais. No arquivo fornecido, o teste cobre o controlador `MuseuController` para garantir que ele responde corretamente a uma solicitação de listagem de museus.

### Exemplo de teste unitário:

```typescript
describe('MuseuController', () => {
  describe('listarMuseus', () => {
    it('deve retornar status 200', async () => {
      const req = {} as Request;
      const res = {
        status: jest.fn().mockReturnThis(),
        json: jest.fn()
      } as unknown as Response;

      await MuseuController.listarMuseus(req, res);

      expect(res.status).toHaveBeenCalledWith(200);
    });
  });
});
```

Neste exemplo, o teste verifica se o método `listarMuseus` do `MuseuController` retorna um status 200 quando chamado.

## Execução de Testes

Para rodar os testes, utilize o seguinte comando no terminal:

```bash
npm test
```

Isso executará o Jest, que irá procurar por arquivos de teste e executar os testes definidos.

## Cobertura de Testes

A cobertura de testes mede quanto do código está sendo testado pelos testes escritos. Para gerar um relatório de cobertura de testes usando Jest, adicione a flag `--coverage` ao comando de teste:

```bash
npm test -- --coverage
```

Após a execução, um relatório de cobertura será gerado na pasta `coverage/`. Este relatório mostra a porcentagem de linhas, funções, e branches que foram cobertas pelos testes, permitindo identificar áreas do código que podem não estar sendo testadas adequadamente.
