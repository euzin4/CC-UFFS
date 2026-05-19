module Lexer where

import Data.Char (isDigit, isSpace)

data Token
    = TokNum Int
    | TokSoma 
    | TokMult
    | TokAbrePar
    | TokFechaPar
    deriving (Show, Eq)

data Expr 
    = Num Int
    | Booleano Bool 
    | Soma Expr Expr
    | Mult Expr Expr
    | Igual Expr Expr
    | Se Expr Expr Expr
    deriving (Show, Eq)

lexer :: String -> [Token]
lexer [] = []
lexer (c:cs)
    | isSpace c = lexer cs
    | isDigit c = lexNum (c:cs)
    | c == '+'  = TokSoma : lexer cs
    | c == '*'  = TokMult : lexer cs
    | c == '('  = TokAbrePar : lexer cs
    | c == ')'  = TokFechaPar : lexer cs
    | otherwise = error ("Erro léxico: caractere inválido: " ++ [c])

lexNum :: String -> [Token]
lexNum cs = case span isDigit cs of
    (numStr, rest) -> TokNum (read numStr) : lexer rest
