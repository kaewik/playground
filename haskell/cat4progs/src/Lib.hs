module Lib
  ( someFunc,
  )
where

import Data.Bifunctor (Bifunctor (bimap, first, second))
import Text.Printf (printf)

someFunc :: IO ()
someFunc =
  let (a, b) = (2, 3)
   in let c = swap (a, b)
       in print c

tuple :: (c -> a) -> (c -> b) -> c -> (a, b)
tuple f g c = (f c, g c)

swap :: (a, b) -> (b, a)
swap = tuple snd fst