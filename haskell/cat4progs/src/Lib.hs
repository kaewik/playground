module Lib
  ( someFunc,
  )
where

import Data.Bifunctor (Bifunctor (bimap, first, second))

someFunc :: IO ()
someFunc =
  do
    let p1 = (2, 3)
    let p2 = 12
    let p3 = (1, (2, 3))
    print (swap p1)
    print (unit p2)
    print (assoc p3)

double :: a -> (a, a)
double a = (a, a)

swap :: (a, b) -> (b, a)
swap = bimap snd fst . double

unit :: a -> ((), a)
unit = first (const ()) . double

assoc :: (a, (b, c)) -> ((a, b), c)
assoc = bimap (second fst) (snd . snd) . double

data Either2 a b = Left2 a | Right2 b

instance Bifunctor Either2 where
  bimap f g (Left2 a) = (Left2 . f) a
  bimap f g (Right2 a) = (Right2 . g) a