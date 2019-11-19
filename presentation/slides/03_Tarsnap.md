# Tarsnap

::: notes
service de sauvegarde en ligne sécurisé et efficace.
:::

## Général

- Code source du client disponible 

- Windows, Mac OS, Linux


::: notes
Le code source du client Tarsnap est disponible afin que l'utilisateur puisse voir exactement comment les données sont protégées.
Cependant, il n'est pas distribué sous une licence Libre.

Windows est uniquement pris en charge via Cygwin ou le sous-système Windows pour Linux
:::

## Fonctionnement

- Sauvegarde de bloc individuel
- Création de l'archive
- Chiffrement et signature
- "Zero-Knownledge"

::: notes
Tous les fichiers à sauvegarder sont séparés en blocs de 64Kb, et uniquement les blocs uniques sont envoyés au serveur, ce qui offre une meilleure granularité comparée à des sauvegardes incrémentales, qui sont limitées aux fichiers différents.
Une fois l’archive Tarsnap créée, elle ne peut plus être modifiée; chaque archive est signée de manière cryptographique afin d'éviter toute modification silencieuse.
:::

## Prix de Tarsnap 

- Pas de frais fixes
- Pas de frais minimums mensuels. 
- On paie ce qu'on utilise
- Espace de rangement: 0,25 USD / Go / mois
- Bande passante: 0,25 USD / Go

::: notes

:::

## Avantage

- Données stockées dans Amazon S3
- Redondance dans le cloud
- Stockage journalisé sur le cloud


::: notes
Une fois que les données ont atteint le serveur Tarsnap, elles sont stockées dans Amazon S3.

Le serveur Tarsnap n'accuse réception de la demande du client qu'une fois que les données ont été stockées sur des disques dans plusieurs centres de données géographiquement divers.

Le serveur Tarsnap implémente un système de fichiers structuré en journal sur S3, mais conserve toutes les métadonnées pertinentes sur un EC2(un service proposé par Amazon permettant à des tiers de louer des serveurs sur lesquels exécuter leurs propres applications web).
:::

## Conclusion

::: notes
Tarsnap est très sécurisé, relativement peu coûteux pour la sauvegarde de dossiers critiques, mais devient exorbitant pour la sauvegarde de systèmes complets.
Le manque d'interface graphique signifie qu'il est principalement axé à la sauvegarde automatique sans interactions utilisateur.
:::

## Démo
