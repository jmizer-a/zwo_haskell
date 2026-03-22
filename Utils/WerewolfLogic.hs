module Utils.WerewolfLogic where
import Utils.Types
import Utils.DataAccess
import Utils.GameStatePrinting
import Utils.Descriptions
import Utils.Endings

handleWerewolf :: State -> IO State
handleWerewolf state = do
    let t = time state
    case t of
        29 -> do
            if "Wilkołak" `elem` getExistingCharacterNames state
                then do
                    return state
                else do
                    if playerPos state == (0, 2)
                        then printLines werewolfChanges
                        else printLines werewolfPlayerOutside
                    let newState = initWerewolf (removeCharacter "Pan Młody" state)
                    return newState {werewolfMoveIndex = 1}
        30 -> do
            if werewolfMoveIndex state == 1
                then do
                if "Goście Weselni" `elem` getExistingCharacterNames state
                    then do
                        if playerPos state == (0, 2)
                            then printLines werewolfSlaughter
                            else printLines werewolfPlayerOutside
                        let newState = removeCharacter "Goście Weselni" state
                        return newState {werewolfMoveIndex = 2}
                    else do
                        if playerPos state == (0, 2)
                            then do
                                newState <- doEnding werewolfKillsPlayerEndingDescription state
                                return newState {werewolfMoveIndex = 2}
                            else do
                                if isDoorOpen "Drzwi do Izby" state
                                    then do
                                        printLines werewolfSlaughter
                                        let newState = removeCharacter "Panna Młoda" state
                                        return newState {werewolfMoveIndex = 2}
                                    else do
                                        newState <- doEnding werewolfChangesWithoutSlaughterEndingDescription state
                                        return newState {werewolfMoveIndex = 2}
                else do
                    return state
        31 -> do
            if werewolfMoveIndex state == 2
                then do
                    if playerPos state == (0, 2)
                        then do
                            newState <- doEnding werewolfKillsPlayerEndingDescription state
                            return newState {werewolfMoveIndex = 3}
                        else do
                            if isDoorOpen "Drzwi do Izby" state
                                then do
                                    printLines werewolfMoves
                                    let pos = playerPos state
                                    let werewolf = Character {
                                        characterName = "Wilkołak",
                                        characterPos = pos,
                                        characterTopics = []
                                    }
                                    let newState = removeCharacter "Wilkołak" state
                                    return newState {characters = werewolf : characters state, werewolfMoveIndex = 3}
                                else do
                                    newState <- doEnding werewolfChangesAfterSlaughterEndingDescription state
                                    return newState {werewolfMoveIndex = 3}
                else do
                    return state
        32 -> do
            newState <- doEnding werewolfKillsPlayerEndingDescription state
            return newState
        _ -> do
            return state
