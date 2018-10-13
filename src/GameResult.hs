module GameResult where

import Action     (actionHandler)
import Data.Board

getGameResult :: Board -> [Action] -> GameResult
getGameResult board actions = do
  let actionsResult = actionHandler board actions []
  let titleForResults = ["Sequence " ++ show id ++ ": " | id <-  [1..length actionsResult]]
  let descriptionForResults = map actionResultDescriptionFor actionsResult
  zipWith (++) titleForResults descriptionForResults

actionResultDescriptionFor :: ActionResult -> ActionResultDescription
actionResultDescriptionFor Success          = "Success!"
actionResultDescriptionFor MineHit          = "Mine Hit!"
actionResultDescriptionFor MoveOutsideBoard = "Move outside the board is an invalid action!"
actionResultDescriptionFor Saved            = "Yay, turtle is safe!"
actionResultDescriptionFor StillInDanger    = "Still in danger!"
