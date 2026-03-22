module Utils.GameStatePrinting where
import Utils.Types
import Utils.Descriptions
import Utils.DataAccess

printLines :: [String] -> IO ()
printLines xs = putStr (unlines xs)

printInstructions :: IO ()
printInstructions = printLines instructionsText

printState :: State -> IO ()
printState state = do
    printTime (time state)
    printLocation (playerPos state)
    printCharacters (getPlayerLocationCharacters state) state
    printItems (locationItems (getPlayerLocation state))
    printDoor (getDoor state)
    printInteractibles (getInteractibles state)

printTime :: Time -> IO ()
printTime t | t < 7 = printLines sunsetDescription
            | t < 12 = printLines duskDescription
            | t < 19 = printLines nightDescription
            | t < 28 = printLines almostMidnightDescription
            | t >= 28 = printLines midnightDescription

printLocation :: Position -> IO ()
printLocation (x, y) | (0,2) == (x, y) = printLines chamberDescription
                     | (0,3) == (x, y) = printLines [""]
                     | (1,0) == (x, y) = printLines [""]
                     | (1,1) == (x, y) = printLines watchtowerDescription
                     | (1,2) == (x, y) = printLines squareDescription
                     | (1,3) == (x, y) = printLines pathToForestDescription
                     | (1,4) == (x, y) = printLines cursedGladeDescription
                     | (2,1) == (x, y) = printLines watchmansHutDescription
                     | (2,2) == (x, y) = printLines barnDescription
                     | (2,3) == (x, y) = printLines [""]

printInventory :: State -> IO ()
printInventory state = do
    let inventory = playerInventory state
    printLines ["EKWIPUNEK"]
    printInventoryItems inventory

printInventoryItems :: Items -> IO ()
printInventoryItems [] = return ()
printInventoryItems (x:xs) = do
    printInventoryItem x
    printInventoryItems xs

printInventoryItem :: Item -> IO ()
printInventoryItem item | item == "Czapka z Piór" = printLines inventoryHatDescription
                        | item == "Szpadel" = printLines inventoryShovelDescription
                        | item == "Strzelba" = printLines inventoryGunDescription
                        | item == "Srebrna Kula" = printLines inventoryBulletDescription
                        | item == "Klucze" = printLines inventoryKeysDescription
                        | item == "Plecak" = printLines inventoryBackpackDescription


printJournal :: State -> IO ()
printJournal state = do
    let journal = playerJournal state
    printLines ["DZIENNIK"]
    printJournalEntries journal

printJournalEntries :: Topics -> IO ()
printJournalEntries [] = return ()
printJournalEntries (x:xs) = do
    printJournalEntry x
    printJournalEntries xs

printJournalEntry :: Topic -> IO ()
printJournalEntry entry | entry == "Wesele" = printLines receptionDescription
                        | entry == "Spuchnięta Dłoń" = printLines swollenHandDescription
                        | entry == "Wieczór Kawalerski" = printLines bachelorPartyDescription
                        | entry == "Rozkopana Mogiła" = printLines dugUpGraveDescription

printItems :: Items -> IO ()
printItems [] = return ()
printItems (x:xs) = do
    printItem x
    printItems xs

printItem :: Item -> IO ()
printItem item | item == "Czapka z Piór" = printLines hatDescription
              | item == "Szpadel" = printLines shovelDescription
              | item == "Strzelba" = printLines ["TODO: Strzelba"]
              | item == "Srebrna Kula" = printLines bulletDescription
              | item == "Klucze" = printLines ["TODO: Klucze"]

printDoor :: Maybe Door -> IO ()
printDoor Nothing = return ()
printDoor (Just door) = do
    let status = if isOpen door then "otwarte" else "zamknięte"
    printLines ["*"++ doorName door ++ "* są " ++ status ++ "."]

printInteractibles :: Interactibles -> IO ()
printInteractibles [] = return ()
printInteractibles (x:xs) = do
    printInteractible x
    printInteractibles xs

printInteractible :: Interactible -> IO ()
printInteractible interactible | interactibleName interactible == "Rozkopana Mogiła" = if wasUsed interactible
                               then printLines graveUsedDescription
                               else printLines graveNotUsedDescription

printCharacters :: Characters -> State -> IO ()
printCharacters [] _ = return ()
printCharacters (x:xs) state = do
    printCharacter x state
    printCharacters xs state

printCharacter :: Character -> State -> IO ()
printCharacter character state | characterName character == "Pan Młody" = printLines (groomDescription state)
                               | characterName character == "Panna Młoda" = printLines (brideDescription state)
                               | characterName character == "Goście Weselni" = printLines (guestsDescription state)
                               | characterName character == "Dziad Proszalny" = printLines (beggarDescription state)
                               | characterName character == "Towarzysze Zabawy" = printLines (friendsDescription state)
                               | characterName character == "Stróż" = printLines (watchmanDescription state)
                               | characterName character == "Wilkołak" = printLines (werewolfDescription state)