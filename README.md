# Bienvenue sur le projet
## Presentation du projet
Vous trouverez ici ma version du projet The Gossip Project
## Installation et utilisation
1. Placez vous où vous souhaitez cloner le projet
2. ```$ git clone https://github.com/DevPomeis/tgp_rails ```
3. ```$ cd tgp_rails```
4. ```$ bundle install```
5. ```$ rails db:drop```
6. ```$ rails db:create```
7. ```$ rails db:migrate```
8. ```$ rails db:seed```
9. ```$ rails c``` pour entrer dans la console et bidouiller 
10. ```$ rails s``` pour lancer le serveur
#### Si vous souhaitez mettre à jour, n'ayant pas prevu de migrations, je vous conseille la demarche suivante:
1. ```$ git pull origin master```
2. ```$ rails db:create```
3. Les étapes 5-9 au dessus
#### OU
Supprimer le clone et refaire les étapes d'installation
## Contenu
### config/routes.rb
Pour voir les routes rapidement
### app/controllers
Vous trouverez ici mes deux controllers, un dynamique et un statique
### app/views
Comme son nom l'indique, vous y trouverez mes views
### db/migrate
Vous verrez comment j'ai lié mes tables et quelles colonnes elles ont
### app/models
Ici vous pourrez trouver mes models avec leurs fonctions
