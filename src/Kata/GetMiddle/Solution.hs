module Kata.GetMiddle.Solution (getMiddle) where

-- Problem: https://www.codewars.com/kata/56747fd5cb988479af000028

-- | getMiddle
-- >>> getMiddle "test"
-- "es"
-- >>> getMiddle "testing"
-- "t"
-- >>> getMiddle "A"
-- "A"
getMiddle :: String -> String
getMiddle "" = ""
getMiddle [a] = [a]
getMiddle x@[_, _] = x
getMiddle (_ : xs) = getMiddle $ init xs

{-
getMiddle :: String -> String
getMiddle [] = []
getMiddle word =
  let size = length word
      middle = size `div` 2
   in reduce word size middle
  where
    reduce :: String -> Int -> Int -> String
    reduce word' size' middle'
      | even size' =
        let (h, t) = splitAt middle' word'
         in [last h, head t]
      | otherwise =
        let (h, _) = splitAt (middle' + 1) word'
         in [last h]
-}
