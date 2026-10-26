
#!/bin/bash

SEUIL=${1:-80}

UTILISATION=$(df / | awk 'NR==2 {print $5}' | tr -d '%')

echo "Espace disque utilisé : ${UTILISATION}%"
echo "Seuil configuré : ${SEUIL}%"

if [ "$UTILISATION" -ge "$SEUIL" ]; then
    echo "ALERTE : le seuil d'utilisation du disque est atteint ou dépassé !"
    exit 1
else
    echo "OK : l'utilisation du disque est inférieure au seuil."
    exit 0
fi
