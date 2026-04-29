{
module Parser where 
import Lexer
}

%name parser
%tokentype { Token }
%error { parseError }

%token 
    num         { TokNum $$ }
    '+'         { TokSoma }
    '*'         { TokMult }
    '('         { TokAbrePar }
    ')'         { TokFechaPar }

-- o operador mais a baixo tem mais prioridade
%left '+'
%left '*' 

%% 

Exp : num               { Num $1 }
    | Exp '+' Exp       { Soma $1 $3 }
    | Exp '*' Exp       { Mult $1 $3 }
    | '(' Exp ')'       { $2 }

{
parseError :: [Token] -> a 
parseError _ = error "Erro sintático!"
}
