dobro :: Int -> Int             --define que a entrada(primeiro Int) e a saida(segundo Int) da funcao dobro serão 'Int'
dobro x = x + x

quadruplo x = dobro(dobro x)    --reusando a funcao

vabs :: Integer -> Integer
vabs n  | n >= 0 = n
        | n < 0 = -n

sinal :: Integer -> Integer
sinal n | n == 0 = 0
        | n < 0 = -1
        | otherwise = 1

firstOrEmpty lst =  if not(null lst)   --funciona somente com char
                    then head lst
                    else "empty"

firstOrEmpty2 :: [Int] -> String        --funciona somente com Int e converte a saida como string usando o comando 'show'
firstOrEmpty2 lst =  if not (null lst) 
                    then show(head lst)
                    else "empty"
