module Kata.DigitalRoot.Solution where

-- Problem: https://www.codewars.com/kata/541c8630095125aba6000c00/haskell

-- Reference: https://en.wikipedia.org/wiki/Digital_root#Significance_and_formula_of_the_digital_root

-- | digitalRoot
-- >>> digitalRoot 19990
-- 1
-- >>> digitalRoot 19999
-- 1
-- >>> digitalRoot 942
-- 6
digitalRoot :: Integral a => a -> a
digitalRoot input
  | input >= 10 = digitalRoot $ (sum . digits) input
  | otherwise = input

-- | digits
--         1      19      199    1999   19999
-- (((([] ++ [1]) ++ [9]) ++ [9]) ++ [9]) ++ [9]
digits :: Integral a => a -> [a]
digits 0 = []
digits x = digits (x `div` 10) ++ [x `mod` 10]
