module ConstFunctor where

import Data.Functor


data ConstFunctor :: forall k. Type -> k -> Type
data ConstFunctor b a = ConstFunctor { getConst :: b}

instance constBoolFunctor :: Functor (ConstFunctor b) where
  map _ (ConstFunctor b) = ConstFunctor b

type ConstBoolFunctor :: forall k. k -> Type
type ConstBoolFunctor = ConstFunctor Boolean