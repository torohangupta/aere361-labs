shell:
	gcc shell.c -o shell -lm

gauss_jordan:
	gcc gauss_jordan.c -o gauss_jordan -lm

ex1:
	gcc matrix_test.c -o matrix_test -lm

ex2:
	gcc order_test.c -o order_test -lm

piv_vort:
	gcc piv_vort.c -o piv_vort -lm

clean:
	rm piv_vort Vort.txt Xvel.txt Yvel.txt ans.out shell gauss_jordan

test_piv_vort: piv_vort
	bash tests/test_piv_vort.sh

test_piv_vort_curl: piv_vort
	bash tests/test_piv_vort_curl.sh

test_shell: shell
	bash tests/test_shell.sh

test_gauss_jordan: gauss_jordan
	bash tests/test_gauss_jordan.sh

test_ex1: ex1
	bash tests/test_ex1.sh

test_ex2: ex2
	bash tests/test_ex2.sh

test_all: shell piv_vort gauss_jordan
	bash tests/test_shell.sh
	bash tests/test_piv_vort.sh
	bash tests/test_piv_vort_curl.sh
	bash tests/test_gauss_jordan.sh
