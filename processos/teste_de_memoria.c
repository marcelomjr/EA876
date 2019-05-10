
#include <stdio.h>
#include <stdlib.h> /* exit() */
#include <sys/types.h> /* define pid_t */
#include <sys/wait.h>
#include <unistd.h> /* fork() */

int main() {
  pid_t pid;
  char test = 't';
  char* heap_test;
  int wstatus = 3;
  
  heap_test = malloc(sizeof(char));
  *heap_test = 't';

  printf("Before fork: Addresses [test:%p|heap_test: %p]\n", &test, &heap_test);
  
  pid = fork();
  if (pid==0) {
    printf("Processo filho\n");
  
  
    printf("After fork (child) Addresses: [test:%p|heap_test: %p]\n", &test, &heap_test);
    
    
    
    printf("Child: Before change: %c|%c\n", test, *heap_test);
    test = 'c';
    *heap_test = 'C';

    printf("Child: After change: %c|%c\n", test, *heap_test);
    
    
  
    printf("Saindo do proceso filho\n");
    exit(0);
  }
    printf("After fork (child) Addresses: [test:%p|heap_test: %p]\n", &test, &heap_test);
  
    printf("Parent: before change: %c|%c\n", test, *heap_test);
    
    test = 'p';
    *heap_test = 'P';
    
    
    printf("Parent: After change: %c|%c\n", test, *heap_test);
    

  
  printf("Processo pai. PID do filho: %d\n", pid);
  
  printf("Esperando processo filho\n");
  waitpid(pid, &wstatus, 0);

  printf("Saiu do processo filho. Encerrando\n");
  printf("Saindo do processo pai\n");
  
  return 0;
}
