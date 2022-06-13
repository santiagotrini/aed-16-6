1_longwords: 1_longwords.c
	@gcc -o 1_longwords 1_longwords.c

2_minmax: 2_minmax.c
	@gcc -o 2_minmax 2_minmax.c

3_grades: 3_grades.c
	@gcc -o 3_grades 3_grades.c

clean:
	@rm 1_longwords 2_minmax 3_grades

test: 1_longwords 2_minmax 3_grades
	@bash tests.sh
