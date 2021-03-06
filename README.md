# Álcool ou Gasolina?
Projeto desenvolvido em Flutter para a disciplina de Programação para Dispositivos Móveis, no curso de Graduação de Análise e Desenvolvimento de Sistemas, da Fatec Ribeirão Preto.

## O que é o aplicativo Álcool ou Gasolina?
O aplicativo foi desenvolvido com dois objetivos, um deles é a conclusão do projeto prático da discilplina e o outro é para melhorar meus conhecimentos nessa tecnologia que me chamou tanto a atenção.

A motivação inicial para a construção desse aplicativo foi que a partir do início do semestre, quando me interessei pela tecnologia, comecei a fazer alguns cursos extracurriculares, e foi através de um deles que esse aplicativo surgiu. 

O objetivo do aplicativo é calcular qual combustível compensa mais utilzar, álcool ou gasolina.

## Como configurar e executar o projeto?
1. Pré-requisitos: 
   * Ter o ambiente flutter configurado na sua máquina
   * Ter um emulador configurado ou o navegador Google Chrome

2. Clone ou faça o dowload do projeto para a sua máquina

3. Abra o diretório do projeto no Visual Studio Code ou no editor que preferir 
    * Download VS Code: <b>https://code.visualstudio.com/download</b>

4. No terminal, execute (este comando permite que o projeto seja executado diretamente no Google Chrome, sem a necessidade do emulador):
   * flutter run -d chrome
   
5. Após o projeto ser compilado, ele irá abrir em uma página do navegador, para ter uma experiência mais realista do aplicativo sugiro que o utilize de forma responsiva, em uma dimensão de celular, para isso:
   * Clique com o botão direito do mouse em qualquer lugar da tela
   * Selecione "Inspecionar"
   * Clique em "Toggle device toolbar" (no canto superior esquerdo)
   * Escolha o aparelho desejado (por exemplo, "iPhone 6/7/8")
      
Pronto, seu projeto estará executando no endereço: <b>http://localhost:54233/#/login.page</b>
 
## Como utilizar o aplicativo?
A tela inicial do aplicativo é a tela de login, então entre com um usuário e senha.

Se você estiver utilizando o aplicativo pela primeira vez, pode cadastrar seu usuário. Os dados ficarão persistidos no Firebase Cloud Firestore.

Após o login, você será direcionado para o Menu Principal do aplicativo, e pode navegar por ele.

E ai, o que compensa mais utilizar, álcool ou gasolina?

## Precisa de ajuda?
Se você precisar de uma ajudinha com o flutter, esses links podem ser utéis:
* Escrevendo seu primeiro app em flutter: <b>https://flutter.dev/docs/get-started/codelab</b>
* Alguns exemplos em Flutter: <b>https://flutter.dev/docs/cookbook</b>
* Documentação: <b>https://flutter.dev/docs</b>

## Deu erro?
Por um certo momento meu projeto parou de funcionar, sem que tivessem sido feitas alterações no código, ou de ambiente, consegui resolver executando os seguintes passos, sucessivamente:
   1. flutter upgrade
   2. flutter channel beta
   3. flutter upgrade
   4. flutter config --enable-web
	