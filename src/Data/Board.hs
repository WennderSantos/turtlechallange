{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Data.Board where

import Data.List
import GHC.Generics
import Data.Aeson

data Position = Position { x :: Int
                         , y :: Int} deriving (Generic, Show, Eq)

instance FromJSON Position

newtype Mine = Mine Position deriving (Generic, Show, Eq)

instance FromJSON Mine

data FaceDirection = North | East | South | West deriving (Generic, Show, Eq)

instance FromJSON FaceDirection

data Turtle = Turtle { position :: Position
                     , faceDirection :: FaceDirection
                     } deriving (Generic, Show, Eq)

instance FromJSON Turtle

data Board = Board { boardSize :: Position
                   , exitPoint :: Position
                   , mines :: [Mine]
                   , turtle :: Turtle
                   } deriving (Generic, Show, Eq)

instance FromJSON Board

data Move = Move | Rotate deriving (Generic, Show, Eq)
instance FromJSON Move

data Moves = Moves [Move] deriving (Generic, Show, Eq)
instance FromJSON Moves
