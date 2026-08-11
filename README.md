# 🌐 Sistema de Tradução

Projeto desenvolvido em Ruby com o objetivo de criar um sistema capaz de traduzir frases entre idiomas utilizando uma API de tradução.

Este projeto reúne diversos conceitos estudados durante o aprendizado de Ruby, como Programação Orientada a Objetos, requisições web, JSON, leitura e escrita de arquivos, entrada de dados pelo usuário e formatação de data e hora.

## 📌 Funcionalidades

- Solicita ao usuário uma frase para tradução;
- Permite informar o idioma de origem e o idioma de destino;
- Realiza a tradução através de uma requisição HTTP;
- Trabalha com os dados retornados pela API em formato JSON;
- Exibe a tradução realizada;
- Salva o resultado da tradução em um arquivo `.txt`;
- Utiliza data e hora para gerar o nome do arquivo;
- Permite realizar várias traduções sem precisar reiniciar o programa.

## 🛠️ Tecnologias e conceitos utilizados

- Ruby
- Programação Orientada a Objetos
- Classes e métodos
- `require`
- `Net::HTTP`
- `URI`
- JSON
- Requisições HTTP
- Entrada de dados com `gets.chomp`
- Estruturas de repetição
- `break`
- Leitura e escrita de arquivos
- `Time`
- `strftime`

## 📂 Estrutura do projeto

```text
sistema_traducao/
├── app.rb
├── tradutor.rb
└── README.md
```

## ▶️ Como executar

No terminal, entre na pasta do projeto e execute:

```bash
ruby app.rb
```

Depois, siga as instruções apresentadas no terminal para informar a frase e os idiomas desejados.

## 🚧 Dificuldades encontradas

Durante o desenvolvimento do projeto, algumas das principais dificuldades foram:

- Entender como funciona uma requisição HTTP e como o programa se comunica com uma API externa;
- Compreender o formato JSON e como acessar as informações retornadas pela API;
- Entender o significado de `responseData` e `translatedText` dentro da resposta recebida;
- Compreender o funcionamento do `langpair` para definir o idioma de origem e o idioma de destino;
- Entender para que servem as bibliotecas utilizadas através do `require`;
- Organizar o código utilizando classes e métodos;
- Entender melhor o funcionamento do `gets.chomp` na entrada de dados;
- Trabalhar com arquivos para salvar as traduções realizadas;
- Utilizar data e hora na criação do nome dos arquivos;
- Implementar um loop para permitir que o usuário faça várias traduções sem precisar reiniciar o programa;
- Entender o uso do `break` para encerrar o programa quando o usuário não quiser realizar outra tradução.

## 📚 Aprendizados

Com este projeto foi possível entender melhor como diferentes conceitos de Ruby podem trabalhar juntos em uma aplicação.

Além da lógica de programação, o projeto ajudou a compreender como uma aplicação pode se comunicar com um serviço externo através de uma API, receber informações em JSON, tratar esses dados e utilizar o resultado dentro do programa.

Também foi possível praticar a organização do código, entrada de informações pelo usuário, estruturas de repetição e manipulação de arquivos.

## 👩‍💻 Autora

Desenvolvido por Mariana.