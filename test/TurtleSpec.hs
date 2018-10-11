module TurtleSpec where

import Data.Board
import Test.Hspec
import Turtle

turtlePositionx1y2 = Position {x = 1, y = 2}
turtlePositionx7y8 = Position {x = 7, y = 8}

exitPointx1y2 = Position {x = 1, y = 2}
minesx1y2x3y2 = [Position {x = 1, y = 2}, Position {x = 3, y = 2}]
boardSizex6y6 = Position {x = 6, y = 6}

spec :: Spec
spec = do
  describe "isTurtleSafe?" $ do
    it "Should be" $ do
      isTurtleSafe turtlePositionx1y2 exitPointx1y2 `shouldBe` True
    it "Shouldn't be" $ do
      isTurtleSafe turtlePositionx7y8 exitPointx1y2 `shouldBe` False

  describe "isTurtleInAMinePosition?" $ do
    it "Should be" $ do
      isTurtleInAMinePosition turtlePositionx1y2 minesx1y2x3y2 `shouldBe` True
    it "Shouldn't be" $ do
      isTurtleInAMinePosition turtlePositionx7y8 minesx1y2x3y2 `shouldBe` False

  describe "isTurtleOutsideBoard?" $ do
    it "Should be" $ do
      isTurtleOutsideBoard turtlePositionx1y2 boardSizex6y6 `shouldBe` False
    it "Shouldn't be" $ do
      isTurtleOutsideBoard turtlePositionx7y8 boardSizex6y6 `shouldBe` True
