# Modélisation et Commande d'un Four Électrique sous MATLAB

Ce dépôt présente un projet d'Automatique (module UL3EE111) réalisé à Sorbonne Université. L'objectif est la modélisation, l'analyse et la synthèse d'une loi de commande pour réguler la température d'un four électrique industriel.

Ce projet inclut les codes sources MATLAB/Simulink ainsi que le rapport d'étude complet détaillant l'approche mathématique. (pdf)

---

### 1. Cahier des Charges Industriel
Le système doit assurer le traitement thermique de pièces métalliques selon des contraintes strictes :
* **Température cible** : Atteindre et maintenir 1200°C pendant 1 heure.
* **Contrainte de sécurité** : Ne dépasser en aucun cas 1400°C (risque de destruction des pièces).
* **Productivité** : Assurer une dynamique suffisamment rapide pour réaliser 3 cycles complets de traitement (chauffe, maintien, refroidissement de 24 min) sur une journée de 24 heures.

---

### 2. Modélisation du Système (Fichiers .m et .slx)
Le système a été mis en équation et implémenté sous **MATLAB/Simulink**.

* **Le Four (G(p))** : Modélisé par un système du second ordre intégrant un comportement intégrateur pur, le rendant marginalement stable en boucle ouverte.
* **Le Capteur (H(p))** : Modélisé par un premier ordre. Sa constante de temps étant négligeable face à l'inertie thermique du four, le modèle a été réduit à son gain statique pour la synthèse de la commande.

---

### 3. Analyse et Synthèse du Correcteur

* **Limites du correcteur proportionnel (Kp)** : L'analyse a démontré qu'un simple gain Kp ne permettait pas de satisfaire le compromis rapidité/stabilité (soit un dépassement de 30.5% violant la sécurité, soit un système trop lent).
* **Correcteur à Avance de Phase** : Pour répondre aux critères, un correcteur à avance de phase a été synthétisé analytiquement. L'objectif fréquentiel était d'imposer une marge de phase de 60° à une pulsation de coupure spécifique pour compenser le retard du système.

---

### 4. Résultats et Rapport (PDF)
Les simulations valident la robustesse de la commande : erreur statique nulle, stabilisation à 1200°C sans dépassement transitoire, et validation de la cadence industrielle (plus de 3 cycles par 24h). 

Le détail complet des calculs mathématiques, des diagrammes de Bode et des chronogrammes de simulation est disponible dans le fichier PDF joint à ce dépôt.
