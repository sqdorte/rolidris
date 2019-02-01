module Main

repl : IO ()
repl = do
  input <- putStr "Rolidris> " *> getLine
  (when . not) (input == ":q" || input == ":quit") $ do
    putStrLn $ "you typed: " ++ input
    repl

main : IO ()
main = repl
