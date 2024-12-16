module Lib where

-- | Find the sum of all multiples of 3 or 5 below 1000
p1 :: Int
p1 = sum $ filter (\x -> x `mod` 3 == 0 || x `mod` 5 == 0) [1 .. 999]

-- | By considering the terms in the Fibonacci sequence whose values do not exceed four million,
--  find the sum of the even-valued terms.
p2 :: Int
p2 = sum $ filter even $ fibSqUnder 4000000
  where
    fibSqUnder :: Int -> [Int]
    fibSqUnder n = takeWhile (<= n) fibs
      where
        fibs = 0 : 1 : zipWith (+) fibs (tail fibs)

-- | What is the largest prime factor of the number 600851475143?
p3 :: Int
p3 = head $ primeFactorsOf 600851475143
  where
    primeFactorsOf :: Int -> [Int]
    primeFactorsOf n = primeFactorsOf' n 2 []
      where
        primeFactorsOf' :: Int -> Int -> [Int] -> [Int]
        primeFactorsOf' m x xs
          | m < 2 = xs
          | m `mod` x == 0 = primeFactorsOf' (m `div` x) x (x : xs)
          | otherwise = primeFactorsOf' m (x + 1) xs
