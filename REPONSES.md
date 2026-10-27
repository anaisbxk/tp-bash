# Réponses aux questions de réflexion

## Exercice 2.2 — Vérification de l'espace disque

Le code de sortie permet de distinguer une exécution normale d'une situation nécessitant une alerte. Le code `0` indique que l'utilisation du disque est inférieure au seuil configuré, tandis que le code `1` signale que le seuil est atteint ou dépassé.

## Exercice 2.3 — Sauvegarde

Le script vérifie que le dossier à sauvegarder existe, crée une archive compressée et supprime les anciennes sauvegardes de plus de sept jours. Les codes de sortie permettent de signaler une erreur pendant l'exécution.

## Exercice 2.4 — Planification avec cron

Cron permet d'automatiser l'exécution périodique d'un script. Les chemins absolus sont préférables, car le répertoire courant de cron peut être différent de celui du terminal.

Dans cet environnement Git Bash sous Windows, la commande `crontab` n'est pas disponible. La tâche cron n'a donc pas été configurée ni vérifiée avec `crontab -l`.

## Exercice 2.5 — Préfiguration CI/CD

### Étapes à ajouter pour obtenir un véritable pipeline CI

- Vérifier la configuration et les dépendances du projet.
- Installer les dépendances nécessaires.
- Exécuter les tests unitaires et les tests d'intégration.
- Ajouter une analyse statique du code et des contrôles de qualité.
- Générer et vérifier les artefacts.
- Publier les résultats et les journaux.
- Automatiser le pipeline lors de chaque modification du dépôt.

### Points de défaillance à gérer

- URL incorrecte ou dépôt inaccessible.
- Échec du clonage ou de la mise à jour Git.
- Dépendances manquantes ou installation échouée.
- Tests échoués.
- Erreurs de permissions ou d'accès aux fichiers.
- Échec de génération ou de publication des artefacts.

Le code `0` indique une réussite. Un code différent de `0` permet de signaler un échec et d'interrompre le pipeline. Les journaux horodatés facilitent le diagnostic.
