module GameTests exposing (..)

import Test exposing (..)
import Game
-- import FreedomTestData
import Expect
import List
import Fuzz exposing (list, int, intRange, tuple, string)
import String

play: Int -> Game.Color -> Fuzz.Fuzzer Game.Move
play size color =
    Fuzz.map2 (\x y -> Game.Play { location = { x = x, y = y }, color = color })
        (intRange 0 (size - 1)) (intRange 0 (size - 1))

all : Test
all =
    describe "Game Tests"
        [ describe "Game Construction"
            [ fuzz (intRange 0 100) "New games have the initialized size" <|
                \size ->
                    size
                    |> Game.newGame
                    |> Game.size
                    |> Expect.equal size
            , fuzz (intRange 0 100) "New games have an empty move list" <|
                \size ->
                    size
                    |> Game.newGame
                    |> Game.toList
                    |> List.length
                    |> Expect.equal 0
            , fuzz (play 19 Game.White)  "New games can place a piece anywere in the board" <|
                \play ->
                  Game.newGame 19
                  |> Game.validate play
                  |> Expect.equal True
            , fuzz (play 19 Game.White)  "New games can place a piece anywere in the board" <|
                \play ->
                  Game.newGame 19
                  |> Game.validate play
                  |> Expect.equal True
            ]
        , describe "Playing the first stone"
            [ fuzz (play 19 Game.White)  "After playing the move, toList contains the move" <|
                \play ->
                  Game.newGame 19
                  |> Game.move play
                  |> Game.toList
                  |> List.map Game.Play
                  |> Expect.equal [play]
            ]
        ]
