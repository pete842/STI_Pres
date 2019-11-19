#
![](assets/img/spideroak.png)

::: notes
Nous allons vous présenter dans cette partie, les solutions que l'entreprise SpiderOak propose.
:::

## Général

- Close source

- Windows, Mac OS, Linux
- Android, iOS

::: notes
Leur outil sont closes source, cependant ils ont un souhaite d'open source lors de la réécriture du client.
Cependant, ils ont annoncé cela il y a 2ans et aucun trace d'open source hormis sur le client mobile dont on en reparlera par la suite

Leur client desktop est disponible sur les 3 systèmes exploitations communes.
Leur client mobile est disponible sur Android et iOS, mais ne permet que de lire, télécharger et partager les données.
:::

## Fonctionnement

- chiffrement end-to-end
- principe de `no knownledge`
- de-duplication

::: notes
SpiderOak fonctionne avec un chiffrement end-to-end qui consiste à un chiffrement de la machine client jusqu'au serveur.
Ils suivent le principe de no knownledge pour garantir qu'ils ne seront jamais en possession d'aucune information et dans l'impossibilité de déchiffrer les données
Pour finir, ils utilisent des méthodes pour éviter au maximum la duplication des données, ils ont une politique intéressante sur la consommation des données en comptant uniquement l'espace réel que l'utilisateur utilise.
:::

## Prix Entreprise

- min. 500 personnes 

::: notes
Malheureusement, la version entreprise demande au minimum 500 personnes pour être demandée.
Donc il n’est clairement pas possible d'accéder à ce système pour une PME.
:::

## Prix One Backup

- personnel
- min. 6$/mois

::: notes
La seule solution alternative dans leur proposition pour une petite entreprise est un système de backup/synchronisation personnel avec des prix en termes de quantité allant de 6dollar à 30 dollars pour 5TB maximums par mois.
:::

## Mais...

- "`no knownledge`"
- Partage lecture seule (world readable)

- Synchronisation **LENTE**
- **FULL BUGGY**

::: notes
Mais... Il y a d'énorme de problème ! Pour commencer, le principe de "no knownledge" n'existe pas dès lorsqu'on souhaite utiliser l'application mobile ou l'interface web.
SpiderOak avertir que dès lorsque la session est créer jusqu'a sa suppression, le mot de passe sera présent dans la mémoire du serveur.
Ce mot de passe est bien sur la clé de chiffrement de l'ensemble des données.
Ensuite le système de partage est très simple, car il permet simplement de proposer en lecture/téléchargement les données d'un dossier de manière public sans restriction hormis la connaissance d'une URL contenant uniquement le nom donné pas l'utilisateur.
Un point important est l'utilisateur est responsable que le backup se fasse correctement sur sa machine.

Ensuite, nous avons pu faire plusieurs tests concernant la synchronisation, il a été nécessaire parfois de plusieurs minutes pour la propagation de petit fichier.
Pour finir, l'interface est très bugger ! Il est impossible de se déloger de l'application, il est relativement simple de créer des distances entre les menus.
L'interface annonce des opérations en cours en n'effectuant aucune action.
:::

## Conclusion

::: notes
Il semble que SpiderOak n'est pas approprié pour une petite entreprise, car cette solution permet difficilement de collaborer entre collègues.
:::

## Démo
