integration: integration.c
	gcc main.c -o integration -lm

bounds:
	gcc bounds.c -o bounds -lm

hangman:
	gcc hangman.c -o hangman

clean:
	rm integration shell bounds hangman ans.out

test_integration: integration
	bash tests/test_integration.sh

test_bounds: bounds
	bash tests/test_bounds.sh

test_hangman: hangman
	bash tests/test_hangman.sh

test_all: integration bounds hangman
	bash tests/test_integration.sh
	bash tests/test_bounds.sh
	bash tests/test_hangman.sh