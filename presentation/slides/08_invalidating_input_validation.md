# Validation d'entrée

::: notes
Cet exemple présente un défaut d'implémentation découvert au niveau d'un site web d'e-commerce

:::

## Contexte

:::fraglist
- Site e-commerce avec base MySQL
- Page de connexion 
- Défense contre injection SQL
:::

:::notes
Il s'agit d'un site avec une correction à une base de données MySQL, afin de traiter tous.

Il existe évidemment une page de connexion, pour que les acheteurs potentiels puissent s'identifier envers le site.

Les développeurs voulant se défendre des injections SQL au niveau de la page de connexion, ont décidé de mettre en place 2 des requêtes.
:::

## Protection injection SQL

:::fraglist
- Duplication des simples guillemets pour les échapper
- Tronquage des entrés utilisateurs
:::


:::notes
Un premier qui échappe le caractère d'injection SQL par excellence, le simple guillemet en le dupliquant, c'est un machinisme interne de MySQL qui garantit que deux simples guillemets sont considérés comme un seul.

Et ensuite, on tronque la longueur des paramètres.
:::

## Problème ?

:::fraglist
- Tronquage au milieu d'un échappement de `'` ?
- Username = `aaaa[...]aaaa'` 
- Second guillemet supprimé ! 
:::

::: notes
Donc, finalement, quel est le problème ? 

Que se passe-t-il si la chaîne est tronquée au milieu d'un simple guillemet échappé ?

Par exemple, dans un champ utilisateur avec 10 caractères max, 9 lettres `a` et un simple guillemet, le doublement du guillemet pour l'échapper le mettra en onzième position, et seul ce guillemet échappé sera tronqué.

Donc en conséquent, le second guillemet sera supprimé !
:::

## Attaque !

```
SELECT * FROM users
WHERE username = 'aaa[...]aa'' and password = ' or id=1 --'
```

:::notes
Donc il est possible d'utiliser une attaque de cette forme pour pouvoir se connecter en temps que n'importe quel utilisateur et d'avoir accès à toutes leurs données.
:::


