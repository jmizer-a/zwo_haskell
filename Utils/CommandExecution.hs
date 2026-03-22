module Utils.CommandExecution where
import Utils.Types
import Utils.DataAccess
import Utils.Descriptions
import Utils.Dialogues
import Utils.Endings
import Utils.GameStatePrinting
import Data.List (find)
import Data.Maybe (fromJust)

tryMove :: Direction -> State -> IO State
tryMove dir state = if isValidMove dir (playerPos state)
    then do
        let doorMaybe = getDoor state
        if existsDoor doorMaybe
            then do
                let door = fromJust doorMaybe
                if isOpen door
                    then do
                        let newPos = move dir (playerPos state)
                        let newState = state {playerPos = newPos, time = time state + 1}
                        printState newState
                        return newState
                    else do
                        printLines ["Drzwi są zamknięte, nie możesz tędy przejść.", ""]
                        return state
            else do
                let newPos = move dir (playerPos state)
                case newPos of
                    (0, 3) -> do
                        newState <- doEnding cliffEndingDescription state
                        return newState
                    (2, 3) -> do
                        newState <- doEnding wolvesEndingDescription state
                        return newState
                    _ -> do
                        let newState = state {playerPos = newPos, time = time state + 1}
                        printState newState
                        return newState
    else do
        printLines ["Nie możesz tędy przejść.", ""]
        return state


tryPickUpItem :: String -> State -> IO State
tryPickUpItem item state = do
    let loc = getPlayerLocation state
    if item `elem` (locationItems loc)
        then do
            printLines ["!! Nowy przedmiot w ekwipunku: " ++ item]
            let newInventory = item : playerInventory state
            let newItems = filter (/= item) (locationItems loc)
            let newLoc = loc {locationItems = newItems}
            let newState = state {playerInventory = newInventory, locations = newLoc : filter (/= loc) (locations state), time = time state + 1}
            return newState
        else do
            printLines ["Nie ma tu przedmiotu o takiej nazwie."]
            return state

tryUseItemOnObject :: Item -> String -> State -> IO State
tryUseItemOnObject item object state =
    if item `elem` playerInventory state
    then
        if item == "Klucze" then do
            let doorMaybe = getDoor state
            if not (existsDoor doorMaybe) then do
                printLines ["Nie ma tu żadnych drzwi."]
                return state
            else do
                let door = fromJust doorMaybe
                if object /= doorName door then do
                    printLines ["Nie możesz użyć *" ++ item ++ "* na *" ++ object ++ "*."]
                    return state
                else
                    if isOpen door then do
                        let updatedDoor = door { isOpen = False }
                        let updatedDoors = updatedDoor : filter (/= door) (doors state)
                        printLines ["Zamykasz *" ++ doorName door ++ "*."]
                        return state { doors = updatedDoors, time = time state + 1 }
                    else do
                        let updatedDoor = door { isOpen = True }
                        let updatedDoors = updatedDoor : filter (/= door) (doors state)
                        printLines ["Otwierasz *" ++ doorName door ++ "*."]
                        return state { doors = updatedDoors, time = time state + 1 }
        else do
            if item == "Szpadel" && object == "Rozkopana Mogiła" && playerPos state == (1, 4) then do
                printLines [
                    "Nie musisz kopać głęboko. Szpadel szybko napotyka na coś twardego, gładszego niż kamień, i pęka od uderzenia. Rozgrzebujesz ziemię rękami i ukazuje się twoim oczom olbrzymia wilcza czaszka, znacząco większa od głowy jakiegokolwiek zwierzęcia, jakie widziałeś w życiu. Jeden z kłów pokrywa świeżo zakrzepła krew. Groza zmraża ci krew w żyłach, włosy stają dęba na karku. To nie jest wilk. To wilkołak. A Pan Młody, nietrzeźwy, musiał się skaleczyć na jego kle. To wyjaśnia siną, nienaturalną opuchliznę. Patrzysz w niebo, szukając księżyca. Jest pełnia. Oczywiście, że jest pełnia.",
                    "!! Nowe zagadnienie w dzienniku: Rozkopana Mogiła"
                    ]
                let newInventory = removeItem item (playerInventory state)
                let updatedInteractibles = map (\i -> if interactibleName i == "Rozkopana Mogiła" then i { wasUsed = True } else i) (interactibles state)
                let updatedJournal = "Rozkopana Mogiła" : playerJournal state
                let newState = state {playerJournal = updatedJournal, playerInventory = newInventory, time = time state + 1, interactibles = updatedInteractibles}
                return newState
            else do
                printLines ["Nie możesz użyć *" ++ item ++ "* na *" ++ object ++ "*."]
                return state
    else do
        printLines ["Brak przedmiotu: *" ++ item ++ "* w ekwipunku."]
        return state

tryTalkToCharacter :: String -> String -> State -> IO State
tryTalkToCharacter character topic state = do
    if topic `elem` playerJournal state
        then do
            let charactersInLocation = getPlayerLocationCharacters state
            if character `elem` map characterName charactersInLocation
                then do
                    let characterMaybe = find (\c -> characterName c == character) charactersInLocation
                    case characterMaybe of
                        Just c -> do
                            if topic `elem` characterTopics c
                                then do
                                    newState <- doSpecificDialogue c topic state
                                    return newState
                                else do
                                    printLines (doDefaultDialogue c state)
                                    let newState = state {time = time state + 1}
                                    return newState
                        Nothing -> return state
                else do
                    printLines ["Nie ma tu nikogo takiego."]
                    return state
        else do
            printLines ["Nie znasz takiego zagadnienia."]
            return state

tryShootCharacter :: String -> State -> IO State
tryShootCharacter character state = do
    if "Strzelba" `elem` playerInventory state && "Srebrna Kula" `elem` playerInventory state
        then do
        if character `elem` getPlayerLocationCharacterNames state
            then do
                case character of
                    "Pan Młody" -> do
                        newState <- doEnding groomShotEndingDescription state
                        return newState
                    "Wilkołak" -> do
                        if "Panna Młoda" `elem` getExistingCharacterNames state
                            then do
                                newState <- doEnding werewolfShotBrideAliveEndingDescription state
                                return newState
                            else do
                                newState <- doEnding werewolfShotDeadBrideEndingDescription state
                                return newState
                    _ -> do
                        printLines ["Nie możesz tego zrobić."]
                        return state
            else do
                printLines ["Nie ma tu nikogo takiego."]
                return state
        else do
            printLines ["Potrzebujesz broni palnej i amunicji, aby to zrobić."]
            return state