-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : ven. 14 avr. 2023 à 14:43
-- Version du serveur :  5.7.34
-- Version de PHP : 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `databaseapp`
--

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
('DoctrineMigrations\\Version20230327082915', '2023-03-27 08:30:39', 62),
('DoctrineMigrations\\Version20230329074406', '2023-03-29 07:49:47', 63),
('DoctrineMigrations\\Version20230329132450', '2023-03-29 13:25:04', 41);

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
-- Structure de la table `questionnaire`
--

CREATE TABLE `questionnaire` (
  `id` int(11) NOT NULL,
  `question` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `response` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `questionnaire`
--

INSERT INTO `questionnaire` (`id`, `question`, `response`) VALUES
(1, 'Comment vous identifiez-vous ?', 'Homme,Femme,Autre'),
(2, 'Quel est votre âge ?', '13-17 ans,18-24 ans,25-34 ans,35-44 ans,45 ans et plus'),
(3, 'Quel est votre code postal ?', NULL),
(4, 'Êtes-vous en étude actuellement ?', 'Oui,Non'),
(5, 'Quel est votre niveau d’étude ?', 'Pre-Bac,Bac,Bac+2,Licence,Master,Doctorat'),
(6, 'Quel est le salaire moyen par mois de vos deux parents réunis (€) ?', '0-1400,1400-2800,2800-4200,+4200'),
(7, 'Combien d\'amis proches voyez-vous par semaine ?', 'Aucun,1-3,4-7,8+'),
(8, 'Avez-vous déjà été critiqué ou moqué pour avoir montré vos émotions en public ?', 'Oui,Non'),
(9, 'Ressentez-vous le besoin de camoufler vos émotions positives ?', 'Oui,Non'),
(10, 'Ressentez-vous le besoin de camoufler vos émotions négatives ?', 'Oui,Non'),
(11, 'Avez-vous déjà observé quelqu\'un cacher ses émotions ?', 'Oui,Non'),
(12, 'Où voyez-vous cette injonction le plus souvent ?', 'Au travail,Dans le cadre prive,Autre'),
(13, 'Les personnes concernées sont généralement ?', 'De la famille,Un ami,Un inconnu'),
(14, 'Qui pensez-vous que cette injonction affecte le plus ?', 'Les hommes,Les femmes,Les deux'),
(15, 'Selon vous, est-ce important pour les hommes de montrer leurs émotions ?', 'Oui,Non'),
(16, 'Pensez-vous que les médias (films, séries TV, publicités, etc.) influencent cette injonction ?', 'Oui,Non'),
(17, 'Pensez-vous que l\'injonction \"Les hommes ne doivent pas montrer leurs émotions\" est en train de changer dans notre société ?', 'Oui,Non');

-- --------------------------------------------------------

--
-- Structure de la table `responses`
--

CREATE TABLE `responses` (
  `id` int(11) NOT NULL,
  `response` longtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `responses`
--

INSERT INTO `responses` (`id`, `response`) VALUES
(68, '\"[\\\"Autre\\\",\\\"45 ans et plus\\\",\\\"97354\\\",\\\"Non\\\",\\\"Doctorat\\\",\\\"2800-4200\\\",\\\"Aucun\\\",\\\"Non\\\",\\\"Non\\\",\\\"Oui\\\",\\\"Oui\\\",\\\"Autre\\\",\\\"Un ami\\\",\\\"Les hommes\\\",\\\"Oui\\\",\\\"Oui\\\",\\\"Oui\\\"]\"'),
(69, '\"[\\\"Homme\\\",\\\"18-24 ans\\\",\\\"50250\\\",\\\"Oui\\\",\\\"Licence\\\",\\\"2800-4200\\\",\\\"1-3\\\",\\\"Oui\\\",\\\"Non\\\",\\\"Oui\\\",\\\"Oui\\\",\\\"Dans le cadre prive\\\",\\\"Un ami\\\",\\\"Les hommes\\\",\\\"Oui\\\",\\\"Oui\\\",\\\"Oui\\\"]\"'),
(70, '\"[\\\"Femme\\\",\\\"35-44 ans\\\",\\\"50430\\\",\\\"Non\\\",\\\"Master\\\",\\\"2800-4200\\\",\\\"8+\\\",\\\"Non\\\",\\\"Non\\\",\\\"Oui\\\",\\\"Oui\\\",\\\"Au travail\\\",\\\"De la famille\\\",\\\"Les deux\\\",\\\"Oui\\\",\\\"Oui\\\",\\\"Oui\\\"]\"'),
(71, '\"[\\\"Femme\\\",\\\"13-17 ans\\\",\\\"50250\\\",\\\"Oui\\\",\\\"Post-Bac\\\",\\\"0-1400\\\",\\\"8+\\\",\\\"Oui\\\",\\\"Oui\\\",\\\"Non\\\",\\\"Non\\\",\\\"Autre\\\",\\\"Un ami\\\",\\\"Les deux\\\",\\\"Non\\\",\\\"Non\\\",\\\"Non\\\"]\"'),
(72, '\"[\\\"Homme\\\",\\\"13-17 ans\\\",\\\"50250\\\",\\\"Oui\\\",\\\"Bac\\\",\\\"2800-4200\\\",\\\"1-3\\\",\\\"Non\\\",\\\"Oui\\\",\\\"Oui\\\",\\\"Non\\\",\\\"Dans le cadre prive\\\",\\\"Un inconnu\\\",\\\"Les hommes\\\",\\\"Oui\\\",\\\"Non\\\",\\\"Oui\\\"]\"'),
(74, '\"[\\\"Homme\\\",\\\"25-34 ans\\\",\\\"60250\\\",\\\"Non\\\",\\\"Licence\\\",\\\"2800-4200\\\",\\\"4-7\\\",\\\"Non\\\",\\\"Non\\\",\\\"Oui\\\",\\\"Oui\\\",\\\"Au travail\\\",\\\"Un inconnu\\\",\\\"Les deux\\\",\\\"Oui\\\",\\\"Oui\\\",\\\"Oui\\\"]\"'),
(75, '\"[\\\"Homme\\\",\\\"18-24 ans\\\",\\\"50250\\\",\\\"Oui\\\",\\\"Licence\\\",\\\"2800-4200\\\",\\\"4-7\\\",\\\"Oui\\\",\\\"Non\\\",\\\"Oui\\\",\\\"Oui\\\",\\\"Dans le cadre prive\\\",\\\"Un ami\\\",\\\"Les hommes\\\",\\\"Oui\\\",\\\"Oui\\\",\\\"Oui\\\"]\"'),
(76, '\"[\\\"Homme\\\",\\\"18-24 ans\\\",\\\"50250\\\",\\\"Oui\\\",\\\"Licence\\\",\\\"2800-4200\\\",\\\"4-7\\\",\\\"Oui\\\",\\\"Non\\\",\\\"Oui\\\",\\\"Oui\\\",\\\"Dans le cadre prive\\\",\\\"Un ami\\\",\\\"Les hommes\\\",\\\"Oui\\\",\\\"Oui\\\",\\\"Oui\\\"]\"'),
(77, '\"[\\\"Homme\\\",\\\"18-24 ans\\\",\\\"50250\\\",\\\"Oui\\\",\\\"Licence\\\",\\\"2800-4200\\\",\\\"4-7\\\",\\\"Oui\\\",\\\"Non\\\",\\\"Oui\\\",\\\"Oui\\\",\\\"Dans le cadre prive\\\",\\\"Un ami\\\",\\\"Les hommes\\\",\\\"Oui\\\",\\\"Oui\\\",\\\"Oui\\\"]\"'),
(78, '\"[\\\"Homme\\\",\\\"18-24 ans\\\",\\\"50250\\\",\\\"Oui\\\",\\\"Licence\\\",\\\"2800-4200\\\",\\\"4-7\\\",\\\"Oui\\\",\\\"Non\\\",\\\"Oui\\\",\\\"Oui\\\",\\\"Dans le cadre prive\\\",\\\"Un ami\\\",\\\"Les hommes\\\",\\\"Oui\\\",\\\"Oui\\\",\\\"Oui\\\"]\"'),
(79, '\"[\\\"Homme\\\",\\\"18-24 ans\\\",\\\"50250\\\",\\\"Oui\\\",\\\"Licence\\\",\\\"2800-4200\\\",\\\"4-7\\\",\\\"Oui\\\",\\\"Non\\\",\\\"Oui\\\",\\\"Oui\\\",\\\"Dans le cadre prive\\\",\\\"Un ami\\\",\\\"Les hommes\\\",\\\"Oui\\\",\\\"Oui\\\",\\\"Oui\\\"]\"'),
(80, '\"[\\\"Homme\\\",\\\"25-34 ans\\\",\\\"50250\\\",\\\"Oui\\\",\\\"Master\\\",\\\"2800-4200\\\",\\\"8+\\\",\\\"Non\\\",\\\"Non\\\",\\\"Non\\\",\\\"Non\\\",\\\"Autre\\\",\\\"Un inconnu\\\",\\\"Les femmes\\\",\\\"Oui\\\",\\\"Oui\\\",\\\"Non\\\"]\"'),
(81, '\"[\\\"Femme\\\",\\\"18-24 ans\\\",\\\"50250\\\",\\\"Non\\\",\\\"Doctorat\\\",\\\"+4200\\\",\\\"1-3\\\",\\\"Oui\\\",\\\"Non\\\",\\\"Non\\\",\\\"Oui\\\",\\\"Dans le cadre prive\\\",\\\"De la famille\\\",\\\"Les hommes\\\",\\\"Oui\\\",\\\"Oui\\\",\\\"Oui\\\"]\"'),
(82, '\"[\\\"Femme\\\",\\\"18-24 ans\\\",\\\"50250\\\",\\\"Non\\\",\\\"Doctorat\\\",\\\"+4200\\\",\\\"1-3\\\",\\\"Oui\\\",\\\"Non\\\",\\\"Non\\\",\\\"Oui\\\",\\\"Dans le cadre prive\\\",\\\"De la famille\\\",\\\"Les hommes\\\",\\\"Oui\\\",\\\"Oui\\\",\\\"Oui\\\"]\"'),
(83, '\"[\\\"Femme\\\",\\\"18-24 ans\\\",\\\"50250\\\",\\\"Non\\\",\\\"Doctorat\\\",\\\"+4200\\\",\\\"1-3\\\",\\\"Oui\\\",\\\"Non\\\",\\\"Non\\\",\\\"Oui\\\",\\\"Dans le cadre prive\\\",\\\"De la famille\\\",\\\"Les hommes\\\",\\\"Oui\\\",\\\"Oui\\\",\\\"Oui\\\"]\"'),
(84, '\"[\\\"Homme\\\",\\\"18-24 ans\\\",\\\"50250\\\",\\\"Oui\\\",\\\"Bac+2\\\",\\\"1400-2800\\\",\\\"4-7\\\",\\\"Non\\\",\\\"Non\\\",\\\"Non\\\",\\\"Non\\\",\\\"Autre\\\",\\\"Un ami\\\",\\\"Les hommes\\\",\\\"Oui\\\",\\\"Oui\\\",\\\"Oui\\\"]\"'),
(85, '\"[\\\"Femme\\\",\\\"13-17 ans\\\",\\\"50250\\\",\\\"Oui\\\",\\\"Doctorat\\\",\\\"2800-4200\\\",\\\"1-3\\\",\\\"Oui\\\",\\\"Oui\\\",\\\"Oui\\\",\\\"Oui\\\",\\\"Au travail\\\",\\\"Un ami\\\",\\\"Les hommes\\\",\\\"Oui\\\",\\\"Oui\\\",\\\"Non\\\"]\"'),
(86, '\"[\\\"Homme\\\",\\\"18-24 ans\\\",\\\"50250\\\",\\\"Non\\\",\\\"Licence\\\",\\\"+4200\\\",\\\"8+\\\",\\\"Non\\\",\\\"Oui\\\",\\\"Oui\\\",\\\"Oui\\\",\\\"Autre\\\",\\\"Un ami\\\",\\\"Les femmes\\\",\\\"Non\\\",\\\"Oui\\\",\\\"Oui\\\"]\"');

--
-- Index pour les tables déchargées
--

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
-- Index pour la table `questionnaire`
--
ALTER TABLE `questionnaire`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `responses`
--
ALTER TABLE `responses`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `questionnaire`
--
ALTER TABLE `questionnaire`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `responses`
--
ALTER TABLE `responses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
