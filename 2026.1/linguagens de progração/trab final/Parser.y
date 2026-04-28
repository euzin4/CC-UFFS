{
module Parser
import Lexer
}

%name parser
%tokentype { Token }
%error { parseError }

%token 
    num     { Token $$ }
    '+'     { TokSoma }
    '*'     { TokMult }
    '('     { TokAbrePar }
    ')'     { TokFechaPar }

%%

Exp : Num           { Num $1 }
    | Exp '+' Exp   { Soma $1 $3 }
    | Exp '*' Exp   { Mult $1 $3 }
    | '(' Exp ')'   { $2 }

{
parseError :: [Token] -> a 
parseError _ = error "Erro sintatico"
}
