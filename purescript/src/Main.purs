module Main where

import Prelude

import ConstFunctor (ConstFunctor(..))
import Data.Maybe (Maybe(..), fromJust)
import Effect (Effect)
import Effect.Console (log)

class Category objects morphisms | morphisms -> objects where
  domain :: morphisms -> objects
  codomain :: morphisms -> objects
  idy :: objects -> morphisms
  cmp :: morphisms -> morphisms -> Maybe morphisms


data Cat2Objects = One | Two
data Cat2Morphisms = Id1 | Id2 | F

instance cat2 :: Category Cat2Objects Cat2Morphisms where
  domain Id1 = One
  domain Id2 =Two
  domain F = One

  codomain Id1 = One
  codomain Id2 =Two
  codomain F =Two

  idy One = Id1
  idy Two = Id2

  cmp Id1 Id1 = Just Id1
  cmp Id1 Id2 = Nothing
  cmp Id1 F = Nothing
  cmp Id2 Id2 = Just Id2
  cmp Id2 Id1 = Nothing
  cmp Id2 F = Just F
  cmp F Id1 = Just F
  cmp F Id2 = Nothing
  cmp F F = Nothing

instance showCat2Morphisms :: Show Cat2Morphisms where
  show Id1 = "Id1"
  show Id2 = "Id2"
  show F = "F"



main :: Effect Unit
main = do
  log (show (cmp Id1 Id2))