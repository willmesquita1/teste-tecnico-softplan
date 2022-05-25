 ## Teste técnico - Softplan
Teste técnico para vaga de Desenvolvedor Delphi Pleno - Cód. 3188 (Segmento Justiça). Para o desenvolvimento desta aplicação foi utilizado Delphi XE7.

## Dependências
Para rodar a aplicação é necessário instalar o DUnitX para poder rodar os testes automatizados, o mesmo se encontra na pasta `dependencies` e é necessário adicionar a pasta `dependencies\dunit\Source` ao library path, caso a versão do Delphi utilizada não tenha o DUnitX instalado. E também é necessário o midas.dll, cujo já está na pasta do executável.

## Aplicação 
A aplicação consiste em um formulário principal do tipo MDI, e todas as tarefas podem ser acessadas a partir do menu principal no canto superior esquerdo. Para rodar aplicação, basta ir na pasta `win32\release` e executar o arquivo `ProvaDelphiApp.exe`

![Captura de tela 2022-05-25 012047](https://user-images.githubusercontent.com/103403091/170182440-5390a2bd-35f4-44b5-af8a-be36690e9d65.png)

## Tarefa 1
Implementação do gerador de SQL com componente customizado a partir do FDQuery. Usuário deverá informar as tabelas, colunas e condições que deseja e depois pressionar em GeraSQL e terá o SQL montado.

![Captura de tela 2022-05-25 013746](https://user-images.githubusercontent.com/103403091/170182485-5363509b-dc28-45dc-8432-727d5b259721.png)

## Tarefa 2 
Implementação de um atualizador de barras de progresso em segundo plano. Neste caso haverá dois SpinEdits em cima de cada barra de progresso para que o usuário informe o tempo em milissegundos de cara iteração. O usuário só precisará informar o tempo e depois clicar em iniciar. Também poderá fechar a janela durante o processo.

![Captura de tela 2022-05-25 013812](https://user-images.githubusercontent.com/103403091/170182511-065a4c7a-6ef5-43f4-b539-0f3c61cef681.png)

## Tarefa 3 
Implementado recurso de processamento de dados em lote. No caso há uma grade com vários itens, e deverá realizar alguns cálculos utilizando os valores dos campos.

![Captura de tela 2022-05-25 013838](https://user-images.githubusercontent.com/103403091/170182516-5a130319-e03c-4c8b-9f01-9f3c07740045.png)

## Testes unitários
Foram desenvolvidos alguns testes unitários para avaliar o comportamento do sistema, assim como garantir a integridade dos dados. 




