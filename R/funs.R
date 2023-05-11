
# custom function
my_function <- function(x){
  file.copy( from = file.path("G:/O meu disco/Bissau/Mangais/Restauro_Mangais/MangaisGEEngine/", x),
               to = file.path("G:/O meu disco/Bissau/Mangais/Restauro_Mangais/restmangaisr/data-raw/", x))
}

