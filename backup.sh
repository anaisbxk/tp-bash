
#!/bin/bash

set -Eeuo pipefail

DOSSIER="${1:-}"
DESTINATION="backups"

if [ -z "$DOSSIER" ]; then
    echo "Erreur : veuillez indiquer un dossier à sauvegarder." >&2
    echo "Utilisation : ./backup.sh <dossier>" >&2
    exit 1
fi

if [ ! -d "$DOSSIER" ]; then
    echo "Erreur : le dossier '$DOSSIER' n'existe pas." >&2
    exit 1
fi

mkdir -p "$DESTINATION"

HORODATAGE=$(date +%Y-%m-%d_%H-%M-%S)
NOM_DOSSIER=$(basename "$DOSSIER")
ARCHIVE="$DESTINATION/${NOM_DOSSIER}_${HORODATAGE}.tar.gz"

echo "Création de la sauvegarde de '$DOSSIER'..."

tar -czf "$ARCHIVE" -C "$(dirname "$DOSSIER")" "$NOM_DOSSIER"

echo "Sauvegarde créée : $ARCHIVE"

echo "Suppression des sauvegardes de plus de 7 jours..."

for fichier in "$DESTINATION"/*.tar.gz; do
    [ -f "$fichier" ] || continue

    find "$fichier" -maxdepth 0 -type f -mtime +7 -print -delete
done

echo "Nettoyage terminé."
exit 0
