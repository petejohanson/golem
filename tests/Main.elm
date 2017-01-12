port module Main exposing (..)

import Tests
import GameTests
import Test
import Test.Runner.Node exposing (run, TestProgram)
import Json.Encode exposing (Value)


main : TestProgram
main =
    run emit (Test.concat [GameTests.all])


port emit : ( String, Value ) -> Cmd msg
