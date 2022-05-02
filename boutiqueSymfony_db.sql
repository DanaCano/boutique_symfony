-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : lun. 02 mai 2022 à 22:32
-- Version du serveur :  5.7.34
-- Version de PHP : 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `fitnow_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `parent_id`, `name`) VALUES
(4, NULL, 'Equipement'),
(5, NULL, 'Nutrition'),
(6, 4, 'Haltères'),
(7, 5, 'Barres protéinées'),
(8, 5, 'Boissons énergétiques'),
(9, 5, 'Protéines en poudres'),
(10, 4, 'Bancs de musculation'),
(11, 4, 'Roues à abdominaux'),
(13, 4, 'Gilets lestés'),
(14, 5, 'Compléments alimentaires');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20220405134332', '2022-04-05 15:43:45', 187),
('DoctrineMigrations\\Version20220412071121', '2022-04-12 09:11:46', 445),
('DoctrineMigrations\\Version20220418145424', '2022-04-18 16:54:46', 164),
('DoctrineMigrations\\Version20220418162115', '2022-04-18 18:22:33', 120),
('DoctrineMigrations\\Version20220418164127', '2022-04-18 18:41:40', 29),
('DoctrineMigrations\\Version20220418165322', '2022-04-18 18:53:58', 35),
('DoctrineMigrations\\Version20220419113338', '2022-04-19 13:34:12', 172);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `transporter_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transporter_price` decimal(10,2) NOT NULL,
  `delivery` longtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL,
  `orders_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `product` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_top` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id`, `categories_id`, `name`, `description`, `price`, `image`, `is_top`) VALUES
