module Kata.DoubleCola.Solution where

-- Problem: https://www.codewars.com/kata/551dd1f424b7a4cdae0001f0
type Name = String

initNames :: [Name]
initNames = ["Sheldon", "Leonard", "Penny", "Rajesh", "Howard"]

{-
doubleName :: Name -> [Name]
doubleName name = [name, name]

names :: [Name] -> [Name]
names n = n ++ names (n >>= doubleName)

whoIsNext :: Int -> [Name] -> Maybe Name
whoIsNext _ [] = Nothing
whoIsNext index (x : xs)
  | index <= 0 = Nothing
  | index == 1 = Just x
  | otherwise = whoIsNext (index - 1) xs
-}

-- With Run-length encoding: https://en.wikipedia.org/wiki/Run-length_encoding
data Group = Group
  { size :: Int,
    name :: Name
  }
  deriving (Show)

initGroups :: [Group]
initGroups = Group 1 <$> initNames

doubleGroup :: Group -> Group
doubleGroup group = group {size = 2 * size group}

groups :: [Group] -> [Group]
groups [] = []
groups ns = ns ++ groups (doubleGroup <$> ns)

-- | whoIsNext
-- >>> whoIsNext 1 $ groups initGroups
-- Just "Sheldon"
-- >>> whoIsNext 50 $ groups initGroups
-- Just "Leonard"
-- >>> whoIsNext 52 $ groups initGroups
-- Just "Penny"
-- >>> whoIsNext 7230702951 $ groups initGroups
-- Just "Leonard"
whoIsNext :: Int -> [Group] -> Maybe Name
whoIsNext _ [] = Nothing
whoIsNext index (Group s n : xs)
  | index <= s = Just n
  | otherwise = whoIsNext (index - s) xs
