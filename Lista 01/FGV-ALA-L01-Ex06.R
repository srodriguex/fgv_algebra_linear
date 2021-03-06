# Retorna a matriz triangular inferior de uma matriz como par�metro.
lowtri <- function(matr) {
  lt <- matrix(0, nrow=nrow(matr), ncol=ncol(matr))
  for (i in 1:nrow(matr)) {
    for (j in 1:i) {
      lt[i,j] <- matr[i,j]
    }
  }
  return(lt)
}

# IN�CIO DO PROGRAMA.
# Determina tamanho da matriz n*n.
n = 10

# Define matriz triangular inferior com valores aleat�rios.
L = lowtri(matrix(sample(1:n^2),c(n,n)))

# Define vetor aleat�rio.
b = sample(1:n,n)

# Concatena matrizes para elimina��o gaussiana.
matriz = cbind(L,b)

# Resolve com elimina��o gaussiana.
n = nrow(matriz)
for(j in 1:(n-1)){
  matriz[j,] = matriz[j,]/matriz[j,j]
  for(i in (j+1):n){
    matriz[i,] = matriz[i,]-(matriz[i,j]*matriz[j,])
  }
}
matriz[n,] = matriz[n,] /matriz[n,n] 

# Imprime fim da elimina��o.
matriz