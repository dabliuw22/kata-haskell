module Main where

import Lib

main :: IO ()
main = do
  {-
    Sheldon,Leonard,Penny,Rajesh,Howard,
    2Sheldon,2Leonard,2Penny,2Rajesh,2Howard,
    4Sheldon,4Leonard,4Penny,4Rajesh,4Howard,
    8Sheldon,8Leonard,..
  
    whoIsNext 50 -> Leonard
    50 - 5 - 10 - 20 - 8 = 7
    7 <= 8Leonard -> Leonard
  -}
  let name = whoIsNext 50 $ groups initGroups
   in print $ "Result: " <> show name
