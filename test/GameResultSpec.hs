module GameResultSpec where

import Data.Board
import GameResult
import Test.Hspec

boardSettings = Board {boardSize = Position {x = 6, y = 6},
                       exitPoint = Position {x = 5, y = 5},
                       mines = [Position {x = 1, y = 2}, Position {x = 3, y = 2}],
                       turtle = Turtle {position = Position {x = 2, y = 2}, faceDirection = North}}

actionLogStillInDanger = ["Sequence 1: Success!", "Sequence 2: Success!", "Sequence 3: Still in danger!"]
actionLogTurtleSaved = ["Sequence 1: Success!", "Sequence 2: Success!", "Sequence 3: Success!", "Sequence 4: Success!", "Sequence 5: Success!", "Sequence 6: Success!", "Sequence 7: Yay, turtle is safe!"]
actionLogTurtleHitingAMine = ["Sequence 1: Success!", "Sequence 2: Mine Hit!"]

actionsTurtleStillInDanger = [Move, Move, Move]
actionsTurtleSafe = [Move, Move, Move, Rotate, Move, Move, Move]
actionsTurtleHitingAMine = [Rotate, Move]

spec :: Spec
spec = do
  describe "getGameResult" $ do
    it "Should the turtle still be in danger" $ do
      getGameResult boardSettings actionsTurtleStillInDanger `shouldBe` actionLogStillInDanger
    it "Should the turtle be safe" $ do
      getGameResult boardSettings actionsTurtleSafe `shouldBe` actionLogTurtleSaved
    it "Should the turtle hit a mine" $ do
      getGameResult boardSettings actionsTurtleHitingAMine `shouldBe` actionLogTurtleHitingAMine

  describe "actionResultDescriptionFor" $ do
    it "Success" $ do
      actionResultDescriptionFor Success `shouldBe` "Success!"
    it "MineHit" $ do
      actionResultDescriptionFor MineHit `shouldBe` "Mine Hit!"
    it "MoveOutsideBoard" $ do
      actionResultDescriptionFor MoveOutsideBoard `shouldBe` "Move outside the board is an invalid action!"
    it "Saved" $ do
      actionResultDescriptionFor Saved `shouldBe` "Yay, turtle is safe!"
    it "StillInDanger" $ do
      actionResultDescriptionFor StillInDanger `shouldBe` "Still in danger!"
