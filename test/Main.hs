module Main where

import Test.QuickCheck
import Data.Aeson
import Diff.Types

main :: IO ()
main = quickCheck prop_DecodeEncodeID

prop_DecodeEncodeID :: DerivationDiff -> Bool
prop_DecodeEncodeID dd = case decode (encode dd) of
  Nothing -> False
  Just dd' -> dd == dd'