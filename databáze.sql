-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Počítač: localhost
-- Vytvořeno: Pon 30. bře 2020, 18:09
-- Verze serveru: 10.1.44-MariaDB-0ubuntu0.18.04.1
-- Verze PHP: 7.2.24-0ubuntu0.18.04.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `makulavo_1`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `akce`
--

CREATE TABLE `akce` (
  `id` int(11) NOT NULL,
  `datum` date NOT NULL,
  `nazev` varchar(45) COLLATE utf8_czech_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `akce`
--

INSERT INTO `akce` (`id`, `datum`, `nazev`) VALUES
(1, '2020-03-22', 'Soutěž');

-- --------------------------------------------------------

--
-- Struktura tabulky `album`
--

CREATE TABLE `album` (
  `id` int(11) NOT NULL,
  `nazev` varchar(45) COLLATE utf8_czech_ci DEFAULT NULL,
  `popis` varchar(45) COLLATE utf8_czech_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `album`
--

INSERT INTO `album` (`id`, `nazev`, `popis`) VALUES
(3, 'nn', 'ss');

-- --------------------------------------------------------

--
-- Struktura tabulky `cena`
--

CREATE TABLE `cena` (
  `id` int(11) NOT NULL,
  `cena` int(11) NOT NULL,
  `popis` varchar(45) COLLATE utf8_czech_ci DEFAULT NULL,
  `skupina_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `cena`
--

INSERT INTO `cena` (`id`, `cena`, `popis`, `skupina_id`) VALUES
(6, 1400, '2x týdně', 2),
(10, 850, '1x týdně', 2),
(11, 1900, '2x týdně', 5),
(12, 1500, '1x týdně', 5),
(13, 2200, '2x týdně', 6),
(14, 1800, '1x týdně', 6),
(15, 900, 'Permanentka na 10 tréninků', 6),
(16, 800, 'Permanentka na 10 tréninků', 5);

-- --------------------------------------------------------

--
-- Struktura tabulky `cvik`
--

CREATE TABLE `cvik` (
  `id` int(11) NOT NULL,
  `nazev` varchar(45) COLLATE utf8_czech_ci NOT NULL,
  `typ` enum('saobento','benguela') COLLATE utf8_czech_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `novinka`
--

CREATE TABLE `novinka` (
  `id` int(11) NOT NULL,
  `nadpis` varchar(45) COLLATE utf8_czech_ci NOT NULL,
  `text` text COLLATE utf8_czech_ci,
  `vytvoreno` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `viditelna` bit(1) NOT NULL DEFAULT b'1',
  `uzivatel_id` int(11) NOT NULL,
  `smazatelna` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `novinka`
--

INSERT INTO `novinka` (`id`, `nadpis`, `text`, `vytvoreno`, `viditelna`, `uzivatel_id`, `smazatelna`) VALUES
(1, 'Něco málo o Capoeiře', '<p>Capoeira\nCapoeira představuje unikátní kombinaci tance, akrobacie a netradičního boje. Je umění s osobitou filozofií. Souboj dvou soupeřů je možné nejlépe definovat jako předstíraný boj – hru založenou na improvizaci. Důraz je kladen zejména na plynulost souhry pohybů obou hráčů, co v kombinaci s hudbou a zpěvem činí Capoeiru bojovým uměním, které je atraktivní nejen pro zúčastněné, ale i pro diváky. Capoeiru není možné jednoznačně přiřadit ani do kategorie bojového umění, sportu či folklóru. Možná právě díky svému netradičnímu přístupu vděčí v současnosti za titul nejrychleji se rozvíjejícího bojového umění na světě, které si ze své kolébky (Brazílie) našlo cestu až k nám do České Republiky.\n\n\nHistorie:\nHistorie Capoeiry je plná nejasností a dodnes nezodpovězených otázek. Začíná to hned při hledání odpovědi na otázku, odkud Capoeira vlastně pochází? I když nikdo nepopírá, že Capoeria se do své současné podoby vyvinula v Brazílii, mnozí odborníci na tuto problematiku umísťují rodisko Capoeiry na africký kontinent, a to hned z více důvodů. Faktem je, že od prvního vylodění Evropanů v roce 1500 bylo do Brazílie násilně odvlečených 3,5 mil. </p><p>Původních afrických obyvatel. Více slov z Capoeiry je odvozeno z řeči afrických kmenů a některé rituály, jako např. ngolo kmene Mucope, je možné považovat za jakési předchůdce tohoto brazilského bojového umění. Jiným i když nepřímým důkazem je skupina bojových umění velmi podobných Capoeiře, které mají svůj domov v jiných částech „nového světa“. Na Martiniku existuje sport ( I´aqya ), na Kubě zase ( Maní ), oba zahrnují akrobacii a předstíraný boj za rytmu hudby. Na Trinidadě jse zase známý boj s tyčkami nazvaný ( Kalinda ), neuvěřitelně podobný brazilskému Maculele, tanci, který se učí každý capoeirista. První zmínka o capoeiře jako boji je datovaná do roku 1770. V roce 1809 byla založena královská policie, která pronásledovala Capoeiristy v Brazílii a nebýt několika málo oblastí, kde dokázala přežít, bylo by toto umění dnes jen pouhou zmínkou. V období 1809 – 1889 probíhaly zuřivé boje mezi policií a capoeiristy. Po vyhlášení republiky 1889 zlá pověst capoeiristů vedla k tomu, že o rok později byl vydán zákon, zakazující praktikování capoeiry, což mělo za následek ještě větší postihy ze strany policie. V roce 1927 založil Mestre Bimba první formální akademii pro vyúku capoeiry jako bojového sportu . I když oficiální licenci dostal až v roce 1937.\n\n\nMestre Bimba vyvinul systém výuky capoeiry a přístup k samotné hře, který byl výrazně odlišný od tradičních norem. Tento styl se začal nazývat REGIONAL. Bimbův příklad rychle následoval Mestre Pastinha, který v protikladu k této inovační tendenci se snažil zachovat tradiční přístup pro výuku a praktikování capoeiry. Tento styl se nazýval ANGOLA. V roku 1972 byla Capoeira oficiálně vyhlášena Brazilským národním sportem. Pohánění vizí nového moderního sportu, začali Bimbovi studenti v 50. letech otevírat akademie po celé Brazílii.- Rio de Janeiro a následně Sao Paulo se stali centry pro růst tohoto nového hnutí. V roku 1972 byla capoeira oficiálně vyhlášena Brazilským národním sportem, čím se začala i éra organizování místních a národních turnajů. V pol. 70. let bylo už hodně akademií po celé Brazílii a první mistři začali učit Capoeiru v USA a Evropě. Dělení mezi styly REGIONAL a ANGOLA bylo nejvíce čitelné ve 40. až 70. letech 20. století. V současnosti se vyvinul nový trend, který se pokouší sjednotit obě školy pod motem: „ Capoeira é uma só“ ( Je jen jedna Capoeira ). Spojuje se přístup stylů Angola, který si více zachovává staré tradice s otevřeností Regional vůdči inovacím a novým trendům. V minulosti měl každý capoeirista dvě nebo tři přezdívky. Policie znala všechny capoeiristy podle těchto přezdívek ,ale jejich skutečné jméno neznali.To znamenalo ,že je bylo mnohem těžší zatknout. (Tato tradice pokračuje dodnes, kdy osobě, která chce praktikovat capoeiru, je dána přezdívka.)</p>', '2020-01-28 00:28:16', b'1', 1, b'0'),
(2, 'Mestre Paçoca', 'Vlastním jménem Sandro Felix dos Santos, narozen 29.5.1970 v severobrazilském přístavním městě Recife kde také začal cvičit Capoeiru v roce 1981. Jeho první učitel byl mestre Benti-vi. V roce 1985 poznal v Recifu mestre Camisu a následující tři roky dojížděl za tímto vynikajícím učitelem do Rio de Janeira. Po třech letech se přestěhoval a cvičil s ním a s mnoha dalšími učiteli a sbíral zkušenosti v pouličních rodách i v zápase Jiu-jitsu. Tam také začal vyučovat ve své první škole. V roce 1992 se vydal do Evropy kam byl pozván uspořádat seminář v Kopenhaagenu. V Evropě již zůstal a založil školu ve Frankfurtu, dále učil v Berlíně, Mnichově a dalších německých městech. V roce 1999 odjel do Barcelony kde založil další velmi kvalitní školu v Barceloně. Také působil ve Švédsku a pořádal semináře po celé Evropě. Od roku 2000 žije a trénuje ve Vídni. V říjnu roku 2009 vystupuje z Asociace Abadá Capoeira a zakládá Asociaci Vem Camará Capoeira. V současnosti dohlíží na výuku v ČR, na Slovensku, v Maďarsku a samozřejmě ve Vídni v Rakousku. V únoru roku 2011 získává corda Marrom e Vermelha (hnědo-červený pás) a stává se Contra Mestre skupiny Vem Camará. V srpnu roku 2012 získává v Itaúnas v Brazílii červevný pás a čestný titul Mestre.', '2020-01-28 00:29:10', b'1', 1, b'0'),
(3, 'Česká Asociace Capoeiry', 'Česká Asociace Capoeiry o.s. (ČAC) byla zřízena v roce 2008 za účelem šíření Capoeiry a zlepšení podmínek pro kluby v ČR na základě dlouholeté funkční spolupráce oddílu v ČR, která trvá od roku 2002.  V tomto období se utvářela spolupráce oddílů a kromě účasti našich zástupců na seminářích a soutěžích po celém světě jsme rozběhli dosud trvající organizaci těchto akcí:\r\nSemináře s brazilskými lektory (od roku 2003)\r\nLetní soustředění pro dospělé i děti (od roku 2004) - oblastní, národní, mezinárodní\r\nBatizado e Troca de cordas (od roku 2005)\r\nSoutěže na národní a mezinárodní úrovni (od roku 2006) pro dospělé i děti\r\nDo roku 2009 jsme působili pod asociací Abadá Capoeira a v říjnu 2009 jsme se začlenili do nově vzniklé mezinárodní asociace Mestre Paçocy Vem Camará Capoeira\r\nOd roku 2011 pravidelně pořádáme Otevřené Mistrovství Evropy (na území ČR  v letech 2011, 2012, 2014, 2015, 2017)\r\nV současnosti je ČAC jedním z nejvýraznějších a nejstabilnějších partnerů asociace Vem Camará Capoeira. Dlouhodobě spolupracujeme s mnoha jinými asociacemi Capoeiry (např. Guanabara, Nova Alianca, Pernas pro ar, Dende Maruo, Cazuá, Arte Nacional, Olinda, Ginga Mundo, Axé, Candeias, Camagula, Gingado, Ungo, Sao Antonio a další...)\r\n \r\nČAC je v rámci ČR nejaktivnější a nejpočetnější organizací a zastřešuje kluby Capoeiry v těchto městech: Liberec, Jablonec nad Nisou, Mladá Boleslav, Milovice, Hradec Králové, Pardubice, Olomouc, Opava, Nový Jičín, Praha, Přerov, Plzeň, Hořice, Trutnov, Osečná, Hodkovice nad Mohelkou, Rumburk, \r\n \r\nMezi hlavní cíle patří:\r\n\r\nrozšiřování Capoeiry a brazilské kultury\r\nspolupráce s dětmi formou pravidelných tréninku, seminářů, soustředění, soutěží a projektů\r\npomoc sociálně slabším\r\norganizace sportovních, kulturních a charitativních akcí\r\nspolupráce se zahraničními kluby\r\nzapojování se do projektů národního a mezinárodního charakteru\r\nzpřístupnění sportovního vyžití pro všechny věkové kategorie', '2020-01-28 00:31:14', b'1', 1, b'0'),
(4, 'Boj', 'Capoeira je bojové umění jímž se otroci bránili otrokářům. Naučíme vás jak kopnout stejně jako vás naučíme se případnému kopu uhnout.', '2020-01-28 00:32:15', b'1', 1, b'0'),
(6, 'Akrobacie', 'U nás se naučíte akrobatichých prvků všeho druhu. Od všech druhů hvězdy, stojky až například po vrut nebo salto.', '2020-01-28 00:32:47', b'1', 1, b'0'),
(8, 'Hudba', 'Ke Capoeiře patří hudba, bez ní by to nešlo. Naučíme vás hrát na tradiční hudební nástroje a zpívat písničky v portugalštině.', '2020-01-28 00:33:17', b'1', 1, b'0'),
(10, '20. století', '<p style=\"margin-top: 0.5em; margin-bottom: 0.5em; color: rgb(34, 34, 34); font-family: sans-serif; font-size: 14px; text-align: start;\"><b>Dvacáté století</b>&nbsp;je podle&nbsp;<a href=\"https://cs.wikipedia.org/wiki/Gregori%C3%A1nsk%C3%BD_kalend%C3%A1%C5%99\" title=\"Gregoriánský kalendář\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">Gregoriánského kalendáře</a>&nbsp;perioda mezi&nbsp;<a href=\"https://cs.wikipedia.org/wiki/1._leden\" title=\"1. leden\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">1. lednem</a>&nbsp;<a href=\"https://cs.wikipedia.org/wiki/1901\" title=\"1901\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">1901</a>&nbsp;a&nbsp;<a href=\"https://cs.wikipedia.org/wiki/31._prosinec\" title=\"31. prosinec\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">31. prosincem</a>&nbsp;<a href=\"https://cs.wikipedia.org/wiki/2000\" title=\"2000\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">2000</a>. Jedná se o desáté a zároveň poslední&nbsp;<a href=\"https://cs.wikipedia.org/wiki/Stolet%C3%AD\" title=\"Století\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">století</a>&nbsp;<a href=\"https://cs.wikipedia.org/wiki/2._tis%C3%ADcilet%C3%AD\" title=\"2. tisíciletí\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">druhého tisíciletí</a>.</p><p style=\"margin-top: 0.5em; margin-bottom: 0.5em; color: rgb(34, 34, 34); font-family: sans-serif; font-size: 14px; text-align: start;\">První polovina dvacátého století byla ovlivněna především dvěma&nbsp;<a href=\"https://cs.wikipedia.org/wiki/Sv%C4%9Btov%C3%A1_v%C3%A1lka\" title=\"Světová válka\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">světovými válkami</a>. Obrovská zkáza a vyčerpání, jež oba celosvětové konflikty přinesly, přispěly ke konci politické a ekonomické dominance&nbsp;<a href=\"https://cs.wikipedia.org/wiki/Evropa\" title=\"Evropa\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">Evropy</a>.<sup id=\"cite_ref-Roberts_(2004),_189_-_190_1-0\" class=\"reference\" style=\"line-height: 1em; unicode-bidi: isolate; white-space: nowrap;\"><a href=\"https://cs.wikipedia.org/wiki/20._stolet%C3%AD#cite_note-Roberts_(2004),_189_-_190-1\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">[1]</a></sup>&nbsp;Druhá polovina století byla charakteristická soupeřením dvou nových světových mocností&nbsp;<a href=\"https://cs.wikipedia.org/wiki/Spojen%C3%A9_st%C3%A1ty_americk%C3%A9\" title=\"Spojené státy americké\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">Spojených států amerických</a>&nbsp;a&nbsp;<a href=\"https://cs.wikipedia.org/wiki/Sov%C4%9Btsk%C3%BD_svaz\" title=\"Sovětský svaz\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">Sovětského svazu</a>&nbsp;o světovou hegemonii v tzv.&nbsp;<a href=\"https://cs.wikipedia.org/wiki/Studen%C3%A1_v%C3%A1lka\" title=\"Studená válka\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">studené válce</a>.<sup id=\"cite_ref-Diner_(2010),_35_-_36_2-0\" class=\"reference\" style=\"line-height: 1em; unicode-bidi: isolate; white-space: nowrap;\"><a href=\"https://cs.wikipedia.org/wiki/20._stolet%C3%AD#cite_note-Diner_(2010),_35_-_36-2\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">[2]</a></sup></p><p style=\"margin-top: 0.5em; margin-bottom: 0.5em; color: rgb(34, 34, 34); font-family: sans-serif; font-size: 14px; text-align: start;\">Toto století bylo charakteristické nevídaným&nbsp;<a href=\"https://cs.wikipedia.org/wiki/Technologie\" title=\"Technologie\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">technologickým</a>&nbsp;a&nbsp;<a href=\"https://cs.wikipedia.org/wiki/V%C4%9Bda\" title=\"Věda\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">vědeckým</a>&nbsp;pokrokem, avšak došlo v něm i k dosud nejkrvavějším&nbsp;<a href=\"https://cs.wikipedia.org/wiki/V%C3%A1lka\" title=\"Válka\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">válkám</a>&nbsp;a k hrůzám&nbsp;<a href=\"https://cs.wikipedia.org/wiki/Genocida\" title=\"Genocida\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">masového vyvražďování</a>.<sup id=\"cite_ref-Hobsbawm_(1998),_24_-_26_3-0\" class=\"reference\" style=\"line-height: 1em; unicode-bidi: isolate; white-space: nowrap;\"><a href=\"https://cs.wikipedia.org/wiki/20._stolet%C3%AD#cite_note-Hobsbawm_(1998),_24_-_26-3\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">[3]</a></sup>&nbsp;Ve druhé polovině století se svět poprvé octl před reálnou hrozbou&nbsp;<a href=\"https://cs.wikipedia.org/wiki/Jadern%C3%A1_v%C3%A1lka\" title=\"Jaderná válka\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">jaderné války</a>, která by pravděpodobně zlikvidovala život na celé&nbsp;<a href=\"https://cs.wikipedia.org/wiki/Zem%C4%9B\" title=\"Země\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">planetě</a>. Ve 20. století byl zaznamenán obrovský nárůst&nbsp;<a href=\"https://cs.wikipedia.org/wiki/Sv%C4%9Btov%C3%A1_populace\" title=\"Světová populace\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">světové populace</a><sup id=\"cite_ref-5\" class=\"reference\" style=\"line-height: 1em; unicode-bidi: isolate; white-space: nowrap;\"><a href=\"https://cs.wikipedia.org/wiki/20._stolet%C3%AD#cite_note-5\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">[p. 1]</a></sup>&nbsp;a přes postupující proces&nbsp;<a href=\"https://cs.wikipedia.org/wiki/Globalizace\" title=\"Globalizace\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">globalizace</a><sup id=\"cite_ref-Roberts_(2004),_449_-_450_6-0\" class=\"reference\" style=\"line-height: 1em; unicode-bidi: isolate; white-space: nowrap;\"><a href=\"https://cs.wikipedia.org/wiki/20._stolet%C3%AD#cite_note-Roberts_(2004),_449_-_450-6\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">[5]</a></sup>&nbsp;došlo k prohloubení sociálních rozdílů mezi světovým obyvatelstvem.</p>', '2020-02-03 07:47:03', b'1', 1, b'1');

-- --------------------------------------------------------

--
-- Struktura tabulky `novinka_has_obrazek`
--

CREATE TABLE `novinka_has_obrazek` (
  `novinka_id` int(11) NOT NULL,
  `obrazek_id` int(11) NOT NULL,
  `hlavni` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `oblibene_pisnicky`
--

CREATE TABLE `oblibene_pisnicky` (
  `uzivatel_id` int(11) NOT NULL,
  `pisnicka_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `oblibene_pisnicky`
--

INSERT INTO `oblibene_pisnicky` (`uzivatel_id`, `pisnicka_id`) VALUES
(1, 14),
(1, 16);

-- --------------------------------------------------------

--
-- Struktura tabulky `obrazek`
--

CREATE TABLE `obrazek` (
  `id` int(11) NOT NULL,
  `nazev` varchar(100) COLLATE utf8_czech_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `obrazek`
--

INSERT INTO `obrazek` (`id`, `nazev`) VALUES
(16, '195e2f8e9fba7764.05101752.jpg'),
(17, '165e2f8ee1d36f46.10123115.jpg'),
(18, '135e2f8f8541a6c9.64364428.jpg'),
(19, '15e2f9ca170f8f0.66440149.jpg'),
(28, '65e7f46b34385e6.26432745.jpg'),
(29, '15e81c02ba03f70.73180486.jpg');

-- --------------------------------------------------------

--
-- Struktura tabulky `obrazek_has_album`
--

CREATE TABLE `obrazek_has_album` (
  `obrazek_id` int(11) NOT NULL,
  `album_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `pisnicka`
--

CREATE TABLE `pisnicka` (
  `id` int(11) NOT NULL,
  `nazev` varchar(45) COLLATE utf8_czech_ci NOT NULL,
  `text` text COLLATE utf8_czech_ci NOT NULL,
  `rytmus` enum('angola','benguela','saobento','samba','maculele') COLLATE utf8_czech_ci NOT NULL,
  `odkaz` varchar(100) COLLATE utf8_czech_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `pisnicka`
--

INSERT INTO `pisnicka` (`id`, `nazev`, `text`, `rytmus`, `odkaz`) VALUES
(5, 'Tim, Tim, Tim, Lá Vai Viola', '<div style=\"padding: 0px;\"><p style=\"margin-bottom: 0px; padding: 0px;\"><span style=\"padding: 0px; font-family: Roboto, Arial, sans-serif; color: rgb(13, 13, 13); font-size: 14px; white-space: pre-wrap; background-color: rgb(249, 249, 249);\">Tim, Tim, Tim, Lá Vai Viola\n\nAdaptação: C.M. Esquilo - CDO\n(CD: Tem Que Ter Muita Fe Muita Axe)\n\n\nO moleque chegou lá em casa,\nPerguntando o que eu ia fazer,\nEu vou no mato, vou pegar biriba,\nPra minha viola fazer,\n\nCoro: Tim, tim, tim lá vai viola\nDigue, digue, digue, digue, digue, digue, dom,\nCoro: Tim, tim, tim lá vai viola\nÊ mas viola meu bem, mas não é violão,\nCoro: Tim, tim, tim lá vai viola\nÊ lá vai viola,\nCoro: Tim, tim, tim lá vai viola\n\nA roda tava desanimada,\nO povo mal queria cantar,\nFoi eu pegar na viola,\nA roda inteira começou a jogar\n\nCoro: Tim, tim, tim lá vai viola\nDigue, digue, digue, digue, digue, digue, dom,\nCoro: Tim, tim, tim lá vai viola\nÊ mas viola meu bem, mas não é violão,\nCoro: Tim, tim, tim lá vai viola \nÊ lá vai viola\nCoro: Tim, tim, tim lá vai viola</span><br style=\"padding: 0px;\"></p><div><span style=\"padding: 0px; font-family: Roboto, Arial, sans-serif; color: rgb(13, 13, 13); font-size: 14px; white-space: pre-wrap; background-color: rgb(249, 249, 249);\"><br></span></div></div>', 'saobento', 'https://www.youtube.com/embed/zgfMV9WqJ6k'),
(6, 'Se o gunga chamar', '<p style=\"margin-bottom: 15px; color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\"><span style=\"text-decoration-line: underline;\">autor:</span>&nbsp;Pretinho/Macaco Preto - Abadá Capoeira</p><p style=\"margin-top: 15px; margin-bottom: 15px; color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\">Saio de casa já ta no pensamento<br>Vou encontra meu mestre<br>Amigo de treinamento<br>Já sei o q vai acontecer</p><p style=\"margin-top: 15px; margin-bottom: 15px; color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\"><em style=\"color: rgb(113, 155, 176);\"><strong>Se o gunga chamar<br>Médio inverter<br>Viola chorar<br>Molho tem dendê</strong></em></p><p style=\"margin-top: 15px; margin-bottom: 15px; color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\">Atabaque rufou<br>Pandeiros tá estalando<br>Agogô repicou<br>Bate palmas acompanhando</p><p style=\"margin-top: 15px; margin-bottom: 15px; color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\">O canto arrepia<br>Envolve, maré molência<br>Emanando energia<br>Responde o coro nessa cadência</p><p style=\"margin-top: 15px; margin-bottom: 15px; color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\">Capoeira agachou<br>Louvação, pé do berimbau<br>Na sua crença rezou<br>Saiu pro jogo, no ritual</p><p style=\"margin-top: 15px; margin-bottom: 15px; color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\">Ginga, negaceia<br>Faz curva, engana no jogo<br>Ta perigoso, sapateia<br>Mandinga quem é mandingueiro</p><p style=\"margin-top: 15px; margin-bottom: 15px; color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\">O mestre grita iê<br>A roda tá acabando<br>Escuta o que eu vô dizer<br>Eu volto a qualquer momento</p>', 'saobento', 'https://www.youtube.com/embed/t7y4Hi2Wiw8'),
(7, 'A vida é assim mesmo', '<p style=\"margin-bottom: 15px; color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\"><span style=\"text-decoration-line: underline;\">autor:</span>&nbsp;inst. Nadinho&nbsp;- Abadá Capoeira</p><p style=\"margin-top: 15px; margin-bottom: 15px; color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\"><em style=\"color: rgb(113, 155, 176);\"><b>a vida é assim mesmo camarada<br>e como é e como é<br>berimbau vai te levar nessa jornada<br>mas tenha fé mas tenha fé</b></em></p><p style=\"margin-top: 15px; margin-bottom: 15px; color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\">se a vida vem pra te dar uma rasteira<br>seja capoeira pra levantar<br>se ainda não chegou a sua hora<br>mas tenha fé que um dia vai chegar</p><p style=\"margin-top: 15px; margin-bottom: 15px; color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\">a vida é assim mesmo ela é<br>ela quem dá ela quem tira<br>a vida sabe quem é de verdade<br>a vida sabe quem é de mentira</p><p style=\"margin-top: 15px; margin-bottom: 15px; color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\">acredite sempre em você<br>não deixa nada te derrubar<br>siga sempre firme capoeira<br>mas tenha fé vai lutando pra chegar</p>', 'saobento', 'https://www.youtube.com/embed/-jpV2a1lEfI'),
(8, 'Esse jogo é de bamba', '<p style=\"margin-bottom: 15px; color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\"><span style=\"text-decoration-line: underline;\">Autor:</span>&nbsp;Mestrando Capú - Gingado Capoeira</p><p style=\"margin-top: 15px; margin-bottom: 15px; color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\"><em style=\"color: rgb(113, 155, 176);\"><strong>Balanca é, balanca<br>Balanca é, balanca<br>Que esse jogo é de bamba<br>Esse jogo é de bamba</strong></em></p><p style=\"margin-top: 15px; margin-bottom: 15px; color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\">No toque do berimbau<br>Na palma cadenciada<br>Preste atencao nesse jogo<br>Esse jogo é de bamba, rapaziada</p><p style=\"margin-top: 15px; margin-bottom: 15px; color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\">Muita energia que rola<br>Mais um jogo que fica pra história<br>É, venha cá, venha ver<br>Meia-lua, esquiva, rasteira<br>O nome já foi dado, é capoeira<br>Quero mais aprender, quero mais aprender</p><p style=\"margin-top: 15px; margin-bottom: 15px; color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\">E essa roda tá boa, eu quero jogar<br>Se for jogo de bamba, é melhor respeitar<br>Meu mestre me falou, meu mestre me falou</p>', 'saobento', 'https://www.youtube.com/embed/5_UuQQxQCAo'),
(9, 'Vou esperar a lua voltar', '<p><span style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px; text-decoration-line: underline;\">Autor:</span><span style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\">&nbsp;Charm -GO</span><br style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\"><br style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\"><b><span style=\"color: rgb(113, 155, 176); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\">Vou esperar a lua voltar</span><br style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\"><span style=\"color: rgb(113, 155, 176); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\">Eu quero entrar na mata ê</span><br style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\"><span style=\"color: rgb(113, 155, 176); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\">Eu vou tirar madeira boa</span><br style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\"><span style=\"color: rgb(113, 155, 176); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\">pro meu berimbau fazer</span><br style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\"></b><br style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\"><span style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\">Madeira boa e como amizade</span><br style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\"><span style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\">e dificil de encontrar</span><br style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\"><span style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\">Amizade eu guardo no peito</span><br style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\"><span style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\">e da madeira eu faço meu berimbau</span><br style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\"><br style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\"><span style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\">A noite chega eu entro na mata</span><br style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\"><span style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\">Lua clareia pra eu procurar</span><br style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\"><span style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\">Jequitiba e maçaranduba</span><br style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\"><span style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\">o gutambo eu devo achar</span><br style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\"><br style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\"><span style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\">Se Mestre Bimba estivesse aqui</span><br style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\"><span style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\">pra me ensinar escolher madeira</span><br style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\"><span style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\">Eu enrava agora na mata</span><br style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\"><span style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\">tirava ipe e pereira</span><br style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\"><br style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\"><span style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\">Na velha África se usava o ungo</span><br style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\"><span style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\">Nas grandes festas religiosos</span><br style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\"><span style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\">O ?quijenge? no dialeto imbundo</span><br style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\"><span style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\">é o berimbau que conquistou o mundo</span><br></p>', 'saobento', 'https://www.youtube.com/embed/hCIkMK8pTGU'),
(10, 'É da nossa cor', '<p><span style=\"color: rgb(3, 3, 3); font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: rgb(249, 249, 249);\"><b>Lauê lauê laueê, lelele lelele lelele ô</b>\nLauê lauê laueê, lelele lelele lelele ô\nTá no sangue da raça brasileira\nCapoeira\n<b>É da nossa cor</b>\nO Berimbau\nÉ da nossa cor\nO Atabaquê\nÉ da nossa cor\nO Pandeiro\nÉ da nossa cor\nO Agogô\nÉ da nossa cor\nO Reco-reco\nÉ da nossa cor</span><br></p>', 'saobento', 'https://www.youtube.com/embed/y100k9TAX1c'),
(11, 'Folha Seca', '<p><span style=\"color: rgb(3, 3, 3); font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: rgb(249, 249, 249);\">Eu pisei na folha seca\nEu ouvi fazer xuê, xuà\nXuê, xuê, xuê, xuà\n\n   Ouvi fazer xuê, xuà\n\nXuê, xuê, xuê, xuà\n\n  Ouvi fazer xuê, xuà.\n\nNa volta que mundo deu\nNa volta que mundo da\n\n  Ouvi fazer xuê, xuà\n\nXuê, xuê, xuê, xuà\n\n  Ouvi fazer xuê, xuà</span><br></p>', 'saobento', 'https://www.youtube.com/embed/FUu5ZeMjuhg'),
(12, 'Cajuê', '<p><span style=\"color: rgb(3, 3, 3); font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: rgb(249, 249, 249);\"><i>Mestre Mão Branca, Capoeira Gerais</i>\n\n\nÊ manda leco\n\n<b>Cajuê</b>\n\nÊ manda loiá\n\nCajuê\n\nMestre Bimba\n\nCajuê\n\nMestre Pastinha\n\nCajuê\n\nMestre Bimba\n\nCajuê\n\nO seu Traira\n\nCajuê\n\nCobrinha verde\n\nCajuê\n\nCanjiquinha\n\nCajuê\n\nMestre Gigante\n\nCajuê\n\nEzequiel\n\nCajuê\n\nSeu Caiçara\n\nCajuê\n\nO Seu Nagé\n\nCajuê\n\nO leco\n\nCajuê</span><br></p>', 'saobento', 'https://www.youtube.com/embed/8gepyfgT9O0'),
(13, 'Dona Maria como vai você?', '<p><i>Mestre Jogo de Dentro</i>\n</p><p><b>\n\nDona Maria, como vai você?</b>\n<br>E vai você, e vai você</p><p>Como tá, como passou\nComo vai você?</p><p>\nE joga bonito  \nQue eu quero aprender</p><p>\nE vai você, e vai você</p><p>Joga bonito\nQue eu quero ver</p><p>\nComo tá, como passou\nComo vai você?</p><p>\nE joga bonito \nQue eu quero aprender</p><p>\nE vai você, e vai você?</p>', 'saobento', 'https://www.youtube.com/embed/0XecLghRqNE'),
(14, 'Você não sabe o valor que a Capoeira tem', '<p><span style=\"color: rgb(3, 3, 3); font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: rgb(249, 249, 249);\"><i>Instrutor Sandro,  Grupo Muzenza</i></span></p><p><span style=\"color: rgb(3, 3, 3); font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: rgb(249, 249, 249);\"><b>\nVocê não sabe o valor que a Capoeira tem\nVocê não sabe o valor que a Capoeira tem\nEla tem valor demais\nÊ se segura rapaz\nVocê não sabe o valor que a Capoeira tem</b></span><span style=\"color: rgb(3, 3, 3); font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: rgb(249, 249, 249);\"><i><br></i>\n\nUm dia a Capoeira ela lhe ajudou\nTirou você da miséria\nlhe transformou\nOs seus amigos ja mais\nNenhum deles foram capaz\nDe te dar ajuda na vida quando precisou\n\n\nUm dia um grande amigo\nEle me disse assim\nVamos jogar Capoeira\nVamos lá brincar\nMuita gente conheci\nAi foi que eu entendi\nQue a Capoeira\nEla veio pra me ajudar\nTu não sabe o valor\n\nHoje eu lembro de um mundo\nEm que um dia passei\nTudo na vida parceiro\nA primeira vez\nAgradeço ao bom Senhor\nA Capoeira me ajudou\nEla me fez ser na vida\nHoje quem eu sou\nTu não sabe o valor\n\n\nEu falo da Capoeira\nCom muita emoção\nMexe com meu corpo\nTodo com meu coração\nSe é pra falar de amor\nEla que me conquistou\nEla me botou nos braços\nE me tirou do chão</span><br></p>', 'benguela', 'https://www.youtube.com/embed/pFLbvQrtrZo'),
(15, 'Seus olhos', '<p><i>Boa Voz</i></p><p><span style=\"color: rgb(3, 3, 3); font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: rgb(249, 249, 249);\"><b>\nSeus olhos parecem dois rios rolando pro mar\nQuando você chora, quando você chora\nE eu como bom capoeira não posso negar\nQue o meu berimbau também já me fez chorar</b>\n\n\nTem choro de alegria\nChoro de tristeza e dor\nCada um tem seus motivos\nTem até choro de amor\nSeu olhos\n\n\nTalvez pela falta de jeito\nDo cabra valente\nQuando quer disfarçar\nÉ quando ele mais sente\n\n\nEm dados momentos da vida\nÉ preciso entender\nQuando é forte demais\nÉ a hora de ceder\nSeu olhos\n\n\nSe diz o ditado\nQue o homem não pode chorar\nComo posso explicar\nSe quando nasce, ele chora</span><i><br></i></p>', 'saobento', 'https://www.youtube.com/embed/kBiPhD2EMk8'),
(16, 'Noite da Saudade', '<p><span style=\"color: rgb(3, 3, 3); font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: rgb(249, 249, 249);\"><i>Professor Ze Baixinho</i></span></p><p><span style=\"color: rgb(3, 3, 3); font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: rgb(249, 249, 249);\"><i><br></i></span></p><p><b style=\"font-size: 14px; white-space: pre-wrap;\">lê lê lê lê lê lê</b></p><p><b style=\"font-size: 14px; white-space: pre-wrap;\">lê lê lê lê lê ôô</b></p><p><span style=\"color: rgb(3, 3, 3); font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: rgb(249, 249, 249);\"> \nHoje a lua não brilhou la no céu\nhoje meu berimbau não tocou\nhoje meu pandeiro está mudo\nhoje meu atabaque não falou\n\nHoje meu mestre\nnão veio pra roda\naté quem não é de falta faltou\nhoje nem Bimba nem seu Pastinha\nveio pôr a bençao em seu jogador\n\nHoje agachado ao pé do\nBerimbau\nconfesso que eu não tive aquele axé\nhoje a comunidade está mais triste\nsentindo a falta de Antonio Jacaré</span><br></p>', 'benguela', 'https://www.youtube.com/embed/0aYrIVKWDZs'),
(17, 'Areia do mar', '<p><span style=\"color: rgb(3, 3, 3); font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: rgb(249, 249, 249);\"><b>Areia do mar, areia do mar\no que você tem\npara me contar</b>\n\nA onda que quebra na praia\nquebrava bo casco do navio\nnavio que trouxe de angola\nnegros para o Brasil\n\nVagando sobre o mar\nchegava o tumbeiro\ntrazendo negros de batalha\nde espirito querreiro\n\nDia dois de fevereiro\nBahia me chamou\nlavagem do Bonfim\ncidade de Salvador \n\nFalar de seu Pastinha\ne de Bimba por favor\nse Pastinha na marinha\nmestre Bimba estivador\n\nAreia que leva e traz\nhistórias de algibeira\nvou visitar o Pero Vaz\naprender a história da capoeira </span><br></p>', 'benguela', 'https://www.youtube.com/embed/KLygvEluUDE'),
(18, 'Vim no balanço do mar', '<p><span style=\"color: rgb(3, 3, 3); font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: rgb(249, 249, 249);\"><i>Contra Mestre Primo, Cordão de Ouro</i></span></p><p><span style=\"color: rgb(3, 3, 3); font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: rgb(249, 249, 249);\"><i><br></i></span></p><p><span style=\"color: rgb(3, 3, 3); font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: rgb(249, 249, 249);\"><b>Vim no balanço do mar la de Angola\nVim no balanço do mar la da Guiné\nVim no balanço do mar de Moçambique\nSó quem veio sabe como é</b>\n\nVim no navio negreiro\nCom uma corrente no pé\nTrabalhar como escravo\nNa colheita do café\n\nHoje sou negro liberto\nA escravidão acabou\nHoje eu sinto saudades\nDa terra que la ficou</span><br></p>', 'benguela', 'https://www.youtube.com/embed/SsjIsOi2Ybw'),
(19, 'Noite da Bahia', '<p><span style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px; text-decoration-line: underline;\">Autor:</span><span style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\">&nbsp;Pato (Polônia), Caxias (SP)</span><b><span style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\"><em style=\"color: rgb(113, 155, 176);\"><br></em></span></b></p><p><b><span style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\"><em style=\"color: rgb(113, 155, 176);\">Estrela</em></span><br style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\"><span style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\"><em style=\"color: rgb(113, 155, 176);\">Que brilha no céu da Bahia</em></span><br style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\"><span style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\"><em style=\"color: rgb(113, 155, 176);\">Que brilha no céu da Bahia</em></span><br style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\"><span style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\"><em style=\"color: rgb(113, 155, 176);\">Me guia</em></span></b><br style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\"><br style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\"><span style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\">A noite da Bahia</span><br style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\"><span style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\">Brilha cada vez mais</span><br style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\"><span style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\">No chão daquela terra</span><br style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\"><span style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\">Bimba descansa em paz</span><br style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\"><br style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\"><span style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\">Apontando para estrela</span><br style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\"><span style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\">No leito abandonado</span><br style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\"><span style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\">Mestre Pastinha disse:</span><br style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\"><span style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\">\"Vou brilhar do seu lado\"</span><br style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\"><br style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\"><span style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\">O seu brilhar tão forte</span><br style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\"><span style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\">Clareava o terreiro</span><br style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\"><span style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\">Onde Seu Valdemar</span><br style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\"><span style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\">Tocava gunga vozeiro</span><br style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\"><br style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\"><span style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\">Estrela que iluminava</span><br style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\"><span style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\">A fazenda do senhor</span><br style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\"><span style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\">Ilumina o caminho</span><br style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\"><span style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\">Que leva à Salvador</span><br style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\"><br style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\"><span style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\">Vou pela barra-á-fora</span><br style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\"><span style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\">Na volta que o mundo dá</span><br style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\"><span style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\">Estrela que me conduz</span><br style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\"><span style=\"color: rgb(85, 85, 85); font-family: &quot;Roboto Condensed&quot;; font-size: 14px;\">Brilha no céu de lá</span><br></p>', 'benguela', 'https://www.youtube.com/embed/ItZWEGXl4sg'),
(20, 'Voltava no tempo', '<p style=\"margin-bottom: 15px;\"><i>Autor:&nbsp;Esquilo -DF</i></p><p style=\"margin-top: 15px; margin-bottom: 15px;\"><b>Se eu pudesse eu voltava no tempo iaiá<br>Se eu pudesse eu voltava no tempo ioiô<br>Se eu pudesse eu voltava no tempo iaiá<br>Eu voltava no tempo ioiô<br>Eu voltava no tempo iaiá</b><br><br>Voltava pra ver Mestre Bimba jogar<br>Voltava pra ver seu Pastinha também<br>Voltava pra ver seu Traira<br>Voltava pra ver Valdemar<br>Voltava pra ver Besouro&nbsp;Manganga<br><br>Voltava pra ver Atenilo e Rozendo<br>Voltava pra ouvir cantar Mugungê<br>Voltava pra ver Caiçara<br>Maré e também Parana<br>Voltava pra ver Onça Preta e Aberrê<br><br>Voltava pra ver a luta do batuque<br>Voltava pra ver brilho da navalha<br>Na Bahia ver Mestre Noronha<br>No Recife Nascimento Grande<br>No Rio ver Manduca da Praia<br><br>Se eu pudesse eu voltava no tempo sinhá<br>So pra ver como tudo aconteceu<br>Se eu pudesse eu voltava no tempo<br>Voltava no engenho e senzala<br>Pra ver como a capoeira nasceu</p>', 'benguela', 'https://www.youtube.com/embed/qkt3J8whlio'),
(21, 'A benguela tá boa', '<p style=\"margin-bottom: 15px;\"><i>autor:&nbsp;Pretinho - Abadá Capoeira</i></p><p style=\"margin-top: 15px; margin-bottom: 15px;\"><b><font color=\"#719bb0\">A benguela tá boa - 2x</font><br>eu quero jogar<br>A benguela tá boa - 2x<br>eu vou vadiar</b></p><p style=\"margin-top: 15px; margin-bottom: 15px;\">Se não conhece Benguela<br>eu vou te contar agora<br>é uma província Africana<br>de uma país que chama Angola</p><p style=\"margin-top: 15px; margin-bottom: 15px;\">Pra jogar benguela<br>tem que ser mandingueiro<br>vou desenvolvendo o jogo<br>preservando o companheiro</p><p style=\"margin-top: 15px; margin-bottom: 15px;\">No jogo da capoeira<br>o berimbau é quem comanda<br>se quer conhecer Angola<br>então viaja pra Luanda</p><p style=\"margin-top: 15px; margin-bottom: 15px;\">Vai mostrando sentimento<br>que o seu coração chora<br>ou na manha desse jogo<br>gunga, médio e viola</p>', 'benguela', 'https://www.youtube.com/embed/yU3KOZjWKkw'),
(22, 'Tá no coração', '<p style=\"margin-bottom: 15px;\"><i>autor:&nbsp;Pretinho - Abadá Capoeira&nbsp;</i></p><p style=\"margin-top: 15px; margin-bottom: 15px;\"><b><font color=\"#719bb0\">Tá no coração lelelelele 2x</font><br>a&nbsp;capoeira não tem jeito de esconder 2x</b></p><p style=\"margin-top: 15px; margin-bottom: 15px;\">Eu nasci escutando o som do berimbau<br>ainda sem saber se era angola ou regional<br>a capoeira mostrou o meu caminho<br>sigo com ela nunca mais estou sozinho</p><p style=\"margin-top: 15px; margin-bottom: 15px;\">Seja em um jesto seja no jeito de falar<br>um aperto de mão até na forma de um olhar<br>o mundo inteiro logo vai perceber<br>que a capoeira faz parte de você</p><p style=\"margin-top: 15px; margin-bottom: 15px;\">Ela é meu sol é meu jeito de respirar<br>ela é sentimento é minha forma de amar<br>seriedade mas também é brincadeira<br>não te agradei desculpe sou capoeira</p>', 'benguela', 'https://www.youtube.com/embed/PY0rF-ujQVc'),
(23, 'ANGOLA É É, ANGOLA É ANGOLA', '<p style=\"margin-top: 15px; margin-bottom: 15px;\"><br></p><p style=\"margin-top: 15px; margin-bottom: 15px;\"><b>Angola ê ê, Angola ê Angola&nbsp;</b><br></p><p style=\"margin-top: 15px; margin-bottom: 15px;\">Oi eu vim é de Angola ê ê, oi eu vim e de Angola Iaia</p><p style=\"margin-top: 15px; margin-bottom: 15px;\"><br></p><p style=\"margin-top: 15px; margin-bottom: 15px;\">O Angola ê ê, vou jogar Angola Iaia</p><p style=\"margin-top: 15px; margin-bottom: 15px;\"><br></p><p style=\"margin-top: 15px; margin-bottom: 15px;\">No balanço deAngola é é, no balanço de Angola, Angola</p><p style=\"margin-top: 15px; margin-bottom: 15px;\"><br></p><p style=\"margin-top: 15px; margin-bottom: 15px;\">No joguinho de Angola é é, no joguinho de Angola, Angola</p><p style=\"margin-top: 15px; margin-bottom: 15px;\"><br></p><p style=\"margin-top: 15px; margin-bottom: 15px;\">Meu pai vem de Angola é é, minha mae vem de Angola, Angola<br></p><p style=\"margin-top: 15px; margin-bottom: 15px;\"><br></p><p style=\"margin-top: 15px; margin-bottom: 15px;\">Quem quiser ver Angola é é, vem pra Angola, Angola<br></p>', 'angola', 'https://www.youtube.com/embed/CoLaw7rvTsU'),
(24, 'EU SOU ANGOLEIRO', '<p style=\"margin-bottom: 15px;\"><b>Eu sou angoleiro</b><br></p><p style=\"margin-top: 15px; margin-bottom: 15px;\">Angoleiro é o que eu sou</p><p style=\"margin-top: 15px; margin-bottom: 15px;\"><br></p><p style=\"margin-top: 15px; margin-bottom: 15px;\">Angoleiro de valor</p><p style=\"margin-top: 15px; margin-bottom: 15px;\"><br></p><p style=\"margin-top: 15px; margin-bottom: 15px;\">Angoleiro Salvador</p><p style=\"margin-top: 15px; margin-bottom: 15px;\"><br></p><p style=\"margin-top: 15px; margin-bottom: 15px;\">Angoleiro sim senhor</p><p style=\"margin-top: 15px; margin-bottom: 15px;\"><br></p><p style=\"margin-top: 15px; margin-bottom: 15px;\">Meu mestre me ensinou<br></p>', 'angola', 'https://www.youtube.com/embed/NGj2sTAisX4'),
(25, 'O VAQUEIRO DE VERDADE', '<p style=\"margin-bottom: 15px;\"><br><font color=\"#719bb0\" face=\"Roboto Condensed\"><span style=\"font-size: 18px;\"><b>ponha lá vaqueiro</b></span></font><br></p><p style=\"margin-top: 15px; margin-bottom: 15px;\"><span style=\"font-size: 18px;\">Ponha lá vaqueiro</span><br><span style=\"font-size: 18px;\">Ponha jaleco de couro</span><br><span style=\"font-size: 18px;\">Oi ponha jaleco de couro</span><br><span style=\"font-size: 18px;\">Na porteira do curral</span></p><p style=\"margin-top: 15px; margin-bottom: 15px;\"><br></p><p style=\"margin-top: 15px; margin-bottom: 15px;\"><span style=\"font-size: 18px;\">Oi ponha jaleco de couro</span><br><span style=\"font-size: 18px;\">Na porteira do curral</span></p>', 'angola', 'https://www.youtube.com/embed/kCAyLW5nbLo'),
(26, 'Canarinho da Alemanha', '<p><span style=\"color: rgb(3, 3, 3); font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: rgb(249, 249, 249);\"><i>Mestre Jogo de Dentro</i>\n\n\n<b>Canarinho da Alemanha \nQuem matou meu curio\nCanarinho da Alemanha \nQuem matou meu curio\n</b>\nCanarinho da Alemanha \nQuem matou meu curio\nEu jogo сapoeira\nO mestre é o melhor, eee\n\nCanarinho da Alemanha\nQuem matou meu curio\nO segredo da lua\nQuem sabe é o clarão do sol\n\nCanarinho da Alemanha\nQuem matou meu curió\nEu jogo Capoeira\nNa Bahia e Maceió\n</span><br></p>', 'angola', 'https://www.youtube.com/embed/MSESarspoxU'),
(27, 'Parana ê', '<p><span style=\"color: rgb(3, 3, 3); font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: rgb(249, 249, 249);\"><i>Mestre Jogo de Dentro\n</i>\n<b>Parana ê,\nParana ê, parana</b></span></p><p><span style=\"color: rgb(3, 3, 3); font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: rgb(249, 249, 249);\">\nVou me embora, vou me embora, parana\nTão sedo não venho cà, parana\n\nSe não for essa semana, parana\nA semana que passou, parana\n\nNa roda de capoeira, parana\nDeu o seu valor, parana\n\nPuxa puxa leva leva, parana\nLeva pra cima de mim, parana\n\nCapoeira de angola, parana\nCapoeira é assim, parana\n\nEu sou braço de marê, parana\nMais não sou marê sem fim, parana\n\nÊ parana ê, parana\nParana parana ê, parana\n\nCapoeira de angola, parana\nQuer ouvir vocês cantar, parana\n\nQuem não pode com mandinga, parana\nNão carrega patua, parana\n\nQuem não pode não intima, Parana\nDeixa quem pode intimar, Parana</span><br></p>', 'angola', 'https://www.youtube.com/embed/L8z8YkfMDr4'),
(28, 'Boa Noite pra quem é de boa noite', '<p><span style=\"color: rgb(3, 3, 3); font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: rgb(249, 249, 249);\">O, boa noite pra quem é de boa noite.\nO, bom dia pra quem é de bom dia.\nA benção meu papai a benção.\nMaculelê é o rei da valentia.\n\nO, boa noite pra quem é de boa noite.\nO, bom dia pra quem é de bom dia.\nA benção meu papai a benção.\nMaculelê é o rei da valentia.</span><br></p>', 'maculele', 'https://www.youtube.com/embed/d9xSoq_g-5Y'),
(30, 'Lelê Maculelê', '<p><span style=\"color: rgb(3, 3, 3); font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: rgb(249, 249, 249);\"><i>Mestre Suíno (Grupo Candeias)</i></span><span style=\"color: rgb(3, 3, 3); font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: rgb(249, 249, 249);\"><b><br></b></span></p><p><span style=\"color: rgb(3, 3, 3); font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: rgb(249, 249, 249);\"><b>\n</b>Lele maculele\n\n<b>Boa noite pra voce </b></span></p><p><span style=\"color: rgb(3, 3, 3); font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: rgb(249, 249, 249);\"><b><br></b>Maculele\n\n\nolha aqui meu camarada presta muita atenção\nisso aqui é o candeias não é brincadeira não\nlele maculele\n\nmaculele\n\no facão bateu em cima teve muita vibração\nfaisca para todo os lados é o candeia meu irmão\nlele maculele\n\nmaculele\n\nmenino toma cuidado para não se machucar\nisso é jogo de facão é cultura popular\nlele maculele\n\nmaculele\n\neu cortava cana madura para no engenho moer\npara fazer a rapadura para eu sobreviver\nlele maculele\n\nmaculele\n</span><br></p>', 'maculele', 'https://www.youtube.com/embed/mDlqpdYFRUM'),
(31, 'Eu vim na hora ê', '<p><span style=\"color: rgb(3, 3, 3); font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: rgb(249, 249, 249);\">Eu vim na hora ê \nEu vim na hora\nEu vim na hora ê\nEu sou de Angola\n\nEu vim na hora ê\nEu vim na hora\nEu vim na hora ê\nEu sou de Angola</span><br></p>', 'maculele', 'https://www.youtube.com/embed/x-s7vK4FhCw'),
(32, 'Olêlê Maculelê', '<p><span style=\"color: rgb(3, 3, 3); font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: rgb(249, 249, 249);\">Olêlê Maculelê, \nOra vamos vadiar \nOlêlê Maculelê, \nLá no canavial</span><br></p>', 'maculele', 'https://www.youtube.com/embed/iFEICklB_qM'),
(33, 'Tindolelê auê Cauiza', '<p><i>Mestre Suassuna</i></p><p><i><br></i></p><p><span style=\"color: rgb(3, 3, 3); font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap;\"><b>Eu vim de Angola ê</b></span><i><br></i></p><p><i><br></i></p><p><span style=\"color: rgb(3, 3, 3); font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: rgb(249, 249, 249);\">Tindolelê auê Cauiza\nTindolelê é sangue real\nEu sou filho eu sou nego de Aruanda\nTindolelê auê Cauiza\nE Cauiza, de onde e que veio\n\nMaculelê, de onde e que veio\n\nE o atabaque, de onde e que veio\n\nSarará, de onde e que veio\n\nE o agogô, de onde e que veio</span><i><br></i></p>', 'maculele', 'https://www.youtube.com/embed/KSKLSnzQurM'),
(34, 'Olê lê lê lê', '<p><span style=\"color: rgb(3, 3, 3); font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: rgb(249, 249, 249);\"><b>Olê lê lê lê, ola la la la</b>\n\nVocê não me pega que eu não te pego\nVocê só me pega quando eu te pegar\n\nMoçinha bacana de Copacabana\nFicou uma semana sem ir trabalhar\n\nSe eu soubese que tinha pagode\nRaspava a cabeça e deixava o bigode</span><br></p>', 'samba', 'https://www.youtube.com/embed/FX8lqFLgVWw'),
(35, 'E samba no mulher', '<p><span style=\"color: rgb(3, 3, 3); font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: rgb(249, 249, 249);\"><b>Oi mulher</b></span><span style=\"color: rgb(3, 3, 3); font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: rgb(249, 249, 249);\"><br></span></p><p><span style=\"color: rgb(3, 3, 3); font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: rgb(249, 249, 249);\"><br></span></p><p><span style=\"color: rgb(3, 3, 3); font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: rgb(249, 249, 249);\">E samba no mulher\n\nMulher, bicho danado\n\nDanada pra falar\n\nMarido não tá em casa\n\nMulher dá pra brigar\n\nÉ samba no mulher\n\nMulher cabeça de vento\n\nJuízo mal governado\n\nAssim como Deus não mente\n\nMulher não fala a verdade</span><br></p>', 'samba', 'https://www.youtube.com/embed/E5xINILnGv0'),
(36, 'Cadeiras de Lolo', '<h1 class=\"title style-scope ytd-video-primary-info-renderer\" style=\"padding: 0px; border: 0px; background: rgb(249, 249, 249); max-height: 4.8rem; overflow: hidden; font-weight: 400; line-height: 2.4rem; color: var(--ytd-video-primary-info-renderer-title-color, var(--yt-spec-text-primary)); font-family: Roboto, Arial, sans-serif; font-size: var(--ytd-video-primary-info-renderer-title-font-size, 1.8rem); transform: var(--ytd-video-primary-info-renderer-title-transform, none); text-shadow: var(--ytd-video-primary-info-renderer-title-text-shadow, none);\"><yt-formatted-string force-default-style=\"\" class=\"style-scope ytd-video-primary-info-renderer\" style=\"word-break: break-word;\"><i><span style=\"font-size: 14px;\">C.Mestre Banto Mae Noelia (Grupo Vadiação Capoeira)</span></i></yt-formatted-string><span style=\"font-size: 14px;\">﻿</span></h1>', 'samba', 'https://www.youtube.com/embed/Uhaq_rdMdrk'),
(37, 'Deixa o negro vadiar', '<p><span style=\"color: rgb(3, 3, 3); font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: rgb(249, 249, 249);\"><i>Mestre Tamanduá</i></span></p><p><span style=\"color: rgb(3, 3, 3); font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: rgb(249, 249, 249);\">O negro ta vadiando\nDeixa o negro vadiar\n\n<b>O negro ta vadiando\nDeixa o negro vadiar</b>\n\nVadia vadia vadia negro\n\n<b>Deixa vadiar</b>\n\nVadia vadia vadia negro\n\n<b>Deixa vadiar</b>\n\nVadia vadia meu Mestre\n\n<b>Deixa vadiar</b></span><span style=\"color: rgb(3, 3, 3); font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: rgb(249, 249, 249);\"><i><br></i></span><br></p>', 'saobento', 'https://www.youtube.com/embed/fOqbKdh87nU'),
(38, 'Me leva morena', '<p><span style=\"color: rgb(3, 3, 3); font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: rgb(249, 249, 249);\"><i>Mestre Toni Vargas</i></span></p><p><span style=\"color: rgb(3, 3, 3); font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: rgb(249, 249, 249);\"><i><br></i></span></p><p><span style=\"color: rgb(3, 3, 3); font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap;\"><b>Me leva morena me leva\nMe leva pro seu bangalô</b></span><span style=\"color: rgb(3, 3, 3); font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: rgb(249, 249, 249);\">\n<br></span></p><p><span style=\"color: rgb(3, 3, 3); font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: rgb(249, 249, 249);\">Eu que já lhe fiz inveja\nHoje só lhe causo pena\nPerdi tudo que eu já tive\nPelo amor de uma morena\n\nMe leva e com um beijo me cala\nQue eu sou da Senzala Sou seu professor\n\nMe leva morena querida\nQue eu dou minha vida\nPelo teu amor\n\nMe leva morena não esquece\nQue o dia amanhece\nO galo já cantou\n\nMe leva de noite e de dia\nEu faço poesia\nEu te falo de amor\n\nMe leva depressa, ligeiro\nQue eu sou prisioneiro\nDesse teu amor\n\nLeva me leva\nMe leva morena\nQue eu vou</span><br></p>', 'saobento', 'https://www.youtube.com/embed/oRogtb28c88');

-- --------------------------------------------------------

--
-- Struktura tabulky `skupina`
--

CREATE TABLE `skupina` (
  `id` int(11) NOT NULL,
  `nazev` varchar(45) COLLATE utf8_czech_ci NOT NULL,
  `popis` varchar(45) COLLATE utf8_czech_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `skupina`
--

INSERT INTO `skupina` (`id`, `nazev`, `popis`) VALUES
(2, 'Děti B', '4-7 let'),
(5, 'Děti A', '8-13 let'),
(6, 'Dospělí', '14+');

-- --------------------------------------------------------

--
-- Struktura tabulky `trener`
--

CREATE TABLE `trener` (
  `id` int(11) NOT NULL,
  `jmeno` varchar(45) COLLATE utf8_czech_ci NOT NULL,
  `prijmeni` varchar(45) COLLATE utf8_czech_ci NOT NULL,
  `prezdivka` varchar(45) COLLATE utf8_czech_ci NOT NULL,
  `email` varchar(45) COLLATE utf8_czech_ci NOT NULL,
  `telefon` varchar(45) COLLATE utf8_czech_ci NOT NULL,
  `popis` text COLLATE utf8_czech_ci NOT NULL,
  `obrazek_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `trener`
--

INSERT INTO `trener` (`id`, `jmeno`, `prijmeni`, `prezdivka`, `email`, `telefon`, `popis`, `obrazek_id`) VALUES
(1, 'Lukáš', 'Novák', 'Rato Branco', 'rato.branco@email.cz', '123654789', '<p style=\"margin-top: 10px; line-height: 24px;\"><div style=\"text-align: left;\">Od útlého věku se aktivně věnoval všemožným sportovním aktivitám od gymnastiky, plavání, atletiky a cyklistky až po judo, kde se těsněji seznámil s kontaktními sporty.</div><div style=\"text-align: left;\">Po odchodu do Hradce Králové na studia se dále věnoval kontaktním sportům skrze hradecký klub aikida, kde poprvé sehnal kontakt na klub capoeiry v Hořicích, kam začal v roce 2004 dojíždět a cvičit u grupy Axé capoeira, kde se naučil základům od Mestre Itabory.</div><div style=\"text-align: left;\">V roce 2005 potkává Tomáše Zummera (Instrutor Robocop), ke kterému dojíždí trénovat do Liberce společně s Filipem Humlem (Graduado Agogo), se kterým stál u zrodu Královéhradecké capoeiry pod světovou asociací ABADÁ v roce 2006.</div><div style=\"text-align: left;\">Od té doby se aktivně věnuje tréninkům capoeiry a pomáhá rozvíjet Královéhradecký klub pod Agogovým vedením. Veliký vliv v té době na něj měl C/Mestre Silvio de Berimbau (BRA) z asociace \"Açao Quilombo Capoeira\", který byl pozván do HK a po dobu dvou měsíců vedl tréninky. Tam pochopil, že umění capoeiry v sobě nese mnohem víc než pouhá salta a akrobacii a měl možnost si se Silviovou pomocí vyrobit své první berimbau.</div><div style=\"text-align: left;\">V té době stále více jezdí na semináře a závody a zároveň pořádá víkendové workshopy capoeiry v České Lípě a Lanškrouně.</div><div style=\"text-align: left;\">V roce 2009 odchází z asociace ABADÁ a společně s dalšími se začleňuje do Asociace Vem Camará pod vedením Metre Paçocy. V témže roce vyhrává na \"4. Otevřeném mistrovství České republiky Jogos Integrados\" první místo ve své kategorii.</div><div style=\"text-align: left;\">V roce 2012 přebírá Pardubický klub, kde se snaží rozvíjet umění capoeiry dál a i přes práci na plný úvazek a studia na UHK se mu to daří. Na jeho tréninky do Pardubic dojíždějí studenti nejen z Pardubic, Hradce Králové a okolí, ale také z Lanškrouna, Trutnova, Semil či Hrádku nad Nisou.</div></p><p style=\"text-align: left; margin-top: 10px; line-height: 24px;\">V roce 2018 vyhrává celostátní soutěž o trenéra mládeže.</p>', 29),
(2, 'Vojtěch', 'Makula', 'Progresso', 'makulvo@gmail.com', '730992666', '<p>Bojovým uměním se věnoval již od mala. V šesti letech ho rodiče zapsali na Aikido a tomu se věnoval až do svých 16ti let, kdy se plně začal věnovat Capoeiře.</p><p>Capoeiru začal cvičit v roce 2014 pod vedením Lukáše Nováka v Pardubicích.</p>', 28);

-- --------------------------------------------------------

--
-- Struktura tabulky `trener_has_skupina`
--

CREATE TABLE `trener_has_skupina` (
  `trener_id` int(11) NOT NULL,
  `skupina_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `trenink`
--

CREATE TABLE `trenink` (
  `id` int(11) NOT NULL,
  `cas_zacatek` varchar(15) COLLATE utf8_czech_ci NOT NULL,
  `cas_konec` varchar(15) COLLATE utf8_czech_ci NOT NULL,
  `den` enum('Pondělí','Úterý','Středa','Čtvrtek','Pátek') COLLATE utf8_czech_ci NOT NULL,
  `skupina_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `trenink`
--

INSERT INTO `trenink` (`id`, `cas_zacatek`, `cas_konec`, `den`, `skupina_id`) VALUES
(1, '2020-01-10 17:4', '2020-01-07 18:4', 'Středa', 2),
(4, '2020-01-10 18:0', '2020-01-07 19:0', 'Pátek', 2),
(10, '17:00', '18:30', 'Středa', 5),
(11, '18:00', '19:30', 'Pátek', 5),
(12, '18:30', '20:00', 'Středa', 6),
(13, '19:30', '21:00', 'Pátek', 6);

-- --------------------------------------------------------

--
-- Struktura tabulky `uzivatel`
--

CREATE TABLE `uzivatel` (
  `id` int(11) NOT NULL,
  `login` varchar(45) COLLATE utf8_czech_ci NOT NULL,
  `heslo` varchar(100) COLLATE utf8_czech_ci NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `uzivatel`
--

INSERT INTO `uzivatel` (`id`, `login`, `heslo`, `status`) VALUES
(1, 'admin', '$2y$10$PV7PzutuBiXEh9XFxrsm6.4ZnYMQKQ6F2666Lm5kiPck37JCrBvx2', 1),
(23, 'RatoBranco', '$2y$10$mHbus4zoXh23bPOImBqLU.LiEWOcdz89uvNwVTR1nRONjpkE/ofou', 1),
(24, 'Wolverinha', '$2y$10$hdsQTh.4BLx70xEkrVZNfOnHfjWCeFYdvegWe514HVU/daGSmfOUy', 1),
(25, 'Progresso', '$2y$10$gBpps4cD2dvM9ffAHtXyIuANkEZfTK4hBIkp0JKqPYUC70IQw.w3u', 1),
(26, 'Afortunado', '$2y$10$CchEHKCHFd68spyMP0wfwuOlB6W6gIKGqLGjzLN4kUl0Ec9xKJ7ti', 0),
(27, 'Macaquinho', '$2y$10$ZEF/DjUihyEYvRWLDudDeOwoZTJIde5mfb17kCNtVjaJm5oGGlDOu', 0),
(28, 'Zvonecek', '$2y$10$RcRRO7gmuCnRCJpvHOk9TeIgdKl1j9ZvJeuPe9kNbEqGAmglgXlpa', 0);

--
-- Klíče pro exportované tabulky
--

--
-- Klíče pro tabulku `akce`
--
ALTER TABLE `akce`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `cena`
--
ALTER TABLE `cena`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cena_skupina1_idx` (`skupina_id`);

--
-- Klíče pro tabulku `cvik`
--
ALTER TABLE `cvik`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `novinka`
--
ALTER TABLE `novinka`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_novinka_uzivatel1_idx` (`uzivatel_id`);

--
-- Klíče pro tabulku `novinka_has_obrazek`
--
ALTER TABLE `novinka_has_obrazek`
  ADD PRIMARY KEY (`novinka_id`,`obrazek_id`),
  ADD KEY `fk_novinka_has_obrazek_obrazek1_idx` (`obrazek_id`),
  ADD KEY `fk_novinka_has_obrazek_novinka1_idx` (`novinka_id`);

--
-- Klíče pro tabulku `oblibene_pisnicky`
--
ALTER TABLE `oblibene_pisnicky`
  ADD PRIMARY KEY (`uzivatel_id`,`pisnicka_id`),
  ADD KEY `fk_uzivatel_has_pisnicka_pisnicka1_idx` (`pisnicka_id`),
  ADD KEY `fk_uzivatel_has_pisnicka_uzivatel1_idx` (`uzivatel_id`);

--
-- Klíče pro tabulku `obrazek`
--
ALTER TABLE `obrazek`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `obrazek_has_album`
--
ALTER TABLE `obrazek_has_album`
  ADD PRIMARY KEY (`obrazek_id`,`album_id`),
  ADD KEY `fk_obrazek_has_album_album1_idx` (`album_id`),
  ADD KEY `fk_obrazek_has_album_obrazek1_idx` (`obrazek_id`);

--
-- Klíče pro tabulku `pisnicka`
--
ALTER TABLE `pisnicka`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `skupina`
--
ALTER TABLE `skupina`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `skupinacol_UNIQUE` (`nazev`);

--
-- Klíče pro tabulku `trener`
--
ALTER TABLE `trener`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_trener_obrazek1_idx` (`obrazek_id`);

--
-- Klíče pro tabulku `trener_has_skupina`
--
ALTER TABLE `trener_has_skupina`
  ADD PRIMARY KEY (`trener_id`,`skupina_id`),
  ADD KEY `fk_trener_has_skupina_skupina1_idx` (`skupina_id`),
  ADD KEY `fk_trener_has_skupina_trener1_idx` (`trener_id`);

--
-- Klíče pro tabulku `trenink`
--
ALTER TABLE `trenink`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_trenink_skupina1_idx` (`skupina_id`);

--
-- Klíče pro tabulku `uzivatel`
--
ALTER TABLE `uzivatel`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login_UNIQUE` (`login`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `akce`
--
ALTER TABLE `akce`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pro tabulku `album`
--
ALTER TABLE `album`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pro tabulku `cena`
--
ALTER TABLE `cena`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pro tabulku `cvik`
--
ALTER TABLE `cvik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pro tabulku `novinka`
--
ALTER TABLE `novinka`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pro tabulku `obrazek`
--
ALTER TABLE `obrazek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT pro tabulku `pisnicka`
--
ALTER TABLE `pisnicka`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT pro tabulku `skupina`
--
ALTER TABLE `skupina`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pro tabulku `trener`
--
ALTER TABLE `trener`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pro tabulku `trenink`
--
ALTER TABLE `trenink`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pro tabulku `uzivatel`
--
ALTER TABLE `uzivatel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `cena`
--
ALTER TABLE `cena`
  ADD CONSTRAINT `fk_cena_skupina1` FOREIGN KEY (`skupina_id`) REFERENCES `skupina` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Omezení pro tabulku `novinka`
--
ALTER TABLE `novinka`
  ADD CONSTRAINT `fk_novinka_uzivatel1` FOREIGN KEY (`uzivatel_id`) REFERENCES `uzivatel` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Omezení pro tabulku `novinka_has_obrazek`
--
ALTER TABLE `novinka_has_obrazek`
  ADD CONSTRAINT `fk_novinka_has_obrazek_novinka1` FOREIGN KEY (`novinka_id`) REFERENCES `novinka` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_novinka_has_obrazek_obrazek1` FOREIGN KEY (`obrazek_id`) REFERENCES `obrazek` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Omezení pro tabulku `oblibene_pisnicky`
--
ALTER TABLE `oblibene_pisnicky`
  ADD CONSTRAINT `fk_uzivatel_has_pisnicka_pisnicka1` FOREIGN KEY (`pisnicka_id`) REFERENCES `pisnicka` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_uzivatel_has_pisnicka_uzivatel1` FOREIGN KEY (`uzivatel_id`) REFERENCES `uzivatel` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Omezení pro tabulku `obrazek_has_album`
--
ALTER TABLE `obrazek_has_album`
  ADD CONSTRAINT `fk_obrazek_has_album_album1` FOREIGN KEY (`album_id`) REFERENCES `album` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_obrazek_has_album_obrazek1` FOREIGN KEY (`obrazek_id`) REFERENCES `obrazek` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Omezení pro tabulku `trener`
--
ALTER TABLE `trener`
  ADD CONSTRAINT `fk_trener_obrazek1` FOREIGN KEY (`obrazek_id`) REFERENCES `obrazek` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Omezení pro tabulku `trener_has_skupina`
--
ALTER TABLE `trener_has_skupina`
  ADD CONSTRAINT `fk_trener_has_skupina_skupina1` FOREIGN KEY (`skupina_id`) REFERENCES `skupina` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_trener_has_skupina_trener1` FOREIGN KEY (`trener_id`) REFERENCES `trener` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Omezení pro tabulku `trenink`
--
ALTER TABLE `trenink`
  ADD CONSTRAINT `fk_trenink_skupina1` FOREIGN KEY (`skupina_id`) REFERENCES `skupina` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
