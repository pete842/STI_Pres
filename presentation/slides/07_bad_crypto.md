# Example 2<br/>Bad crypto

![](assets/img/cookies.png){width=20%}

::: notes
Pour cet exemple, nous avons utilisé un cas concret en la modifiant pour que cela soit plus simple à illustrer.

Nous prendrons le cas d'un casino en ligne pour la logique des valeurs.
:::

## 2 cookies

::: fraglist
- `Username|user_id|entropie`
- `full name|number|entropie`
:::
[`string`<span>|</span>`int`<span>|</span>`entropie`]{.fragment .fade-in .same-cookie}

::: notes
Imaginons deux cookies, le premier serait composé des informations d'authentification de l'utilisateur permettant au serveur de savoir à qui il s'adresse.
Ces informations sont son nom d'utilisateur, son id et de l'entropie pour la sécurité. Ce cookie est chiffré de manière sûr.

Le second serait composé du nom complet de l'utilisateur ainsi que **son numéro porte-bonheur**, le développeur se dit que c'est des informations sensibles vis-à-vis de la vie privée.
Alors il décide de chiffrer ce cookie avec la **même clé** que le cookie précédent.

Cela nous donne deux cookies chiffrés de la même manière ainsi que ces valeurs qui sont identiques.
:::

## Attaque

![](assets/img/hmm.gif)

[`John Doe|`<span>1</span>`|je suis de l'entropie`]{.fragment .fade-in .cookie-attack}

::: notes
Nous avons donc deux cookies chiffrés de la même manière et donc déchiffrés aussi de la même manière. Nous pouvons donc simplement intervertir les valeurs.
Et le problème vient du faîte que le second champ donne l'identifiant de l'utilisateur et qu'il peut être choisi de manière arbitraire !

Nous pouvons donc imaginer choisir l'identifiant de l'admin, très certainement le numéro 1 et l'intervertir avec notre premier cookie.
Et nous voilà donc administrateurs du site.
:::

## Problèmes

::: fraglist
- réutilisation de clé
- format réutilisé
- possibilité de forger
:::

::: notes
Nous voyons que la réutilisation de clé est une très mauvaise pratique en crypto.
La réutilisation de format n'est pas une simple duplication de code, ce point est potentiellement difficile à détecter.
Mais l'utilisation de format tel que le JSON aurait clairement bloqué ce problème, car nous aurions eu des noms de champs différents.

La possibilité de forger le contenu du cookie a été le point d'exploitation, la cohérence des types de champs ont permis cette attaque.
:::
