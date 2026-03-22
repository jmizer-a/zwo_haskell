module Utils.Descriptions where
import Utils.Types
import Utils.DataAccess

introductionText :: [String]
introductionText = [
    "Zguba wsi Omiegi - gra przygodowa",
    "---------------------------------", "",
    "W cieniu pierwotnej puszczy, pod spojrzeniem złowrogich sił, człowiek uparcie żyje - i stara się z życia czerpać, ile może.", "",
    "Nazywają cię po prostu Domokrążcą, bo krążysz po całym świecie, od domu do domu, od jednych kupując, innym sprzedając, jeszcze innym opowiadając swe przygody.",
    "Zawędrowałeś dziś rano do wsi o nazwie Omiegi, położonej u samych stóp czarnej puszczy. Okazało się, że szczęśliwie trafiłeś - dziś odbywają się zaślubiny młodej pary. Zaproszono cię do udziału w zabawach i nie odmówiłeś.",
    "W czasie ceremonii okazało się, że dłoń Pana Młodego zsiniała i spuchła tak, że nie dało się wsunąć na palec obrączki. Młodzieniec zbył ten fakt żartem i wsunął obrączkę na drugą dłoń. Wszyscy wiwatowali, choć Panna Młoda patrzyła na męża z mieszaniną podejrzliwości i troski.",
    "Od tamtej pory minęło kilka godzin, wesele nabrało rozpędu i izbę weselną wypełniają śmiechy i okrzyki. Słońce zachodzi. Przez okna wpada chłodny, jesienny wiatr. Spuchnięta dłoń Pana Młodego nie daje ci spokoju.",
    "Jeśli chcesz dojść do sedna tej sprawy, lepiej się spiesz - o północy oczepiny!", ""
    ]

instructionsText :: [String]
instructionsText = [
    "DOSTĘPNE POLECENIA",
    "- n/e/s/w",
    "    przemieszcza Domokrążcę do lokacji położonej na północ, wschód, południe albo zachód od aktualnej lokacji Domokrążcy, o ile to możliwe (np. na drodze nie stoją zamknięte drzwi)",
    "- zapytaj <postać> o <zagadnienie>",
    "    prowokuje dialog z podaną postacią na temat podanego zagadnienia, o ile postać znajduje się w lokacji Domokrążcy i wie coś na ten temat",
    "- użyj <przedmiot> na <obiekt>",
    "    dokonuje interakcji z obiektem przy użyciu przedmiotu",
    "- podnieś <przedmiot>",
    "    dodaje znajdujący się w lokacji Domokrążcy przedmiot do ekwipunku",
    "- zastrzel <postać>",
    "    powoduje zastrzelenie postaci, jeżeli Domokrążca posiada właściwy do tego przedmiot",
    "- rozejrzyj",
    "    wywołuje opis sytuacji, podając lokację oraz zajdujące się w niej postacie, przedmioty i obiekty; podaje porę dnia",
    "- czekaj",
    "    sprawia, że Domokrążca czeka, aż coś się stanie bez jego udziału; lepiej zastanów się dobrze przed użyciem tego polecenia",
    "- dziennik",
    "    wypisuje poznane zagadnienia z dziennika Domokrążcy wraz z ich opisem",
    "- ekwipunek",
    "    wypisuje posiadane przedmioty z ekwipunku Domokrążcy wraz z ich opisem",
    "- pomoc",
    "    wyświetla niniejszą listę dostępnych poleceń",
    "- zrezygnuj",
    "    powoduje przedwczesny koniec gry"
    ]


-- Times of Day Descriptions
sunsetDescription :: [String]
sunsetDescription = [
    "Zachód słońca: Krwawy blask zachodzącego słońca zalewa okolicę. ",
    ""
    ]

duskDescription :: [String]
duskDescription = [
    "Zmrok: Słońce schowało się za horyzontem, a mrok powoli ogarnia wieś.",
    ""
    ]

nightDescription :: [String]
nightDescription = [
    "Noc: Na niebie ledwo dostrzec można księżyc przysłoniony chmurami. ",
    ""
    ]

almostMidnightDescription :: [String]
almostMidnightDescription = [
    "Zaraz północ: W Omiegach panują ciemności, ale zasłona chmur zaczyna się rozsuwać ukazując blade światło. ",
    ""
    ]

