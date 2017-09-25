-- phpMyAdmin SQL Dump
-- version 4.4.15.7
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1:3306
-- Время создания: Сен 25 2017 г., 13:17
-- Версия сервера: 5.5.50
-- Версия PHP: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `antagosoft`
--

-- --------------------------------------------------------

--
-- Структура таблицы `city`
--

CREATE TABLE IF NOT EXISTS `city` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `city`
--

INSERT INTO `city` (`id`, `name`) VALUES
(1, 'Dubai'),
(2, 'Abu-Dabi'),
(3, 'Al-Ain'),
(4, 'Fujairah');

-- --------------------------------------------------------

--
-- Структура таблицы `city_area`
--

CREATE TABLE IF NOT EXISTS `city_area` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `city_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `city_area`
--

INSERT INTO `city_area` (`id`, `name`, `city_id`) VALUES
(1, 'Downtown Dubai', 1),
(2, 'Deira', 1),
(3, 'Jumeira', 1),
(4, 'Downtown', 2),
(5, 'Madinat Zayed', 2),
(6, 'Al Jahili', 3),
(7, 'Jebel Hafeet', 3),
(8, 'Khor Fakkan', 4),
(9, 'Kalba', 4);

-- --------------------------------------------------------

--
-- Структура таблицы `main_info`
--

CREATE TABLE IF NOT EXISTS `main_info` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `city_id` int(11) NOT NULL,
  `area_id` int(11) NOT NULL,
  `street` varchar(50) NOT NULL,
  `house` int(11) NOT NULL,
  `additional` varchar(200) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `city_area`
--
ALTER TABLE `city_area`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `main_info`
--
ALTER TABLE `main_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `city_id` (`city_id`),
  ADD KEY `area_id` (`area_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `city`
--
ALTER TABLE `city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `city_area`
--
ALTER TABLE `city_area`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT для таблицы `main_info`
--
ALTER TABLE `main_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `main_info`
--
ALTER TABLE `main_info`
  ADD CONSTRAINT `foreign_area_id_key` FOREIGN KEY (`area_id`) REFERENCES `city_area` (`id`),
  ADD CONSTRAINT `foreign_city_id_key` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
