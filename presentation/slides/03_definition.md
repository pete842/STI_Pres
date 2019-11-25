# Logique d'application

<br>
[Rôle ]{.fragment .fade-in}
[- En pratique]{.fragment .fade-in}
[- **Risques**]{.fragment .fade-in}

:::notes
La logique d'application, ou *application logic* en anglais, est le **concept** à la base même de notre (future) métier d'ingénieur.
En effet, c'est ce concept qui permet l'implémentation d'une solution informatique à un problème humain.

Mais comment le définir ?
Comment cerner davantage son rôle, sa mise en pratique, et enfin ses risques / points sensibles ? 
:::

## Rôle

[Processus complexe]{.fragment .fade-in}

[` /     |   ...  \`<br>tâche 1 + tâche 2 + ... + tâche N]{.fragment .fade-in} 

:::notes
Le rôle de la logique d'application est de permettre la décomposition d'un processus complexe en une série de tâches simples et atomiques.

Le processus complexe peut prendre des formes très variées.
Il peut s'agir par exemple :
- ... d'un algorithme mathématique.
Dans ce cas, les "tâches simples" deviennent typiquement des opérations arithmétiques.
- ... d'une solution applicative, comme une boutique en ligne ou autre plateforme proposant un espace client.
Ici, on divisera d'en un premier temps le processus principal en sous-processus, et ainsi de suite jusqu'à arriver à une tâche suffisamment simple pour pouvoir être implémentée.
- ... de tout autre protocole, même non-numérique, pouvant faire l'objet d'une décomposition en activités élémentaires.
:::

## En pratique

![](assets/img/part.png){.fragment .fade-in width=50%}

:::notes
En pratique, dans le contexte du développement applicatif, il existe d'innombrables techniques préétablies de découpage d'application en fonction du besoin du domaine.

De manière générale, ce découpage sera influencé par une multitude de facteurs plus ou moins concrets, 
tel que les besoins directs de l'application, 
mais également des bonnes pratiques populaires apparues au gré d'expérimentations plus ou moins fructueuses.

Ainsi, une application de vente en ligne deviendra dans un premier temps l'association d'un panier d'achat, d'un catalogue, d'un système de livraison / paiement et d'un système d'authetification.
Vous l'aurez compris, cela ne s'arrête pas là.
Le catalogue lui-même ne sera en fait qu'un ensemble de **produits**, à l'instar du panier d'achat. 
Mais ces deux systèmes ne remplissent pas la même fonction, et nécessite donc une implémentation différente.

Le contexte des applications web est particulièrement intéressant, 
car il s'agit généralement d'application fournissant une multitude de services, parfois de nature très varié,
mais à travers une seule plateforme, et bien souvent au travers d'un moyen de communication unifier.

Cela nous amène directement au point suivant, à savoir les risques à considérer en matière de logique applicative. 
:::

## Risques

![](assets/img/fail.png){.fragment .fade-in width=50%}

:::notes
Si les tâches atomiques peuvent contenir des erreurs de logique en elles-mêmes, il ne s'agit pourtant pas des causes majeures de logique applicative en échec.
En effet, une telle erreur est généralement facile à trouver à l'aide de tests unitaires bien conçus, c'est-à-dire testant bien les cas limites.
De plus, même en production, une erreur de ce type sera généralement rapidement visible, car une fonctionnalité fondamentale de l'application est touchée.

Les échecs de logique applicative trouvent leur origine dans l'étape de réunification des sous-processus.
Chaque processus dispose d'un espace individuel, d'un contexte propre.
Pourtant, l'application en elle-même ne contient généralement qu'un seul contexte, que devront plus ou moins tacitement se partager les différentes parties du code.

Comme dit précédemment, les applications web souffre tout particulièrement de ce constat, 
car elle dispose typiquement de mécanismes globaux permettant l'échange et la persistance d'information entre un client et le serveur, 
tel que les sessions.

NB : Le contexte d'une application est à prendre ici au sens large.
Il peut s'agir aussi bien du contexte d'exécution à proprement parler que d'éléments de conception, 
tel que la modélisation d'une entité quelconque.
:::