midnightDescription :: [String]
midnightDescription = [
    "Północ: Na niebie widnieje księżyc w pełni... ",
    ""
    ]


-- Location Descriptions
chamberDescription :: [String]
chamberDescription = [
    "Wnętrze izby rozświetlają świece. Ławy, rozstawione tak licznie jak to było możliwe w dosyć ciasnym pomieszczeniu, zastawione są suto różnego rodzaju strawą i napitkiem. Bielone ściany ozdabiają trofea i mające odpędzać złe moce zioła. Drzwi izby otwierają się na wschód.",
    ""
    ]

squareDescription :: [String]
squareDescription = [
    "Mały plac stanowi centrum wsi, zaś centrum placu stanowi studnia. Na zachodzie jest izba weselna, na wschodzie stodoła, na południu wznosi się strażnica, na której szczycie widzisz sylwetkę Stróża, ściskającą w dłoni strzelbę, strzegącą w milczeniu wsi. Od północy do wsi przylega ciemny, gęsty las, do którego prowadzi wąska, kręta ścieżka, wyraźnie z rzadka tylko uczęszczana.",
    ""
    ]

barnDescription :: [String]
barnDescription = [
    "Otwierające się na zachód drzwi do stodoły były otwarte. Wnętrze wypełnia woń słomy, stęchlizny i alkoholu.",
    ""
    ]

watchtowerDescription :: [String]
watchtowerDescription = [
    "Strażnicą mieszkańcy Omiegów nazywają prostą drewnianą konstrukcję, podobną do myśliwskiej ambony, stojącą tuż przy trakcie. Stróż ma stąd doskonały widok na okolicę: wiejski plac na północy, trakt na południu i niewielką chatę, prawdopodobnie należącą do Stróża, stojącą zaraz obok po wschodniej stronie. Jeśli udasz się na południe i ruszysz traktem, już najpewniej nigdy nie powrócisz do Omiegów.",
    ""
    ]

watchmansHutDescription :: [String]
watchmansHutDescription = [
    "Chata Stróża jest zauważalnie starsza od innych budynków w Omiegach. Przez ganek wpada do niej snop księżycowego światła, oświetlając unoszący się wszędzie kurz.",
    ""
    ]

pathToForestDescription :: [String]
pathToForestDescription = [
    "Droga prowadząca do lasu to w zasadzie ledwie dostrzegalna ścieżka ściśnięta między korzeniami sędziwych dębów, buków i wiązów, których liście zasłaniają niebo niemal zupełnie. Nikt, kto nie ma dobrego powodu, by tu być, nie powinien zapuszczać się w gęstwinę bodaj o krok dalej. Ścieżka się rozwidla. Jeśli nie wiesz, gdzie masz iść, lepiej zawróć.",
    ""
    ]

cursedGladeDescription :: [String]
cursedGladeDescription = [
    "Powietrze jest tu ciężkie. Na samej polanie nie rośnie nic prócz dzikiej trawy, tojadu i pokrzywy, zaś otaczające ją wierzby zginają się ku samej ziemi i szumią żałośnie. Nie potrafisz oprzeć się wrażeniu, że to sam las opłakuje tragedię, do której musiało tu dojść. Jedyna droga stąd prowadzi na południe, skąd tu przyszedłeś.",
    ""
    ]


-- Item Descriptions
inventoryBackpackDescription :: [String]
inventoryBackpackDescription = [
    "- Plecak",
    "    Dosyć pojemny, skórzany plecak."
    ]

hatDescription :: [String]
hatDescription = [
    "Na ławie leży *Czapka z Piór*."
    ]

inventoryHatDescription :: [String]
inventoryHatDescription = [
    "- Czapka z Piór",
    "    Dobrze, że właściciel zgubił ją, a nie coś cennego. Na przykład buty. Trza być w butach na weselu."
    ]

shovelDescription :: [String]
shovelDescription = [
    "O ścianę stodoły oparty jest *Szpadel*."
    ]

inventoryShovelDescription :: [String]
inventoryShovelDescription = [
    "- Szpadel",
    "    Proste, chłopskie narzędzie pracy."
    ]

