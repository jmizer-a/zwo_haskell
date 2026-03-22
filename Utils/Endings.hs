module Utils.Endings where
import Utils.Types
import Utils.GameStatePrinting

doEnding :: [String] -> State -> IO State
doEnding ending state = do
    printLines ending
    return state {isOver = True}
