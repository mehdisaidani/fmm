CREATE DATABASE  IF NOT EXISTS `fmm_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `fmm_db`;
-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: fmm_db
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comarcas`
--

DROP TABLE IF EXISTS `comarcas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comarcas` (
  `idComarca` int(11) NOT NULL,
  `nombre` mediumtext,
  `idProvincia` int(11) DEFAULT NULL,
  PRIMARY KEY (`idComarca`),
  KEY `FK_COM_PROV_idx` (`idProvincia`),
  CONSTRAINT `FK_COM_PROV` FOREIGN KEY (`idProvincia`) REFERENCES `provincias` (`idProvincia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comarcas`
--

LOCK TABLES `comarcas` WRITE;
/*!40000 ALTER TABLE `comarcas` DISABLE KEYS */;
INSERT INTO `comarcas` VALUES (1,'Alt Camp',43),(2,'Alt Empordà',17),(3,'Alt Penedès',8),(4,'Alt Urgell',25),(5,'Alta Ribagorça',25),(6,'Anoia',8),(7,'Bages',8),(8,'Baix Camp',43),(9,'Baix Ebre',43),(10,'Baix Empordà',17),(11,'Baix Llobregat',8),(12,'Baix Penedès',43),(13,'Barcelonès',8),(14,'Berguedà',8),(15,'Cerdanya',17),(16,'Conca de Barberà',43),(17,'Garraf',8),(18,'Garrigues',25),(19,'Garrotxa',17),(20,'Gironès',17),(21,'Maresme',8),(22,'Montsià',43),(23,'Noguera',25),(24,'Osona',8),(25,'Pallars Jussà',25),(26,'Pallars Sobirà',25),(27,'Pla d\'Urgell',25),(28,'Pla de l\'Estany',17),(29,'Priorat',43),(30,'Ribera d\'Ebre',43),(31,'Ripollès',17),(32,'Segarra',25),(33,'Segrià',25),(34,'Selva',17),(35,'Solsonès',25),(36,'Tarragonès',43),(37,'Terra Alta',43),(38,'Urgell',25),(39,'Aran',25),(40,'Vallès Occidental',8),(41,'Vallès Oriental',8),(42,'Moianès',8);
/*!40000 ALTER TABLE `comarcas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `municipios`
--

DROP TABLE IF EXISTS `municipios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `municipios` (
  `idMunicipio` int(11) NOT NULL,
  `Nombre` mediumtext NOT NULL,
  `idComarca` int(11) DEFAULT NULL,
  PRIMARY KEY (`idMunicipio`),
  KEY `FK_MUN_COM_idx` (`idComarca`),
  CONSTRAINT `FK_MUN_COM` FOREIGN KEY (`idComarca`) REFERENCES `comarcas` (`idComarca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `municipios`
--

LOCK TABLES `municipios` WRITE;
/*!40000 ALTER TABLE `municipios` DISABLE KEYS */;
INSERT INTO `municipios` VALUES (80018,'Abrera',11),(80023,'Aguilar de Segarra',7),(80039,'Alella',21),(80044,'Alpens',24),(80057,'Ametlla del Vallès, l\'',41),(80060,'Arenys de Mar',21),(80076,'Arenys de Munt',21),(80082,'Argençola',6),(80095,'Argentona',21),(80109,'Artés',7),(80116,'Avià',14),(80121,'Avinyó',7),(80137,'Avinyonet del Penedès',3),(80142,'Aiguafreda',41),(80155,'Badalona',13),(80168,'Bagà',14),(80174,'Balenyà',24),(80180,'Balsareny',7),(80193,'Barcelona',13),(80207,'Begues',11),(80214,'Bellprat',6),(80229,'Berga',14),(80235,'Bigues i Riells',41),(80240,'Borredà',14),(80253,'Bruc, el',6),(80266,'Brull, el',24),(80272,'Cabanyes, les',3),(80288,'Cabrera d\'Anoia',6),(80291,'Cabrera de Mar',21),(80305,'Cabrils',21),(80312,'Calaf',6),(80327,'Caldes d\'Estrac',21),(80333,'Caldes de Montbui',41),(80348,'Calders',42),(80351,'Calella',21),(80364,'Calonge de Segarra',6),(80370,'Calldetenes',24),(80386,'Callús',7),(80399,'Campins',41),(80403,'Canet de Mar',21),(80410,'Canovelles',41),(80425,'Cànoves i Samalús',41),(80431,'Canyelles',17),(80446,'Capellades',6),(80459,'Capolat',14),(80462,'Cardedeu',41),(80478,'Cardona',7),(80484,'Carme',6),(80497,'Casserres',14),(80500,'Castellar del Riu',14),(80517,'Castellar del Vallès',40),(80522,'Castellar de n\'Hug',14),(80538,'Castellbell i el Vilar',7),(80543,'Castellbisbal',40),(80556,'Castellcir',42),(80569,'Castelldefels',11),(80575,'Castell de l\'Areny',14),(80581,'Castellet i la Gornal',3),(80594,'Castellfollit del Boix',7),(80608,'Castellfollit de Riubregós',6),(80615,'Castellgalí',7),(80620,'Castellnou de Bages',7),(80636,'Castellolí',6),(80641,'Castellterçol',42),(80654,'Castellví de la Marca',3),(80667,'Castellví de Rosanes',11),(80673,'Centelles',24),(80689,'Cervelló',11),(80692,'Collbató',11),(80706,'Collsuspina',42),(80713,'Copons',6),(80728,'Corbera de Llobregat',11),(80734,'Cornellà de Llobregat',11),(80749,'Cubelles',17),(80752,'Dosrius',21),(80765,'Esparreguera',11),(80771,'Esplugues de Llobregat',11),(80787,'Espunyola, l\'',14),(80790,'Estany, l\'',42),(80804,'Fígols',14),(80811,'Fogars de Montclús',41),(80826,'Fogars de la Selva',34),(80832,'Folgueroles',24),(80847,'Fonollosa',7),(80850,'Font-rubí',3),(80863,'Franqueses del Vallès, les',41),(80879,'Gallifa',40),(80885,'Garriga, la',41),(80898,'Gavà',11),(80902,'Gaià',7),(80919,'Gelida',3),(80924,'Gironella',14),(80930,'Gisclareny',14),(80945,'Granada, la',3),(80958,'Granera',42),(80961,'Granollers',41),(80977,'Gualba',41),(80983,'Sant Salvador de Guardiola',7),(80996,'Guardiola de Berguedà',14),(81000,'Gurb',24),(81017,'Hospitalet de Llobregat, l\'',13),(81022,'Igualada',6),(81038,'Jorba',6),(81043,'Llacuna, la',6),(81056,'Llagosta, la',41),(81069,'Llinars del Vallès',41),(81075,'Lliçà d\'Amunt',41),(81081,'Lliçà de Vall',41),(81094,'Lluçà',24),(81108,'Malgrat de Mar',21),(81115,'Malla',24),(81120,'Manlleu',24),(81136,'Manresa',7),(81141,'Martorell',11),(81154,'Martorelles',41),(81167,'Masies de Roda, les',24),(81173,'Masies de Voltregà, les',24),(81189,'Masnou, el',21),(81192,'Masquefa',6),(81206,'Matadepera',40),(81213,'Mataró',21),(81228,'Mediona',3),(81234,'Molins de Rei',11),(81249,'Mollet del Vallès',41),(81252,'Montcada i Reixac',40),(81265,'Montgat',21),(81271,'Monistrol de Montserrat',7),(81287,'Monistrol de Calders',42),(81290,'Muntanyola',24),(81304,'Montclar',14),(81311,'Montesquiu',24),(81326,'Montmajor',14),(81332,'Montmaneu',6),(81347,'Figaró-Montmany',41),(81350,'Montmeló',41),(81363,'Montornès del Vallès',41),(81379,'Montseny',41),(81385,'Moià',42),(81398,'Mura',7),(81402,'Navarcles',7),(81419,'Navàs',7),(81424,'Nou de Berguedà, la',14),(81430,'Òdena',6),(81445,'Olvan',14),(81458,'Olèrdola',3),(81461,'Olesa de Bonesvalls',3),(81477,'Olesa de Montserrat',11),(81483,'Olivella',17),(81496,'Olost',24),(81509,'Orís',24),(81516,'Oristà',24),(81521,'Orpí',6),(81537,'Òrrius',21),(81542,'Pacs del Penedès',3),(81555,'Palafolls',21),(81568,'Palau-solità i Plegamans',40),(81574,'Pallejà',11),(81580,'Papiol, el',11),(81593,'Parets del Vallès',41),(81607,'Perafita',24),(81614,'Piera',6),(81629,'Hostalets de Pierola, els',6),(81635,'Pineda de Mar',21),(81640,'Pla del Penedès, el',3),(81653,'Pobla de Claramunt, la',6),(81666,'Pobla de Lillet, la',14),(81672,'Polinyà',40),(81688,'Pontons',3),(81691,'Prat de Llobregat, el',11),(81705,'Prats de Rei, els',6),(81712,'Prats de Lluçanès',24),(81727,'Premià de Mar',21),(81748,'Puigdàlber',3),(81751,'Puig-reig',14),(81764,'Pujalt',6),(81770,'Quar, la',14),(81786,'Rajadell',7),(81799,'Rellinars',40),(81803,'Ripollet',40),(81810,'Roca del Vallès, la',41),(81825,'Pont de Vilomara i Rocafort, el',7),(81831,'Roda de Ter',24),(81846,'Rubí',40),(81859,'Rubió',6),(81878,'Sabadell',40),(81884,'Sagàs',14),(81897,'Sant Pere Sallavinera',6),(81901,'Saldes',14),(81918,'Sallent',7),(81923,'Santpedor',7),(81939,'Sant Iscle de Vallalta',21),(81944,'Sant Adrià de Besòs',13),(81957,'Sant Agustí de Lluçanès',24),(81960,'Sant Andreu de la Barca',11),(81976,'Sant Andreu de Llavaneres',21),(81982,'Sant Antoni de Vilamajor',41),(81995,'Sant Bartomeu del Grau',24),(82009,'Sant Boi de Llobregat',11),(82016,'Sant Boi de Lluçanès',24),(82021,'Sant Celoni',41),(82037,'Sant Cebrià de Vallalta',21),(82042,'Sant Climent de Llobregat',11),(82055,'Sant Cugat del Vallès',40),(82068,'Sant Cugat Sesgarrigues',3),(82074,'Sant Esteve de Palautordera',41),(82080,'Sant Esteve Sesrovires',11),(82093,'Sant Fost de Campsentelles',41),(82107,'Sant Feliu de Codines',41),(82114,'Sant Feliu de Llobregat',11),(82129,'Sant Feliu Sasserra',7),(82135,'Sant Fruitós de Bages',7),(82140,'Vilassar de Dalt',21),(82153,'Sant Hipòlit de Voltregà',24),(82166,'Sant Jaume de Frontanyà',14),(82172,'Sant Joan Despí',11),(82188,'Sant Joan de Vilatorrada',7),(82191,'Vilassar de Mar',21),(82205,'Sant Julià de Vilatorta',24),(82212,'Sant Just Desvern',11),(82227,'Sant Llorenç d\'Hortons',3),(82233,'Sant Llorenç Savall',40),(82248,'Sant Martí de Centelles',24),(82251,'Sant Martí d\'Albars',24),(82264,'Sant Martí de Tous',6),(82270,'Sant Martí Sarroca',3),(82286,'Sant Martí Sesgueioles',6),(82299,'Sant Mateu de Bages',7),(82303,'Premià de Dalt',21),(82310,'Sant Pere de Ribes',17),(82325,'Sant Pere de Riudebitlles',3),(82331,'Sant Pere de Torelló',24),(82346,'Sant Pere de Vilamajor',41),(82359,'Sant Pol de Mar',21),(82362,'Sant Quintí de Mediona',3),(82378,'Sant Quirze de Besora',24),(82384,'Sant Quirze del Vallès',40),(82397,'Sant Quirze Safaja',42),(82401,'Sant Sadurní d\'Anoia',3),(82418,'Sant Sadurní d\'Osormort',24),(82423,'Marganell',7),(82439,'Santa Cecília de Voltregà',24),(82444,'Santa Coloma de Cervelló',11),(82457,'Santa Coloma de Gramenet',13),(82460,'Santa Eugènia de Berga',24),(82476,'Santa Eulàlia de Riuprimer',24),(82482,'Santa Eulàlia de Ronçana',41),(82495,'Santa Fe del Penedès',3),(82508,'Santa Margarida de Montbui',6),(82515,'Santa Margarida i els Monjos',3),(82520,'Barberà del Vallès',40),(82536,'Santa Maria de Besora',24),(82541,'Esquirol, l\'',24),(82554,'Santa Maria de Merlès',14),(82567,'Santa Maria de Martorelles',41),(82573,'Santa Maria de Miralles',6),(82589,'Santa Maria d\'Oló',42),(82592,'Santa Maria de Palautordera',41),(82606,'Santa Perpètua de Mogoda',40),(82613,'Santa Susanna',21),(82628,'Sant Vicenç de Castellet',7),(82634,'Sant Vicenç dels Horts',11),(82649,'Sant Vicenç de Montalt',21),(82652,'Sant Vicenç de Torelló',24),(82665,'Cerdanyola del Vallès',40),(82671,'Sentmenat',40),(82687,'Cercs',14),(82690,'Seva',24),(82704,'Sitges',17),(82711,'Sobremunt',24),(82726,'Sora',24),(82732,'Subirats',3),(82747,'Súria',7),(82750,'Tavèrnoles',24),(82763,'Tagamanent',41),(82779,'Talamanca',7),(82785,'Taradell',24),(82798,'Terrassa',40),(82802,'Tavertet',24),(82819,'Teià',21),(82824,'Tiana',21),(82830,'Tona',24),(82845,'Tordera',21),(82858,'Torelló',24),(82861,'Torre de Claramunt, la',6),(82877,'Torrelavit',3),(82883,'Torrelles de Foix',3),(82896,'Torrelles de Llobregat',11),(82900,'Ullastrell',40),(82917,'Vacarisses',40),(82922,'Vallbona d\'Anoia',6),(82938,'Vallcebre',14),(82943,'Vallgorguina',41),(82956,'Vallirana',11),(82969,'Vallromanes',41),(82975,'Veciana',6),(82981,'Vic',24),(82994,'Vilada',14),(83008,'Viladecavalls',40),(83015,'Viladecans',11),(83020,'Vilanova del Camí',6),(83036,'Vilanova de Sau',24),(83041,'Vilobí del Penedès',3),(83054,'Vilafranca del Penedès',3),(83067,'Vilalba Sasserra',41),(83073,'Vilanova i la Geltrú',17),(83089,'Viver i Serrateix',14),(89019,'Rupit i Pruit',24),(89024,'Vilanova del Vallès',41),(89030,'Sant Julià de Cerdanyola',14),(89045,'Badia del Vallès',40),(89058,'Palma de Cervelló, la',11),(170010,'Agullana',2),(170025,'Aiguaviva',20),(170031,'Albanyà',2),(170046,'Albons',10),(170059,'Far d\'Empordà, el',2),(170062,'Alp',15),(170078,'Amer',34),(170084,'Anglès',34),(170097,'Arbúcies',34),(170101,'Argelaguer',19),(170118,'Armentera, l\'',2),(170123,'Avinyonet de Puigventós',2),(170139,'Begur',10),(170144,'Vajol, la',2),(170157,'Banyoles',28),(170160,'Bàscara',2),(170182,'Bellcaire d\'Empordà',10),(170195,'Besalú',19),(170209,'Bescanó',20),(170216,'Beuda',19),(170221,'Bisbal d\'Empordà, la',10),(170237,'Blanes',34),(170242,'Bolvir',15),(170255,'Bordils',20),(170268,'Borrassà',2),(170274,'Breda',34),(170280,'Brunyola i Sant Martí Sapresa',34),(170293,'Boadella i les Escaules',2),(170307,'Cabanes',2),(170314,'Cabanelles',2),(170329,'Cadaqués',2),(170335,'Caldes de Malavella',34),(170340,'Calonge i Sant Antoni',10),(170353,'Camós',28),(170366,'Campdevànol',31),(170372,'Campelles',31),(170388,'Campllong',20),(170391,'Camprodon',31),(170405,'Canet d\'Adri',20),(170412,'Cantallops',2),(170427,'Capmany',2),(170433,'Queralbs',31),(170448,'Cassà de la Selva',20),(170464,'Castellfollit de la Roca',19),(170470,'Castelló d\'Empúries',2),(170486,'Castell-Platja d\'Aro',10),(170499,'Celrà',20),(170502,'Cervià de Ter',20),(170519,'Cistella',2),(170524,'Siurana',2),(170545,'Colera',2),(170558,'Colomers',10),(170561,'Cornellà del Terri',28),(170577,'Corçà',10),(170583,'Crespià',28),(170600,'Darnius',2),(170617,'Das',15),(170622,'Escala, l\'',2),(170638,'Espinelves',24),(170643,'Espolla',2),(170656,'Esponellà',28),(170669,'Figueres',2),(170675,'Flaçà',20),(170681,'Foixà',10),(170694,'Fontanals de Cerdanya',15),(170708,'Fontanilles',10),(170715,'Fontcoberta',28),(170736,'Fornells de la Selva',20),(170741,'Fortià',2),(170754,'Garrigàs',2),(170767,'Garrigoles',10),(170773,'Garriguella',2),(170789,'Ger',15),(170792,'Girona',20),(170806,'Gombrèn',31),(170813,'Gualta',10),(170828,'Guils de Cerdanya',15),(170834,'Hostalric',34),(170849,'Isòvol',15),(170852,'Jafre',10),(170865,'Jonquera, la',2),(170871,'Juià',20),(170887,'Lladó',2),(170890,'Llagostera',20),(170904,'Llambilles',20),(170911,'Llanars',31),(170926,'Llançà',2),(170932,'Llers',2),(170947,'Llívia',15),(170950,'Lloret de Mar',34),(170963,'Llosses, les',31),(170979,'Madremanya',20),(170985,'Maià de Montcal',19),(170998,'Meranges',15),(171002,'Masarac',2),(171019,'Massanes',34),(171024,'Maçanet de Cabrenys',2),(171030,'Maçanet de la Selva',34),(171058,'Mieres',19),(171061,'Mollet de Peralada',2),(171077,'Molló',31),(171096,'Montagut i Oix',19),(171100,'Mont-ras',10),(171117,'Navata',2),(171122,'Ogassa',31),(171143,'Olot',19),(171156,'Ordis',2),(171169,'Osor',34),(171175,'Palafrugell',10),(171181,'Palamós',10),(171194,'Palau de Santa Eulàlia',2),(171208,'Palau-saverdera',2),(171215,'Palau-sator',10),(171236,'Palol de Revardit',28),(171241,'Pals',10),(171254,'Pardines',31),(171267,'Parlavà',10),(171289,'Pau',2),(171292,'Pedret i Marzà',2),(171306,'Pera, la',10),(171328,'Peralada',2),(171334,'Planes d\'Hostoles, les',19),(171349,'Planoles',31),(171352,'Pont de Molins',2),(171365,'Pontós',2),(171371,'Porqueres',28),(171387,'Portbou',2),(171390,'Preses, les',19),(171404,'Port de la Selva, el',2),(171411,'Puigcerdà',15),(171426,'Quart',20),(171432,'Rabós',2),(171447,'Regencós',10),(171450,'Ribes de Freser',31),(171463,'Riells i Viabrea',34),(171479,'Ripoll',31),(171485,'Riudarenes',34),(171498,'Riudaura',19),(171501,'Riudellots de la Selva',34),(171518,'Riumors',2),(171523,'Roses',2),(171539,'Rupià',10),(171544,'Sales de Llierca',19),(171557,'Salt',20),(171576,'Sant Andreu Salou',20),(171582,'Sant Climent Sescebes',2),(171595,'Sant Feliu de Buixalleu',34),(171609,'Sant Feliu de Guíxols',10),(171616,'Sant Feliu de Pallerols',19),(171621,'Sant Ferriol',19),(171637,'Sant Gregori',20),(171642,'Sant Hilari Sacalm',34),(171655,'Sant Jaume de Llierca',19),(171668,'Sant Jordi Desvalls',20),(171674,'Sant Joan de les Abadesses',31),(171680,'Sant Joan de Mollet',20),(171693,'Sant Julià de Ramis',20),(171707,'Vallfogona de Ripollès',31),(171714,'Sant Llorenç de la Muga',2),(171729,'Sant Martí de Llémena',20),(171735,'Sant Martí Vell',20),(171740,'Sant Miquel de Campmajor',28),(171753,'Sant Miquel de Fluvià',2),(171766,'Sant Mori',2),(171772,'Sant Pau de Segúries',31),(171788,'Sant Pere Pescador',2),(171805,'Santa Coloma de Farners',34),(171812,'Santa Cristina d\'Aro',10),(171827,'Santa Llogaia d\'Àlguema',2),(171833,'Sant Aniol de Finestres',19),(171848,'Santa Pau',19),(171851,'Sant Joan les Fonts',19),(171864,'Sarrià de Ter',20),(171870,'Saus, Camallera i Llampaies',2),(171886,'Selva de Mar, la',2),(171899,'Cellera de Ter, la',34),(171903,'Serinyà',28),(171910,'Serra de Daró',10),(171925,'Setcases',31),(171931,'Sils',34),(171946,'Susqueda',34),(171959,'Tallada d\'Empordà, la',10),(171962,'Terrades',2),(171978,'Torrent',10),(171984,'Torroella de Fluvià',2),(171997,'Torroella de Montgrí',10),(172001,'Tortellà',19),(172018,'Toses',31),(172023,'Tossa de Mar',34),(172039,'Ultramort',10),(172044,'Ullà',10),(172057,'Ullastret',10),(172060,'Urús',15),(172076,'Vall d\'en Bas, la',19),(172082,'Vall de Bianya, la',19),(172095,'Vall-llobrega',10),(172109,'Ventalló',2),(172116,'Verges',10),(172121,'Vidrà',24),(172137,'Vidreres',34),(172142,'Vilabertran',2),(172155,'Vilablareix',20),(172168,'Viladasens',20),(172174,'Viladamat',2),(172180,'Vilademuls',28),(172207,'Viladrau',24),(172214,'Vilafant',2),(172229,'Vilaür',2),(172235,'Vilajuïga',2),(172240,'Vilallonga de Ter',31),(172253,'Vilamacolum',2),(172266,'Vilamalla',2),(172272,'Vilamaniscle',2),(172288,'Vilanant',2),(172305,'Vila-sacra',2),(172327,'Vilopriu',10),(172333,'Vilobí d\'Onyar',34),(172348,'Biure',2),(179011,'Cruïlles, Monells i Sant Sadurní de l\'Heura',10),(179026,'Forallac',10),(179032,'Sant Julià del Llor i Bonmatí',34),(250019,'Abella de la Conca',25),(250024,'Àger',23),(250030,'Agramunt',38),(250045,'Alamús, els',33),(250058,'Alàs i Cerc',4),(250061,'Albagés, l\'',18),(250077,'Albatàrrec',33),(250083,'Albesa',23),(250096,'Albi, l\'',18),(250100,'Alcanó',33),(250117,'Alcarràs',33),(250122,'Alcoletge',33),(250138,'Alfarràs',33),(250143,'Alfés',33),(250156,'Algerri',23),(250169,'Alguaire',33),(250175,'Alins',26),(250194,'Almacelles',33),(250208,'Almatret',33),(250215,'Almenar',33),(250220,'Alòs de Balaguer',23),(250236,'Alpicat',33),(250241,'Alt Àneu',26),(250254,'Naut Aran',39),(250273,'Anglesola',38),(250292,'Arbeca',18),(250306,'Pont de Bar, el',4),(250313,'Arres',39),(250328,'Arsèguel',4),(250334,'Artesa de Lleida',33),(250349,'Artesa de Segre',23),(250352,'Sentiu de Sió, la',23),(250365,'Aspa',33),(250371,'Avellanes i Santa Linya, les',23),(250387,'Aitona',33),(250390,'Baix Pallars',26),(250404,'Balaguer',23),(250411,'Barbens',27),(250426,'Baronia de Rialb, la',23),(250432,'Vall de Boí, la',5),(250447,'Bassella',4),(250450,'Bausen',39),(250463,'Belianes',38),(250479,'Bellcaire d\'Urgell',23),(250485,'Bell-lloc d\'Urgell',27),(250498,'Bellmunt d\'Urgell',23),(250501,'Bellpuig',38),(250518,'Bellver de Cerdanya',15),(250523,'Bellvís',27),(250539,'Benavent de Segrià',33),(250557,'Biosca',32),(250560,'Bovera',18),(250576,'Bòrdes, Es',39),(250582,'Borges Blanques, les',18),(250595,'Bossòst',39),(250609,'Cabanabona',23),(250616,'Cabó',4),(250621,'Camarasa',23),(250637,'Canejan',39),(250642,'Castellar de la Ribera',35),(250674,'Castelldans',18),(250680,'Castellnou de Seana',27),(250693,'Castelló de Farfanya',23),(250707,'Castellserà',38),(250714,'Cava',4),(250729,'Cervera',32),(250735,'Cervià de les Garrigues',18),(250740,'Ciutadilla',38),(250753,'Clariana de Cardener',35),(250766,'Cogul, el',18),(250772,'Coll de Nargó',4),(250788,'Corbins',33),(250791,'Cubells',23),(250812,'Espluga Calba, l\'',18),(250827,'Espot',26),(250851,'Estaràs',32),(250864,'Esterri d\'Àneu',26),(250870,'Esterri de Cardós',26),(250886,'Estamariu',4),(250899,'Farrera',26),(250925,'Floresta, la',18),(250931,'Fondarella',27),(250946,'Foradada',23),(250962,'Fuliola, la',38),(250978,'Fulleda',18),(250984,'Gavet de la Conca',25),(250997,'Golmés',27),(251001,'Gósol',14),(251018,'Granadella, la',18),(251023,'Granja d\'Escarp, la',33),(251039,'Granyanella',32),(251044,'Granyena de Segarra',32),(251057,'Granyena de les Garrigues',18),(251095,'Guimerà',38),(251109,'Guissona',32),(251116,'Guixers',35),(251121,'Ivars de Noguera',23),(251137,'Ivars d\'Urgell',27),(251142,'Ivorra',32),(251155,'Isona i Conca Dellà',25),(251180,'Juncosa',18),(251193,'Juneda',18),(251207,'Lleida',33),(251214,'Les',39),(251229,'Linyola',27),(251235,'Lladorre',26),(251240,'Lladurs',35),(251253,'Llardecans',33),(251266,'Llavorsí',26),(251272,'Lles de Cerdanya',15),(251288,'Llimiana',25),(251291,'Llobera',35),(251305,'Maldà',38),(251312,'Massalcoreig',33),(251327,'Massoteres',32),(251333,'Maials',33),(251348,'Menàrguens',23),(251351,'Miralcamp',27),(251364,'Molsosa, la',35),(251370,'Mollerussa',27),(251386,'Montgai',23),(251399,'Montellà i Martinet',15),(251403,'Montferrer i Castellbò',4),(251410,'Montoliu de Segarra',32),(251425,'Montoliu de Lleida',33),(251431,'Montornès de Segarra',32),(251459,'Nalec',38),(251462,'Navès',35),(251484,'Odèn',35),(251497,'Oliana',4),(251500,'Oliola',23),(251517,'Olius',35),(251522,'Oluges, les',32),(251538,'Omellons, els',18),(251543,'Omells de na Gaia, els',38),(251556,'Organyà',4),(251569,'Os de Balaguer',23),(251575,'Ossó de Sió',38),(251581,'Palau d\'Anglesola, el',27),(251615,'Conca de Dalt',25),(251636,'Coma i la Pedra, la',35),(251641,'Penelles',23),(251654,'Peramola',4),(251667,'Pinell de Solsonès',35),(251673,'Pinós',35),(251689,'Poal, el',27),(251692,'Pobla de Cérvoles, la',18),(251706,'Bellaguarda',18),(251713,'Pobla de Segur, la',25),(251728,'Ponts',23),(251734,'Pont de Suert, el',5),(251749,'Portella, la',33),(251752,'Prats i Sansor',15),(251765,'Preixana',38),(251771,'Preixens',23),(251790,'Prullans',15),(251804,'Puiggròs',18),(251811,'Puigverd d\'Agramunt',38),(251826,'Puigverd de Lleida',33),(251832,'Rialp',26),(251850,'Ribera d\'Urgellet',4),(251863,'Riner',35),(251898,'Rosselló',33),(251902,'Salàs de Pallars',25),(251919,'Sanaüja',32),(251924,'Sant Guim de Freixenet',32),(251930,'Sant Llorenç de Morunys',35),(251945,'Sant Ramon',32),(251961,'Sant Esteve de la Sarga',25),(251977,'Sant Guim de la Plana',32),(252000,'Sarroca de Lleida',33),(252017,'Sarroca de Bellera',25),(252022,'Senterada',25),(252038,'Seu d\'Urgell, la',4),(252043,'Seròs',33),(252056,'Sidamon',27),(252069,'Soleràs, el',18),(252075,'Solsona',35),(252081,'Soriguera',26),(252094,'Sort',26),(252108,'Soses',33),(252115,'Sudanell',33),(252120,'Sunyer',33),(252154,'Talarn',25),(252167,'Talavera',32),(252173,'Tàrrega',38),(252189,'Tarrés',18),(252192,'Tarroja de Segarra',32),(252206,'Térmens',23),(252213,'Tírvia',26),(252228,'Tiurana',23),(252234,'Torà',32),(252249,'Torms, els',18),(252252,'Tornabous',38),(252265,'Torrebesses',33),(252271,'Torre de Cabdella, la',25),(252287,'Torrefarrera',33),(252304,'Torregrossa',27),(252311,'Torrelameu',23),(252326,'Torres de Segre',33),(252332,'Torre-serona',33),(252347,'Tremp',25),(252385,'Vallbona de les Monges',38),(252398,'Valls de Valira, les',4),(252402,'Vallfogona de Balaguer',23),(252424,'Verdú',38),(252430,'Vielha e Mijaran',39),(252445,'Vilagrassa',38),(252458,'Vilaller',5),(252477,'Vilamòs',39),(252483,'Vilanova de Bellpuig',27),(252496,'Vilanova de l\'Aguda',23),(252509,'Vilanova de Meià',23),(252516,'Vilanova de Segrià',33),(252521,'Vila-sana',27),(252537,'Vilosell, el',18),(252542,'Vilanova de la Barca',33),(252555,'Vinaixa',18),(259010,'Vall de Cardós',26),(259025,'Sant Martí de Riucorb',38),(259031,'Guingueta d\'Àneu, la',26),(259046,'Castell de Mur',25),(259059,'Ribera d\'Ondara',32),(259062,'Valls d\'Aguilar, les',4),(259078,'Torrefeta i Florejacs',32),(259084,'Fígols i Alinyà',4),(259097,'Vansa i Fórnols, la',4),(259101,'Josa i Tuixén',4),(259118,'Plans de Sió, els',32),(259123,'Gimenells i el Pla de la Font',33),(259139,'Riu de Cerdanya',15),(430017,'Aiguamúrcia',1),(430022,'Albinyana',12),(430038,'Albiol, l\'',8),(430043,'Alcanar',22),(430056,'Alcover',1),(430069,'Aldover',9),(430075,'Aleixar, l\'',8),(430081,'Alfara de Carles',9),(430094,'Alforja',8),(430108,'Alió',1),(430115,'Almoster',8),(430120,'Altafulla',36),(430136,'Ametlla de Mar, l\'',9),(430141,'Amposta',22),(430154,'Arbolí',8),(430167,'Arboç, l\'',12),(430173,'Argentera, l\'',8),(430189,'Arnes',37),(430192,'Ascó',30),(430206,'Banyeres del Penedès',12),(430213,'Barberà de la Conca',16),(430228,'Batea',37),(430234,'Bellmunt del Priorat',29),(430249,'Bellvei',12),(430252,'Benifallet',9),(430265,'Benissanet',30),(430271,'Bisbal de Falset, la',29),(430287,'Bisbal del Penedès, la',12),(430290,'Blancafort',16),(430304,'Bonastre',12),(430311,'Borges del Camp, les',8),(430326,'Bot',37),(430332,'Botarell',8),(430347,'Bràfim',1),(430350,'Cabacés',29),(430363,'Cabra del Camp',1),(430379,'Calafell',12),(430385,'Cambrils',8),(430398,'Capafonts',8),(430402,'Capçanes',29),(430419,'Caseres',37),(430424,'Castellvell del Camp',8),(430430,'Catllar, el',36),(430445,'Sénia, la',22),(430458,'Colldejou',8),(430461,'Conesa',16),(430477,'Constantí',36),(430483,'Corbera d\'Ebre',37),(430496,'Cornudella de Montsant',29),(430509,'Creixell',36),(430516,'Cunit',12),(430521,'Xerta',9),(430537,'Duesaigües',8),(430542,'Espluga de Francolí, l\'',16),(430555,'Falset',29),(430568,'Fatarella, la',37),(430574,'Febró, la',8),(430580,'Figuera, la',29),(430593,'Figuerola del Camp',1),(430607,'Flix',30),(430614,'Forès',16),(430629,'Freginals',22),(430635,'Galera, la',22),(430640,'Gandesa',37),(430653,'Garcia',30),(430666,'Garidells, els',1),(430672,'Ginestar',30),(430688,'Godall',22),(430691,'Gratallops',29),(430705,'Guiamets, els',29),(430712,'Horta de Sant Joan',37),(430727,'Lloar, el',29),(430733,'Llorac',16),(430748,'Llorenç del Penedès',12),(430751,'Margalef',29),(430764,'Marçà',29),(430770,'Mas de Barberans',22),(430786,'Masdenverge',22),(430799,'Masllorenç',12),(430803,'Masó, la',1),(430810,'Maspujols',8),(430825,'Masroig, el',29),(430831,'Milà, el',1),(430846,'Miravet',30),(430859,'Molar, el',29),(430862,'Montblanc',16),(430884,'Montbrió del Camp',8),(430897,'Montferri',1),(430901,'Montmell, el',12),(430918,'Mont-ral',1),(430923,'Mont-roig del Camp',8),(430939,'Móra d\'Ebre',30),(430944,'Móra la Nova',30),(430957,'Morell, el',36),(430960,'Morera de Montsant, la',29),(430976,'Nou de Gaià, la',36),(430982,'Nulles',1),(430995,'Palma d\'Ebre, la',30),(431009,'Pallaresos, els',36),(431016,'Passanant i Belltall',16),(431021,'Paüls',9),(431037,'Perafort',36),(431042,'Perelló, el',9),(431055,'Piles, les',16),(431068,'Pinell de Brai, el',37),(431074,'Pira',16),(431080,'Pla de Santa Maria, el',1),(431093,'Pobla de Mafumet, la',36),(431107,'Pobla de Massaluca, la',37),(431114,'Pobla de Montornès, la',36),(431129,'Poboleda',29),(431135,'Pont d\'Armentera, el',1),(431140,'Porrera',29),(431153,'Pradell de la Teixeta',29),(431166,'Prades',8),(431172,'Prat de Comte',37),(431188,'Pratdip',8),(431191,'Puigpelat',1),(431205,'Querol',1),(431212,'Rasquera',30),(431227,'Renau',36),(431233,'Reus',8),(431248,'Riba, la',1),(431251,'Riba-roja d\'Ebre',30),(431264,'Riera de Gaià, la',36),(431270,'Riudecanyes',8),(431286,'Riudecols',8),(431299,'Riudoms',8),(431303,'Rocafort de Queralt',16),(431310,'Roda de Berà',36),(431325,'Rodonyà',1),(431331,'Roquetes',9),(431346,'Rourell, el',1),(431359,'Salomó',36),(431362,'Sant Carles de la Ràpita',22),(431378,'Sant Jaume dels Domenys',12),(431384,'Santa Bàrbara',22),(431397,'Santa Coloma de Queralt',16),(431401,'Santa Oliva',12),(431418,'Pontils',16),(431423,'Sarral',16),(431439,'Savallà del Comtat',16),(431444,'Secuita, la',36),(431457,'Selva del Camp, la',8),(431460,'Senan',16),(431476,'Solivella',16),(431482,'Tarragona',36),(431495,'Tivenys',9),(431508,'Tivissa',30),(431515,'Torre de Fontaubella, la',29),(431520,'Torre de l\'Espanyol, la',30),(431536,'Torredembarra',36),(431541,'Torroja del Priorat',29),(431554,'Tortosa',9),(431567,'Ulldecona',22),(431573,'Ulldemolins',29),(431589,'Vallclara',16),(431592,'Vallfogona de Riucorb',16),(431606,'Vallmoll',1),(431613,'Valls',1),(431628,'Vandellòs i l\'Hospitalet de l\'Infant',8),(431634,'Vendrell, el',12),(431649,'Vespella de Gaià',36),(431652,'Vilabella',1),(431665,'Vilallonga del Camp',36),(431671,'Vilanova d\'Escornalbou',8),(431687,'Vilanova de Prades',16),(431690,'Vilaplana',8),(431704,'Vila-rodona',1),(431711,'Vila-seca',36),(431726,'Vilaverd',16),(431732,'Vilella Alta, la',29),(431747,'Vilella Baixa, la',29),(431750,'Vilalba dels Arcs',37),(431763,'Vimbodí i Poblet',16),(431779,'Vinebre',30),(431785,'Vinyols i els Arcs',8),(439018,'Deltebre',9),(439023,'Sant Jaume d\'Enveja',22),(439039,'Camarles',9),(439044,'Aldea, l\'',9),(439057,'Salou',36),(439060,'Ampolla, l\'',9),(439076,'Canonja, la',36);
/*!40000 ALTER TABLE `municipios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productores`
--

DROP TABLE IF EXISTS `productores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productores` (
  `idProductor` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(20) NOT NULL,
  `password` varchar(16) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellidos` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `numTelefono` int(11) DEFAULT NULL,
  PRIMARY KEY (`idProductor`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productores`
--

LOCK TABLES `productores` WRITE;
/*!40000 ALTER TABLE `productores` DISABLE KEYS */;
INSERT INTO `productores` VALUES (1,'productor1','1234','Pepito','Perez','mail1@mail.com',555555001),(2,'productor2','1234','Paquito','Lopez','mail2@mail.com',555555002),(3,'productor3','1234','Juanito','Sanchez','mail3@mail.com',555555003),(4,'productor4','1234','Mehdi','Saidani','mahde.53@gmail.com',637111111),(5,'productor5','1234','Marc','Dominguez','marcpages@gmail.com',637113135),(6,'productor6','1234','Laura','Gomez','laura@gmail.com',637113139),(7,'productor7','1234','test','test','test@mail.com',623456789);
/*!40000 ALTER TABLE `productores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `idProductos` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`idProductos`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Tomate'),(2,'Patata'),(3,'Lechuga'),(4,'Cebolla'),(5,'Berenjena'),(6,'Zanahoria'),(7,'Calabacin'),(8,'Mandarina'),(9,'Sandia'),(10,'Platano'),(11,'Aguacate'),(12,'Naranja');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos_puntos`
--

DROP TABLE IF EXISTS `productos_puntos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos_puntos` (
  `idpuntoDeVenta` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  PRIMARY KEY (`idpuntoDeVenta`,`idProducto`),
  KEY `FK_PRODUCTOS_PUNTOS_idx` (`idProducto`),
  CONSTRAINT `FK_PRODUCTOS_PUNTOS` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProductos`),
  CONSTRAINT `FK_PUNTOS_PRODUCTOS` FOREIGN KEY (`idpuntoDeVenta`) REFERENCES `puntosdeventa` (`idpuntoDeVenta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos_puntos`
--

LOCK TABLES `productos_puntos` WRITE;
/*!40000 ALTER TABLE `productos_puntos` DISABLE KEYS */;
INSERT INTO `productos_puntos` VALUES (1,1),(2,1),(3,1),(15,2),(16,2),(26,2),(1,3),(2,3),(27,3),(3,4),(4,4),(27,4),(1,5),(2,5),(3,5),(4,6),(15,6),(16,6),(1,7),(26,7),(27,7),(2,8),(3,8),(4,8),(15,9),(16,9),(26,9),(1,10),(2,10),(27,10),(3,11),(4,11),(15,11),(1,12),(26,12),(27,12);
/*!40000 ALTER TABLE `productos_puntos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provincias`
--

DROP TABLE IF EXISTS `provincias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provincias` (
  `idProvincia` int(11) NOT NULL,
  `nombre` varchar(35) NOT NULL,
  PRIMARY KEY (`idProvincia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincias`
--

LOCK TABLES `provincias` WRITE;
/*!40000 ALTER TABLE `provincias` DISABLE KEYS */;
INSERT INTO `provincias` VALUES (8,'Barcelona'),(17,'Girona'),(25,'Lleida'),(43,'Tarragona');
/*!40000 ALTER TABLE `provincias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puntosdeventa`
--

DROP TABLE IF EXISTS `puntosdeventa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `puntosdeventa` (
  `idpuntoDeVenta` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` tinytext,
  `idProvincia` int(11) NOT NULL,
  `idComarca` int(11) NOT NULL,
  `idProductor` int(11) NOT NULL,
  `idProducto` int(11) DEFAULT NULL,
  `fechaInicio` date NOT NULL,
  `horaInicio` time NOT NULL,
  `fechaFinal` date DEFAULT NULL,
  `horaFinal` time DEFAULT NULL,
  `productos` mediumtext,
  `idMunicipio` int(11) NOT NULL,
  `isPermanente` tinyint(4) DEFAULT '0',
  `direccion` mediumtext,
  `descripcion` mediumtext,
  PRIMARY KEY (`idpuntoDeVenta`),
  KEY `FK_PDV_PRODUCTOR_idx` (`idProductor`),
  KEY `FK_PDV_PRODUCTO_idx` (`idProducto`),
  KEY `FK_PDV_PROVINCIA_idx` (`idProvincia`),
  KEY `FK_PDV_COMARCA_idx` (`idComarca`),
  KEY `FK_PDV_MUNICIPIO_idx` (`idMunicipio`),
  CONSTRAINT `FK_PDV_COMARCA` FOREIGN KEY (`idComarca`) REFERENCES `comarcas` (`idComarca`),
  CONSTRAINT `FK_PDV_MUNICIPIO` FOREIGN KEY (`idMunicipio`) REFERENCES `municipios` (`idMunicipio`),
  CONSTRAINT `FK_PDV_PRODUCTO` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProductos`),
  CONSTRAINT `FK_PDV_PRODUCTOR` FOREIGN KEY (`idProductor`) REFERENCES `productores` (`idProductor`),
  CONSTRAINT `FK_PDV_PROVINCIA` FOREIGN KEY (`idProvincia`) REFERENCES `provincias` (`idProvincia`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puntosdeventa`
--

LOCK TABLES `puntosdeventa` WRITE;
/*!40000 ALTER TABLE `puntosdeventa` DISABLE KEYS */;
INSERT INTO `puntosdeventa` VALUES (1,'Fira d\'Aiguafreda',8,41,1,NULL,'2019-12-09','08:00:00','2019-12-09','20:00:00','',80142,0,'Plaça de l\'Ajuntament, 08591 Aiguafreda','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),(2,'Mercat de la Terra',43,8,5,NULL,'2019-12-22','09:00:00','2020-01-07','17:00:00','',431270,0,'Carrer del Dimecres, 9, 43771 Riudecanyes','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),(3,'Mercat a la Fresca',17,10,3,NULL,'2020-01-03','10:00:00','2020-01-03','18:00:00','',170046,0,'Plaça del Poble, 1, 17136 Albons','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),(4,'Albons Ecologic',17,10,4,NULL,'2020-01-15','10:00:00','2020-01-17','20:00:00','',170046,0,'Plaça del Poble, 1, 17136 Albons','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),(15,'Mercat de la Concepcio',8,13,6,NULL,'2020-02-20','09:00:00','2020-02-29','19:00:00','',80193,0,'Carrer d\'Aragó, 313, Barcelona','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),(16,'Santa Caterina Market',8,13,2,NULL,'2020-03-02','10:00:00','2020-03-15','17:00:00','',80193,0,'Av. de Francesc Cambó, 16, 08003 Barcelona','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),(26,'Riudecanyes Local',43,8,4,NULL,'2019-12-05','11:00:00','2019-12-12','20:00:00','',431270,0,'Carrer del Dimecres, 9, 43771 Riudecanyes','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),(27,'Mercat de l\'Horta',8,41,5,NULL,'2019-12-07','08:00:00','2019-12-07','16:00:00','',80142,0,'Plaça de l\'Ajuntament, 08591 Aiguafreda','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');
/*!40000 ALTER TABLE `puntosdeventa` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-04 12:50:43
