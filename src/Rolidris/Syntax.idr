module Rolidris.Syntax

%access public export
%default total

Name : Type
Name = String

data Literal = LInt Int
             | LBool Bool

data Expr = Var Name
          | Lam Name Expr
          | Cls Name Expr (List (Name, Expr))
          | Lit Literal
