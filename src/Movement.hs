module Movement where

import Data.Board

doMovements :: Maybe Board -> Maybe Moves -> [String]
doMovements currentBoard moves = ["Sequence 1: GameStarted", "Sequence 2: Sucess!", "Sequence 3: Mine hit!"]

action :: Move -> Turtle -> Turtle
action Rotate Turtle{position = p, faceDirection=North} = Turtle { position = p, faceDirection = East}
action Rotate Turtle{position = p, faceDirection=East} = Turtle { position = p, faceDirection = South}
action Rotate Turtle{position = p, faceDirection=South} = Turtle { position = p, faceDirection = West}
action Rotate Turtle{position = p, faceDirection=West} = Turtle { position = p, faceDirection = North}
-- action Move turtle = "Move"