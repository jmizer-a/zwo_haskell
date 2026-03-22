module Utils.Dialogues where
import Utils.Types
import Utils.DataAccess
import Utils.GameStatePrinting

doDefaultDialogue :: Character -> State -> [String]
doDefaultDialogue character state | characterName character == "Pan Młody" = groomDefaultDialogue state
                                   | characterName character == "Panna Młoda" = brideDefaultDialogue state
                                   | characterName character == "Goście Weselni" = guestsDefaultDialogue state
                                   | characterName character == "Dziad Proszalny" = beggarDefaultDialogue state
                                   | characterName character == "Towarzysze Zabawy" = friendsDefaultDialogue state
                                   | characterName character == "Stróż" = watchmanDefaultDialogue state

doSpecificDialogue :: Character -> String -> State -> IO State
doSpecificDialogue character topic state =
    case characterName character of
        "Pan Młody" -> do
            case topic of
                "Spuchnięta Dłoń" -> do
                    printLines ["'Co z nią? No, spuchła trochę, i co? Czekaj, bo mnie wołają. Już idę!', odpowiada wymijająco Pan Młody, po czym oddala się na drugi koniec izby. Nie słyszałeś, żeby ktoś go wołał."]
                    return state {time = time state + 1}
                "Rozkopana Mogiła" -> do
                    printLines ["'Nie myślisz chyba, że... Nie, to niemożliwe, na pewno nic mi nie będzie... Prawda?'"]
                    return state {time = time state + 1}
        "Panna Młoda" -> do
            case topic of
                "Spuchnięta Dłoń" -> do
                    printLines [
                        "'Och, tak, zauważyłam. Ciężko nie zauważyć...', odpowiada Panna Młoda, marszcząc brwi. 'Nie wiem dlaczego, ale nie chce i mi powiedzieć, co się stało. Wcześniej nie była aż tak sina i spuchnięta, ale parę dni temu miał wieczór kawalerski i to chyba wtedy się zranił. Może zrobił jaką głupotę i tym dłoń skaleczył, a nie powie, bo mu wstyd? Bawił się z kilkoma innymi chłopcami... wyjątkowo podłe towarzystwo, za przeproszeniem. Mało im było zabawy i jeszcze wczoraj poprawili, to teraz leżą w stodole i dochodzą do siebie. Może oni coś wiedzą, ale ja z nimi nie mam zamiaru rozmawiać'. Panna Młoda wzdycha ciężko i kręci głową. 'Ech, mógłby mi choć opuchliznę dać do obejrzenia, bałwan...'",
                        "!! Nowe zagadnienie w dzienniku: Wieczór Kawalerski"
                        ]
                    return state {playerJournal = "Wieczór Kawalerski" : playerJournal state, time = time state + 1}
                "Rozkopana Mogiła" -> do
                    printLines ["Panna Młoda patrzy na ciebie z niedowierzaniem. 'Niemożliwe. Musi być, że się tamtym osłom pomyliło, niemożliwe żeby mój...' Próbujesz przekonać ją, żeby się schowała, uciekła, cokolwiek... 'Nie, nigdzie nie idę. Nie po to żem się z nim ochajtnęła, żeby zaraz przed nim uciekać, bo mi jakiś... jakiś Domokrążca mówi, że rzekomo wziął i go nieżywy wilkołak pogryzł. Słyszysz ty siebie?'. Widzisz po niej, że jej rzekoma niewiara to blef. Wie, że nie masz powodu kłamać, na pewno też wie o pogrzebanej na polanie bestii więcej, niż ty; mimo to jest zdecydowana zostać u boku męża. Żadnym sposobem nie zmienisz jej zdania."]
                    return state {time = time state + 1}
                "Wesele" -> do
                    printLines ["'Oczywiście, że się cieszę! Myślisz, że mnie by kto dał radę przymusem zeswatać?'"]
                    return state {time = time state + 1}
        "Goście Weselni" -> do
            case topic of
                "Spuchnięta Dłoń" -> do
                    printLines ["'Pewno, żeśmy zauważyli', odpowiada rumiana kobieta znad kufla, 'ciężko nie zauważyć! Musi być, skaleczenie...' Ktoś inny, starszy mężczyzna o nadającym mu wygląd wydry wąsie, podsłuchuje rozmowę i postanawia się przyłączyć. 'Skaleczenie i gangrena albo inne paskudztwo. Ja bym uciął, mówiłem, to mnie wyśmiali. Rozumiesz, co mówię?' Kilka jeszcze osób przyłącza się do wymiany zdań, ale wniosek pozostaje jeden: nikt nic tak naprawdę nie wie."]
                    return state {time = time state + 1}
                "Rozkopana Mogiła" -> do
                    printLines ["W odpowiedzi na twoje wykrzyczane ostrzeżenie w izbie zapada milczenie. Wszyscy Goście Weselni patrzą na Pana Młodego, jedni ze współczuciem, inni z pogardą czy niesmakiem, ale wszyscy z prawdziwym niepokojem. Każdy zna legendy o wilkołakach, a Bestia, choć jest we wsi tabu, wciąż nie odeszła w niepamięć. Z czasem wszyscy Goście Weselni - jedni żwawiej, inni po cichu albo oferując wymówki - opuszczają izbę."]
                    return state {time = time state + 1, characters = filter (\c -> characterName c /= "Goście Weselni") (characters state)}
                "Wesele" -> do
                    printLines ["'Zabawa dobra, choć towarzystwo wcale przaśne, proszę waszeci', mówi pryszczaty podrostek - mieszczuch, sądząc z treści i wymowy. 'Ja nie wiem, jakie to jest przaśne towarzystwo, ale skorośmy już w temacie, to przykro mi trochę, że ojciec Pana Młodego nie zaszczycił', żali się siedzący obok niego na ławie staruszek. 'Ano nie zaszczycił, bo ma robotę! Nasz Stróż jest człowiek porządny i pracowity, ot co! Młodzi na pewno mu nie mają za złe', wtrąca się gospodyni, niosąc kolejny talerz z serem. Gdy temat schodzi na bieżące plotki o życiu prywatnym Stróża, jego chorej nodze i rzekomym romansie z rusałką w młodości, tracisz zainteresowanie."]
                    return state {time = time state + 1}
        "Dziad Proszalny" -> do
            case topic of
                "Spuchnięta Dłoń" -> do
                    printLines ["'A ja wiem, czy widziałem. A za ile?' Rzucasz Dziadowi Proszalnemu denara. 'No, niech będzie, że widziałem. To nie jest gangrena, wiesz, chłopcze? Tak, te bandaże na nodze to jest ściema, ale prawdziwie żem niejedno zapalenie czy inne zakażenie widział tu i ówdzie. Tu się coś dzieje niedobrego, jeśli mnie rozumiesz; czary, powiedziałbym. Ale jakie, to ja tego nie wiem. No, jakbyś co jeszcze wybadał, chodź i pytaj, chłopcze, chętnie opowiem.'"]
                    return state {time = time state + 1}
                "Rozkopana Mogiła" -> do
                    printLines ["'A więc Bestię odkopali? Niepojęte, nie do pomyślenia... Oj, mam ja ci do powiedzenia, oj mam, ale za ile...?' Rzucasz Dziadowi Proszalnemu cały srebrny grosz. Żebrak kiwa z uznaniem głową, zamyśla się. 'Bestia, proszę ja ciebie, siała tutaj, jak mówią, popłoch i spustoszenie będzie dwadzieścia lat temu. Skąd się wzięła? Niewielu wie. Wieś opustoszała, kto przeżył się zaraz wyniósł, ale Bestia nie zostawiała rannych. Nawet nasz Stróż, co się nikogo nie boi, umknął.' Dziad przerywa swój wywód, patrząc na ciebie z oczekiwaniem. Rzucasz mu kolejny grosz, a on ciągnie dalej. 'Dopiero po wielu miesiącach wrócił i zabił Bestię, zakopał na polanie, gdzie odtąd nic jak chwasty róść nie chce. Taki los spotkał Zgubę wsi Omiegi. Jeśli jest jak myślisz i Pan Młody się skaleczył, i nie daj Boże ściągnął na siebie klątwę... Dziś pełnia. Przekonamy się prędzej, niż chcemy.' Dziad Proszalny patrzy na ciebie z tą samą miną, co wcześniej. Kiedy mówisz mu, że potrzebujesz pieniędzy na drogę, przemawia bez opłaty, cichszym tonem, jakby nagle posmutniał. 'Ja wiem, skąd się Bestia wzięła, chłopcze.' Czekasz, aż powie więcej. 'Okrutny los spotkał Stróża i jego rodzinę. Wiesz na pewno, że Pan Młody jest jego synem. Bestią był jego brat.'"]
                    return state {time = time state + 1}
                "Wesele" -> do
                    printLines ["'Mnie to tam mało interesuje, bo tam jest hałas w środku, tak ci powiem, chłopcze. Ale dobrze, niech cieszą się, niech świętują. Też kiedyś tańcowałem, że ho ho!'"]
                    return state {time = time state + 1}
                "Wieczór Kawalerski" -> do
                    printLines ["'Oj, nie wiem, czy słyszałem. A za ile?' Rzucasz Dziadowi Proszalnemu denara. 'Cała wieś słyszała, chłopcze, hałas robili, jakby Panu Młodemu żona już miała nigdy nie dać pokrzyczeć. Może i jest coś na rzeczy?' Zaczyna ci być żal wydanego denara, ale żebrak ciągnie dalej. 'Widziałem, jak z lasu wracali, jeden niósł szpadel. Jeśliś, chłopcze, uparty, i zamierzasz leźć ich śladem, to pamiętaj jedno: Nie zbaczaj ze ścieżki.'"]
                    return state {time = time state + 1}
        "Towarzysze Zabawy" -> do
            case topic of
                "Wieczór Kawalerski" -> do
                    printLines ["'Hę? Czego chce, spać nie daje, Boszszee...' Wyjaśniasz zmęczonym nocą młodzieńcom, po co przyszedłeś. 'No tak, poszliśmy, znaczy... No, na polanę, na północy, ogólnie, i żeśmy... No, zabawę sobie zrobili. Jak się skaleczył, to tam pewnie, bo gdzie? Ja go chyba nie ugryzłem... Nie pamiętam, przynajmniej. Nie wiem, sam idź tam jak chcesz, jak nie będziesz skręcał trafisz, ale jak dla mnie to wcale nie było takie znowu... ćśśsiekawe...' Chłopak osuwa się z powrotem na siano. Może tyle informacji ci wystarczy?"]
                    return state {time = time state + 1}
        "Stróż" -> do
            case topic of
                "Rozkopana Mogiła" -> do
                    printLines [
                        "Stróż przybiera najgroźniejszą i najbardziej poważną minę, jaką kiedykolwiek widziałeś. 'Czułem, że to się kiedyś zdarzy, ale żeby mój własny syn, niech go licho porwie. I ta cholerna pełnia... Masz, chłopcze.' Stróż rzuca ci Strzelbę. 'Lepiej na nią uważaj. Jest cenna.' Rzuca też pęk Kluczy. 'Te klucze otwierają i zamykają wszystkie drzwi we wsi. W mojej chacie, tej tu obok, na stole leży czarna szkatułka. W środku jest jedna srebrna kula. Weź ją i... nie zawahaj się, jak ja się zawahałem dwadzieścia lat temu.'",
                        "!! Nowy przedmiot w ekwipunku: Strzelba",
                        "!! Nowy przedmiot w ekwipunku: Klucze"
                        ]
                    let newInventory = "Strzelba" : "Klucze" : playerInventory state
                    return state {playerInventory = newInventory, time = time state + 1}
                "Wesele" -> do
                    printLines ["'Cieszę się ze szczęścia młodych', odpowiada Stróż wymijająco. 'Mój syn ma szczęście, że taka dziewczyna zechciała gamonia jak on.' Na pytanie, czemu nie świętuje z nimi, Stróż kręci tylko głową."]
                    return state {time = time state + 1}

