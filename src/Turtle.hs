module Turtle where

import Data.Board

isTurtleSafe :: TurtlePosition -> ExitPoint -> Bool
isTurtleSafe turtlePosition exitPoint = turtlePosition == exitPoint

isTurtleInAMinePosition :: TurtlePosition -> [Mine] -> Bool
isTurtleInAMinePosition turtlePosition mines = turtlePosition `elem` mines

isTurtleOutsideBoard :: TurtlePosition -> BoardSize -> Bool
isTurtleOutsideBoard turtlePosition boardSize
  | (x turtlePosition) < 0 || (x turtlePosition) >= (x boardSize) = True
  | (y turtlePosition) < 0 || (y turtlePosition) >= (y boardSize) = True
  | otherwise = False
