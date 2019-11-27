# Example 1<br/>Casser la banque

![*Code Reuse*](assets/img/reuse.png)

::: notes
Cet exemple présente un défaut d'implémentation découvert au niveau d'une application web permettant la gestion de comptes banquaires personnels.

Ce défaut de logique présente une conséquence majeure que peut avoir la réutilisation de code au sein d'un système se voulant sécurisé.
:::

## Contexte

:::fraglist
- Enregistrement
- Connexion
- Consultation
:::

:::notes
Dans le contexte de cette application, un client doit être en mesure de se connecter à l'interface.
Une fois connecté, il pourra consulter un certain nombre de pages donnant accès à du contenu privé.

Un client de la banque n'ayant pas encore de compte actif sur la plateforme doit également pouvoir disposer d'un mécanisme lui permettant dans créer un.
:::

## Enregistrement

:::fraglist
1. Identification (&ne; authentification)
2. Kit d'inscription
3. &rarr; **Connexion**
:::


:::notes
Afin de pouvoir accéder à l'application web, un client de la banque doit au préalable créer un compte sur la plateforme.

Pour ce faire, il lui suffit de se rendre sur la page d'inscription.
Plus précisément, il s'agit d'une page de demande de création de compte pour un client de la banque.

La page en question requiert un certain nombre d'informations personnelles permettant par la suite **d'identifier** avec certitude le client concerné.
(NB: IDENTIFIER et non AUTHENTIFIER => on s'est de qui il s'agit, mais on a aucune garantie sur son authenticité.)

Ces informations sont ensuite vérifiées par l'application, et si elles correspondent à un client valide, ce dernier recevra un "kit d'inscription" par courrier.
Ce kit lui permettra de finaliser son compte en transmettant un secret à travers un canal jugé authentique (dans ce cas la ligne téléphonique privé du client) ainsi qu'un mot de passe "jeton unique" pour sa première connexion sur la plateforme.
:::

## Connexion

:::{.fraglist .nobullet}
1. Authentification
2. ```js
    class CCustomer {
        String firstName;
        String lastName;
        CDoB dob;
        CAddress homeAddress;
        long custNumber;
        ...
    }
    ```
3. Stockage dans la session
4. &rarr; **Consultation**
:::

:::notes
Le mécanisme de connexion repose sur l'existance d'un secret partagé entre le client et l'application, à savoir son mot de passe.

Une fois l'utilisateur authentifié, l'application instancie un objet `CCustomer` correspondant au client courant et le stocke dans sa session.
Cet objet contient les informations personnelles du client telles que son identité, son numéro de client et autres informations utiles à l'application.
À noter donc que la plupart de ces infos seront récupéré par le *backend* depuis la base de donnée.
:::

## Sécurité

- Identification ?
[&#10004; (données personnelles) ]{.fragment}
- Accès physique requis ? 
[&#10004; (courrier)]{.fragment}
- Canal authentifié ?
[&#10004; (téléphone + PIN)]{.fragment}

<br>
Verdict : [**OK**]{.fragment}

:::notes
Si l'on discute à présent la sécurité du système d'enregistrement de cette application, on est amené à se demander quelles sont les obstacles rencontrés par un attaquant,
et s'ils sont suffisants pour empêcher l'usurpation d'identité à n'importe quel instant du processus.

- Le premier obstacle est de parvenir à identifier correctement un client de la banque.
L'utilisation d'information personnelle lié à l'identité de la personne est évidemment suffisante pour satisfaire ce premier point.
Attention encore une fois, ce point garantie à l'application de connaître l'identité exact du client souhaitant s'enregistrer, bien que ce dernier ne soit aucunement authentifié (l'usage d'aucun secret n'a été fait jusque-là).

- Le second obstacle réside dans l'utilisation du courrier postal.
En effet, un éventuel attaquant devrai dès lors avoir bénéficier d'un accès physique au domicile de la victime afin de prélever son courrier postal à son insu.

- Le dernier point, terminant de garantir dans une certaine mesure l'authentification du client, impose l'utilisation de la ligne téléphonique reliant le client à sa banque afin de transmettre un secret.
Ce secret provient donc du kit d'enregistrement reçu par voie postale.

Si cette solution est évidemment discutable en certain point, 
notamment la difficulté négligeable, selon le contexte, que peut avoir un attaquant à prélever le courrier de sa victime, voir de l'impersonner à travers sa propre ligne téléphonique,
il ne fait aucun doute qu'il n'est pas aisé pour un attaquant de s'interposier dans ce processus afin d'obtenir un accès légitime au compte d'une victime.

La sécurité de ce mécanisme de manière isolé n'est donc pas mis en cause ici.
:::


## Problème ?
### *Code Reuse !*{.fragment}
:::notes
Mais quel est donc le problème ?
Des idées ?

Indice : cela se réfaire à la "bad smell" *code reuse*. 
:::

## Session utilisateur

[Connexion<br>&#8681;]{.fragment}


```{.js style="width: 50%;display:inline-block"}
class CCustomer {
    String firstName;
    String lastName;
    CDoB dob;
    CAddress homeAddress;
    long custNumber;
    ...
}
```

[&#8679;<br>**Enregistrement !**]{.fragment}

:::notes
Le problème réside dans le fait que la `class CCustomer` est utilisé dans deux parties distinctes du code.

Lors de la connexion d'un client, une instance de cette classe sera stockée dans la session utilisateur.
Les différentes fonctionnalités de la consultation se référeront ensuite aux données personnelles contenues dans cette dernière.

Cependant, lors de la première phase d'enregistrement, celle qui ne fait pas du tout l'objet d'une quelconque authentification,
une instance incomplète de `CCustomer` est également généré et placé au même endroit (dans la session).

Vous avez compris l'attaque qu'il est possible d'effectuer ?
:::

## Attaque !

:::fraglist
1. Connexion <u>légitime</u> (ID Attaquant)
2. &rarr; page d'enregistrement
3. Usurpation d'identité 
[<br>&#x26A1; écrasement de `CCustomer` &#x26A1;]{.fragment}
4. Consultation <u>illégitime</u> (ID Victime)
:::

:::notes
En effet, il existe une procédure d'attaque, simple et infaillible, qui permet de consulter des informations relatives à un autre client de la banque de façon illégitime.

Il suffit pour ce faire de posséder soi-même un compte client légitime, et il faut connaître un minimum de données personnelles sur sa victime.

Il faut donc :
1. Se connecter sur l'application de façon légitime avec l'identifiant de l'attaquant.
2. Se rendre sur la page d'enregistrement avec la session courante.
3. "Poster" les données personnelles d'un autre client NE DISPOSANT PAS encore d'un compte client sur l'application.
Les données `CCustomer` de l'ID de l'attaquant sont alors écrasées par celles de la victime.
4. Consulter les informations personnelles de la victime via la session ainsi obtenu (à savoir la connexion légitime de l'attaquant avec les données personnelles de la victime dans la session).
:::






