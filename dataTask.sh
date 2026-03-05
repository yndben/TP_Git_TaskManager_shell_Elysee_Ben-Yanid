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

# Fonction 5 : supprimer_base
supprimer_base() {

    if [ -f "tasks.txt" ]; then
        read -p "Êtes-vous sûr de vouloir supprimer la base ? (y/n) : " confirmation

        if [ "$confirmation" = "y" ]; then
            rm tasks.txt
            echo "La base de données a été supprimée."
        else
            echo "Suppression annulée."
        fi
    else
        echo "Erreur : La base n'existe pas, rien à supprimer."
    fi
}
