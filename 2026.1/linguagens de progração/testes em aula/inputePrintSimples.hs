main :: IO()
main = do 
    putStrLn ("texto printado")
    recebe <- getLine   --recebe um input do teclado
    putStrLn ("voce digitou " ++ recebe ++ " antes")