(11, 8, 'Eau de coco Super Vegan, menthe & fraise', 'Quelle que soit l’activité sportive que vous avez effectuée, la phase de récupération est essentielle.\r\nCette eau de coco vegan répond a vos besoins en :\r\n\r\n💪 PROTÉINES : qui contribuent à restaurer la masse musculaire\r\n💪 GLUCIDES : pour retrouver de l’énergie\r\n💪 VITAMINES\r\n\r\n- Vitamine B12 qui contribue à réduire la fatigue\r\n- Vitamine B1 qui contribue à un métabolisme énergétique normal\r\n\r\nQuand la consommer ?\r\n\r\nBoire la bouteille entière dans les 30 minutes qui suivent l’effort pour en maximiser l’efficacité.', '32.90', 'super-vegan-hydrate-eau-de-coco-mente-and-fraise_62557117ba447_625835b0796c1_625ea60aab4f4_625ebddeaa031_jpg', 0),
(13, 14, 'Breakfast Banane & Fraise Super Vegan 1,2 kg', 'Un petit-déjeuner instantané pensé pour les sportifs, avec 15 g de protéine par portion. \r\nCette association de céréales complètes moulues, de graines, de protéines végétales et de fruits lyophilisés sans sucres ajoutés constitue une source de protéines, mais aussi de minéraux. Un porridge onctueux et qui rassasie pour que vous ayez toute l\'énergie dont vous avez besoin pour l\'entraînement !\r\n\r\n💪 mélange de céréales complètes, de fruits et de graines\r\n💪 forte teneur en protéines et en fibres\r\n💪 début de journée sain et rassasiant\r\n', '26.90', 'super-vegan-breakfast-banane-and-fraise_6255775fa30d4_jpg', 0),
(14, 14, 'Pancake Cacao & Pépites de Chocolat Super Vegan 1,2 kg', 'Les Pancakes Super Vegan ont été pensés pour les athlètes et les sportifs. Ils contiennent une haute teneur en protéines et des ingrédients riches en fibres.\r\nNous voulions un petit-déjeuner nutritif et rassasiant, mais qui réponde aussi aux besoins des personnes qui font du sport.\r\nLa préparation de ces pancakes est facile et rapide.\r\n\r\n💪 Augmentation de la masse musculaire\r\n💪 Fonctionnement musculaire : source de magnésium\r\n💪 Energie : haute teneur en manganèse\r\n💪 Maintien d\'une ossature saine', '25.90', 'super-vegan-pancake-cacao-and-pepites-de-chocolat_625577d90447b_jpg', 0),
(15, 14, 'Multivitamines', 'Un indispensable à prendre à l\'année pour les sportifs et les personnes actives.\r\n\r\nGrâce à ses vitamines et minéraux d’excellente qualité, notre multivitamines agira notamment sur votre métabolisme énergétique, sur vos muscles et votre ossature.\r\nIl possède une action anti oxydante sur votre organisme pour lutter contre le stress oxydatif\r\n\r\n💪 21 nutriments bioactifs dont 12 vitamines et 5 minéraux (Iode, chrome, sélénium, Zinc, Mg)\r\n💪 Complexe Zinc Magnésium B6 : action en synergie des co-facteurs du Magnesium\r\n💪 Co-facteurs végétaux : caroténoïdes (Betacarotène, Lutéine), Q10, Quercétine\r\n💪 Présence d\'ingrédients brevetés (Vitamines B9, E) & de Vitamine D3 : 1000UI', '24.90', 'Pack_muscu_6255786044eb4_625ec2b748221_png', 0),
(16, 14, 'Pack Prise de Muscles', 'Le pack Prise de Muscles a été conçu pour vous aider à développer votre masse musculaire qualitativement,\r\nc’est-à-dire avec une bonne alimentation et des compléments spécifiquement conçus pour la synthèse protéique !\r\n\r\n💪 La Whey Isolat est un concentré d’acides aminés et de protéines qui contribuent à augmenter la masse musculaire et au maintien d’une ossature solide\r\n💪 Les BCAA 2.1.1 Vegan sont adaptés à toutes les pratiques sportives et permettent de nourrir le muscle qualitativement\r\n💪 La Créatine améliore les capacités physique et renforce l’effet de la pratique de la musculation', '59.90', 'Pack_muscu_6255786044eb4_625ec330b05d6_png', 0),
(17, 7, 'Barre Protéinée Extra Choco Pack de 12', '💪 Minimum 90 % de sucre en moins\r\n💪 Jusqu\'à 8x plus de protéines et de précieuses fibres\r\n💪 5 délicieuses saveurs', '29.90', 'choco_bar_pdp-VERSO_625578ab2b3a4_jpg', 0),
(18, 7, 'Barre Paléo Fruits Pack de 12', 'Les ingrédients naturels vous tiennent à cœur ? Alors notre barre Paléo est faite pour vous !\r\nSans produits chimiques et sans sucre ajouté. Mais avec de précieux nutriments issus des fruits bio et des noix.\r\nC\'est non seulement incroyablement savoureux, mais également sain.\r\n\r\nLe snack fitness parfait au quotidien et à l\'entraînement. Et une alternative saine et délicieuse aux snacks classiques.\r\n\r\n💪 100 % Paléo, 100 % qualité crue\r\n💪 Sans céréales ni sucres ajoutés**\r\n💪 Ingrédients issus de l\'agriculture bio et durable', '29.90', 'paleo_62557a0734027_625ec257b705f_jpg', 0),
(19, 7, 'Barre Protéinée Fruits Pack de 12', 'Pourquoi échanger la saveur contre des protéines quand on peut avoir les deux ? Nous avons trouvé la formule idéale correspondant à vos besoins grâce à la Whey et des fibres. \r\nDes protéines à un goût formidablement onctueux.\r\n\r\n💪 33 % de protéines par portion\r\n💪 5 délicieuses saveurs en un pack\r\n💪 Sans sucre ajouté, sans arômes artificiels', '24.90', 'protein_bars_mix_slider_4_1_VERSO_62557b24cc49b_625ec35e34f4b_jpg', 1),
(20, 8, 'Boisson de récupération en poudre au chocolat 1,5 kg', 'Quelle que soit l’activité sportive que vous avez effectuée, la phase de récupération est essentielle.\r\n\r\nCette boisson au goût chocolat comblera vos besoins en :\r\n\r\n💪 PROTÉINES : qui contribuent à restaurer la masse musculaire\r\n💪 GLUCIDES : pour retrouver de l’énergie\r\n💪 VITAMINES : Vitamine B12 qui contribue à réduire la fatigue, Vitamine B1 qui contribue à un métabolisme énergétique normal\r\n\r\nQuand la consommer ?\r\n\r\nBoire la bouteille entière dans les 30 minutes qui suivent l’effort pour en maximiser l’efficacité.', '24.90', 'test_62557b7ae2b53_jpg', 0),
(21, 8, 'Boisson de récupération en poudre au citron 512g', 'Contribue au métabolisme énergétique grâce aux vitamines B1, B2, B6.\r\nPar ailleurs, grâce à sa teneur en glucides et en électrolytes, elle contribue au maintien des performances au cours d’un exercice d’endurance.\r\nProlonge et accroit l’absorption d’eau durant un exercice physique. Par sa teneur en vitamines, cette boisson énergétique contribue :\r\n\r\n💪 Au bon fonctionnement du système immunitaire (vitamine B6)\r\n💪 Au métabolisme énergétique (vitamines B1, B2, B6),\r\n💪 A la protection des cellules contre le stress oxydatif (vitamine B2).\r\n\r\nMise au point par des spécialistes en nutrition sportive, cette boisson est particulièrement adaptée aux efforts de longue durée, notamment lors des compétitions.\r\nElle peut aussi être utilisée en « boisson d’attente » trois jours avant l’effort.', '24.90', 'boisson-de-recuperation-poudre-recovery-drink-citron-512g_62557d577f3c6_jpg', 0),
(22, 7, 'Barre Protéinée Vegan Chocolat Amandes Pack de 12', 'Nos barres protéines vegan, ce sont des protéines de sources 100 % végétales et tous les acides aminés essentiels\r\ndont vos muscles ont besoin. Recette sans soja, sans gluten, et hypoallergénique. Que vous soyez végétalien,\r\nintolérant au lactose ou que vous vouliez simplement inclure plus de protéines végétales dans votre alimentation,\r\n nos barres protéinées sont pleines de ressources!\r\n\r\n💪 Sources 100% végtales\r\n💪 Recette sans lactose et sans gluten\r\n💪 Riche en protéines\r\n💪 Profil complet d\'acides aminés', '24.90', 'vegan_protbar_chocolate_almond_12pack_retina_6255811f3d016_png', 0),
(23, 10, 'Banc bowflex SelectTech 5.1S', 'Bowflex vous présente avec le SelectTech 5.1S son banc de musculation haut de gamme. Sa structure en acier très robuste lui confère une capacité de charge de 272 kg. Conçu pour une polyvalence totale d’entrainement, ce banc plat incliné/décliné présente 6 réglages d’inclinaison du dossier.\r\n\r\nSa conception ingénieuse intègre un rembourrage en mousse à haute densité, une barre T de maintien des jambes amovible et des mini-roulettes pour un transport facile. Pliable sur action d’un bouton, il se range facilement à la verticale réduisant ainsi son empreinte au sol de plus de 50%.\r\n\r\n💪 Réglage dans 6 positions différentes pour une polyvalence totale : -20°, 0°, 30 °, 45 °, 60°, 90 °.\r\n💪 Structure robuste et de haute qualité en acier pour une longue durabilité. Corrige la posture et stabilise la position pour un entraînement en toute sécurité avec des poids libres.\r\n💪 Facile à transporter et à stocker après utilisation grâce aux roulettes de transport\r\n💪 Rangement vertical quand il n’est pas utilisé\r\n💪 Dimensions : 155 x 71 x 125 cm', '299.90', 'bowflex-5-1-s_6255824a0f457_jpg', 0),
(24, 10, 'Banc de musculation K-Sport avec presse pour jambes', 'Avec cet appareil d\'entraînement, vous obtenez une combinaison d\'un banc d\'entraînement multi-réglable de haute qualité et d\'une presse pour jambes. Assurer des muscles parfaitement définis et désormais entraîner tout le corps régulièrement à la maison. Ensemble de bancs de musculation polyvalent Avec cet ensemble d\'exercice, vous apportez un centre de remise en forme compact directement dans votre maison.\r\n\r\n💪 Charge maximale sur la banque : 250 kg\r\n💪 Charge maximale sur la presse à jambes : 150 kg\r\n💪 Siège réglable sur 3 niveaux et dossier à 8 niveaux\r\n💪 Position assise réglable en 3 directions\r\n💪 Châssis en acier massif', '249.90', 'Banc_de_musculation_avec_presse_pour_jambes_625583b76278d_jpg', 0),
(25, 10, 'Banc de musculation Black Bench Fitness Doctor', 'Le nouveau banc Black Bench de Fitness Doctor est ultra complet, robuste avec un superbe design. En plus des nombreux exercices possibles, vous pouvez faire vos squats librement grâce au banc amovible.\r\nDes charges maximales élevées pour un banc stable, confortable et bien conçu, idéal pour évoluer. \r\n\r\n💪 Construction du châssis en acier\r\n💪 Banc inclinable multipositions indépendant pour un travail complet de tous les groupes musculaires ciblés\r\n💪 Assise réglable sur 3 positions (lorsque l\'on exécute le développer incliné, cela apporte du confort : bien calé au fond du siège, impossible de glisser)\r\n💪 Assise et dossier confortable avec une épaisseur de 45 mm et protections en mousse haute densité\r\n💪 Pupitre à biceps réglable sur 4 positions de hauteur et amovible\r\n💪 Système de blocage du leg lever', '349.90', 'fitsa100_console_f_VERSO_6255846c26b3f_jpg', 0),
(26, 10, 'Banc de Musculation Multifonction ISE', 'Le banc de musculation ISE est un accessoire incontournable pour les athlètes. Il est fait de métal et de mousse de haute densité, dont la principale pièce est un support pour les longues haltères. Associée au dossier réglable sur plusieurs niveaux, cette pièce permet des entraînements adaptés à diverses corpulences et exigences. \r\n\r\n💪 Charge maximale : env. 300 kg (poids corporel et disques de poids inclus)\r\n💪 Poids corporel maximal : env. 150 kg\r\n💪 Matériau : acier, matière PU, synthétique\r\n💪 Banc avec inclinaison ajustable pour une grande variété d\'exercices', '189.90', 'Banc_musculation_Multifonction_Mixte_625586458e10d_png', 0),
(27, 6, 'Haltère Bowflex Compact à Charge Variable', 'Ce seul haltère à charge variable remplace 15 haltères de poids différents \r\n\r\n💪 Conception compacte. Dimensions d’haltère simple: 40 x 20 x 23 cm\r\n💪 Poignée ergonomique antidérapante de haute qualité\r\n💪 Vous pouvez effectuer des exercices difficiles tels que des shakes et des fentes, et même des exercices plus légers tels que des boucles et des ascenseurs\r\n💪 Plaques métalliques recouvertes de plastique de haute qualité pour permettre un entraînement silencieux', '189.90', 'Bowflex_Haltère_Compact_à_Charge_Variable_625586c9e5944_jpg', 0),
(28, 6, 'Haltère Réglable Atifavit', 'Cet haltère qui équivaut à 7 haltères différents possède un design compact pour économiser de l\'espace à la maison.\r\n\r\n💪 Interrupteur de poids rapide : vous pouvez rapidement changer le poids que vous voulez en 3 secondes avec le design push-pull\r\n💪 Nombreuses utilisations : plusieurs gammes de poids adaptées pour effectuer des exercices de base du corps, des exercices de remise en forme, des exercices de force et des levés de jambes lourdes\r\n💪 Matériau de haute qualité : poignée profilée, texturée et douce pour une prise en main confortable et sûre', '149.90', 'atifavit_6255888b61c09_625eb9d8e7615_jpg', 1),
(29, 6, 'Kit Halteres courts avec disques fonte 2*12.5 KG', '💪 Kit access pour un rapport qualité prix optimale\r\n💪 Disques en fonte et barre en acier et revêtement plastique\r\n💪 Grip noir et rouge pour une excellente prise en main.\r\n💪 Diamètre de la barre de 25mm', '59.90', 'KIT_HALTERES_COURTS_AVEC_DISQUES_FONTE_25kg_6255890ded043_jpg', 0),
(30, 6, 'Kit Haltères réglables avec coffret (2x 15 kg)', 'Avec ces haltères vous pouvez entraîner vos bras et le haut de votre corps de manière optimale. Prêt pour le sport ?\r\nEnsuite, stockez les poids dans la mallette fournie.\r\n\r\n💪 Idéal pour un entraînement complet du corps dans votre propre maison ou jardin.\r\n💪 Prise en main confortable grâce à la poignée en caoutchouc\r\n💪 Réglable de 1 à 15 kg par haltère\r\n💪 Disques en fonte durables\r\n💪 Livré dans une valise pour faciliter le stockage', '109.90', 'HALTERES_set_réglable_-_Avec_coffret_-_30_kg_625589c979a4e_jpg', 0),
(31, 11, 'Roue abdominale AB Carver Pro', 'La première roue abdominal avec laquelle vous pourrez travailler l\'ensemble de vos Abdominaux mais aussi bras et pectoraux !\r\n\r\n💪 Des poignées anti dérapantes avec une forme incliné pour une meilleur prise en main.\r\n💪 Un concept moteur cinétique, des ressorts turbo-compresseur en carbone pour une poussée a la descente et une aide a la remontée\r\n💪 Une roue XXL avec un grip pour les exercices des obliques.\r\n💪 Les protections genou avec une mousse haute densité.', '49.90', 'Appareil_Abdominaux_AB_Carver_Pro_62558a173da55_png', 0),
(32, 11, 'Roues Abdominales Core Wheels', 'Passez au niveau supérieur des exercices de gainage, des pompes et des exercices pour le tronc avec Core Wheels de SKLZ. \r\n\r\n💪 Accessoire de musculation dynamique pour le tronc\r\n💪 Intensifiez les exercices de gainage traditionnels et les pompes\r\n💪 Musclez votre tronc (épaules, torse et hanches) avec différents exercices\r\n💪 Les rouleaux placés de chaque côté bougent ensemble pour une plus grande sécurité et un meilleur contrôle\r\n💪 Accessoire léger et portatif, poignées ergonomiques confortables en mousse.', '45.90', 'Roues_Abdominales_Core_Wheels_62558a8a9f12e_png', 0),
(33, 11, 'Roue abdominale Fitness Doctor', 'Ce type d’exercice d’abdominaux à la roulette renforce bien les muscles du ventre (grand droit et transverse) mais aussi les épaules, le dos et les bras.\r\n\r\n💪 Installation facile\r\n💪 Diamètre des roues : 18,5 cm\r\n💪 Roues pleines, en plastique et poignées en acier.', '24.90', 'Double_roue_abdominaux_62558bb47fb15_png', 0),
(34, 11, 'Roue abdominale Deluxe 15cm', 'Cette roue abdominale dispose d\'une tige en métal et d\'une double traction, ce qui vous donne une stabilité supérieure et qui permet un mouvement sans restriction pour un entraînement plus intense, ils ne bougeront pas jusqu\'à 600 kg.\r\n\r\n💪 Portable : étapes d\'installation simples, matériel de fitness mobile.\r\n💪 Poignées antidérapantes : poignées ergonomiques, amovibles pour un transport et un rangement faciles\r\n💪 Applicabilité : notre roue à roulettes est adaptée pour les débutants et les exercices avancés (femmes et hommes) pour développer une force de base équilibrée', '49.90', 'Roue_Deluxe_15cm_62558cd736ce5_jpg', 0),
(35, 13, 'Gilet de musculation Muscle Power - 20 kg', 'Ce gilet de poids de 20 kg dispose de 19 poids métalliques en vrac que vous pouvez retirer ou ajouter pour créer votre charge idéale.\r\nLes poches pour ces poids sont uniformément réparties sur le devant et le dos du gilet, de sorte que vous pouvez facilement garder l\'équilibre.\r\n\r\nVous accrochez le gilet de poids sur vos épaules, puis vous le bouclez avec une sangle qui traverse votre poitrine et votre dos.\r\nCette bande garantit que le gilet ne bouge pas pendant les exercices.\r\n\r\n💪 Équipé de poids amovibles\r\n💪 Une taille unique\r\n💪 Réglable', '139.90', 'gilet-de-musculation-muscle-power-20-kg_62558dddb6061_jpg', 0),
(36, 13, 'Gilet lesté RDX 10-18kg - poids amovibles', 'Gilet lesté avec poids amovible de 10 a 18 kg. Très facile d\'utilisation, et poids parfaitement réparti, ce gilet lesté sera votre allié pour des entrainements intensifs et pousser vos limites au maximum.\r\n\r\n💪 Le gilet s\'attache par sangle velcro et s\'ajuste parfaitement\r\n💪 Taille unique\r\n💪 Lests inclus', '79.90', 'r1-gilet-de-poids-18-kg_62558f3d23340_625ebb24a99c7_jpg', 1),
(37, 13, 'Veste Lestée Tunturi Pro 30kg', 'Portez ce gilet de poids Tunturi si vous voulez facilement rendre vos exercices plus difficiles. Le gilet augmente votre poids corporel jusqu’à 30 kg au maximum. Bien sûr, vous pouvez directement vous entraîner à fond avec le poids total, mais augmenter doucement est sans doute mieux. Le gilet est rempli de blocs de poids d’1 kg et vous rend aussi lourd que vous le souhaitez. Il s’agit d’un modèle de taille unique qui convient à tout le monde. Vous enfilez le gilet de poids et serrez ensuite la fermeture à bande velcro autour de votre taille.\r\n\r\n💪 Outil idéal pour l’entraînement avec un poids corporel supplémentaire\r\n💪 Réglable à l’aide d’une fermeture à bande Velcro\r\n💪 Le poids peut être ajusté par blocs séparés d’1 kg', '184.90', 'tunturi-veste-lestee-pro-30kg_62559178e2d2f_jpg', 0),
(38, 13, 'Gilet lesté de musculation et cross training 10 kg', 'Notre équipe a conçu ce gilet lesté pour vous permettre d\'augmenter la difficulté de vos WOD et de vos exercices en poids de corps.\r\nHissez vos séances de cross training et de musculation à un niveau supérieur ! Choisissez votre lest entre 6 et 10 kg et augmentez l\'intensité de tous vos exercices en poids de corps.\r\n\r\n💪 Maintien : votre gilet reste en place grâce à son poids réparti et ses sangles de réglage\r\n💪 Liberté de mouvement\r\n💪 Préhension ergonomique\r\n💪 Modularité', '49.90', 'gilet-leste-de-musculation-et-cross-training-10-kg_625592760da69_jpg', 0),
(40, 9, 'Protéine de whey goût chocolat', '💪 100 % isolat de whey provenant de vaches de pâturages européens\r\n💪 Plus de 77 % de protéine et seulement 1 % de sucre\r\n💪 Avec les enzymes broméline, papaïne et lactase\r\n💪 Arôme naturel et cacao véritable\r\n💪 Sans sucralose - sucré avec de l\'érythritol et de la stévia\r\n💪 Sans colorants ni conservateurs', '15.90', '71o3tQYJU7L._AC_SL1500__6255945ed6ff0_jpg', 0),
(41, 9, 'Fit shake goût vanille', '💪 Plus de 70 % de protéines pour prendre de la masse\r\n💪 Formule body shape intelligente : collagène, thé vert & choline\r\n💪 1g de sucre par portion seulement', '19.90', 'Fit_shake_gout_vanille_625594930e0f6_png', 0),
(43, 9, 'Protection musculaire goût chocolat', 'Avec les protéines pour séniors nu3 Muscle Protect, nous avons développé une protéine en poudre 2.0 qui vous soutient de manière globale : de la protéine de whey et des enzymes digestives combinées à des vitamines, du collagène et de la créatine ainsi qu\'un délicieux goût de chocolat pour votre développement musculaire.\r\n\r\nNotre protéine en poudre convient pour les sports de force et d\'endurance, pour les activités physiques intenses, pour la construction musculaire pendant la convalescence et est également idéale pour les seniors sportifs. Alors laissez-vous convaincre par ses nombreux avantages !\r\n\r\n💪 Spécialement conçu pour les plus de 50 ans\r\n💪 Pour soutenir ou préserver vos muscles\r\n💪 Avec protéine de whey, créatine & peptides de collagène', '19.90', 'Protection_musculaire_gout_chocolat_6255959197c55_png', 0),
(44, 9, 'Eau protéinée saveur pêche', '💪 Boisson en poudre avec 71% de protéines, pauvre en matières grasses et en sucre\r\n💪 Goût rafraîchissant de thé glacé à la pêche\r\n💪 Vous apporte un supplément de calcium, de magnésium, de potassium, de sodium et de chlorure\r\n💪 Seulement 99 kcal et 0,3 g de sucre par portion (30 g)\r\n💪 Sans sucralose, aspartame ni conservateurs', '13.90', 'Eau_protéinée_saveur_peche_625596044581f_png', 0),
(45, 8, 'Boisson isotonique bio citron vert 440 gr', 'Cette boisson isotonique permet une bonne hydratation et un apport en énergie nécessaire pour vos efforts supérieurs à 1h.\r\n\r\n💪 Apport énergétique. Apporte 38g de glucides pour 500ml de boisson.\r\n💪 Anti-oxydant\r\n💪 Réduction de fatigue\r\n💪 Facilite l\'hydratation', '12.90', 'boisson-isotonique-bio-isostar-en-poudre-citron-vert-440g_62559793b796c_jpg', 0);

