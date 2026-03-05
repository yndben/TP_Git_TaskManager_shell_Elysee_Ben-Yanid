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


