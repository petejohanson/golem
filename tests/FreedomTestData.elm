module FreedomTestData exposing (..)

import Set exposing (Set)
import Game exposing (Game)
import Matrix exposing (Matrix)

type alias FreedomTestData =
  { board: Game
  , freedoms: Set Game.Location
  , check: Game.Location
  }

type alias FreedomTest =
  { name: String
  , data : FreedomTestData
  }

type TestPoint = Freedom Game.Location | Stone Game.StonePlacement


parsePoint: Int -> Int -> Char -> TestPoint
parsePoint x y c =
  case c of
    'B' -> Stone { location = { x = x, y = y }, color = Game.Black }
    '?' -> Freedom { x = x, y = y }
    _ -> Freedom { x = x, y = y }

parseData: List String -> Game.Location -> FreedomTestData
parseData board check =
  let
    b = Game.newGame List.length board
    characterMatrix = Matrix.fromList (List.concatMap String.toList)
    pointMatrix = Matrix.indexedMap parseData
  in
    { board = b
    , freedoms = Set.empty
    , check =  check
    }
  

data =
  [
    { name = "Single unsurrounded stone"
    , game = Game.newGame 19 |> Game.move (Game.Play { x = 0, y = 0, color = Game.White })
    , check = (0,0)
    }
  ]
