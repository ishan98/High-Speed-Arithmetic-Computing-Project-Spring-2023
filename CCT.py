def Const(n, r, k):
    m = n
    S = m + n - r
    E1, E2 = 0, 0
    for q in range(0, S - k):
        E1 = E1 + (q + 1)*(2.0**(-m-n+q))*(0.25)
    for z in range (S - k, S):
        E2 = E2 + (0.5) * (2.0**(-m -n + z))
    
    E = E2 + E1

    C = round(E*(2.0**(r + k)))
    E1 = round(E1*(2.0**(r + k)))
    E2 = round(E2*(2.0**(r + k)))
    return C, E1, E2

def HCT_Const(n , r, k, N):
    m = n
    S = m + n - r
    hct = N*(0.25)*(2.0**(-r - k - 1))

    (temp, cct) = Const( n , r, k)

    C = round((cct - hct)*(2.0**(r + k)))

    return C

print(Const(25, 32, 0))
print(Const(25, 32, 2))
print(Const(25, 32, 4))
print(Const(25, 32, 8))
print(Const(25, 32, 12))