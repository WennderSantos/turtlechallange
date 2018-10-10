{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Data.Board where

import Data.List
import GHC.Generics
import Data.Aeson
import Data.Typeable

data Position = Position { x :: Int
                         , y :: Int} deriving (Generic, Show, Eq)

instance FromJSON Position

data FaceDirection = North | East | South | West deriving (Enum, Generic, Show, Eq)

instance FromJSON FaceDirection

type TurtlePosition = Position

data Turtle = Turtle { position :: TurtlePosition
                     , faceDirection :: FaceDirection
                     } deriving (Generic, Show, Eq)

instance FromJSON Turtle

type BoardSize = Position
type ExitPoint = Position
type Mine = Position

data Board = Board { boardSize :: BoardSize
                   , exitPoint :: ExitPoint
                   , mines :: [Mine]
                   , turtle :: Turtle
                   } deriving (Generic, Show, Eq)

instance FromJSON Board

data Action = Move | Rotate deriving (Enum, Generic, Show, Eq)

instance FromJSON Action

data MoveResult = Success | MineHit | MoveOutsideBoard | Saved deriving (Enum, Show, Eq)

type ActionLog = String