inventoryGunDescription :: [String]
inventoryGunDescription = [
    "- Strzelba",
    "    Długa lufa, zamek kołowy... bez wątpienia najcenniejsza broń we wsi, może nawet najcenniejszy przedmiot, choć ma swoje lata."
    ]

bulletDescription :: [String]
bulletDescription = [
    "Zgodnie z tym, co mówił Stróż, w czarnej szkatułce na stole leży *Srebrna Kula* do strzelby."
    ]

inventoryBulletDescription :: [String]
inventoryBulletDescription = [
    "- Srebrna Kula",
    "    Wygląda, jakby stopiono ją z kilku kawałków srebra o różnej próbie. W szkatułce było też nieco prochu, którego użyłeś do załadowania broni. Możesz wystrzelić z broni w każdej chwili, ale masz jeden strzał."
    ]

inventoryKeysDescription :: [String]
inventoryKeysDescription = [
    "- Klucze",
    "    Pęk kluczy różnego rozmiaru, najbardziej zużyty musi otwierać drzwi do chaty Stróża; co otwierają pozostałe...?"
    ]


-- Journal Entry Descriptions
receptionDescription :: [String]
receptionDescription = [
    "- Wesele",
    "    Trwa wesele."
    ]

swollenHandDescription :: [String]
swollenHandDescription = [
    "- Spuchnięta Dłoń",
    "    Dłoń Pana Młodego jest sina i spuchnięta. Wygląda to przynajmniej na zakażenie. Panna Młoda się martwi."
    ]

bachelorPartyDescription :: [String]
bachelorPartyDescription = [
    "- Wieczór Kawalerski",
    "    Pan Młody ponoć nieźle zabawił na wieczorze kawalerskim. Panna Młoda sądzi, że mógł skaleczyć się wtedy - jeśli tak było, jego Towarzysze Zabawy powinni o tym wiedzieć. Powinni być w stodole, gdzie dochodzą do siebie."
    ]

dugUpGraveDescription :: [String]
dugUpGraveDescription = [
    "- Rozkopana Mogiła",
    "    Znalazłem rozkopaną mogiłę. Złożono w niej olbrzymiego wilka. To najpewniej był wilkołak, a Pan Młody skaleczył się na kle. Niedobrze. Dziś pełnia."
    ]


-- Character Descriptions
groomDescription :: State -> [String]
groomDescription state =
    if "Goście Weselni" `elem` getExistingCharacterNames state
        then ["*Pan Młody* pije z dwójką *Gości Weselnych.*"]
        else ["*Pan Młody* siedzi naprzeciw *Panny Młodej.*"]

brideDescription :: State -> [String]
brideDescription state =
    if "Wilkołak" `elem` getExistingCharacterNames state
        then ["*Panna Młoda* cofnęła się pod ścianę. W jej oczach widzisz czystą, bezbrzeżną grozę."]
        else if "Goście Weselni" `elem` getExistingCharacterNames state
            then ["Na środku izby, otoczona roześmianymi druhnami, siedzi *Panna Młoda* w kwiecistym wianku weselnym."]
            else ["*Panna Młoda* siedzi przy ławie."]

guestsDescription :: State -> [String]
guestsDescription state =
    if "Wilkołak" `elem` getExistingCharacterNames state
        then ["*Goście Weselni* są w popłochu. Niektórych zmroził strach, niektórzy pomdleli. Reszta rzuca się do drzwi, ale nie każdy zdoła uciec."]
        else ["*Goście Weselni*, w liczbie większej niż kopa, ledwie się pomieścili w izbie."]

friendsDescription :: State -> [String]
friendsDescription _ = ["Na stogu siana pod ścianą stodoły leży trzech mężczyzn. Zbudzeni przez twoje nagłe wtargnięcie masują skronie i jęczą. To z pewnością *Towarzysze Zabawy*, którzy wciąż odpokutowują wieczór kawalerski."]

watchmanDescription :: State -> [String]
watchmanDescription _ = ["Na strażnicy stoi oparty o belkę rusztowania starszy mężczyzna o surowym obliczu pooranym bliznami. To musi być *Stróż*."]

beggarDescription :: State -> [String]
beggarDescription _ = ["Przy studni siedzi *Dziad Proszalny* i ściąga bandaże ze zdrowej nogi."]

