module Kata.Parentheses.Solution (validParentheses) where

-- Problem: https://www.codewars.com/kata/52774a314c2333f0a7000688/train/haskell

-- | validParentheses
-- >>> validParentheses "()"
-- True
-- >>> validParentheses ")("
-- False
-- >>> validParentheses ")"
-- False
-- >>> validParentheses "(())((()())())"
-- True
-- >>> validParentheses "()()((((((((((((()))))))))))))()"
-- True
validParentheses :: String -> Bool
validParentheses xs = reduce [] xs
  where
    reduce :: [Char] -> [Char] -> Bool
    reduce [] [] = True
    reduce [] (x : xs) = reduce [x] xs
    reduce (_ : _) [] = False
    reduce stack@(s : ss) (x : xs)
      | s == '(' && x == ')' = reduce ss xs
      | otherwise = reduce (x : stack) xs