groomDefaultDialogue :: State -> [String]
groomDefaultDialogue _ = ["'Słuchaj, miło mi, że zostałeś na weselu, ale mam teraz inne sprawy na głowie.'"]

brideDefaultDialogue :: State -> [String]
brideDefaultDialogue state =
    if "Wilkołak" `elem` getExistingCharacterNames state
        then ["Ratuj się!"]
        else ["'Wybacz, ale jestem trochę zajęta.'"]

guestsDefaultDialogue :: State -> [String]
guestsDefaultDialogue state =
    if "Wilkołak" `elem` getExistingCharacterNames state
        then ["Goście Weselni nie odpowiadają, zajęci rozpaczliwą ucieczką."]
        else ["'Nie wiem nic, dobry człowieku, ale mam tu gorzałkę i sam jej nie dam rady opróżnić... chyba, że skonam', odpowiada ci jedyny z Gości Weselnych niezajęty rozmową."]

friendsDefaultDialogue :: State -> [String]
friendsDefaultDialogue _ = ["'Szszłowieku, daj spaćśśś...'"]

watchmanDefaultDialogue :: State -> [String]
watchmanDefaultDialogue _ = ["'Dziś pełnia. Cholerna pełnia...'"]

beggarDefaultDialogue :: State -> [String]
beggarDefaultDialogue _ = ["'Nic więcej o tym nie wiem, ale jak znajdziesz co nowego, przyjdź tu prędko. Żebrak widzi wiele, a pamięta więcej niż by chciał.'"]