module Main where

import System.Environment
import qualified Data.ByteString.Lazy.Char8 as C
import Data.Board
import Data.Aeson
import Movement

main :: IO ()
main = do
  filePaths <- getArgs
  case filePaths of
    [gameSettingsFilePath, movesFilePath]
      -> do
        gameSettingsJson <- readFile gameSettingsFilePath
        let currentBoard = (decode $ C.pack gameSettingsJson :: Maybe Board)
        movesJson <- readFile movesFilePath
        let moves = (decode $ C.pack movesJson :: Maybe Moves)
        mapM_ putStrLn (doMovements currentBoard moves)
    _ -> putStrLn "Missing file paths"