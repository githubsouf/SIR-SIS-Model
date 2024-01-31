# SIR-SIS-Model-Using-Runge-Kutta-4

Présentation du virus Conficker
Depuis son introduction dans les années 1900, les logiciels malveillants ont
représenté une menace majeure pour le secteur technologique. Un moment clé de
cette histoire s’est produit avec l’émergence du ver "Conficker" en 2008, développé
par des programmeurs ukrainiens. Son impact a été profond, infectant environ 11
millions d’appareils. Malgré les efforts déployés pour atténuer sa propagation, son
héritage reste manifesté.
En septembre 2017, des rapports indiquaient que près de 15 000 machines
étaient encore infectées. De tels jalons soulignent les défis évolutifs et persistants
posés par les malwares, soulignant la nécessité d’une recherche continue et d’une
vigilance accrue dans le domaine de la cybersécurité.
.
Le modèle SIR est un outil mathématique étudiant la propagation des maladies dans
une population, divisée en trois compartiments : Susceptibles (S), Infectés (I), et Rétablis/Récupérés (R).
Le modèle SIS se concentre sur les individus pouvant être infectés, guéris, puis redevenir susceptibles, permettant l’étude des cycles de transmission. Il a deux compartiments :
Susceptibles (S) et Infectés (I).
.
La méthode de Runge-Kutta est une technique numérique reconnue pour résoudre
efficacement des équations différentielles ordinaires.
Son utilisation pour les modèles SIR et SIS adaptés aux virus informatiques offre plusieurs avantages. Premièrement, la méthode permet une discrétisation précise du temps,
essentielle pour suivre la propagation rapide des virus dans des environnements informatiques complexes. Deuxièmement, sa robustesse et sa capacité à traiter des conditions
initiales variées permettent de simuler efficacement des scénarios d’infection à grande
échelle, tout en prenant en compte les interactions entre les différents nœuds du réseau.
En somme, l’application de la méthode de Runge-Kutta au modèle SIR pour les virus
informatiques facilite une analyse approfondie et précise de la propagation des menaces
numériques, contribuant ainsi à renforcer la cybersécurité et à protéger les systèmes contre
les attaques potentielles.
.
.
— Taux de transmission () = 1.44.
— Taux de récupération () = 0.48.
— S(0) = 120,000 : Nombre initial d’individus susceptibles.
— I(0) = 10 : Nombre initial d’individus infectés.
— R(0) = 0 : Nombre initial d’individus rétablis (généralement mis à 0).
— Pas de temps (n = 20) : Spécifie la taille de l’intervalle de temps entre les points
de temps successifs pour l’évaluation des valeurs des compartiments.
Pour code 1, on définira ensuite la fonction RK4SIR qui utilisera la méthode de RungeKutta d’ordre 4 (RK4) pour prédire l’évolution des compartiments Susceptibles (S) et
Infectés (I) dans le temps pour enfin déduire les valeurs de R avec (R = N - S - I, où N
est la taille totale de la population). Pour code 2 qui concerne le modèle SIS, on utilisera
une fonction similaire RK4SIS qui n’aura pas recours aux valeurs R. La fonction RK4
commence par estimer les taux de changement des compartiments Susceptibles (S) et
Infectés (I) à partir des valeurs actuelles. Ensuite, elle utilise des valeurs intermédiaires
pour affiner ces estimations. Ces valeurs intermédiaires représentent des approximations
à mi-chemin entre deux pas de temps consécutifs (dt/2). En répétant ce processus, RK4 améliore progressivement sa prédiction de la propagation de la maladie, permettant ainsi
d’obtenir des prédictions plus fiables et détaillées de l’évolution de la population à chaque
pas de temps.[2]
On représentera ces résultats dans un graphe qui modélisera l’évolution de chaque
compartiment S, I et R
