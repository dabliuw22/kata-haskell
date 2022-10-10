module Kata.BitCounting.Solution (countBits) where

-- Problem: https://www.codewars.com/kata/526571aae218b8ee490006f4

-- | countBits
-- >>> countBits 0
-- 0
-- >>> countBits 1
-- 1
-- >>> countBits 156
-- 4
countBits :: Int -> Int
countBits n = (length . filter (== 1)) (toBinary n [])

toBinary :: Int -> [Int] -> [Int]
toBinary 0 accum = 0 : accum
toBinary 1 accum = 1 : accum
toBinary n accum
  | even n = toBinary (quot n 2) (0 : accum)
  | otherwise = toBinary (quot n 2) (1 : accum)
