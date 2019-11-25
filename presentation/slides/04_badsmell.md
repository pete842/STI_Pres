# Bad Code Smell

:::notes
Une première méthode de détection est les bad smell.
Ces "mauvaises odeurs" sont des indicateurs d'erreur de programmation ou d'optimisation qui peuvent conduire à des bugs de logique.
Ces indicateurs peuvent être utiles pour trouver de manière plus aisée les problèmes de logique.

https://sourcemaking.com/refactoring
:::

## Duplicate Code

![](assets/img/stackoverflow.jpg)

:::notes
La réutilisation/duplication de code implique une potentielle réutilisation de la logique, ce qui peut-être dévastatrice !
L'utilisation du puissant Ctrl-C Ctrl-V peut être problématique, car il impose la réutilisation de l'ensemble de la logique.
Dans un premier temps, on altère ce code jusqu'à son fonctionnement, mais il peut rester des points de logique attaquable qui ne pose de problème visible dans un premier temps.

Pour mitiger ce problème, il faut éviter de recopier une trop grosse ou complexe partie de code et il est parfois nécessaire de refaire et faire attention à la logique.
Nous avons après un petit exemple de problème que cela peu créer.
:::

## Switch Statements

![](assets/img/switch-statement.png)

[Large class, Long methode, Long parameter list, etc.]{.fragment}

:::notes
Ce bad smell définit comme un switch ou une série de if très complexe.
Dans ce cas, le risque provient de la mauvaise compréhension de l'ensemble de la logique ce qui peut cacher un bug qui peu être possible d'exploiter.
On peut aussi ajouter les bad smells suivants à la liste des problèmes de complexité.

Pour éviter ce problème, il serait nécessaire de découper le problème en plus petite partie.
Sans perdre le contexte global.
:::

## Refused Bequest

![](assets/img/refused-bequest.png)

:::notes
Des personnes ont parfois l'envie de faire de l'héritage uniquement pour éviter de la duplication de code.
Cela est clairement une erreur qui pourra potentiellement amener à l'avenir de gros soucis, car les classes vont évoluer de manière distincte sans prendre en compte l'héritage arbitraire.
Ce futur problème sera amplifié par les multiples logiques et développeurs travaillants sur le programme et qu'il ne connaisse pas forcément l'ensemble du code.

Il faut parfois faire des concessions, l'orienté objet a été penser pour modéliser des idées, des entités et leur relation, pas de faire de l'optimisation.
:::


