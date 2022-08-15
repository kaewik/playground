import PreList (PreList (Cons, Nil))
import Test.QuickCheck (quickCheck)
import Data.Bifunctor (Bifunctor(first, second))

main :: IO ()
main = do
  putStrLn "PreList is a Bifunctor"
  putStrLn "first preserves id for Int"
  quickCheck prop_FirstPreservesIdForInt
  putStrLn "second preserves id for Int"
  quickCheck prop_SecondPreservesIdForInt

prop_FirstPreservesIdForInt :: (Int, Int) -> Bool
prop_FirstPreservesIdForInt (a, b) = (first id (Cons a b) == Cons a b) && (first id Nil == (Nil::PreList Int Int))

prop_SecondPreservesIdForInt :: (Int, Int) -> Bool
prop_SecondPreservesIdForInt (a, b) = (second id (Cons a b) == Cons a b) && (second id Nil == (Nil::PreList Int Int))

