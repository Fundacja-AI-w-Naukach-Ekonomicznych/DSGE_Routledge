import sympy

L, K = sympy.symbols('L K')  # Czynniki produkcji: praca (L) i kapitał (K)
a, b = sympy.symbols('a b')  # Parametry funkcji produkcji

# Funkcja produkcji Cobba-Douglasa
Q = L**a * K**b

# Obliczanie pochodnych cząstkowych
dQ_dL = sympy.diff(Q, L)
dQ_dK = sympy.diff(Q, K)

print("Pochodna po L:", dQ_dL)
print("Pochodna po K:", dQ_dK)

# Warunki pierwszego rzędu (równanie pochodnych do zera)
warunek_L = sympy.Eq(dQ_dL, 0)
warunek_K = sympy.Eq(dQ_dK, 0)

print("Warunek pierwszego rzędu dla L:", warunek_L)
print("Warunek pierwszego rzędu dla K:", warunek_K)
