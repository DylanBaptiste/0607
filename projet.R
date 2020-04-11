library(ggplot2)
library(readr)
library(dplyr)

pokemons <- read_csv("pokemon.csv")
#summary(pokemons)


#Répartition des types de Pokemon en fonction des générations
#ggplot(data = pokemon, aes(x=Generation)) + geom_bar(aes(fill=pokemon$"Type 1")) + scale_fill_discrete(name = "Type")  +  xlab("Génération") + ylab("Total")

#Legendaire en fonction des générations
#ggplot(data = pokemon, aes(x=Generation)) + geom_bar(aes(fill=pokemon$Legendary))

#WaterPokemon <- pokemons[pokemons$"Type 1" == "Water", ]
#ggplot(data = WaterPokemon, aes(x="Type 2")) + geom_bar(aes(fill=WaterPokemon$Generation))
#unique <- unique(pokemon$Name);

pokemons <- cbind(pokemons, c(rep(0, max(pokemons$"#"))))  
colnames(pokemons)[13] <- "NbType"

pokemons

length(t(unique(pokemons["Type 1"])))

for (nb in 1:length(t(unique(pokemons["Type 1"])))) {
  pokemons$"NbType"[pokemons$"Type 1" == unique(pokemons["Type 1"])[nb,] ] <- length(which(pokemons["Type 1"] == unique(pokemons["Type 1"])[nb,]))
}


pokemons


