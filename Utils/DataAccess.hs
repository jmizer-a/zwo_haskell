module Utils.DataAccess where
import Utils.Types
import Data.List (find)
import Data.Maybe (listToMaybe)

getExistingCharacterNames :: State -> [String]
getExistingCharacterNames state = map characterName (characters state)

getPlayerLocationCharacters :: State -> Characters
getPlayerLocationCharacters state = filter (\c -> characterPos c == playerPos state) (characters state)

getPlayerLocationCharacterNames :: State -> [String]
getPlayerLocationCharacterNames state = map characterName (filter (\c -> characterPos c == playerPos state) (characters state))

removeCharacter :: String -> State -> State
removeCharacter charName state = state { characters = newCharacters }
  where
    newCharacters = filter (\c -> characterName c /= charName) (characters state)

getInteractibles :: State -> Interactibles
getInteractibles state = filter (\i -> interactiblePos i == playerPos state) (interactibles state)

initWerewolf :: State -> State
initWerewolf state =
    let werewolf = Character {
        characterName = "Wilkołak",
        characterPos = (0, 2),
        characterTopics = []
    }
    in state {characters = werewolf : characters state}

findDoor :: String -> State -> Maybe Door
findDoor name state =
  listToMaybe [door | door <- doors state, doorName door == name]

isMaybeDoorOpen :: String -> State -> Maybe Bool
isMaybeDoorOpen doorName state = do
  door <- findDoor doorName state
  return (isOpen door)

isDoorOpen :: String -> State -> Bool
isDoorOpen doorName state =
  case isMaybeDoorOpen doorName state of
    Just True -> True
    _ -> False

getPlayerLocation :: State -> Location
getPlayerLocation state = head [loc | loc <- locations state, locationPos loc == playerPos state]

getDoor :: State -> Maybe Door
getDoor state = find (\door ->
    let (pos1, pos2) = doorPassage door
    in pos1 == playerPos state || pos2 == playerPos state) (doors state)

existsDoor :: Maybe Door -> Bool
existsDoor Nothing = False
existsDoor (Just _) = True

removeItem :: Item -> Items -> Items
removeItem _ [] = []
removeItem item (x:xs)
    | item == x = xs
    | otherwise = x : removeItem item xs

availablePositions :: Positions
availablePositions = [(x,y) | x <- [0..2], y <- [0..4], (x,y) `notElem` [(0,0), (0,1), (0,4), (2,0), (2,4)]]

isValidPosition :: Position -> Bool
isValidPosition (x, y) = (x, y) `elem` availablePositions

blockedPassages :: [Passage]
blockedPassages = [((0,2), (0,3)), ((2,1), (2,2)), ((2,2), (2,3))]

isBlockedPassage :: Position -> Position -> Bool
isBlockedPassage (x1, y1) (x2, y2) = ((x1, y1), (x2, y2)) `elem` blockedPassages || ((x2, y2), (x1, y1)) `elem` blockedPassages

isValidMove :: Direction -> Position -> Bool
isValidMove dir (x, y) = do
    let newPos = move dir (x, y)
    isValidPosition newPos && not (isBlockedPassage (x, y) newPos)

move :: Direction -> Position -> Position
move North (x, y) = (x, y + 1)
move South (x, y) = (x, y - 1)
move East  (x, y) = (x + 1, y)
move West  (x, y) = (x - 1, y)