-- --------------------------------------------------------

--
-- Structure de la table `transporter`
--

CREATE TABLE `transporter` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `transporter`
--

INSERT INTO `transporter` (`id`, `name`, `description`, `price`) VALUES
(1, 'Colissimo', 'Profitez d\'une livraison premium avec un colis chez vous dans les 72 heures.', '9.90'),
(2, 'Chronopost', 'Profitez de la livraison express en 24 heures.', '14.90');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zipcode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `lastname`, `firstname`, `address`, `zipcode`, `city`) VALUES
(1, 'allo@allo.fr', '[\"ROLE_USER\"]', '$2y$13$a0DuWlAuUtVYBsgj0wGiMun0HDEyMyFFLMkkYo75ZpF9b2j/MKmbu', 'allo', 'allovv', 'adaazdazd', '25000', 'paris'),
(2, 'abricot@aol.fr', '[\"ROLE_USER\"]', '$2y$13$wDvqiYZFsAAcsBJfbZQ9HO05vzfTuiSecddxPYYFJdtenN29OfKYW', 'azeazeaze', 'aazeae', 'azeazeae', '15250', 'azeazee'),
(3, 'admin@admin.fr', '[\"ROLE_USER\"]', '$2y$13$d.TVKheBE.3.d2WWEGLufOnzVhfccuu3hqq/lexTD/W6/dFEyDFF6', 'adminn', 'adminp', '15 rue du bois', '75000', 'paris'),
(4, 'testtestestqqsss@aol.fr', '[\"ROLE_USER\"]', '$2y$13$Gb3EejwNkePCE8/wrBird.Adl..lJ9x7bC.uwf8bMYYusCqzAJCgC', 'test', 'test', '5 rue mira', 'qsdqs', 'azeea'),
(5, 'testtestestqqsazdss@aol.fr', '[\"ROLE_USER\"]', '$2y$13$dkXTDZsFBwMLc4CTeg4Pae/g5X9FWNAHHdVW4511eibfbxDmxqYO.', 'test', 'test', '5 rue mira', '02520', 'azeea'),
(6, 'admin1@admin.fr', '[\"ROLE_ADMIN\"]', '$2y$13$JUzeoq7PQkK8TNB8qO7MfOLf8KLcps0mJUYyZxV8dnkoRnF9wx4DK', 'admin', 'admin', '1rue de l\'admin', '75012', 'Paris'),
(7, 'user@user.com', '[\"ROLE_USER\"]', '$2y$13$v2LqPf5Je9sFBwiVWeI0Tu3KuGHwmq5lvILgnFU9nxPlGGJ.3DANG', 'User', 'User', '2 rue user', '45258', 'paris'),
(8, 'danacanorodriguez@gmail.com', '[\"ROLE_USER\"]', '$2y$13$q/rMUvLyxFSYbMTWNF4AU.VDJ4zy9dC/wFDJ2VsJ29tkb0YkE8E4m', 'Cano', 'Dana', 'la ville', '75005', 'Paris');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_64C19C1727ACA70` (`parent_id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Index pour la table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_F5299398A76ED395` (`user_id`);

--
-- Index pour la table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_ED896F46CFFE9AD6` (`orders_id`);

--
-- Index pour la table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D34A04ADA21214B7` (`categories_id`);

--
-- Index pour la table `transporter`
--
ALTER TABLE `transporter`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT pour la table `transporter`
--
ALTER TABLE `transporter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `FK_64C19C1727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `category` (`id`);

--
-- Contraintes pour la table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `FK_F5299398A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `FK_ED896F46CFFE9AD6` FOREIGN KEY (`orders_id`) REFERENCES `order` (`id`);

--
-- Contraintes pour la table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_D34A04ADA21214B7` FOREIGN KEY (`categories_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
