# automacao-emprestimo-api
Esta suíte de testes tem por objetivo validar as respostas às requisições da API.

## Como executar o projeto

* Ter o VS Code instalado
* Importante ter o ruby instalado (versão 2.7.2 ou superior)
* Escolher o ambiente que deseja executar os testes (homolog/dev) em: support/data/rspec.yml

### Instalar o Bundler
'
gem install bundler
'

### Instalar as dependências do Ruby (projeto)
'
bundle install
'
### Rodar as features do projeto separadamente
'
rspec ./spec/(nome_do_spec).rb -fd
'
### Rodar o projeto inteiro
'
rspec
'
