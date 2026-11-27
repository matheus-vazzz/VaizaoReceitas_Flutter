# VAIZAO RECEITAS

App de receitas feito em Flutter para a disciplina de desenvolvimento mobile. Ele mostra receitas da API pública DummyJSON (https://dummyjson.com/docs/recipes): dá para pesquisar pelo nome, ver ingredientes e modo de preparo e salvar favoritos.

 Funcionalidades

- Lista de receitas carregada da API ao abrir o app, com imagem, tempo, dificuldade e nota
- Pesquisa pelo nome da receita (não aceita campo vazio e ignora espaços no começo e no fim)
- Tela de detalhes com ingredientes, passo a passo, tempo, porções e tipo de refeição
- Favoritos: dá para adicionar e remover durante o uso do app, sem repetir receita
- Mensagens para quando está carregando, quando dá erro (sem internet, erro do servidor ou resposta inválida) e quando a pesquisa não encontra nada

*Os dados da API vêm em inglês.

 Algumas decisões

- A tela de detalhes usa os dados que já vieram na lista ou na pesquisa, porque a API já manda a receita completa. Por isso não fiz outra requisição para `/recipes/{id}`.
- Os favoritos ficam numa lista só, em memória, usada por todas as telas. Se o app for fechado, eles são perdidos.
- A lista é carregada uma vez quando o app abre, e o botão de pesquisar fica bloqueado enquanto uma busca está em andamento.

 Tecnologias

- Flutter 3.47.8
- Pacote `http` (^1.6.0) para as requisições

 Como rodar

1. Clone o repositório:
   git clone https://github.com/matheus-vazzz/VaizaoReceitas_Flutter.git]

2. Entre na pasta do projeto e instale as dependências:
   flutter pub get
   ```
3. Abra um emulador Android ou conecte um celular e rode:
   flutter run

*É preciso estar com internet para carregar as receitas.