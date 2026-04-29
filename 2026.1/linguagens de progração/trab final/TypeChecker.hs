module TypeChecker where 

import Lexer
import Parser 

data Tipo 
    = TInt 
    | TBool
    deriving (Show, Eq)

infereTipo :: Expr -> Either String Tipo 
infereTipo (Num _) = Right TInt 
infereTipo (Booleano _) = Right TBool

infereTipo (Soma e1 e2) = do 
    t1 <- infereTipo e1 
    t2 <- infereTipo e2 
    if t1 == TInt && t2 == TInt 
        --terminar (tem no slide)