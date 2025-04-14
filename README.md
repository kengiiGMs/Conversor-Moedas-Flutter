# Projeto Flutter 03 - Conversor de moedas
Construindo um conversor de valores de moedas (Real | Dólar | Iene)
- Três TextFields (um para cada moeda), que permitem ao usuário inserir valores manualmente, atualizando automaticamente os demais campos de acordo com o valor inserido.

<div align="center">

![ProjectFlutter3](https://github.com/user-attachments/assets/eeca9e4d-439a-4e5e-b19e-bd5821703850)

   
</div>

## Objetivos 
Projeto com o objetivo de entender a estrutura de consumo de APIs externas.

### Conceitos aprendidos 
- DotEnv
- Future | FutureBuilder
- Snapshot
- Http Reponse/Get
- CircularProgressIndicator

### Rodar o projeto 
1. **SDK do Flutter:**
   - Certifique-se de ter o SDK do Flutter instalado e configurado corretamente em seu ambiente de desenvolvimento.

2. **Variáveis de Ambiente:**
    - Crie a pasta `assets` na raiz do projeto e adicione o arquivo `.env`.
    - Dentro do arquivo `.env`, declare a variável `API_URL_KEY` com a URL da sua API de moedas. Você pode encontrá-la e gerá-la em: [https://hgbrasil.com](https://hgbrasil.com).

   <br>

<b>Comandos:</b> 
Instalar dependências do projeto:

``` 

flutter pub get 

``` 

Conectar com o dispositivo e rodar o projeto:

``` 

flutter run

```
