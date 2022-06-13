#!/bin/bash

# colores
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

# contador
tests_passed=0

# funciones
test_output() {
  output=$($1)
  expected=$2
  if [[ "$output" == "$expected" ]]
  then
    echo -e "[  ${GREEN}OK${NC}  ]: $1 → $2 ${GREEN}✓${NC}"
    tests_passed=$((tests_passed + 1))
  else
    echo -e "[ ${RED}Fail${NC} ]: Esperaba '$expected' pero se obtuvo '$output' ${RED}✗${NC}"
  fi
}

# 1_longwords
test_output "./1_longwords word" "word"
test_output "./1_longwords localization" "l10n"
test_output "./1_longwords internationalization" "i18n"
test_output "./1_longwords algoritmos" "algoritmos"
test_output "./1_longwords organizacion" "o10n"
test_output "./1_longwords hola" "hola"
test_output "./1_longwords permutations" "p10s"
test_output "./1_longwords derazenski" "derazenski"
test_output "./1_longwords desoxirribonucleico" "d17o"
test_output "./1_longwords entschuldigung" "e12g"
test_output "./1_longwords electrocardiograma" "e16a"
test_output "./1_longwords otorrinolaringologo" "o17o"
test_output "./1_longwords database" "database"
test_output "./1_longwords javascript" "javascript"
test_output "./1_longwords electrodomestico" "e14o"
lwords_tests=$tests_passed
echo
# 2_minmax
test_output "./2_minmax 11 100" "23 94 97⬆️ 45 3⬇️ 95 81 81 89 23 "
test_output "./2_minmax 1 10" "3 6 7 5 3 5 6 2 9⬆️ 1⬇️ "
test_output "./2_minmax 1 1000" "383 886 777 915⬆️ 793 335⬇️ 386 492 649 421 "
test_output "./2_minmax 2 10" "0⬇️ 9⬆️ 8 5 1 8 4 7 5 7 "
test_output "./2_minmax 3 10" "6 5 8⬆️ 0⬇️ 5 0 2 6 1 4 "
test_output "./2_minmax 4 10" "1⬇️ 3 4 6 3 7 5 3 8⬆️ 5 "
test_output "./2_minmax 5 10" "5 5 0⬇️ 2 6 2 0 9⬆️ 3 1 "
test_output "./2_minmax 12 50" "10 14 44 8 23 5⬇️ 29 23 47⬆️ 14 "
test_output "./2_minmax 12 100" "60 14 94 8⬇️ 23 55 29 73 97⬆️ 64 "
test_output "./2_minmax 6 100" "41 85 12 65 8 85 86⬆️ 43 2⬇️ 78 "
test_output "./2_minmax 5 1000" "675 765 610 72⬇️ 276 632 920⬆️ 649 73 381 "
test_output "./2_minmax 86 1000" "222 881⬆️ 210⬇️ 728 448 639 782 251 618 461 "
test_output "./2_minmax 54 1000" "680 58⬇️ 928 937⬆️ 245 60 670 236 839 362 "
test_output "./2_minmax 78 1000" "64⬇️ 940⬆️ 837 921 855 276 780 283 870 633 "
test_output "./2_minmax 7 1000" "677 299 899⬆️ 871 325 443 586 97⬇️ 600 153 "
minmax_tests=$(( $tests_passed - $lwords_tests ))
echo
# 3_grades
test_output "./3_grades 1 Gonzalo" "Gonzalo no aprueba con 4.00"
test_output "./3_grades 1 German" "Alumno no encontrado"
test_output "./3_grades 1 Valeria" "Valeria aprueba con 7.50"
test_output "./3_grades 1 Maria" "Maria no aprueba con 5.00"
test_output "./3_grades 2 Maria" "Maria aprueba con 6.00"
test_output "./3_grades 3 Maria" "Maria no aprueba con 4.25"
test_output "./3_grades 1 Juan" "Juan aprueba con 6.25"
test_output "./3_grades 1 Paz" "Alumno no encontrado"
test_output "./3_grades 1 Jorge" "Jorge no aprueba con 5.50"
test_output "./3_grades 1 Juana" "Juana no aprueba con 4.50"
test_output "./3_grades 3 Facundo" "Alumno no encontrado"
test_output "./3_grades 3 Santiago" "Alumno no encontrado"
test_output "./3_grades 3 Viviana" "Alumno no encontrado"
test_output "./3_grades 12 Juana" "Juana aprueba con 6.25"
test_output "./3_grades 12 Pedro" "Pedro aprueba con 8.00"
test_output "./3_grades 13 Pedro" "Pedro aprueba con 7.25"
test_output "./3_grades 33 Antonio" "Antonio aprueba con 6.50"
test_output "./3_grades 34 Guillermo" "Guillermo aprueba con 8.00"
test_output "./3_grades 35 Florencia" "Florencia aprueba con 6.75"
test_output "./3_grades 42 Florencia" "Florencia no aprueba con 5.25"
grades_tests=$(( $tests_passed - $lwords_tests - $minmax_tests ))
# resultado final
echo
echo "--------------  Resultado  --------------"
if [[ $tests_passed -eq 50 ]]
then
  echo -e "Todos los tests pasaron ${GREEN}✓${NC}"
  echo "Nota: " $(bc -l <<< "scale=2; (10/50) * $tests_passed")
else
  echo -e "1_longwords: $lwords_tests ${GREEN}✓${NC}"
  echo -e "2_minmax: $minmax_tests ${GREEN}✓${NC}"
  echo -e "3_grades: $grades_tests ${GREEN}✓${NC}"
  echo
  echo "Total: $tests_passed/50 tests OK."
  echo "Nota: " $(bc -l <<< "scale=2; (10/50) * $tests_passed")
fi

exit 0
