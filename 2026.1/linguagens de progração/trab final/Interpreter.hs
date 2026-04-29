module Interpreter where 

import Lexer
import Parser 

aval :: Expr -> Int 
aval (Num n) = n 
aval (Soma e1 e2) = 
    let v1 = aval e1 
        v2 = aval e2 
      in v1 + v2 
aval (Mult e1 e2) = 
    let v1 = aval e1 
        v2 = aval e2
      in v1 * v2

passo :: Expr -> Maybe Expr 
passo (Soma (Num n1) (Num n2)) = Just (Num (n1 + n2))
passo (Soma (Num n1) e2) = do 
    e2' <- passo e2 
    return (Soma (Num n1) e2')
passo (Soma e1 e2) = 
    case passo e1 of 
      Just e1' -> Just (Soma e1' e2)
      _        -> Nothing 
passo (Mult (Num n1) (Num n2)) = Just (Num (n1 * n2))
-- passo (Se True e2 e3) - Just e2  
-- passo (Se False e2 e3) - Just e3 
passo (Se e1 e2 e3) = do 
    e1' <- passo e1 
    return (Se e1' e2 e3)
passo _ = Nothing
-- Implementar a multiplicação 
-- Implementar a subtração e divisao

-- executar :: 