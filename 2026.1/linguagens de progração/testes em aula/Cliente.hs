module Cliente where 

data Cliente = OrgGov String
             | Empresa String Integer String String
             | Individuo String String Bool
             deriving Show 

data Pessoa = Pessoa String String Genero 
            deriving Show 

-- (criando um 'data' "Pessoa" usando outro 'data' "Genero") ghci> Pessoa ("joao" "pedro" Masculino)

data Genero = Masculino
            | Feminino
            | Outro 
            deriving Show 

data Expr = Btrue
          | Bfalse
          | And Expr Expr 
          deriving Show 

nomeCliente :: Cliente -> String
nomeCliente c = case c of 
                    OrgGov n -> n 
                    Empresa n i r c -> n    --n=nome, i=id, r=responsavel, c=cargo 
                    Individuo p ads ->      --nao sei se esta certo
                        case p of 
                            Pessoa n s g -> n   --n=nome, s=sobrenome, g=genero

nomeCliente'' :: Cliente -> String
nomeCliente'' (OrgGov n) = n    --n=nome
nomeCliente'' (Empresa n _ _ _) =n 
nomeCliente'' (Individuo (Pessoa n s _)_ _ ) = n++ " " ++s    --n=nome, s=sobrenome, _=seria o genero mas como nao é usado esta preenchendo espaco ja que nao pode estar vazio
