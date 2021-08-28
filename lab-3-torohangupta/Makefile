ex1:
	gcc ex1.c -o ex1

ex2:
	gcc ex2.c -o ex2

ex3:
	gcc ex3.c -o ex3

ex4:
	gcc ex4.c -o ex4

ex5:
	gcc ex5.c -o ex5

ex6:
	gcc ex6.c -o ex6

ex7:
	gcc ex7.c -o ex7

clean:
	rm ex1 ex2 ex3 ex4 ex5 ex6 ex7

test_ex1: ex1
	bash tests/test_ex1.sh

test_ex2: ex2
	bash tests/test_ex2.sh

test_ex3: ex3
	bash tests/test_ex3.sh

test_ex4: ex4
	bash tests/test_ex4.sh

test_ex5: ex5
	bash tests/test_ex5.sh

test_ex6: ex6
	bash tests/test_ex6.sh

test_ex7: ex7
	bash tests/test_ex7.sh

test_all: ex1 ex2 ex3 ex4 ex5 ex6 ex7
	bash tests/test_ex1.sh
	bash tests/test_ex2.sh
	bash tests/test_ex3.sh
	bash tests/test_ex4.sh
	bash tests/test_ex5.sh
	bash tests/test_ex6.sh
	bash tests/test_ex7.sh