
#!/bin/bash

set -Eeuo pipefail

LOG="ci.log"

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*" | tee -a "$LOG"
}

erreur() {
    log "ERREUR : $*"
    exit 1
}

if [ -z "${1:-}" ]; then
    echo "Utilisation : ./ci.sh <url_du_depot_git>" >&2
    exit 1
fi

URL="$1"
DOSSIER="projet_ci"

log "===== Début du pipeline CI ====="

if [ -d "$DOSSIER/.git" ]; then
    log "Mise à jour du dépôt existant..."
    git -C "$DOSSIER" pull || erreur "Échec de la mise à jour du dépôt"
elif [ -e "$DOSSIER" ]; then
    erreur "Le dossier '$DOSSIER' existe mais n'est pas un dépôt Git"
else
    log "Clonage du dépôt..."
    git clone "$URL" "$DOSSIER" || erreur "Échec du clonage"
fi

log "Exécution des tests..."

if [ -f "$DOSSIER/package.json" ]; then
    if command -v npm >/dev/null 2>&1; then
        (cd "$DOSSIER" && npm test) || erreur "Échec des tests npm"
    else
        erreur "npm n'est pas installé"
    fi
else
    log "Aucun package.json : exécution d'un test minimal"
    if [ -d "$DOSSIER/.git" ]; then
        log "Test réussi : dépôt Git disponible"
    else
        erreur "Test échoué : dépôt Git introuvable"
    fi
fi

log "===== Pipeline terminé avec succès ====="
exit 0
