#!/bin/bash
initialiser_base(){

  if [ -f "tasks.txt" ]; then 
      echo "La base existe deja"
  else 
      touch tasks.txt
      echo "La base a ete cree avec succes"
  fi
}

afficher_toutes_taches(){
  if [ -f "tasks.txt" ]; then
      cat tasks.txt
  else 
      echo "Erreur: Base non initialise"
  fi
}

sauvegarder_base(){
  if [ -f "tasks.txt" ]; then 
      cp tasks.txt tasks_backup.txt 
      echo "Sauvegarde cree: tasks_backup.txt"

  fi
}

restaurer_base(){
  if [ -f "tasks_backup.txt" ]; then 
       cp tasks_backup.txt tasks.txt
       echo "base restauree depuis la sauvegarde"
  else 
       echo "Aucun sauvegarde disponible"
  fi
}

supprimer_base(){
  if [ -f "tasks.txt" ]; then 
    read -p "Etes-vous sure de vouloir la base? (y/n): " confrimation
 	if [ "$confirmation" = "y" ]; then
	      rm tasks.txt
              echo "La base a ete supprimer avec succes"
        else
	      echo"La base n'a pas ete supprimer"
  else 
     echo "La base n'existe pas. Rien a ete supprimer"

  fi
}
