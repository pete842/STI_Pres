# Analyse Concolique

:::fraglist
- *Pathfinding* du code
- Découverte d'effets de bord et cas limite
- Plus efficace que *Fuzzing*
:::

:::notes
Une autre méthode de détection de fautes de logique est l'analyse concoilique.

Cette methode consiste à parcourir le code de telle façon à contaitre quelles valeurs doivent avoir les variables pour que tous les chemins du code soient executés au moins une fois.

Cette methode permet de découvrir les eventuels effets de bords et cas limites lors de l'execution de code.

De par le fait que l'analyse concolique à conaissance du code sous-jacant, elle est plus efficace que le fuzzing à trouver les effets de bord.

:::

## Execution Symbolique

:::fraglist
- Garanties mathématiques sur le code
- Très lourd à exécuter
- Uniquement pour code critique
- Utile pour NASA
:::

:::notes

Cette méthode permet de transformer le code en un ensemble d'equations mathematique, qui, une fois résolues permettent d'obtenir des garanties sur le code.

Comme cette methode consiste à résoudre des equations mathematiques tres complexes, le temps d'execution deviens tres grand tres rapidement, donc c'est uniquement utilisable en pratique pour du code tres critique.

Une telle methode, avec toutes ses restrictions, est tout de même tres utile pour des applications extrèmement critiques, ou une erreur logique n'est pas admise. Il s'agit donc d'un outil tres pratique pour les organisations telles que la NASA.

:::

## Limitations

:::fraglist
- Lourd à installer
- Aucune garantie sur le code
- Non-exhaustif
:::

:::notes

Bien que puissant à l'utilisation, la mise en place n'est pas aisée, et requiere une intégration plutot invasive au niveau du code.

Contrairement à l'execution symboliqe, qui fournit des garanties mathematiques, l'analyse concolique ne permet pas d'avoir de garantie sur la robustesse du code analysé.

De par la nature de l'analyse concolique, il n'est pas possible de trouver une grande majoritée des erreurs de logique.

Malgré tous ces désavantages, ce systeme est quand meme tres aprecié quand il est correctement mis en place, bien que rarement en pratique

:::