werewolfDescription :: State -> [String]
werewolfDescription _ = ["*Wilkołak* łaknie krwi."]


-- Interactible Descriptions
graveUsedDescription :: [String]
graveUsedDescription = [
    "Rozkopałeś *Rozkopaną Mogiłę*. Czaszka olbrzymiego wilka spoczywa teraz na dzikiej trawie, a jej kieł umazany jest zakrzepłą krwią."
    ]

graveNotUsedDescription :: [String]
graveNotUsedDescription = [
    "Na środku polany znajduje się *Rozkopana Mogiła*. Ktoś wyraźnie odkopał to coś, co w niej dawno temu zagrzebano, ale potem pospiesznie przykrył z powrotem ziemią."
    ]


-- Ending Descriptions
ranAwayEndingDescription :: [String]
ranAwayEndingDescription = [
    "Niepozorne Omiegi okazały się skrywać wiele sekretów, których wolałbyś nigdy nie poznać. Może jeszcze o niej kiedyś usłyszysz i dowiesz się, na jaką tragedię pozwoliłeś, opuszczając wieś. Osiągnąłeś tej nocy jeden sukces: przeżyłeś. Modlisz się teraz tylko, żeby w nocy na trakcie nie zaatakowali cię zbójcy... lub coś gorszego."
    ]

groomShotEndingDescription :: [String]
groomShotEndingDescription = [
    "Następnego ranka, stojąc na pieńku, zastanawiasz się tylko nad jednym: czy było warto? Owszem, ocaliłeś wieś przed zgubnym losem, uratowałeś mieszkających w niej ludzi, ale w tym celu zamordowałeś - co by nie było - niewinnego człowieka. Owdowiłeś młodą, pełną nadziei Pannę Młodą zanim zdążyła nacieszyć się swym ukochanym. Odebrałeś Stróżowi jedynego syna. Rozglądasz się, ale nie widzisz go. Oburzeni dopuszczonym przez niego morderstwem Omieżanie wygnali go jeszcze w nocy. A ciebie, mordercę... Czujesz na szyi szorstki powróz. Czy było warto?"
    ]

werewolfChangesAfterSlaughterEndingDescription :: [String]
werewolfChangesAfterSlaughterEndingDescription = [
    "Nad ranem słyszysz, że hałasy ustały, więc otwierasz drzwi do izby weselnej. Pan Młody klęczy w postrzępionym ubraniu, tuląc do piersi ciało ukochanej. W izbie nie ostał się nikt żywy. Młodzieniec podnosi na ciebie wzrok, szukając w twoich oczach zrozumienia. Pozwoliłeś, żeby wilkołak rozszarpał niewinnych ludzi, wraz z własną małżonką. Próbując ukryć łzy żalu i wstydu, opuszczasz izbę, opuszczasz wieś. Nie planujesz tu już wrócić."
    ]

werewolfChangesWithoutSlaughterEndingDescription :: [String]
werewolfChangesWithoutSlaughterEndingDescription = [
    "Nad ranem otwierasz drzwi do izby weselnej. Pan Młody siedzi w kącie w łachmanach, a obok niego... czy to możliwe? Panna Młoda siedzi żywa, gdy wchodzisz, podnosi na ciebie wzrok. 'Dziękuję', szepcze, gładząc zalewającego się łzami małżonka. Słyszysz za sobą nierówny krok; obracasz się i widzisz Stróża wkraczającego do izby. Otwiera usta, ale żadne słowo ich nie opuszcza. W oku starca błyszczy łza. Wyciągasz ku niemu rękę ściskającą Strzelbę, ale on kręci głową. 'Zachowaj ją sobie, chłopcze. W podzięce za uratowanie mi syna. Jak widzisz... zdaje się, nie będzie już potrzebna'. Opuszczasz wieś Omiegi jako bohater, ocaliwszy Gości Weselnych, darowawszy życie Panu Młodemu... nawet Panna Młoda zdołała uniknąć śmierci, ale jak?... Ciężko ci to pojąć, ale pojmujesz na pewno, że tę niepozorną osadę zapamiętasz na długie lata i w niejednej karczmie opowiesz historię o nieroztropnych zabawach kawalerów i nieustraszonej Pannie Młodej, która przeżyła całą noc z Wilkołakiem, bo nie chciała żyć bez niego."
    ]

