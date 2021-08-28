number_gen:
	gcc number_gen.c -o number_gen

head:
	gcc head.c -o head

tail:
	gcc tail.c -o tail

mac_exp:
	gcc mac_exp.c -o exp -lm

361_calc:
	gcc 361_calc.c -o 361_calc -lm

clean:
	rm number_gen head tail mac_exp 361_calc

test_number_gen: number_gen
	bash tests/test_number_gen.sh

test_head: head
	bash tests/test_head.sh

test_tail: tail
	bash tests/test_tail.sh

test_mac_exp: mac_exp
	bash tests/test_mac_exp.sh

test_361_calc: 361_calc
	bash tests/test_361_calc.sh

test_all: number_gen head tail mac_exp 361_calc
	bash tests/test_number_gen.sh
	bash tests/test_head.sh
	bash tests/test_tail.sh
	bash tests/test_mac_exp.sh
	bash tests/test_361_calc.sh
