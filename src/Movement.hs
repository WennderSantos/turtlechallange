module Movement where

import Data.Board

doMovements :: Maybe Board -> Maybe Moves -> [String]
doMovements currentBoard moves = ["Sequence 1: GameStarted", "Sequence 2: Sucess!", "Sequence 3: Mine hit!"]

action :: Move -> Turtle -> Turtle
action move Turtle{position = p, faceDirection = North}
  | move == Rotate = Turtle { position = p, faceDirection = East}
  | move == Forward = Turtle {position = Position {x = x p, y = succ (y p)}, faceDirection = North}

action move Turtle{position = p, faceDirection = East}
  | move == Rotate = Turtle { position = p, faceDirection = South}
  | move == Forward = Turtle {position = Position {x = succ (x p), y = y p}, faceDirection = East}

action move Turtle{position = p, faceDirection=South}
  | move == Rotate = Turtle { position = p, faceDirection = West}
  | move == Forward = Turtle {position = Position {x = x p, y = pred (y p)}, faceDirection = South}

action move Turtle{position = p, faceDirection=West}
  | move == Rotate = Turtle { position = p, faceDirection = North}
  | move == Forward = Turtle {position = Position {x = pred (x p), y = y p}, faceDirection = West}