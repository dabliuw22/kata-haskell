module Kata.Likes.Solution where

-- Problem: https://www.codewars.com/kata/5266876b8f4bf2da9b000362

-- | likes
-- >>> likes []
-- "no one likes this"
-- >>> likes ["Peter"]
-- "Peter likes this"
-- >>> likes ["Jacob", "Alex"]
-- "Jacob and Alex like this"
-- >>> likes ["Max", "John", "Mark"]
-- "Max, John and Mark like this"
-- >>> likes ["Alex", "Jacob", "Mark", "Max"]
-- "Alex, Jacob and 2 others like this"
likes :: [String] -> String
likes [] = "no one likes this"
likes [a] = a <> " likes this"
likes [a, b] = a <> " and " <> b <> " like this"
likes [a, b, c] = a <> ", " <> b <> " and " <> c <> " like this"
likes (a : b : _ : _ : xs) = a <> ", " <> b <> " and " <> (show . nextLength) xs <> " others like this"

nextLength :: [a] -> Int
nextLength xs = length xs + 2
