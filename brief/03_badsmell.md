# Bad code smell

Les `mauvaises odeurs` sont des *indicateurs* facilitant la **découverte** de problème de logic.
Elles décrivent des *mauvaises habitudes*, des *erreurs de conception* ou des *erreurs de code* pouvant amener des problèmes qui seront **exploitable** par un attaquant.
Les plus intéressantes dans ce contexte sont : 

- **Duplicate code** : défini une duplication de code
- **Switch statements** : définis une complexité trop grande dans des conditions (switch case / if)
    - *Large class, Long methode, Long parameter list* : définis une trop grande complexité dans une classe, méthode ou paramètre
- **Refused Bequest** : définis une utilisation de l'objet pour sa capacité d'éviter la duplication de code sans prendre en compte l'évolution du programme

On peut ajouter dans la catégorie *Duplicate code*, la **réutilisation de logique** qui n'est pas une `mauvaises odeurs` en tant que telle.
Mais le principe est proche et généralement problématique.


