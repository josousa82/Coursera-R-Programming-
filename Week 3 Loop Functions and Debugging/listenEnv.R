listEnv <- function (){
g <- globalenv()

while (environmentName(g) != 'R_EmptyEnv') {
  g <- parent.env(g);
  cat(str(g, give.attr = F))
  
}
}