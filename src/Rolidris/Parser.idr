module Rolidris.Parser

import Rolidris.Syntax
import Lightyear
import Lightyear.Char
import Lightyear.Combinators
import Lightyear.Strings

%access public export

identifier : Parser Name
identifier = (::) <$> letter <*> many alphaNum <?> "identifier"

literalInt : Parser AST
literalInt = Lit <$> LInt <$> integer

literalBool : Parser AST
literalBool = Lit <$> do
  b <- string "True" <|> string "False"
  pure $ case b of
    "True" => LBool True
    "False" => LBool False

var : Parser AST
var = Var <$> identifier

parseTerm : Parser AST
parseTerm =  (literalBool <?> "boolean")
         <|> (literalInt <?> "number")
         <|> (var <?> "identifier")
