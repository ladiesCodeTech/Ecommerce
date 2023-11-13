## Iniciar o projeto 


* Instalar php 


Versão utilizada 8.1.12 

Download: https://www.php.net/downloads.php


* Instalar o composer


Versão utilizada  2.4.4

Download: https://getcomposer.org/download/



* Instalar o laravel


Versão utilizada 10.31.0

Documentação: https://laravel.com/docs/10.x



* Instalar banco de dados Oracle 


Versão utilizada: Oracle Database 21c Express Edition

Download: https://www.oracle.com/br/database/technologies/xe-downloads.html


* Instalar DBeaver


Download: https://sourceforge.net/projects/dbeaver.mirror/



## Iniciar o projeto com laravel



1. Criar uma pasta para o projeto, com o nome do projeto;

2. Entrar na pasta do projeto pelo prompt de comando, digitar o comando: cd nome da pasta do projeto;

3. Para criar o projeto com a última versão do laravel, utilizar o comando:

   **composer create-project laravel/laravel nomedoprojeto**

4. Criar um banco de dados com nome do projeto. 

   Alterar as informações para acessar o banco de dados criado, as informações deve ser alteradas na pasta **.env** do projeto.

   

## Roda um servidor laravel embutido



* Para rodar um servidor laravel embutido, utilizar o comando:

**php artisan serve**


* Parar de rodar o servidor, pressionar as teclas  Ctrl + c



## Migrations


* Para criar os arquivos controller resource, model e migrations, com único comando: 

**php artisan make:model Nomedatabela -mcr**


* Para criar as migrations, utilizar o comando: 

**php artisan migrate** 
