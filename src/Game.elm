module Game exposing (..)

import Array
import Matrix exposing (Matrix)

type Color = Black | White
type alias Location = { x: Int, y: Int }
type alias StonePlacement = { location: Location, color: Color }

type Move = Pass | Play StonePlacement

type alias Game = Matrix (Maybe Color)

newGame: Int -> Game
newGame size =
  Matrix.repeat size size Nothing

size: Game -> Int
size game =
  Matrix.height game

gameMap ((x, y), v) =
  case v of
    Nothing -> Nothing
    Just c -> Just { location = { x = x, y = y }, color = c}

toList: Game -> List StonePlacement
toList game =
  game
     |> Matrix.toIndexedArray
     |> Array.toList
     |> List.filterMap gameMap

move: Move -> Game -> Game
move mv game =
  case mv of
    Pass -> game
    Play { location, color} -> Matrix.set location.x location.y (Just color) game

validate: Move -> Game -> Bool
validate move game = True
