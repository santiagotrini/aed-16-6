// 3_grades
// usar strcmp() para buscar si un alumno esta en la lista
// strcmp(s1, s2)
// string compare devuelve 0 si dos strings (s1 y s2) son iguales
// strcmp("hola", "hola") -> 0

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char *argv[]) {
  // no borrar
  int s = atoi(argv[1]);
  srand(s);
  // lista de alumnos
  char *alumnos[] = {
    "Juan",
    "Maria",
    "Pedro",
    "Jorge",
    "Juana",
    "Guillermo",
    "Antonio",
    "Florencia",
    "Valeria",
    "Gonzalo"
  };
  // no borrar lo de arriba
  // solucion aca abajo

  return 0;
}
