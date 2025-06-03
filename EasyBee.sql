-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mar. 03 juin 2025 à 11:29
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `EasyBee`
--

-- --------------------------------------------------------

--
-- Structure de la table `Associer`
--

CREATE TABLE `Associer` (
  `idFormation` int(11) NOT NULL,
  `idTheme` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Attribuer`
--

CREATE TABLE `Attribuer` (
  `idFormation` int(11) NOT NULL,
  `idFormateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Clients`
--

CREATE TABLE `Clients` (
  `idUtilisateur` int(11) NOT NULL,
  `nomClient` varchar(255) NOT NULL,
  `prenomClient` varchar(255) NOT NULL,
  `emailClient` varchar(255) NOT NULL,
  `mdpClient` varchar(255) NOT NULL,
  `identifiantClient` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `Clients`
--

INSERT INTO `Clients` (`idUtilisateur`, `nomClient`, `prenomClient`, `emailClient`, `mdpClient`, `identifiantClient`) VALUES
(1, 'Mazain', 'Hugo', 'hugo.mazain@gmail.com', '0000', 'Hugo');

-- --------------------------------------------------------

--
-- Structure de la table `Equipement_Formation`
--

CREATE TABLE `Equipement_Formation` (
  `idEquipement` int(11) NOT NULL,
  `libelle` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Formateurs`
--

CREATE TABLE `Formateurs` (
  `idFormateur` int(11) NOT NULL,
  `nomFormateur` varchar(255) NOT NULL,
  `prenomFormateur` varchar(255) NOT NULL,
  `mailFormateur` varchar(255) NOT NULL,
  `telFormateur` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Formations`
--

CREATE TABLE `Formations` (
  `idFormation` int(11) NOT NULL,
  `titreFormation` varchar(255) NOT NULL,
  `descriptionFormation` text DEFAULT NULL,
  `prixFormation` decimal(10,2) NOT NULL,
  `dateDebutFormation` date NOT NULL,
  `dureeFormation` int(11) NOT NULL,
  `placesMaxFormation` int(11) NOT NULL,
  `idNiveau` int(11) DEFAULT NULL,
  `idModalite` int(11) DEFAULT NULL,
  `idLieu` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Inscrire`
--

CREATE TABLE `Inscrire` (
  `idFormation` int(11) NOT NULL,
  `idUtilisateur` int(11) NOT NULL,
  `etatInscription` varchar(50) NOT NULL,
  `dateInscription` date NOT NULL,
  `montantRegleInscription` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Lieu_Formation`
--

CREATE TABLE `Lieu_Formation` (
  `idLieu` int(11) NOT NULL,
  `libelle` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Modalite_Formation`
--

CREATE TABLE `Modalite_Formation` (
  `idModalite` int(11) NOT NULL,
  `libelle` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Necessaire`
--

CREATE TABLE `Necessaire` (
  `idFormation` int(11) NOT NULL,
  `idEquipement` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Niveau_Formation`
--

CREATE TABLE `Niveau_Formation` (
  `idNiveau` int(11) NOT NULL,
  `libelle` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Prerequis`
--

CREATE TABLE `Prerequis` (
  `idFormation` int(11) NOT NULL,
  `idFormationPrerequis` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Situer`
--

CREATE TABLE `Situer` (
  `idFormation` int(11) NOT NULL,
  `idLieu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Themes`
--

CREATE TABLE `Themes` (
  `idTheme` int(11) NOT NULL,
  `nomTheme` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Associer`
--
ALTER TABLE `Associer`
  ADD PRIMARY KEY (`idFormation`,`idTheme`),
  ADD KEY `idTheme` (`idTheme`);

--
-- Index pour la table `Attribuer`
--
ALTER TABLE `Attribuer`
  ADD PRIMARY KEY (`idFormation`,`idFormateur`),
  ADD KEY `idFormateur` (`idFormateur`);

--
-- Index pour la table `Clients`
--
ALTER TABLE `Clients`
  ADD PRIMARY KEY (`idUtilisateur`),
  ADD UNIQUE KEY `emailClient` (`emailClient`),
  ADD UNIQUE KEY `identifiantClient` (`identifiantClient`);

--
-- Index pour la table `Equipement_Formation`
--
ALTER TABLE `Equipement_Formation`
  ADD PRIMARY KEY (`idEquipement`);

--
-- Index pour la table `Formateurs`
--
ALTER TABLE `Formateurs`
  ADD PRIMARY KEY (`idFormateur`);

--
-- Index pour la table `Formations`
--
ALTER TABLE `Formations`
  ADD PRIMARY KEY (`idFormation`),
  ADD KEY `idNiveau` (`idNiveau`),
  ADD KEY `idModalite` (`idModalite`),
  ADD KEY `idLieu` (`idLieu`);

--
-- Index pour la table `Inscrire`
--
ALTER TABLE `Inscrire`
  ADD PRIMARY KEY (`idFormation`,`idUtilisateur`),
  ADD KEY `idUtilisateur` (`idUtilisateur`);

--
-- Index pour la table `Lieu_Formation`
--
ALTER TABLE `Lieu_Formation`
  ADD PRIMARY KEY (`idLieu`);

--
-- Index pour la table `Modalite_Formation`
--
ALTER TABLE `Modalite_Formation`
  ADD PRIMARY KEY (`idModalite`);

--
-- Index pour la table `Necessaire`
--
ALTER TABLE `Necessaire`
  ADD PRIMARY KEY (`idFormation`,`idEquipement`),
  ADD KEY `idEquipement` (`idEquipement`);

--
-- Index pour la table `Niveau_Formation`
--
ALTER TABLE `Niveau_Formation`
  ADD PRIMARY KEY (`idNiveau`);

--
-- Index pour la table `Prerequis`
--
ALTER TABLE `Prerequis`
  ADD PRIMARY KEY (`idFormation`,`idFormationPrerequis`),
  ADD KEY `idFormationPrerequis` (`idFormationPrerequis`);

--
-- Index pour la table `Situer`
--
ALTER TABLE `Situer`
  ADD PRIMARY KEY (`idFormation`,`idLieu`),
  ADD KEY `idLieu` (`idLieu`);

--
-- Index pour la table `Themes`
--
ALTER TABLE `Themes`
  ADD PRIMARY KEY (`idTheme`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Clients`
--
ALTER TABLE `Clients`
  MODIFY `idUtilisateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `Equipement_Formation`
--
ALTER TABLE `Equipement_Formation`
  MODIFY `idEquipement` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Formateurs`
--
ALTER TABLE `Formateurs`
  MODIFY `idFormateur` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Formations`
--
ALTER TABLE `Formations`
  MODIFY `idFormation` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Lieu_Formation`
--
ALTER TABLE `Lieu_Formation`
  MODIFY `idLieu` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Modalite_Formation`
--
ALTER TABLE `Modalite_Formation`
  MODIFY `idModalite` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Niveau_Formation`
--
ALTER TABLE `Niveau_Formation`
  MODIFY `idNiveau` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Themes`
--
ALTER TABLE `Themes`
  MODIFY `idTheme` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Associer`
--
ALTER TABLE `Associer`
  ADD CONSTRAINT `associer_ibfk_1` FOREIGN KEY (`idFormation`) REFERENCES `Formations` (`idFormation`),
  ADD CONSTRAINT `associer_ibfk_2` FOREIGN KEY (`idTheme`) REFERENCES `Themes` (`idTheme`);

--
-- Contraintes pour la table `Attribuer`
--
ALTER TABLE `Attribuer`
  ADD CONSTRAINT `attribuer_ibfk_1` FOREIGN KEY (`idFormation`) REFERENCES `Formations` (`idFormation`),
  ADD CONSTRAINT `attribuer_ibfk_2` FOREIGN KEY (`idFormateur`) REFERENCES `Formateurs` (`idFormateur`);

--
-- Contraintes pour la table `Formations`
--
ALTER TABLE `Formations`
  ADD CONSTRAINT `formations_ibfk_1` FOREIGN KEY (`idNiveau`) REFERENCES `Niveau_Formation` (`idNiveau`),
  ADD CONSTRAINT `formations_ibfk_2` FOREIGN KEY (`idModalite`) REFERENCES `Modalite_Formation` (`idModalite`),
  ADD CONSTRAINT `formations_ibfk_3` FOREIGN KEY (`idLieu`) REFERENCES `Lieu_Formation` (`idLieu`);

--
-- Contraintes pour la table `Inscrire`
--
ALTER TABLE `Inscrire`
  ADD CONSTRAINT `inscrire_ibfk_1` FOREIGN KEY (`idFormation`) REFERENCES `Formations` (`idFormation`),
  ADD CONSTRAINT `inscrire_ibfk_2` FOREIGN KEY (`idUtilisateur`) REFERENCES `Clients` (`idUtilisateur`);

--
-- Contraintes pour la table `Necessaire`
--
ALTER TABLE `Necessaire`
  ADD CONSTRAINT `necessaire_ibfk_1` FOREIGN KEY (`idFormation`) REFERENCES `Formations` (`idFormation`),
  ADD CONSTRAINT `necessaire_ibfk_2` FOREIGN KEY (`idEquipement`) REFERENCES `Equipement_Formation` (`idEquipement`);

--
-- Contraintes pour la table `Prerequis`
--
ALTER TABLE `Prerequis`
  ADD CONSTRAINT `prerequis_ibfk_1` FOREIGN KEY (`idFormation`) REFERENCES `Formations` (`idFormation`),
  ADD CONSTRAINT `prerequis_ibfk_2` FOREIGN KEY (`idFormationPrerequis`) REFERENCES `Formations` (`idFormation`);

--
-- Contraintes pour la table `Situer`
--
ALTER TABLE `Situer`
  ADD CONSTRAINT `situer_ibfk_1` FOREIGN KEY (`idFormation`) REFERENCES `Formations` (`idFormation`),
  ADD CONSTRAINT `situer_ibfk_2` FOREIGN KEY (`idLieu`) REFERENCES `Lieu_Formation` (`idLieu`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
