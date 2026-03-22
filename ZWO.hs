import Utils.Types
import Utils.Descriptions
import Utils.DataAccess
import Utils.Dialogues
import Utils.GameStatePrinting
import Utils.WerewolfLogic
import Utils.CommandExecution
import Utils.Endings
import Data.List (isInfixOf)
import Data.Char (toLower)
import qualified Data.Text as T

doIntroduction :: State -> IO ()
doIntroduction state = do
    printLines introductionText
    printState state

readCommand :: IO String
readCommand = do
    putStr "> "
    xs <- getLine
    return xs

parseCommand :: String -> Command
parseCommand input =
    let (cmd, args) = splitCommand input
    in case cmd of
        "n" -> Move North
        "north" -> Move North
        "s" -> Move South
        "south" -> Move South
        "e" -> Move East
        "east" -> Move East
        "w" -> Move West
        "west" -> Move West

        "rozejrzyj" -> Look

        "ekwipunek" -> Inventory

        "dziennik" -> Journal

        "pomoc" -> Help

        "zrezygnuj" -> Quit
        "quit" -> Quit

        "podnieś" -> if not (null args)
                     then Take args
                     else Unknown "Niepoprawne użycie:\npodnieś <przedmiot>"

        "użyj" -> if " na " `isInfixOf` args
                     then let (item, object) = splitOnce " na " args
                          in Use (trimWhitespace item) (trimWhitespace object)
                     else Unknown "Niepoprawne użycie:\nużyj <przedmiot> na <obiekt>"

        "zapytaj" -> if " o " `isInfixOf` args
                     then let (character, topic) = splitOnce " o " args
                          in Talk (trimWhitespace character) (trimWhitespace topic)
                     else Unknown "Niepoprawne użycie:\nzapytaj <postać> o <zagadnienie>"

        "zastrzel" -> if not (null args)
                     then Shoot args
                     else Unknown "Niepoprawne użycie:\nzastrzel <postać>"

        "czekaj" -> Wait

        _ -> Unknown "Nieznane polecenie"

trimWhitespace :: String -> String
trimWhitespace = reverse . dropWhile (== ' ') . reverse . dropWhile (== ' ')

splitOnce :: String -> String -> (String, String)
splitOnce delimiter str =
  let (before, rest) = T.breakOn (T.pack delimiter) (T.pack str)
      after = T.drop (T.length (T.pack delimiter)) rest
  in (T.unpack before, T.unpack after)

splitCommand :: String -> (String, String)
splitCommand input =
    case dropWhile (== ' ') input of
        "" -> ("", "")
        str -> let (cmd, rest) = break (== ' ') str
               in (map toLower cmd, dropWhile (== ' ') rest)

gameLoop :: State -> IO ()
gameLoop state = do
    state <- handleWerewolf state
    if isOver state
        then return ()
        else do
        input <- readCommand
        printLines [""]

        let command = parseCommand input
        case command of
            Help -> do
                printInstructions
                gameLoop state

            Quit -> do
                printLines ["Czy jesteś pewien, że chcesz wyjść? (t/n) "]
                answer <- getLine
                if answer == "t"
                    then do
                    newState <- doEnding ranAwayEndingDescription state
                    gameLoop newState
                    else gameLoop state

            Look -> do
                printState state
                gameLoop state

            Inventory -> do
                printInventory state
                gameLoop state

            Journal -> do
                printJournal state
                gameLoop state

            Shoot targetName -> do
                newState <- tryShootCharacter targetName state
                gameLoop newState

            Move dir -> do
                newState <- tryMove dir state
                gameLoop newState

            Take itemName -> do
                newState <- tryPickUpItem itemName state
                gameLoop newState

            Use item object -> do
                newState <- tryUseItemOnObject item object state
                gameLoop newState

            Talk character topic -> do
                newState <- tryTalkToCharacter character topic state
                gameLoop newState

            Wait -> do
                printLines ["Czy na pewno chcesz to zrobić? Ta czynność może mieć poważne konsekwencje. Wprowadź 't', żeby potwierdzić, jeśli się nie boisz. "]
                answer <- getLine
                if answer == "t"
                    then do
                        if time state < 29
                            then do
                                let newState = state {time = 29}
                                printState newState
                                gameLoop newState
                            else do
                                let newState = state {time = time state + 1}
                                printState newState
                                gameLoop newState
                    else do
                        gameLoop state

            Unknown reason -> do
                printLines [reason, ""]
                gameLoop state

main = do
    let initialState = State {
        playerPos = (0, 2),
        playerJournal = ["Wesele", "Spuchnięta Dłoń"],
        playerInventory = ["Plecak"],
        time = 0,
        locations = [
            Location {locationName = "Izba", locationPos = (0, 2), locationItems = ["Czapka z Piór"]},
            Location {locationName = "Urwisko", locationPos = (0, 3), locationItems = []},
            Location {locationName = "Trakt", locationPos = (1, 0), locationItems = []},
            Location {locationName = "Strażnica", locationPos = (1, 1), locationItems = []},
            Location {locationName = "Plac ze Studnią", locationPos = (1, 2), locationItems = []},
            Location {locationName = "Droga do Lasu", locationPos = (1, 3), locationItems = []},
            Location {locationName = "Przeklęta Polana", locationPos = (1, 4), locationItems = []},
            Location {locationName = "Chata Stróża", locationPos = (2, 1), locationItems = ["Srebrna Kula"]},
            Location {locationName = "Stodoła", locationPos = (2, 2), locationItems = ["Szpadel"]},
            Location {locationName = "Wilki", locationPos = (2, 3), locationItems = []}
            ],
        doors = [
            Door {doorName = "Drzwi do Izby", doorPassage = ((0, 2), (1, 2)), isOpen = True},
            Door {doorName = "Drzwi Stróża", doorPassage = ((1, 1), (2, 1)), isOpen = False}
            ],
        characters = [
            Character {characterName = "Panna Młoda", characterPos = (0, 2), characterTopics = ["Spuchnięta Dłoń", "Wesele", "Rozkopana Mogiła"]},
            Character {characterName = "Pan Młody", characterPos = (0, 2), characterTopics = ["Spuchnięta Dłoń", "Rozkopana Mogiła"]},
            Character {characterName = "Goście Weselni", characterPos = (0, 2), characterTopics = ["Spuchnięta Dłoń", "Wesele", "Rozkopana Mogiła"]},
            Character {characterName = "Dziad Proszalny", characterPos = (1, 2), characterTopics = ["Spuchnięta Dłoń", "Wesele", "Rozkopana Mogiła", "Wieczór Kawalerski"]},
            Character {characterName = "Towarzysze Zabawy", characterPos = (2, 2), characterTopics = ["Wieczór Kawalerski"]},
            Character {characterName = "Stróż", characterPos = (1, 1), characterTopics = ["Wesele", "Rozkopana Mogiła"]}
            ],
        interactibles = [
            Interactible {interactibleName = "Rozkopana Mogiła", interactiblePos = (1, 4), wasUsed = False}
            ],
        isOver = False,
        werewolfMoveIndex = 0
        }
    doIntroduction initialState
    gameLoop initialState