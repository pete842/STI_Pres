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
Il s'agit d'un site avec une connection à une base de données MySql, afin de traiter tous.

Il existe évidement une page de connection, pour que les acheteurs potentiels puissent s'identifier envers le site

Les développeurs voulant se défendre des injections SQL au niveau de la page de connection, on décidé de mettre en place 2 pré-traitement des requêtes.
:::

## Protection injection SQL

:::fraglist
- Duplication des simples guillemets pour les échapper
- Tronquage des entrés utilisateurs
:::


:::notes
un premier qui échappe le caractere d'injection SQL par excellence, le simple guillement en le duplicant, c'est un mechanisme interne de MySQL qui garentit que deux simples guillements soient considérés comme un seul.
Et ensuite, on tronque la longeur des parametres,
:::

## Problème ?

:::fraglist
- Tronquage au milieu d'un échappement de `'` ?
- Username = `aaaa[...]aaaa'` 
- Second guillemet supprimé ! 
:::

::: notes
Donc, finalement, quel est le probleme ? 

Que ce passe-il si la chaine est tronquée au milieu d'un simple guillement échappé ?

Par example, dans un champ utilisateur avec 10 caracteres max, 9 lettre a et un simple guillement, le doublement du guillement pour l'échapper le mettra en 11 position, et seul ce guillement échapé sera tronqué.
 
Donc en conséquent, le second guillement sera supprimé !
:::

## Attaque !

```
SELECT * FROM users
WHERE username = 'aaa[...]aa'' and password = ' or id=1 --'
```

:::notes
Donc il est possible d'utiliser une attaque de cette forme pour pouvoir se connecter en temps que n'importe quel utilisateur et d'avoir acces à toutes leures données
:::


