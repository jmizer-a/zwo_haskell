module Utils.Types where

type Time = Int

type Position = (Int, Int)

type Positions = [Position]

type Passage = (Position, Position)

data Direction = North | South | East | West

data State = State {
    playerPos :: Position,
    playerJournal :: Topics,
    playerInventory :: Items,
    time :: Time,
    locations :: Locations,
    doors :: Doors,
    characters :: Characters,
    interactibles :: Interactibles,
    isOver :: Bool,
    werewolfMoveIndex :: Int
}

data Location = Location {
    locationName :: String,
    locationPos :: Position,
    locationItems :: Items
} deriving (Eq)

type Locations = [Location]

type Item = String

type Items = [Item]

data Command
    = Move Direction
    | Talk String String      -- porozmawiaj <postać> <zagadnienie>
    | Use Item String         -- użyj <przedmiot> <obiekt>
    | Take Item               -- podnieś <przedmiot>
    | Shoot String            -- zastrzel <postać>
    | Look                    -- rozejrzyj
    | Wait                    -- czekaj
    | Journal                 -- dziennik
    | Inventory               -- ekwipunek
    | Help                    -- pomoc
    | Quit                    -- zrezygnuj
    | Unknown String          -- nieznane polecenie

data Door = Door {
    doorName :: String,
    doorPassage :: Passage,
    isOpen :: Bool
} deriving (Eq)

type Doors = [Door]

data Interactible = Interactible {
    interactibleName :: String,
    interactiblePos :: Position,
    wasUsed :: Bool
} deriving (Eq)

type Interactibles = [Interactible]

type Topic = String

type Topics = [Topic]

data Character = Character {
    characterName :: String,
    characterTopics :: Topics,
    characterPos :: Position
} deriving (Eq)

type Characters = [Character]