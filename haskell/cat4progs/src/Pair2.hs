module Pair2 where
import Data.Bifunctor (Bifunctor (bimap))

data Pair2 a b = Pair2 a b deriving Show

instance Bifunctor Pair2 where
  bimap f g (Pair2 a b) = Pair2 (f a) (g b)
