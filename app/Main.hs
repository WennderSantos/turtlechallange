module Main where

import           Data.Aeson
import           Data.Board
import qualified Data.ByteString.Lazy.Char8 as C
import           GameResult                 (getGameResult)
import           System.Environment

main :: IO ()
main = do
  filePaths <- getArgs
  case filePaths of
    [gameSettingsFilePath, movesFilePath] -> do
      gameSettingsJson <- readFile gameSettingsFilePath
      let maybeBoard = (decode $ C.pack gameSettingsJson :: Maybe Board)
      movesJson <- readFile movesFilePath
      let maybeMoves = (decode $ C.pack movesJson :: Maybe [Action])
      case maybeBoard of
        Nothing    -> putStrLn "Failed trying to parse gameSettings file"
        Just board -> case maybeMoves of
          Nothing    -> putStrLn "Failed trying to parse moves file"
          Just moves -> mapM_ putStrLn (getGameResult board moves)
    _ -> putStrLn "Missing file paths"
