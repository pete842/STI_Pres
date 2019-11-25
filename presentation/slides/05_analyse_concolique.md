# Analyse Concolique

:::fraglist
- *Pathfinding* du code
- Découverte d'effets de bord et cas limite
- Plus efficace que *Fuzzing*
:::

:::notes
Une autre méthode de détection de fautes de logique est l'analyse concolique.

Cette méthode consiste à parcourir le code de telle façon à connaître quelles valeurs doivent avoir les variables pour que tous les chemins du code soient exécutes au moins une fois.

Cette méthode permet de découvrir les éventuels effets de bords et cas limites lors de l'exécution de code.

De par le fait que l'analyse concolique à connaissance du code sous-jacent, elle est plus efficace que le fuzzing à trouver les effets de bord.

:::

## Execution Symbolique

:::fraglist
- Garanties mathématiques sur le code
- Très lourd à exécuter
- Uniquement pour code critique
- Utile pour NASA
:::

:::notes

Cette méthode permet de transformer le code en un ensemble d'équations mathématique, qui, une fois résolues permettent d'obtenir des garanties sur le code.

Comme cette méthode consiste à résoudre des équations mathématiques très complexes, le temps d'exécution deviens très grand très rapidement, donc c'est uniquement utilisable en pratique pour du code très critique.

Une telle méthode, avec toutes ses restrictions, est tout de même très utile pour des applications extrêmement critiques, ou une erreur logique n'est pas admise. Il s'agit donc d'un outil très pratique pour les organisations telles que la NASA.

:::

## Limitations

:::fraglist
- Lourd à installer
- Aucune garantie sur le code
- Non-exhaustif
:::

:::notes

Bien que puissant à l'utilisation, la mise en place n'est pas aisée, et requière une intégration plutôt invasive au niveau du code.

Contrairement à l'exécution symbolique, qui fournit des garanties mathématiques, l'analyse concolique ne permet pas d'avoir de garantie sur la robustesse du code analysé.

De par la nature de l'analyse concolique, il n'est pas possible de trouver une grande majorité des erreurs de logique.

Malgré tous ces désavantages, ce système est quand même très apprécié quand il est correctement mis en place, bien que c'est rarement le cas en pratique.

:::


