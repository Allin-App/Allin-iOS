<div align="center">

  <img src="Documentation/Images/Banner-AllIn.png" />
    
---

&nbsp; ![Swift](https://img.shields.io/badge/Swift-F05138.svg?style=for-the-badge&logo=Swift&logoColor=white)
&nbsp; ![iOS](https://img.shields.io/badge/iOS-000000.svg?style=for-the-badge&logo=Apple&logoColor=white)

---

[Présentation](#apple---all-in) | [Répartition du dépôt](#répartition-du-gitlab) | [Structures](#structures) | [Technologies](#technologies) | [Outils](#outils) | [Wiki](https://codefirst.iut.uca.fr/git/AllDev/Gestion_de_projet/wiki)

</div>

### Apple - ALL IN!

**Contexte** : Application Swift et SwiftUI pour le projet universitaire de troisième année (B.U.T Informatique de Clermont-Ferrand) intitulé *All In*.
</br>

**Description** : Ce dépôt contient l'ensemble du code pour la partie client iOS de l'application *ALL IN*.
</br>

# Répartition du dépot

[**Sources**](Sources) : **Code de l'application**

[**Documentation**](Documentation) : **Documentation de l'application**


# Structures

- MVVM

<div align = center>

<img src="https://codefirst.iut.uca.fr/git/AllDev/Gestion_de_projet/raw/branch/master/Documentation/Diagrammes/AllInMVVM.png" width="600" />

</div>

# Fonctionnement

- ### Comment lancer le projet ? 

:information_source: *Assurez-vous d'avoir un Mac à disposition*

Tout d'abord si ce n'est pas fait cloner le dépôt de la branche **master/main**, pour cela copier le lien URL du dépôt git :

<div align = center>

![Comment cloner](Documentation/Images/HowToClone.png)

</div>

Sur votre Mac, ouvrez l'IDE **Xcode** (disponible via l'App Store), puis cloner le dépôt en utilisant l'URL copiée précédemment  :

<div align = center>

<img src="Documentation/Images/WelcomeToXcode.png" width="500" >

</div>

Vous serez alors redirigé par l'IDE et pourrez lancer l'application sur l'appareil de votre choix :

<div align = center>

<img src="Documentation/Images/LaunchApp.png" width="900" >

</div>

*Si vous souhaitez lancer l'application sur votre appareil personnel, il sera nécessaire de renseigner votre compte iCloud dans l'IDE !*

# Technologies

<img src="" />

Pour réaliser l'interface visuelle, nous avons opté pour **SwiftUI** du fait qu'elle permet de réaliser des interfaces utilisateurs complexes de manière élégante. Le framework est récent, mis à jour régulièrement, et facile à prendre en main pour le développement.

# Outils

Pour la partie API, nous avons utilisé plusieurs outils :

- UserDefaults

Pour stocker le token localement, nous utilisons l'outil fourni par SwiftUI qui est UserDefaults, afin de réaliser une authentification automatique lorsque le client ouvre l'application, en récupérant son token lors de la précédente connexion.

<div align="center">

© AllDev - Apple

</div>