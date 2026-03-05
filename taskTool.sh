#!/bin/bash

ajouter_tache() {
	read -p "entrez la description de la tache : " description 

	nb_lignes=$(wc -l < tasks.txt)
	id=$((nb_lignes + 1))

	echo "$id|$description|0" >> tasks.txt

	echo "tache ajoutée avec succès !"
#commit git
git add tasks.txt
git commit -m "feat ajout fonction ajouter_tache"
}
ajouter_tache

supprimer_tache() {
	read -p "entrez l'ID de la tache à suprimer : " id_a_supprimer

	grep -v "^$id_a_supprimer|" tasks.txt> tasks.tmp

	mv tasks.tmp tasks.txt

	echo "la tache $id_a_supprimer a été supprimer avec succès."
git add tasks.txt
git commit -m "feat  supprimer fonction  supprimer_tache"

}

marquer_terminer() {
	read -p "entrez l'ID  de la tache à la marquer comme terminée : " id_recherche

	sed -i "s/^$id_recherche|\(.*\)0$/$id_recherche|\1|1/" tasks.txt
	echo "la tache $id_recherche a été mise à jour !"
git add tasks.txt
git commit -m "feat marquer terminer maraquer_terminer"
}

afficher_taches() {
     if	[ -f tasks.txt ]; then

		echo "ID |description		| statut"

		while IFS="|" read -r id desc statut
		do
		    if ["$statut" == "1" ]; then
			statut_visuel="[TERMINEE]"
		    else
			statut_visuel="[EN COURS]"
		    fi
			echo "$id | $desc | $statut_visuel"
		done <tasks.txt
    
     else
	echo "le fichier tasks.txt n'existe pas encore."
     fi
git add tasks.txt
git commit -m "feat afficher tache afficher_taches"

}
