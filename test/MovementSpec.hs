import Test.Hspec
import Data.Board
import Movement

turtleFacingNorth = Turtle {position = Position {x = 0, y = 0}, faceDirection = North}
turtleFacingEast = Turtle {position = Position {x = 0, y = 0}, faceDirection = East}
turtleFacingSouth = Turtle {position = Position {x = 0, y = 0}, faceDirection = South}
turtleFacingWest = Turtle {position = Position {x = 0, y = 0}, faceDirection = West}

main :: IO ()
main = hspec $ do
  describe "action Rotate" $ do
    it "Should rotate turtle's face to East" $ do
      action Rotate turtleFacingNorth `shouldBe` Turtle {position = Position {x = 0, y = 0}, faceDirection = East}
    it "Should rotate turtle's face to South" $ do
      action Rotate turtleFacingEast `shouldBe` Turtle {position = Position {x = 0, y = 0}, faceDirection = South}
    it "Should rotate turtle's face to West" $ do
      action Rotate turtleFacingSouth `shouldBe` Turtle {position = Position {x = 0, y = 0}, faceDirection = West}
    it "Should rotate turtle's face to North" $ do
      action Rotate turtleFacingWest `shouldBe` Turtle {position = Position {x = 0, y = 0}, faceDirection = North}