{-# LANGUAGE DerivingStrategies #-}
module PreList(PreList(..)) where
import Data.Bifunctor (Bifunctor (first, second))

data PreList a b = Nil | Cons a b deriving Show deriving Eq

instance Bifunctor PreList where
  first f Nil = Nil
  first f (Cons a b) = Cons (f a) b

  second f Nil = Nil
  second f (Cons a b) = Cons a (f b)
