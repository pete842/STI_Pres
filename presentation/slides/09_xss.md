# Démo

![](assets/img/troy.jpg){width=50%}

Validation de saisie en multi-étapes


::: notes
Cette premiere démo consiste à abuser la logique d'un simple validateur de saisie, pour reussi à effectuer une attaque en XSS

:::

## Scenario

:::fraglist
- Site web avec status d'utilisateur
- Valdation du status par le serveur
- Consultation du status d'autres utilisateurs
:::

:::notes
Pour ce scenario, nous allons nous attaquer à un site web fictif ayant la possibilitée qu'un utilisateur définisse un status actuel, qui est visible par tous les autres utilisateurs

Afin d'éviter des failles de type XSS, le site valide le nouveau status d'un utilisateur avant de l'affecter.

Finalement, les autres utilisateurs du site pourrons consulter le status précédement définit.
:::

## Validation du status

:::fraglist
1. Decodage HTML du texte
2. Supression de toutes balises script du text.
:::


:::notes
Comme la verification est faite en plusieurs étapes ,
Il va d'abbord effectuer un décodage html sur le contenu.

Il va ensuite retirer toutes balises script du contenu.
Le status est ensuite consideré come valide est sécurisé
:::

## Code de validation

```
function validate(status){
	status = unescape(status);
	old = ""
	while(old !== status){
		old = status;
		status = status.replace("<script>", "");
		status = status.replace("</script>","");
	}
	return status;
}
```
[L'encodage  HTML est retiré]{.fragment .current-only data-code-focus="2"} 
[Toutes les balises script sont retirées récursivement]{.fragment .current-only data-code-focus="4,6-7"} 

::: notes
Le code de validation s'occupe de rendre le status entré valide, et de le retourner pour qu'il soit stocké sur le serveur
:::

## Vulnerabilitée ?

::::fraglist
- HTML decode et supression de balise 1 fois
- Abusable ?
::::

:::notes
De par le code précédent, l'encode HTML est retiré une fois, et ensuite les balises script sont supprimées, et finalement l'encodage est réapliqué.

Est-il possible d'abuser un tel comportement ? Absolument !
:::

## Attaque !

:::fraglist
- envoi de `<script>` pas possible....
- mais envoi de `%<script>3Cscript>`
- Qui deviens `<script>` une fois validé !!
:::

:::notes
envoyer une simple balise script n'est pas possible, car la validation le retire. 
Envoyer plusieurs balises script, imbriquées les unes dans les autres ne marche pas non plus..

Mais que ce passe-il si on combine HTML encodage et balise script

En envoyeant une basise script encodée en HTML, mais avec une autre balise script, non encodée, juste à la suite du premier pourcent, on arrive à obtenir une balise script une fois validée !
:::

## Démo ! {data-run-in-terminal="assets/codes/xss.js" data-run-in-terminal-start="3" data-run-in-terminal-end="6"}

:::notes
Dans cette demo, nous testons la fonction de validation, à l'aide de 4 valeurs possibles, pour verifier que notre faille fonctionne réellement :
- Une simple balise script
- Deux balises scripts imbriquées
- Une balise script encodée
- finallement notre faille
:::
