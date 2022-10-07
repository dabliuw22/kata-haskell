module Kata.BirthdayParadox.Solution where

-- Problem: https://en.wikipedia.org/wiki/Birthday_problem

{-
In a room with 23 people, what is the probability that 2 of them celebrate their birthdays on the same day?
Assume ordinary years (365 days)
-}
calculate :: Int -> Double
calculate n
  | n > 365 = 1
  | n <= 0 = 0
  | otherwise =
    1
      - foldl
        (\prob i -> prob * (365 - fromInteger i) / 365)
        1.0
        [0 .. toInteger n - 1]
