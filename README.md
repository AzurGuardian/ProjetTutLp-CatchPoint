# ProjetTutLp-CatchPoint

symfony 1/4 : 1h pour comprendre le framework, et prendre les 3 suivantes


faut composer, et lors de son installation, choisir php 7.2.x
Symfony 4 ne tourne que sur php 7.2 et au dessus 


la toute premere fois qu on creer un projet symfony il faut faire
composer create-project symfony/website-skeleton nomApp


composer require symfony/orm-pack permet de recup des composants supplementaire de symfony

composer require symfony/maker-bundle --dev permet d avoir les maker -> permet de creer des fichiers automatiquement

composer require server --dev (dans le dossier CatchPoint) permet d'avoir un serveur local en plus de amp
   
   
BDD -> .env, tout en bas il y a une var DATABASE_URL, remplacer par DATABASE_URL=mysql://root:@127.0.0.1:3306/catchpoint
Une fois fait, écire dans un terminal php bin/console doctrine:database:create pour creer la base de données

php console/bin make:entity pour creer une entite(l equivalent d une table sql)
php console/bin make:Controller pour creer un controlleur

php console/bin make:migration une fois que les entites sont créées/modifiées pour actualiser la BDD
php console/bin doctrine:migrations:migrate pour actualiser les tables dans la BDD

composer require orm-fixtures --dev permet de récup les composants pour créer des fixtures

fixtures = des jeux de données pour test
php bin/console make:fixtures
