-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: leepeuker
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bookmark_tag`
--

DROP TABLE IF EXISTS `bookmark_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookmark_tag` (
  `bookmark_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  KEY `bookmark_tag_bookmark_id_foreign` (`bookmark_id`),
  KEY `bookmark_tag_tag_id_foreign` (`tag_id`),
  CONSTRAINT `bookmark_tag_bookmark_id_foreign` FOREIGN KEY (`bookmark_id`) REFERENCES `bookmarks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bookmark_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookmark_tag`
--

LOCK TABLES `bookmark_tag` WRITE;
/*!40000 ALTER TABLE `bookmark_tag` DISABLE KEYS */;
INSERT INTO `bookmark_tag` VALUES (1,1),(2,1),(3,1),(3,2),(4,1),(4,3),(5,1),(6,1),(6,4),(7,1),(7,5),(8,1),(8,6),(9,8),(10,8),(13,10),(16,11),(16,12),(17,11),(17,12),(18,13),(19,11),(19,14),(10,14),(20,14),(20,15),(20,16),(21,9),(21,17),(22,9),(22,18),(23,16),(23,14),(23,19),(24,14),(24,19),(25,15),(27,14),(27,20),(28,8),(29,8),(29,9),(29,21),(30,14),(30,15),(31,8),(31,21),(32,1),(35,9),(35,1),(36,9),(36,19),(37,1),(37,14),(37,22),(38,1),(38,23),(39,1),(39,23),(40,8),(40,24),(41,24),(41,21),(41,8),(42,15),(42,16),(43,9),(43,11),(43,25),(44,21),(44,8),(44,14),(44,26),(52,8),(52,27),(9,27),(10,27),(53,21),(53,8),(54,28),(55,9),(56,9),(57,21),(57,8),(58,9),(58,27),(59,9),(59,27),(60,21),(60,29),(61,21),(61,29),(62,19),(62,21),(62,1),(62,29),(63,28),(64,28),(65,28),(66,28),(67,28),(68,9),(69,28),(70,29),(71,28),(72,9),(73,19),(74,9),(75,30),(76,11),(76,14),(78,9),(79,31),(80,32),(74,32),(81,9),(81,19),(79,14),(82,31),(82,33),(83,27),(83,8),(84,27),(84,8),(85,27),(85,8),(86,16),(86,14),(87,14),(87,16),(88,33),(89,9),(89,1),(89,16),(90,32),(90,9),(91,19),(92,22),(93,32),(94,34),(95,20),(95,35),(96,31),(96,32),(96,33),(97,31),(97,33);
/*!40000 ALTER TABLE `bookmark_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookmarks`
--

DROP TABLE IF EXISTS `bookmarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookmarks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `favicon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bookmarks_url_unique` (`url`),
  KEY `bookmarks_user_id_foreign` (`user_id`),
  FULLTEXT KEY `title` (`title`),
  CONSTRAINT `bookmarks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookmarks`
--

LOCK TABLES `bookmarks` WRITE;
/*!40000 ALTER TABLE `bookmarks` DISABLE KEYS */;
INSERT INTO `bookmarks` VALUES (1,1,'Namespaces Explained (PHP)','https://daylerees.com/php-namespaces-explained/','OMguNq7tYJ.ico','2018-08-06 05:28:56','2018-08-06 05:28:58'),(2,1,'Interfaces Explained (PHP)','https://daylerees.com/php-interfaces-explained/','4ydMCMcoVZ.ico','2018-08-06 05:29:22','2018-08-06 05:29:23'),(3,1,'The Composer Lock File','https://daylerees.com/the-composer-lock-file/','od2kObTZ0q.ico','2018-08-06 05:29:47','2018-08-06 05:29:48'),(4,1,'You’re doing PHP logging wrong','https://logmatic.io/blog/youre-doing-php-logging-wrong/',NULL,'2018-08-06 05:30:31','2018-08-06 05:30:31'),(5,1,'PHP The Right Way','https://www.phptherightway.com/','xuazYYJ0R9.png','2018-08-06 05:31:39','2018-08-06 05:31:40'),(6,1,'Design Patterns (PHP)','https://www.phptherightway.com/pages/Design-Patterns.html','khemOF6Eh8.png','2018-08-06 05:32:38','2018-08-06 05:32:38'),(7,1,'PHP Streaming and Output Buffering Explained','https://www.sitepoint.com/php-streaming-output-buffering-explained/','CCx7khJoyh.ico','2018-08-06 05:33:39','2018-08-06 05:33:44'),(8,1,'(The only proper) PDO tutorial','https://phpdelusions.net/pdo','nVIB0s3QQ3.ico','2018-08-06 05:34:29','2018-08-06 05:34:31'),(9,1,'Why Your Static Website Needs HTTPS','https://www.troyhunt.com/heres-why-your-static-website-needs-https/','HInG0LVtCi.png','2018-08-06 05:55:37','2018-08-06 05:55:38'),(10,1,'The 6-Step \"Happy Path\" to HTTPS','https://www.troyhunt.com/the-6-step-happy-path-to-https/','SAYcF5XVlL.png','2018-08-06 06:30:38','2018-08-06 06:30:39'),(13,1,'What is Docker? A Simple Explanation','https://www.nebulaworks.com/blog/2015/03/24/what-is-docker-a-simple-explanation/','Xwx600PDP2.ico','2018-08-06 06:33:25','2018-08-06 06:33:28'),(14,1,'The DRY principle: its cost explained with examples','http://web-techno.net/dry-principle-explained/',NULL,'2018-08-06 06:33:59','2018-08-06 06:33:59'),(15,1,'Mastering HTTP Caching','https://blog.fortrabbit.com/mastering-http-caching','eZZH1FVied.png','2018-08-06 06:34:37','2018-08-06 06:34:39'),(16,1,'Collection of ES6 goodies for next-level dev','https://melanieseltzer.github.io/es6-all-the-things/',NULL,'2018-08-06 06:53:50','2018-08-06 06:53:50'),(17,1,'What’s the difference between JavaScript and ECMAScript?','https://medium.freecodecamp.org/whats-the-difference-between-javascript-and-ecmascript-cba48c73a2b5',NULL,'2018-08-06 06:54:44','2018-08-06 06:54:44'),(18,1,'How to estimate how many website visitors your hosting can deal with','https://servebolt.com/calculate-how-many-simultaneous-website-visitors/','jZql5fDhGL.png','2018-08-06 06:55:57','2018-08-06 06:55:57'),(19,1,'Learn Enough JavaScript to Be Dangerous','https://www.learnenough.com/javascript-tutorial/javascript','IapUPXf789.ico','2018-08-06 06:56:51','2018-08-06 06:56:54'),(20,1,'How To Install the Apache Web Server on Ubuntu 18.04','https://www.digitalocean.com/community/tutorials/how-to-install-the-apache-web-server-on-ubuntu-18-04#step-5-%E2%80%94-setting-up-virtual-hosts-(recommended)','c018k5KvDG.ico','2018-08-06 07:00:59','2018-08-06 07:01:00'),(21,1,'Web Architecture 101','https://engineering.videoblocks.com/web-architecture-101-a3224e126947',NULL,'2018-08-06 07:02:04','2018-08-06 07:02:04'),(22,1,'REST API Design — Step By Step Guide','https://hackernoon.com/restful-api-design-step-by-step-guide-2f2c9f9fcdbf',NULL,'2018-08-06 07:03:34','2018-08-06 07:04:33'),(23,1,'How To Install MySQL on Ubuntu 18.04','https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-18-04','Dzpo8EjViX.ico','2018-08-06 07:05:08','2018-08-06 07:05:10'),(24,1,'Full-Text Search in MySQL 5.6','https://www.digitalocean.com/community/tutorials/how-to-improve-database-searches-with-full-text-search-in-mysql-5-6-on-ubuntu-16-04','hB8E9jw2mR.ico','2018-08-06 07:12:32','2018-08-07 17:40:04'),(25,1,'URL Rewriting for Beginners','https://www.addedbytes.com/blog/url-rewriting-for-beginners/','Pd54ufFsu3.ico','2018-08-06 07:14:41','2018-08-06 07:14:42'),(27,1,'Let\'s hand write DNS messages','https://routley.io/tech/2017/12/28/hand-writing-dns-messages.html',NULL,'2018-08-06 07:16:06','2018-08-06 07:16:06'),(28,1,'Software Security Wiki','https://www.owasp.org/index.php',NULL,'2018-08-06 07:17:22','2018-08-06 07:17:36'),(29,1,'Web Application Penetration Testing Cheat Sheet','https://jdow.io/blog/2018/03/18/web-application-penetration-testing-methodology/','p8qJbZgzQt.ico','2018-08-06 07:19:02','2018-08-06 07:19:03'),(30,1,'Apache V-Hosts on Ubuntu 16.04','https://www.digitalocean.com/community/tutorials/how-to-set-up-apache-virtual-hosts-on-ubuntu-16-04','cXcu9QLXHU.ico','2018-08-06 08:55:02','2018-08-06 12:50:44'),(31,1,'Data from connected CloudPets teddy bears leaked and ransomed','https://www.troyhunt.com/data-from-connected-cloudpets-teddy-bears-leaked-and-ransomed-exposing-kids-voice-messages/','nxU3ADeIIO.png','2018-08-06 09:25:06','2018-08-06 09:25:07'),(32,1,'Traits Explained (PHP)','https://daylerees.com/php-pandas-traits/','fRLCdg55Iu.ico','2018-08-06 12:25:53','2018-08-06 12:25:55'),(34,1,'Must Know About Unicode and Character Sets','https://www.joelonsoftware.com/2003/10/08/the-absolute-minimum-every-software-developer-absolutely-positively-must-know-about-unicode-and-character-sets-no-excuses/','EhTQG5ChDw.jpg','2018-08-06 16:40:49','2018-08-06 16:40:49'),(35,1,'Defensive programming  (PHP)','https://ocramius.github.io/extremely-defensive-php/','NlJeylj189.gif','2018-08-07 11:38:57','2018-08-07 11:39:03'),(36,1,'MySQL Full text search','https://www.w3resource.com/mysql/mysql-full-text-search-functions.php','xqMWracCyy.png','2018-08-07 15:31:42','2018-08-07 15:31:43'),(37,1,'User email verification and account activation in Laravel 5.6','https://www.5balloons.info/user-email-verification-and-account-activation-in-laravel-5-5/',NULL,'2018-08-07 15:33:45','2018-08-07 15:33:45'),(38,1,'PHP Roundtable Podcast','https://www.phproundtable.com/','vcY6ZjdP7W.ico','2018-08-07 15:35:02','2018-08-07 15:35:42'),(39,1,'PHP Web Development Podcast','https://mathewkimani.podbean.com/','qV3haWopRA.ico','2018-08-07 15:35:35','2018-08-07 15:35:38'),(40,1,'Troy Hunt Blog','https://www.troyhunt.com/','9dRvCoORij.png','2018-08-07 15:37:02','2018-08-07 15:37:02'),(41,1,'Null Byte','https://null-byte.wonderhowto.com/','QKSdKKMSW2.png','2018-08-07 15:38:53','2018-08-07 15:38:55'),(42,1,'Apache with Let\'s Encrypt on Ubuntu 18.04','https://www.digitalocean.com/community/tutorials/how-to-secure-apache-with-let-s-encrypt-on-ubuntu-18-04','mnZBvDnVEj.ico','2018-08-17 17:30:33','2018-08-17 17:30:33'),(43,1,'10 JavaScript concepts every Node.js programmer must master','https://www.infoworld.com/article/3196070/node-js/10-javascript-concepts-nodejs-programmers-must-master.html#tk.ifw-infsb','6jli15aXkN.ico','2018-08-17 17:55:12','2018-08-17 17:55:12'),(44,1,'Certified Ethical Hacker Boot Camp for 2018','https://jtdigital.teachable.com/p/certified-ethical-hacker/',NULL,'2018-08-17 17:56:24','2018-08-17 17:56:24'),(52,1,'Content Security Policy 101','https://christoph-rumpel.com/2018/03/content-security-policy-101','ppzWz1XYNM.png','2018-08-17 18:13:21','2018-08-17 18:13:21'),(53,1,'A comprehensive tutorial on cross-site scripting (XSS)','https://excess-xss.com/',NULL,'2018-08-17 18:16:26','2018-08-17 18:16:26'),(54,1,'Open port finder','https://www.yougetsignal.com/tools/open-ports/','Ew6ayLTkBt.ico','2018-08-17 18:17:04','2018-08-17 18:17:04'),(55,1,'Google directives','http://www.googleguide.com/print/adv_op_ref.pdf','ppoL96EPwq.ico','2018-08-17 18:21:22','2018-08-17 18:21:22'),(56,1,'What happens when you type google.com into your browser\'s address box and press enter?','https://github.com/alex/what-happens-when','hYNXf3JZkM.ico','2018-08-17 18:23:05','2018-08-17 18:23:05'),(57,1,'SQL Injection','https://www.owasp.org/index.php/SQL_Injection',NULL,'2018-08-17 18:24:37','2018-08-17 18:24:37'),(58,1,'The First Few Milliseconds of an HTTPS Connection','http://www.moserware.com/2009/06/first-few-milliseconds-of-https.html','ghfaFrePU4.ico','2018-08-17 18:26:10','2018-08-17 18:26:10'),(59,1,'What is HTTP/2 – The Ultimate Guide','https://kinsta.com/learn/what-is-http2/','gnRZ6sVxDi.png','2018-08-17 18:26:42','2018-08-17 18:26:42'),(60,1,'Hack This Site','https://www.hackthissite.org/','t6FsPdwuVt.ico','2018-08-17 18:31:06','2018-08-17 18:31:06'),(61,1,'Wargames','http://overthewire.org/wargames/','S1RmmK1XG5.ico','2018-08-17 18:33:05','2018-08-17 18:33:05'),(62,1,'RedTiger\'s Hackit','https://redtiger.labs.overthewire.org/','StsGFF0cEF.ico','2018-08-17 18:34:12','2018-08-17 18:34:12'),(63,1,'Editor for crontab schedule expressions','https://crontab.guru/','Ka36ahj6bq.ico','2018-08-17 18:35:47','2018-08-17 18:40:26'),(64,1,'JSON Editor','http://jsoneditoronline.org/','lNFMrOhA9W.ico','2018-08-17 18:36:12','2018-08-17 18:36:12'),(65,1,'Regex Tester','https://regexr.com/','pMQJbAYGAA.ico','2018-08-17 18:37:49','2018-08-17 18:37:49'),(66,1,'Secure Password & Keygen Generator','https://randomkeygen.com/','j8ahefPF4g.ico','2018-08-17 18:39:12','2018-08-17 18:39:12'),(67,1,'DNS & IP Lookup','https://dns-lookup.com/','ISROLriGDc.ico','2018-08-17 18:40:10','2018-08-17 18:40:10'),(68,1,'Learn how to design large-scale systems','https://github.com/donnemartin/system-design-primer','Tg6WEokTwT.ico','2018-08-17 18:55:30','2018-08-17 18:55:30'),(69,1,'Unminify JavaScript, CSS and HTML','https://unminify.com/','cdXWT41NA8.png','2018-08-20 11:04:04','2018-08-20 11:04:04'),(70,1,'Regex Cross­word','https://regexcrossword.com','d2rLqx6b9J.ico','2018-08-21 05:22:17','2018-08-21 05:22:17'),(71,1,'DSL Speed Test','http://speedtest.dslreports.com/',NULL,'2018-08-23 10:58:57','2018-08-23 10:58:57'),(72,1,'How I scaled a Fortnite website for a sudden peak','https://probablywrong.org/how-i-scaled-a-fortnite-website-for-a-sudden-peak-every-day-on-a-low-budget',NULL,'2018-09-02 14:17:49','2018-09-02 14:17:49'),(73,1,'In MySQL, never use “utf8”. Use “utf8mb4”.','https://medium.com/@adamhooper/in-mysql-never-use-utf8-use-utf8mb4-11761243e434','R9sY5IgvNn.ico','2018-09-02 14:38:06','2018-09-02 14:38:06'),(74,1,'Oh shit, git!','http://ohshitgit.com/','iqyJxD2xnr.ico','2018-09-02 14:57:43','2018-09-02 14:57:43'),(75,1,'Flexbox Froggy','https://flexboxfroggy.com/',NULL,'2018-09-02 15:00:15','2018-09-02 15:00:15'),(76,1,'Getting Started with React – An Overview and Walkthrough','https://www.taniarascia.com/getting-started-with-react/','0k4qoJIytz.ico','2018-09-02 15:01:05','2018-09-02 15:01:05'),(77,1,'Web technology for developers (MDN)','https://developer.mozilla.org/en-US/docs/Web',NULL,'2018-09-02 15:31:28','2018-09-02 15:31:46'),(78,1,'Regex: Everything You Need To Know','https://www.codepicky.com/regex/','oyjgfgM2DA.png','2018-09-02 16:25:46','2018-09-02 16:25:46'),(79,1,'Ultimate Tar Command Tutorial','https://www.thegeekstuff.com/2010/04/unix-tar-command-examples/','70RWupeiap.ico','2018-09-04 13:05:39','2018-09-04 13:05:39'),(80,1,'A successful Git branching model','https://nvie.com/posts/a-successful-git-branching-model/','zEoCFPAePc.ico','2018-09-04 13:37:26','2018-09-04 13:37:26'),(81,1,'How to Back Up and Restore a MySQL Database','http://webcheatsheet.com/sql/mysql_backup_restore.php','ZxBhzjvfJx.ico','2018-09-05 06:22:11','2018-09-05 06:22:11'),(82,1,'How To Use Find and Locate to Search for Files on Linux','https://www.digitalocean.com/community/tutorials/how-to-use-find-and-locate-to-search-for-files-on-a-linux-vps','2GsuwiNpxw.ico','2018-09-18 17:36:03','2018-09-18 17:36:43'),(83,1,'HTTP Header: Referrer Policy','https://scotthelme.co.uk/a-new-security-header-referrer-policy/','zRHBPd7WzL.ico','2018-09-19 13:21:31','2018-09-19 13:21:31'),(84,1,'Clickjack attack - X-Frame-Options','https://www.troyhunt.com/clickjack-attack-hidden-threat-right-in/','zzJg78a1uJ.png','2018-09-19 13:33:51','2018-09-19 13:33:51'),(85,1,'HSTS - The missing link in Transport Layer Security','https://scotthelme.co.uk/hsts-the-missing-link-in-tls/','0OXZ0E1VMH.ico','2018-09-19 13:39:41','2018-09-19 13:39:41'),(86,1,'How To Install Linux, Apache, MySQL, PHP (LAMP) stack on Ubuntu 18.04','https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-ubuntu-18-04','v1mxERL1rT.ico','2018-09-20 06:38:02','2018-09-20 06:38:02'),(87,1,'How To Install and Secure phpMyAdmin on Ubuntu 18.04','https://www.digitalocean.com/community/tutorials/how-to-install-and-secure-phpmyadmin-on-ubuntu-18-04','DR4Bu9UWUf.ico','2018-09-20 06:42:12','2018-09-20 06:42:12'),(88,1,'VirtualBox: Access Windows-host shared folders from Ubuntu-guest','http://www.giannistsakiris.com/2008/04/09/virtualbox-access-windows-host-shared-folders-from-ubuntu-guest/',NULL,'2018-09-20 13:05:36','2018-09-20 13:05:36'),(89,1,'How to Install Multiple PHP Version with Apache on Ubuntu 18.04','https://tecadmin.net/install-multiple-php-version-apache-ubuntu/','9lcSSBLjx8.png','2018-09-21 10:19:55','2018-09-21 10:19:55'),(90,1,'How to use Git efficiently','https://medium.freecodecamp.org/how-to-use-git-efficiently-54320a236369',NULL,'2018-09-27 05:20:59','2018-09-27 05:20:59'),(91,1,'Import big sql files','https://dba.stackexchange.com/questions/98814/mysql-dump-import-incredibly-slow-on-my-developers-machine','9cXn4kK5Bk.ico','2018-10-11 12:49:00','2018-10-11 12:49:00'),(92,1,'Laravel Eloquent Ecosystem','https://eloquentbyexample.com/',NULL,'2018-11-07 09:34:45','2018-11-07 09:34:45'),(93,1,'How does Git work?','https://medium.freecodecamp.org/how-not-to-be-afraid-of-git-anymore-fe1da7415286',NULL,'2018-11-30 10:55:09','2018-11-30 10:55:09'),(94,1,'Windows isos','https://tb.rg-adguard.net/public.php',NULL,'2018-12-06 20:26:02','2018-12-06 20:26:02'),(95,1,'DNS Aktualisierung einer Strato Domain mit dem Raspberry Pi','https://jansepke.blogspot.com/2014/08/dns-aktualisierung-einer-strato-domain.html','XzonCGkd9q.ico','2018-12-13 22:15:00','2018-12-13 22:15:00'),(96,1,'Show Git Branch In Terminal','https://www.shellhacks.com/show-git-branch-terminal-command-prompt/','p7loXGj66E.png','2018-12-14 18:37:11','2018-12-14 18:37:11'),(97,1,'Bash tips: Colors and formatting','https://misc.flogisoft.com/bash/tip_colors_and_formatting','5PMM1NVPNk.png','2018-12-14 18:37:54','2018-12-14 18:37:54');
/*!40000 ALTER TABLE `bookmarks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2018_07_29_115141_create_bookmarks_table',1),(4,'2018_07_31_184422_create_tags_table',1),(5,'2018_07_31_185042_create_bookmark_tag_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `text` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tags_text_unique` (`text`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'php','2018-08-06 05:28:58','2018-08-06 05:28:58'),(2,'composer','2018-08-06 05:29:48','2018-08-06 05:29:48'),(3,'logging','2018-08-06 05:30:33','2018-08-06 05:30:33'),(4,'design_patterns','2018-08-06 05:32:38','2018-08-06 05:32:38'),(5,'streaming','2018-08-06 05:33:44','2018-08-06 05:33:44'),(6,'pdo','2018-08-06 05:34:31','2018-08-06 05:34:31'),(8,'security','2018-08-06 05:55:38','2018-08-06 05:55:38'),(9,'guide','2018-08-06 06:30:39','2018-08-06 06:30:39'),(10,'docker','2018-08-06 06:33:29','2018-08-06 06:33:29'),(11,'javascript','2018-08-06 06:53:51','2018-08-06 06:53:51'),(12,'ecmascript','2018-08-06 06:53:51','2018-08-06 06:53:51'),(13,'hosting','2018-08-06 06:55:57','2018-08-06 06:55:57'),(14,'tutorial','2018-08-06 06:56:54','2018-08-06 06:56:54'),(15,'apache','2018-08-06 07:01:00','2018-08-06 07:01:00'),(16,'ubuntu','2018-08-06 07:01:00','2018-08-06 07:01:00'),(17,'architecture','2018-08-06 07:02:10','2018-08-06 07:02:10'),(18,'rest_api','2018-08-06 07:03:39','2018-08-06 07:03:39'),(19,'mysql','2018-08-06 07:05:10','2018-08-06 07:05:10'),(20,'dns','2018-08-06 07:16:07','2018-08-06 07:16:07'),(21,'penetration_testing','2018-08-06 07:19:03','2018-08-06 07:19:03'),(22,'laravel','2018-08-07 15:33:51','2018-08-07 15:33:51'),(23,'podcast','2018-08-07 15:35:05','2018-08-07 15:35:05'),(24,'blog','2018-08-07 15:37:02','2018-08-07 15:37:02'),(25,'node.js','2018-08-17 17:55:12','2018-08-17 17:55:12'),(26,'course','2018-08-17 17:56:24','2018-08-17 17:56:24'),(27,'http/s','2018-08-17 18:13:21','2018-08-17 18:13:21'),(28,'tool','2018-08-17 18:17:04','2018-08-17 18:17:04'),(29,'practice','2018-08-17 18:31:06','2018-08-17 18:31:06'),(30,'css','2018-09-02 15:00:15','2018-09-02 15:00:15'),(31,'cli','2018-09-04 13:05:39','2018-09-04 13:05:39'),(32,'git','2018-09-04 13:37:26','2018-09-04 13:37:26'),(33,'linux','2018-09-18 17:36:43','2018-09-18 17:36:43'),(34,'windows','2018-12-06 20:26:02','2018-12-06 20:26:02'),(35,'strato','2018-12-13 22:15:00','2018-12-13 22:15:00');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `text` (`text`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES (1,'this is a test string for searching'),(2,'a string story for searching in fulltext');
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  `verification_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'lee.peuker@gmail.com','$2y$10$6O2MYWFLADd9xw4IbE4pDuEENh50koHESe94U6MPa1JiSkRyycT6O',1,NULL,'uM0zg9GDwdwL3oDV4Jtld6nV3IyqfzhchmYzPC57BHDyIwnJPQCdSmZ9NRW5','2018-08-05 12:25:13','2018-08-05 12:25:29'),(2,0,'familie.peuker@web.de','$2y$10$IqlnOMVujgSaiLmgkpEVheKeonrS1kc8kXCfRw7diKAnvwX.R5Yeu',1,NULL,'MBIh47DAUUREekTGUbEqcr2WJQAepBzm57VvqtZTgiMT4E7qcBA3BfJkVssd','2018-08-07 17:49:27','2018-08-07 17:49:46');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-19 18:30:43
