import Test.Hspec
import Data.Board
import Movement

positionx2y2 = Position {x = 2, y = 2}

turtleFacingNorth = Turtle {position = positionx2y2, faceDirection = North}
turtleFacingEast = Turtle {position = positionx2y2, faceDirection = East}
turtleFacingSouth = Turtle {position = positionx2y2, faceDirection = South}
turtleFacingWest = Turtle {position = positionx2y2, faceDirection = West}

main :: IO ()
main = hspec $ do
  describe "action Move Rotate" $ do
    it "Should rotate turtle's face to East" $ do
      action Rotate turtleFacingNorth `shouldBe` Turtle {position = position turtleFacingNorth, faceDirection = East}
    it "Should rotate turtle's face to South" $ do
      action Rotate turtleFacingEast `shouldBe` Turtle {position = position turtleFacingEast, faceDirection = South}
    it "Should rotate turtle's face to West" $ do
      action Rotate turtleFacingSouth `shouldBe` Turtle {position = position turtleFacingSouth, faceDirection = West}
    it "Should rotate turtle's face to North" $ do
      action Rotate turtleFacingWest `shouldBe` Turtle {position = position turtleFacingWest, faceDirection = North}

  describe "action Move Forward" $ do
    it "Should move turtle one tile north" $ do
      action Forward turtleFacingNorth `shouldBe` Turtle {position = Position {x = x positionx2y2, y = succ (y positionx2y2)}, faceDirection = faceDirection turtleFacingNorth}
    it "Should move turtle one tile east" $ do
      action Forward turtleFacingEast `shouldBe` Turtle {position = Position {x = succ (x positionx2y2), y = y positionx2y2}, faceDirection = faceDirection turtleFacingEast}
    it "Should move turtle one tile south" $ do
      action Forward turtleFacingSouth `shouldBe` Turtle {position = Position {x = x positionx2y2, y = pred (y positionx2y2)}, faceDirection = faceDirection turtleFacingSouth}
    it "Should move turtle one tile west" $ do
      action Forward turtleFacingWest `shouldBe` Turtle {position = Position {x = pred (x positionx2y2), y = y positionx2y2}, faceDirection = faceDirection turtleFacingWest}