werewolfKillsPlayerEndingDescription :: [String]
werewolfKillsPlayerEndingDescription = [
    "Uderzenie pazurzastych łap obala cię na ziemię. Masz zaledwie sekundę, by dostrzec coś w czerwonych ślepiach... Kły przebijają ciało i Śmierć przesłania ci oczy swą czarną dłonią."
    ]

werewolfShotDeadBrideEndingDescription :: [String]
werewolfShotDeadBrideEndingDescription = [
    "Stoisz, trzymając dymiącą lufę wciąż wycelowaną w potwora. Oddychasz ciężko, po chwili dopiero opuszczasz broń. Olbrzymi wilk leży teraz martwy - aż ciężko sobie wyobrazić, że jeszcze przed godziną to był szczęśliwy, młody człowiek... Ocierasz spoconą twarz. Odrzucasz od siebie broń. Ciała należy spalić."
    ]

werewolfShotBrideAliveEndingDescription :: [String]
werewolfShotBrideAliveEndingDescription = [
    "Huk przez długi czas dzwoni ci echem w uszach. Do izby wpada, utykając, Stróż. Panna Młoda zanosi się płaczem. Oboje klękają przy martwym wilczym ciele Pana Młodego. Stróż obejmuje synową ramieniem i z grobową miną podnosi ku tobie spojrzenie. 'Zrobiłeś, co musiałeś, chłopcze. Zabierz tę Strzelbę, ja już nie mam dla niej potrzeby. I nie chcę jej więcej oglądać'. Wiesz, że ma rację: to była konieczność. Młodzieniec sam ściągnął na siebie ten los, nie trzeba było niepokoić zmarłych przeklętych... Dobrze, że nikt więcej nie zginął. Opierasz Strzelbę o ramię i opuszczasz izbę, wychodzisz na trakt. Wschodzące słońce oświetla ci twarz, a ty wiesz, że wieś Omiegi na długo zapadnie ci w pamięć."
    ]

cliffEndingDescription :: [String]
cliffEndingDescription = [
    "Słyszysz za plecami wycie wilków. Przyspieszasz kroku, zahaczasz stopą o korzeń i spadasz. Ostrzeżono cię, żebyś nie zbaczał ze szlaku."
    ]

wolvesEndingDescription :: [String]
wolvesEndingDescription = [
    "Słyszysz przed sobą wycie wilków. Zatrzymujesz się i rozglądasz, próbując znaleźć drogę ucieczki. Świecące w ciemności ślepia zaczynają ze wszystkich stron zbliżać się do ciebie. Niemądrze jest w nocy zapuszczać się do lasu."
    ]

-- Werewolf Event Descriptions
werewolfChanges :: [String]
werewolfChanges = [
    "",
    "Nagle Pan Młody zgina się w pół, pada na kolana, drapiąc po podłodze paznokciami, które zaczęły się wydłużać w pazury. Ciało porasta mu futro, stawy wykręcają się, twarz przekształca w wilczy pysk. Po chwili nie ma już Pana Młodego - w jego miejscu stoi olbrzymich rozmiarów wilk, szczerzący kły. W czerwonych oczach Wilkołaka płonie ból i gniew."
    ]

werewolfSlaughter :: [String]
werewolfSlaughter = [
    "",
    "Scena, która stanęła przed twoimi oczami, będzie ci się śnić po nocach do końca życia. O ile zdołasz ujść żywy. Nigdy nie widziałeś tyle krwi... nie minęło kilka chwil, a zostałeś w izbie tylko ty, Panna Młoda i krwiożerczy Wilkołak. Ciała... Wszędzie ciała... W uszach dzwoni... Co robić?"
    ]

werewolfPlayerOutside :: [String]
werewolfPlayerOutside = [
    "",
    "Z wnętrza izby dobiegają trudne do rozróżnienia hałasy. Cóż tam się w środku dzieje?..."
    ]

werewolfMoves :: [String]
werewolfMoves = [
    "Słyszysz za sobą narastające warczenie, tak niskie i głębokie, że czujesz, jak drżą ci od niego kości. Obracasz się gwałtownie i widzisz wpatrzone w ciebie czerwone ślepia... Masz ograniczone opcje. I mało czasu na namysł."
    ]
