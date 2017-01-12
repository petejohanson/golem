
import Test.Runner.Html
import Test
import Tests
import GameTests

main: Test.Runner.Html.TestProgram

main = Test.Runner.Html.run GameTests.all
