# Exemple

## Format simple

L'utilisation de **format simple** n'est pas un problème en soi, mais il faut être conscient que la simplicité de ce dernier *impose une perte d'information* par exemple le nom des champs.
On se base alors sur la position pour trouver nos valeurs ce qui est possiblement trop simple pour éviter de mauvaises données dans des fonctions critiques comme le `login`.
Si on ajoute à cela, la possibilité de forger une structure équivalente, il devient aisé de forger une usurpation.

## Code reused

Bien que le recyclage de code permette parfois d'économiser du temps, il s'agit pourtant d'une pratique dangereuse.
En effet, il n'est souvent pas souhaitable de disposer de structure identique dans deux parties distinctes d'une application, au risque de voir apparaître des failles de sécurités très difficile à déceler.

Rappelez-vous de l'exemple de l'application banquaire stockant **la même structure** `CCustomer` à la fois pour la connexion et l'enregistrement.
Un attaquant pouvait alors écraser cette structure au sein d'une connexion légitime par les données personnelles de sa victime afin d'usurper son identiter aux yeux de l'application.

## Scope restreint
