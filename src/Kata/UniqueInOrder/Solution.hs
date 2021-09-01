module Kata.UniqueInOrder.Solution where

-- Problem: https://www.codewars.com/kata/54e6533c92449cc251001667

{-
uniqueInOrder :: Eq a => [a] -> [a]
uniqueInOrder [] = []
uniqueInOrder [a] = [a]
uniqueInOrder (a : b : xs)
  | a == b = uniqueInOrder (b : xs)
  | otherwise = a : uniqueInOrder (b : xs)
-}

{-
import Data.List (foldl')

uniqueInOrder :: Eq a => [a] -> [a]
uniqueInOrder = reverse . aux
  where
    f acc elem
      | null acc || elem /= head acc = elem:acc
      | otherwise = acc
    aux word' = foldl' f [] word'
-}

{-
import Data.List (group)
uniqueInOrder :: Eq a => [a] -> [a]
uniqueInOrder = map head . group
-}

-- | uniqueInOrder
-- >>> uniqueInOrder "AAAABBBCCDAABBB"
-- "ABCDAB"
-- >>> uniqueInOrder "ABBCcAD"
-- "ABCcAD"
-- >>> uniqueInOrder [1,2,2,3,3]
-- [1,2,3]
uniqueInOrder :: Eq a => [a] -> [a]
uniqueInOrder = reduce []
  where
    reduce :: Eq a => [a] -> [a] -> [a]
    reduce state [] = reverse state
    reduce [] (x : xs) = reduce [x] xs
    reduce state@(s : _) (x : xs)
      | x == s = reduce state xs
      | otherwise = reduce (x : state) xs

-- | uniqueInOrderRle
-- >>> uniqueInOrderRle "AAAABBBCCDAABBB"
-- [(4,'A'),(3,'B'),(2,'C'),(1,'D'),(2,'A'),(3,'B')]
-- >>> uniqueInOrderRle "ABBCcAD"
-- [(1,'A'),(2,'B'),(1,'C'),(1,'c'),(1,'A'),(1,'D')]
-- >>> uniqueInOrderRle [1,2,2,3,3]
-- [(1,1),(2,2),(2,3)]
uniqueInOrderRle :: Eq a => [a] -> [(Int, a)]
uniqueInOrderRle = reduce []
  where
    reduce :: Eq a => [(Int, a)] -> [a] -> [(Int, a)]
    reduce state [] = reverse state
    reduce [] (x : xs) = reduce [(1, x)] xs
    reduce state@((n, s) : ss) (x : xs)
      | x == s = reduce ((n + 1, s) : ss) xs
      | otherwise = reduce ((1, x) : state) xs
