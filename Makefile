CC = gcc
CFLAGS = -std=c11 -Wall -Wextra -Wpedantic -g -DMAT_TEST_ALLOC

# Tous les modules du projet
MODULES = matrice.c matrice_alloc.c matrice_io.c matrice_calcul.c

# all : créer les executables de tous les tests et du programme principal
all: test_ex1 test_ex2 test_ex3 demo_matrices

# test_ex1 : compile les modules de l'exercice 1 pour créer l'executable test_ex1
test_ex1: test_ex1.c matrice.c matrice_alloc.c
	$(CC) $(CFLAGS) $^ -o $@

# test_ex2 : compile les modules de l'exercice 2+1 pour créer l'executable test_ex2
test_ex2: test_ex2.c matrice.c matrice_alloc.c matrice_io.c
	$(CC) $(CFLAGS) $^ -o $@

# test_ex3 : compile les modules de l'exercice 3+2+1 pour créer l'executable test_ex3
test_ex3: test_ex3.c $(MODULES)
	$(CC) $(CFLAGS) $^ -o $@

# demo_matrices : compile tous les modules du projet pour créer l'executable demo_matrices
demo_matrices: main.c $(MODULES)
	$(CC) $(CFLAGS) $^ -o $@

# supprime tout les exécutables créer et le fichier créer par mat_ecrire lors de l'éxecution de test_ex2
clean:
	rm -f test_ex1 test_ex2 test_ex3 demo_matrices test_ex2_sortie.txt
