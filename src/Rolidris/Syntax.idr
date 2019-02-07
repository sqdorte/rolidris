module Rolidris.Syntax

%access public export

Name : Type
Name = List Char

data Literal = LInt Int
             | LBool Bool

Map : Type -> Type -> Type
Map a b = List (a, b)

mutual
  Env : Type
  Env = Map Name AST
  
  data AST = Var Name
           | Lam Name AST
           | Cls Name AST Env
           | Lit Literal
