#!/bin/bash

sudo apt-get update
sudo apt-get install apache2 -y
sudo chmod -R 0755 /var/www/html/
sudo cat /var/www/html/index.html >> index.html.old
#sudo echo -e "\n\n\n\n\n\n\n\t\t\t\t\t\t\tWEBSERVER -\t2\n\n\n\n\n\n\n" > index.html
sudo echo  "<html> <body bgcolor="plum"> <h1><br>WEBSERVER - 2</h1> <p> <br><br><br><br>Inbound Transit VNet Demo</p> </body> </html>"  > index.html
sudo cp index.html /var/www/html/
