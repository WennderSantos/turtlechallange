{-# LANGUAGE NamedFieldPuns #-}

module Action where

import Data.Board
import Turtle

getGameResult :: Board -> [Action] -> [ActionLog]
getGameResult board actions = do
  let actionsLog = actionHandler board actions []
  zipWith (++) ["Sequence " ++ show id ++ ": " | id <-  [1..length actionsLog]] actionsLog

actionHandler :: Board -> [Action] -> [ActionLog] -> [ActionLog]
actionHandler _ [] actionsLog = (init actionsLog) ++ logFor StillInDanger

actionHandler Board {boardSize, turtle, exitPoint, mines} actions actionsLog = do
  let action = (head actions)
  let turtleAfterAction = executeAction action turtle
  case getActionResult action (position turtleAfterAction) exitPoint boardSize mines of
    Success -> actionHandler Board {boardSize, turtle = turtleAfterAction, exitPoint, mines} (tail actions) (actionsLog ++ logFor Success)
    MineHit -> actionsLog ++ logFor MineHit
    MoveOutsideBoard -> actionsLog ++ logFor MoveOutsideBoard
    Saved -> actionsLog ++ logFor Saved

logFor :: ActionResult -> [ActionLog]
logFor Success          = ["Success!"]
logFor MineHit          = ["Mine Hit!"]
logFor MoveOutsideBoard = ["Move outside the board is an invalid action!"]
logFor Saved            = ["Yay, turtle is safe!"]
logFor StillInDanger    = ["Still in danger!"]

getActionResult :: Action -> TurtlePosition -> ExitPoint -> BoardSize -> [Mine] -> ActionResult
getActionResult Rotate _ _ _ _ = Success

getActionResult Move turtlePosition exitPoint boardSize mines
  | isTurtleOutsideBoard turtlePosition boardSize = MoveOutsideBoard
  | isTurtleInAMinePosition turtlePosition mines = MineHit
  | isTurtleSafe turtlePosition exitPoint = Saved
  | otherwise = Success

executeAction :: Action -> Turtle -> Turtle
executeAction action Turtle {position = p, faceDirection = North}
  | action == Rotate = Turtle {position = p, faceDirection = East}
  | action == Move = Turtle {position = Position {x = x p, y = succ (y p)}, faceDirection = North}

executeAction action Turtle {position = p, faceDirection = East}
  | action == Rotate = Turtle {position = p, faceDirection = South}
  | action == Move = Turtle {position = Position {x = succ (x p), y = y p}, faceDirection = East}

executeAction action Turtle {position = p, faceDirection=South}
  | action == Rotate = Turtle {position = p, faceDirection = West}
  | action == Move = Turtle {position = Position {x = x p, y = pred (y p)}, faceDirection = South}

executeAction action Turtle {position = p, faceDirection=West}
  | action == Rotate = Turtle {position = p, faceDirection = North}
  | action == Move = Turtle {position = Position {x = pred (x p), y = y p}, faceDirection = West}
