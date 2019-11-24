# échaper l'échappement

::: fragment
![*Poor input sanitizing*](assets/img/heartbleed.png)
:::

::: notes
Cet exemple présente un défaut d'implémentation découvert au niveau d'une application web permettant la gestion d'un produit de type  Intrusion Detection System (IDS)

Ce défaut de logique présente une conséquence majeure que peut avoir un mauvais assainissement d'entrée.

:::

## Contexte

:::fraglist
- Exécution commande système
- Échappement de caractères dangereux
:::

:::notes
Dans le contexte de cette application, un client doit pouvoir executer des commandes système, pour modifier son produit avec des paramètres qu'il controle.

Les développeurs s'étant rendu compte des dangers de cela, ont décidé d'échaper correctement les caractères dangereux, pour éviter qu'un utilisateur puisse abuser 
:::

## Exécution de commandes

:::fraglist
- `ids-set-name toto`
- `ids-set-name toto ; cat /etc/passwd`
- `ids-set-name toto \; cat /etc/passwd`
- `;`, `|`, `&`, `<`, `>`, `'` et espace
:::


:::notes
Afin de pouvoir mettre à jour certaines options du produit, comme par example, le nom de la machine courrante, il faut utiliser une commande comme suit, celle-ci mettant le nom à "toto".

Comme mentionné précédement, si l'on essaie de abuser du systeme, pour executer une autre commande arbitraire, les caracteres speciaux sont échapés avec un backslash, comme sur bash.

Voici une liste des caractères échapés, on peut voir que tous les caractères évidents pour abuser de commandes systemes dont échapés.
:::

## Problème ?

::: fragment
**Caractère d'échappement !**
:::

::: notes
Donc, finalement, quel est le probleme ? 
Quelqu'un sait ?
:::

## Caracteres échapés

:::fraglist
- `;`, `|`, `&`, `<`, `>`, `'` et espace
- Sont échapés par un backslash (`\`)...
- backslash pas échapé !
:::

:::notes
Voici à nouveau la liste des caracteres d'échappement.

Ils sont échappés par un backslash....

Mais le backslash n'est pas échappé lui-même !
:::

## Attaque !

:::fraglist
- `ids-set-name toto \; cat /etc/passwd`
- `ids-set-name toto \\; cat /etc/passwd`
:::

:::notes
En effet, comme le caractère d'échappement lui-meme n'est pas échappé, il suffit de fournir comme nom d'utilisateur "toto \; cat /etc/passwd".

Une fois que l'application va ésayer de sanitize l'entrée, il va échapper le ";"... qui aura pour effet l'inverse total, qui va simplement annuler l'échappement.
:::






