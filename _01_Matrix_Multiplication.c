#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <omp.h>


#define N 2000

void Matrix_Multiplication_OpenMp(double **arr1, double **arr2, double **ans_mat){
  #pragma omp tile sizes(64,64,64)
  //#pragma omp parallel for collapse(2) schedule(static)
        for(int i=0; i<N; i++){
          for(int j=0; j<N; j++){
            for(int k=0; k<N; k++){
                ans_mat[i][j] += arr1[i][k]*arr2[k][j] ;
              }
            }
          }
  return ;  
}

void Matrix_Multiplication_Tiling(double **arr1, double **arr2, double **ans_mat){
  
}
void Matrix_Multiplication(double **arr1, double **arr2, double **ans_mat){

        for(int i=0; i<N; i++){
          for(int j=0; j<N; j++){
            for(int k=0; k<N; k++){
                ans_mat[i][j] += arr1[i][k]*arr2[k][j] ;
              }
            }
          }
   return ; 
}

void display(double **arr){
	for(int i=0; i<N; i++){
	  for(int j=0; j<N; j++){
	  		printf("%.2lf ",arr[i][j]);
	  	}
	  	printf("\n");
		}
		printf("\n");	
}

void read_file(double **arr, FILE *file){
  /* char line[105] ;
  int k= 0 ;
  while(fgets(line, sizeof(line), file)){
    int num ;
    int m=0 ;
    int offset ;
    char *token = line ;
    while(sscanf(token, "%d%n", &num, &offset)==1){
      arr[k][m] = num ;
      m++ ;
      token += offset ;
      if(m>99) break ;
    }
    k++ ;
    if(k>99)break ;
  }
  printf("%d\n",k) ; */
  for(int i=0; i<N; i++){
    for(int j=0; j<N; j++){
      if(fscanf(file, "%lf", &arr[i][j])!=1){
         printf("Error reading input at index [%d][%d]\n", i, j);
        return ; 
      }
    }
  }
}

void print_output_file(double **ans_mat){
  FILE *ans_file;
  ans_file = fopen("ans_file", "w");
  for(int i=0; i<N; i++){
    for(int j=0; j<N; j++){
        fprintf(ans_file,"%.2lf ",ans_mat[i][j]);
      }
      fprintf(ans_file,"\n");
    }
    fclose(ans_file); 
}


int main(int argc, char *argv[]){
  double **arr1 ;
  double **arr2 ;
  double **ans_mat;

  double start, end; 

  //make the 100 rows first
  arr1 = (double **)malloc(sizeof(double *)*N) ;
  arr2 = (double **)malloc(sizeof(double *)*N) ;
  ans_mat = (double **)malloc(sizeof(double *)*N) ; 

  
  //make the each 100 int colums in the 100 rows ;
  for(int i=0; i<N; i++){
    arr1[i] = (double *)malloc(sizeof(double)*N) ;
    arr2[i] = (double *)malloc(sizeof(double)*N) ;
    ans_mat[i] = (double *)calloc(N, sizeof(double));
  }

  FILE *file1, *file2,*ans_file ;
  file1 = fopen(argv[1],"r") ;
  if(!file1){
    printf("Error in the file opening 1") ;
    return 0;
  }else{
    printf("File 1 read complete\n");
  }
  file2 = fopen(argv[2],"r") ;
  if(!file2){
    printf("Error in the file opening 2");
    return 0; 
  }else{
    printf("File 2 reading complete\n");
  }
  
  read_file(arr1, file1);
  read_file(arr2, file2);

  display(arr1);
  printf("File 1 complte\n");  
  display(arr2);
  printf("File 2 complete\n");

  start = clock();
  Matrix_Multiplication(arr1, arr2, ans_mat);
  print_output_file(ans_mat);
  end = clock();
  display(ans_mat);
  printf("\n%lf sec time for simple Multiplication\n",((end-start)/CLOCKS_PER_SEC));

  start = clock();
  //#pragma omp parallel
  Matrix_Multiplication_OpenMp(arr1, arr2, ans_mat);
  end = clock();
  printf("\n%lf sec time using the openmp\n",((end-start)/CLOCKS_PER_SEC));

  fclose(file1);
  fclose(file2); 
  return 0 ;

}
