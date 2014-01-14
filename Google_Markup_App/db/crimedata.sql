-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 25, 2013 at 08:56 PM
-- Server version: 5.6.12
-- PHP Version: 5.5.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cdcol`
--
CREATE DATABASE IF NOT EXISTS `cdcol` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `cdcol`;

-- --------------------------------------------------------

--
-- Table structure for table `cds`
--

CREATE TABLE IF NOT EXISTS `cds` (
  `titel` varchar(200) DEFAULT NULL,
  `interpret` varchar(200) DEFAULT NULL,
  `jahr` int(11) DEFAULT NULL,
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `cds`
--

INSERT INTO `cds` (`titel`, `interpret`, `jahr`, `id`) VALUES
('Beauty', 'Ryuichi Sakamoto', 1990, 1),
('Goodbye Country (Hello Nightclub)', 'Groove Armada', 2001, 4),
('Glee', 'Bran Van 3000', 1997, 5);
--
-- Database: `crimedata`
--
CREATE DATABASE IF NOT EXISTS `crimedata` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `crimedata`;

-- --------------------------------------------------------

--
-- Table structure for table `Markers`
--

CREATE TABLE IF NOT EXISTS `Markers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(40) NOT NULL,
  `city` varchar(30) NOT NULL,
  `address` varchar(255) NOT NULL,
  `year` year(4) DEFAULT NULL,
  `month` tinyint(2) DEFAULT NULL,
  `lat` float DEFAULT '0',
  `lng` float DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `address` (`address`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=79 ;

--
-- Dumping data for table `Markers`
--

INSERT INTO `Markers` (`id`, `type`, `city`, `address`, `year`, `month`, `lat`, `lng`) VALUES
(1, 'Theft From Auto Over $5000', 'Vancouver', '63XX BOUNDARY RD', 2010, 1, 49.2437, -123.024),
(2, 'Theft From Auto Over $5000', 'Vancouver', '19XX E HASTINGS ST', 2010, 1, 49.2812, -123.064),
(3, 'Theft From Auto Over $5000', 'Vancouver', 'RICHARDS ST / W GEORGIA ST', 2010, 1, 49.2787, -123.112),
(4, 'Theft From Auto Over $5000', 'Vancouver', '8XX AVISON WAY', 2010, 1, 49.3003, -123.13),
(5, 'Theft From Auto Over $5000', 'Vancouver', '56XX EAST BLVD', 2010, 1, 49.2232, -123.152),
(6, 'Theft From Auto Over $5000', 'Vancouver', '7XX W GEORGIA ST', 2010, 1, 49.2857, -123.123),
(7, 'Theft From Auto Over $5000', 'Vancouver', '39XX INVERNESS ST', 2010, 1, 49.2332, -123.08),
(8, 'Theft From Auto Over $5000', 'Vancouver', '38XX W 29TH AVE', 2010, 1, 49.2462, -123.173),
(9, 'Theft From Auto Over $5000', 'Vancouver', '17XX BARCLAY ST', 2010, 1, 49.2873, -123.133),
(10, 'Theft From Auto Over $5000', 'Vancouver', '9XX BURRARD ST', 2010, 2, 49.2766, -123.133),
(11, 'Theft From Auto Over $5000', 'Vancouver', 'GRANVILLE ST / ROBSON ST', 2010, 2, 49.2851, -123.125),
(12, 'Theft From Auto Under $5000', 'Vancouver', 'KINGSWAY AVE / KNIGHT ST', 2010, 1, 49.2348, -123.077),
(13, 'Theft From Auto Under $5000', 'Vancouver', '29XX KITCHENER ST', 2010, 1, 49.2723, -123.054),
(14, 'Theft From Auto Under $5000', 'Vancouver', '19XX CEDAR CRES', 2010, 1, 49.2548, -123.148),
(15, 'Theft From Auto Under $5000', 'Vancouver', '27XX ALBERTA ST', 2010, 1, 49.237, -123.113),
(16, 'Theft From Auto Under $5000', 'Vancouver', '15XX W 32ND AVE', 2010, 1, 49.2431, -123.157),
(17, 'Theft From Auto Under $5000', 'Vancouver', '53XX SLOCAN ST', 2010, 1, 49.2587, -123.05),
(49, 'Theft From Auto Under $5000', 'Vancouver', '12XX BURNABY ST', 2010, 1, 49.2821, -123.136),
(50, 'Theft From Auto Under $5000', 'Vancouver', '19XX W 11TH AVE', 2010, 1, 49.262, -123.158),
(51, 'Theft From Auto Under $5000', 'Vancouver', '4XX W 19TH AVE', 2010, 1, 49.2545, -123.151),
(52, 'Theft From Auto Under $5000', 'Vancouver', '50XX ST CATHERINES ST', 2010, 1, 49.2453, -123.086),
(53, 'Theft From Auto Under $5000', 'Vancouver', '9XX W 21ST AVE', 2010, 1, 49.2535, -123.153),
(54, 'Theft From Auto Under $5000', 'Vancouver', '4XX W 18TH AVE', 2010, 1, 49.2554, -123.151),
(55, 'Commercial BE', 'Vancouver', '72XX FRASER ST', 2010, 1, 49.2361, -123.09),
(56, 'Commercial BE', 'Vancouver', '57XX FRASER ST', 2010, 1, 49.2361, -123.09),
(57, 'Commercial BE', 'Vancouver', '55XX OAK ST', 2010, 1, 49.233, -123.128),
(58, 'Commercial BE', 'Vancouver', '32XX W BROADWAY AVE', 2010, 1, 49.2612, -123.114),
(59, 'Commercial BE', 'Vancouver', '55XX WEST BLVD', 2010, 1, 49.2271, -123.155),
(60, 'Commercial BE', 'Vancouver', '2XX BURRARD ST', 2010, 3, 49.2766, -123.133),
(61, 'Commercial BE', 'Vancouver', '25XX WINDSOR ST', 2010, 3, 49.2373, -123.085),
(62, 'Commercial BE', 'Vancouver', '22XX HIGHBURY ST', 2010, 3, 49.2511, -123.188),
(63, 'Commercial BE', 'Vancouver', '4XX W PENDER ST', 2010, 3, 49.2874, -123.12),
(64, 'Commercial BE', 'Vancouver', '86XX OAK ST', 2010, 3, 49.233, -123.128),
(65, 'Commercial BE', 'Vancouver', '35XX W 41ST AVE', 2010, 3, 49.2345, -123.151),
(66, 'Commercial BE', 'Vancouver', '49XX VICTORIA DR', 2010, 3, 49.2253, -123.066),
(67, 'Commercial BE', 'Vancouver', '9XX SEYMOUR ST', 2010, 3, 0, 0),
(68, 'Commercial BE', 'Vancouver', '5XX SMITHE ST', 2010, 3, 0, 0),
(69, 'Commercial BE', 'Vancouver', '21XX W BROADWAY AVE', 2010, 3, 49.2612, -123.114),
(70, 'Commercial BE', 'Vancouver', '22XX W 2ND AVE', 2010, 3, 49.2703, -123.189),
(71, 'Mischief Under $5000', 'Vancouver', '21XX W 21ST AVE', 2010, 2, 49.2535, -123.153),
(72, 'Mischief Under $5000', 'Vancouver', '79XX GRANVILLE ST', 2010, 2, 49.246, -123.139),
(73, 'Mischief Under $5000', 'Vancouver', '1XX PRIOR ST', 2010, 2, 49.2767, -123.094),
(74, 'Mischief Under $5000', 'Vancouver', '64XX DUNBAR ST', 2010, 2, 49.249, -123.185),
(75, 'Mischief Under $5000', 'Vancouver', '2XX E HASTINGS ST', 2010, 2, 49.2812, -123.064),
(76, 'Mischief Under $5000', 'Vancouver', '32XX VANNESS AVE', 2010, 2, 49.2429, -123.043),
(77, 'Mischief Under $5000', 'Vancouver', '9XX ROBSON ST', 2010, 2, 49.2853, -123.126),
(78, 'Mischief Under $5000', 'Vancouver', 'ALMA ST / W 10TH AVE', 2010, 2, 49.2621, -123.105);
--
-- Database: `my_db`
--
CREATE DATABASE IF NOT EXISTS `my_db` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `my_db`;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE IF NOT EXISTS `pma__bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE IF NOT EXISTS `pma__column_info` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `pma__column_info`
--

INSERT INTO `pma__column_info` (`id`, `db_name`, `table_name`, `column_name`, `comment`, `mimetype`, `transformation`, `transformation_options`) VALUES
(1, 'crimedata', 'Markers', 'date_added', '', '', '_', '');

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_coords`
--

CREATE TABLE IF NOT EXISTS `pma__designer_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `x` int(11) DEFAULT NULL,
  `y` int(11) DEFAULT NULL,
  `v` tinyint(4) DEFAULT NULL,
  `h` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`db_name`,`table_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE IF NOT EXISTS `pma__history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`,`db`,`table`,`timevalue`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE IF NOT EXISTS `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '',
  PRIMARY KEY (`page_nr`),
  KEY `db_name` (`db_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE IF NOT EXISTS `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{"db":"crimedata","table":"Markers"},{"db":"my_db","table":"markers"},{"db":"information_schema","table":"CHARACTER_SETS"},{"db":"phpmyadmin","table":"pma__bookmark"},{"db":"mysql","table":"db"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE IF NOT EXISTS `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  KEY `foreign_field` (`foreign_db`,`foreign_table`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE IF NOT EXISTS `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float unsigned NOT NULL DEFAULT '0',
  `y` float unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE IF NOT EXISTS `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`db_name`,`table_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE IF NOT EXISTS `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`username`,`db_name`,`table_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE IF NOT EXISTS `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) unsigned NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`db_name`,`table_name`,`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE IF NOT EXISTS `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `test_multi_sets`()
    DETERMINISTIC
begin
        select user() as first_col;
        select user() as first_col, now() as second_col;
        select user() as first_col, now() as second_col, now() as third_col;
        end$$

DELIMITER ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
