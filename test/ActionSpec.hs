module ActionSpec where

import Action
import Data.Board
import Test.Hspec

turtlepositionx2y2 = Position {x = 2, y = 2}
turtlepositionx8y8 = Position {x = 8, y = 8}
turtlepositionx1y2 = Position {x = 1, y = 2}
turtlepositionx5y5 = Position {x = 5, y = 5}

minesx1y2x3y2 = [Position {x = 1, y = 2}, Position {x = 3, y = 2}]
exitPointx5y5 = Position {x = 5, y = 5}
boardSizex6y6 = Position {x = 6, y = 6}

turtleFacingNorth = Turtle {position = turtlepositionx2y2, faceDirection = North}
turtleFacingEast = Turtle {position = turtlepositionx2y2, faceDirection = East}
turtleFacingSouth = Turtle {position = turtlepositionx2y2, faceDirection = South}
turtleFacingWest = Turtle {position = turtlepositionx2y2, faceDirection = West}

spec :: Spec
spec = do
  describe "execute action Rotate" $ do
    it "Should rotate turtle's face to East" $ do
      executeAction Rotate turtleFacingNorth `shouldBe` Turtle {position = position turtleFacingNorth, faceDirection = East}
    it "Should rotate turtle's face to South" $ do
      executeAction Rotate turtleFacingEast `shouldBe` Turtle {position = position turtleFacingEast, faceDirection = South}
    it "Should rotate turtle's face to West" $ do
      executeAction Rotate turtleFacingSouth `shouldBe` Turtle {position = position turtleFacingSouth, faceDirection = West}
    it "Should rotate turtle's face to North" $ do
      executeAction Rotate turtleFacingWest `shouldBe` Turtle {position = position turtleFacingWest, faceDirection = North}

  describe "execute action Move" $ do
    it "Should move turtle one tile north" $ do
      executeAction Move turtleFacingNorth `shouldBe` Turtle {position = Position {x = x turtlepositionx2y2, y = succ (y turtlepositionx2y2)}, faceDirection = faceDirection turtleFacingNorth}
    it "Should move turtle one tile east" $ do
      executeAction Move turtleFacingEast `shouldBe` Turtle {position = Position {x = succ (x turtlepositionx2y2), y = y turtlepositionx2y2}, faceDirection = faceDirection turtleFacingEast}
    it "Should move turtle one tile south" $ do
      executeAction Move turtleFacingSouth `shouldBe` Turtle {position = Position {x = x turtlepositionx2y2, y = pred (y turtlepositionx2y2)}, faceDirection = faceDirection turtleFacingSouth}
    it "Should move turtle one tile west" $ do
      executeAction Move turtleFacingWest `shouldBe` Turtle {position = Position {x = pred (x turtlepositionx2y2), y = y turtlepositionx2y2}, faceDirection = faceDirection turtleFacingWest}

  describe "getActionResult" $ do
    it "for action Rotate should be always Success" $ do
      getActionResult Rotate turtlepositionx2y2 exitPointx5y5 boardSizex6y6 minesx1y2x3y2 `shouldBe` Success
    it "for action Move resulting in a turtle position outside the board should be MoveOutsideBoard" $ do
      getActionResult Move turtlepositionx8y8 exitPointx5y5 boardSizex6y6 minesx1y2x3y2 `shouldBe` MoveOutsideBoard
    it "for action Move resulting in a turtle in the same tile as a mine is should be MineHit" $ do
      getActionResult Move turtlepositionx1y2 exitPointx5y5 boardSizex6y6 minesx1y2x3y2 `shouldBe` MineHit
    it "for action Move resulting in a turtle position in the same tile as the exit point shoulbe be Saved" $ do
      getActionResult Move turtlepositionx5y5 exitPointx5y5 boardSizex6y6 minesx1y2x3y2 `shouldBe` Saved
