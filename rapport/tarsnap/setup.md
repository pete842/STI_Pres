# Installation de Tarsnap

Sur des machines de type Debian (Ubuntu ou Mint, par exemple), [le site de Tarsnap](https://www.tarsnap.com/pkg-deb.html) explicite l'ajout de la clé de package de Tarsnap au système, l'ajout de leur repos à la liste de sources APT, et l'installation de Tarsnap lui-même via apt-get.

Leur site web fournit également des instructions pour compiler et installer Tarsnap via le code source, afin de pouvoir l'installer sur d'autres systèmes non supportés.

Il faudra ensuite créer un compte sur [le site de Tarsnap](https://www.tarsnap.com/register.cgi), et déposer au minimum 5$ USD sur son compte afin de pouvoir l'utiliser.

## Configuration de Tarsnap

Tarsnap est configurable via un fichier de configuration, localisé à 2 endroits possibles :

* `/etc/tarsnap.conf`, si Tarsnap a été installé via leur package .deb
* `/usr/local/etc/tarsnap.conf`, si Tarsnap a été installé via le code source.

Le fichier de configuration par défaut est suffisant pour une utilisation traditionnelle.

Il faudra ensuite créer une clé d'authentification Tarsnap, authentifiant la machine auprès des serveurs de Tarsnap, à l'aide de la commande suivante, en rentrant son mot de passe lorsqu'il est demandé.

```
sudo tarsnap-keygen \
	--keyfile /root/tarsnap.key \
	--user <account_email> \
	--machine <machine_name>
```

Attention ! Le keyfile d'authentification généré est également utilisé pour le chiffrement des données sauvegardées, si celui-ci est perdu, les données seront définitivement perdues.

Il est recommandé de sauvegarder ce keyfile en 3 places, sur plusieurs supports et sur plusieurs lieux physiques. 

## Utilisation de Tarsnap

### Utilisation basique

L'utilisation recommandée de Tarsnap pour créer des backups est via des scripts automatisés via cron, mais dans le cadre de ce guide d'utilisation l'automatisation via cron ne sera pas couverte.

La commande pour backup le dossier `/tmp/toto` peut est comme suie :
```
tarsnap -c -f "$(uname -n)-$(date +%Y-%m-%d_%H-%M-%S)" /tmp/toto
```
* le paramètre <-c> spécifie la création d'une archive distante
* le paramètre <-f> spécifie le nom de l'archive distante. Dans ce cas, le nom distant sera le nom de la machine, suivi de la date actuelle, précise à la seconde.

NB : chaque keyfile dispose d'un namespace, et par conséquent, de dossier racine diffère, donc il est possible de créer plusieurs archives de même nom uniquement si l'on dispose de différents keyfiles.

* Il est ensuite possible de lister tous les backups distants à l'aide de la commande :
```
tarsnap --list-archives
```

* Il est possible de restaurer un backup via :
```
tarsnap -x -f <backup_name>
```

* Il est possible de supprimer un backup avec :
```
tarsnap -d -f <backup_name>
```

### Utilisation avancée
* Il est possible de lister les fichiers contenus dans un backup avec :
```
tarsnap -tv -f <backup_name>
```

* Il est possible de restaurer un fichier particulier à l'aide :
```
tarsnap -x -f <backup_name> <path_of_file_to_restore>
```

* Il est possible de tester, sans rien upload, combien de données seraient utilisées (et donc, combien d'argent sera dépensé) par le backup d'un fichier/dossier :
```
tarsnap -c -f <backup_name> --dry-run --print-stats <path_of_file_or_folder>
```

* Suite à une perte du dossier de cache, ou une migration système, il est possible de le restaurer via :
```
tarsnap --fsck
```
