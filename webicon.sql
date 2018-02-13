-- phpMyAdmin SQL Dump
-- version 4.4.15.7
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1:3306
-- Время создания: Сен 26 2017 г., 15:32
-- Версия сервера: 5.7.13
-- Версия PHP: 7.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `webicon`
--

-- --------------------------------------------------------

--
-- Структура таблицы `articles`
--

CREATE TABLE IF NOT EXISTS `articles` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_desc_en` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc_en` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `views` int(11) NOT NULL,
  `tags` json NOT NULL,
  `category` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `articles`
--

INSERT INTO `articles` (`id`, `name`, `name_en`, `alias`, `short_desc`, `short_desc_en`, `desc`, `desc_en`, `img`, `views`, `tags`, `category`, `created_at`, `updated_at`) VALUES
(1, 'Добавляем на сайт лайки', 'We add to the site like Facebook, Facebook, Google+ and the Tweet button', 'Dobavljaem-na-sajt-lajki-Vkontakte-Facebook-Google-i-knopku-Tvitnut', 'Инструкция по установки на свой сайт кнопок like от популярных социальных сетей.', 'Instructions for installing buttons on your site like popular social networks.', 'Обычно все пользователи для этих целей используют готовые плагины, например отличный плагин Pluso, но он скорее для разшаривания чем для лайков и не всегда подходит.\r\n\r\nЕсли Вам нужны кнопки лайк то это то что нужно.\r\n\r\nИтак начнем, первым на очереди виджет Vkontakte.\r\n\r\nВиджет «Мне нравится» — Like Vkontakte на сайт\r\n\r\nДля размещения виджета like от Vkontakte на своем сайте заходим на эту страницу\r\n\r\nДля начала Вам нужно зарегистрировать свой сайт в виджетах Вконтакте. Выберите из выпадающего списка «подключить новый сайт» и заполните основные поля формы, затем нажмите сохранить. Вашему виджету присвоен id и теперь осталось только выбрать вид дизайна.\r\n\r\nНастраиваем внешний вид кнопки.  Выбираем вариант кнопки, ниже будет приведен пример Вашей кнопки, выбираем высоту кнопки и название.', 'Usually, all users use ready-made plug-ins for this purpose, such as the excellent Pluso plug-in, but it''s more for sharing than for the likes and not always suitable.\r\n\r\nIf you need buttons like that, then this is what you need.\r\n\r\nSo, let''s start, the Vkontakte widget is first on the queue.\r\n\r\nWidget "Like" - Like Vkontakte on the site\r\n\r\nTo place the like like from Vkontakte on your site go to this page\r\n\r\nFirst you need to register your site in the Vkontakte widget. Select "connect a new site" from the drop-down list and fill in the main fields of the form, then click save. Your widget has been assigned an id and now you only need to choose a design type.\r\n\r\nCustomize the appearance of the button. Choose the button option, below is an example of your button, choose the height of the button and the name.', 'case_1.jpg', 1, '["Иконки", "Социальные сети"]', 4, '2017-09-02 21:00:00', NULL),
(2, 'Добавляем на сайт лайки Вконтакте, Facebook, Google+ и кнопку Твитнуть2', 'We add to the site like Facebook, Facebook, Google+ and the Tweet button', 'Dobavljaem-na-sajt-lajki-Vkontakte-Facebook-Google-i-knopku-Tvitnut2', 'Эти цвета, определяют социальные сети в 2015 году. Если мы пропустили какие-нибудь соц сети, пожалуйста, сообщите нам об этом в комментариях. Ниже приведен список наиболее популярных социальных сетей и их цветовые гаммы.   Facebook Цветовая палитра (Hex и RGB)', 'Instructions for installing buttons on your site like popular social networks.', 'Обычно все пользователи для этих целей используют готовые плагины, например отличный плагин Pluso, но он скорее для разшаривания чем для лайков и не всегда подходит.\r\n\r\nЕсли Вам нужны кнопки лайк то это то что нужно.\r\n\r\nИтак начнем, первым на очереди виджет Vkontakte.\r\n\r\nВиджет «Мне нравится» — Like Vkontakte на сайт\r\n\r\nДля размещения виджета like от Vkontakte на своем сайте заходим на эту страницу\r\n\r\nДля начала Вам нужно зарегистрировать свой сайт в виджетах Вконтакте. Выберите из выпадающего списка «подключить новый сайт» и заполните основные поля формы, затем нажмите сохранить. Вашему виджету присвоен id и теперь осталось только выбрать вид дизайна.\r\n\r\nНастраиваем внешний вид кнопки.  Выбираем вариант кнопки, ниже будет приведен пример Вашей кнопки, выбираем высоту кнопки и название.', 'Usually, all users use ready-made plug-ins for this purpose, such as the excellent Pluso plug-in, but it''s more for sharing than for the likes and not always suitable.\r\n\r\nIf you need buttons like that, then this is what you need.\r\n\r\nSo, let''s start, the Vkontakte widget is first on the queue.\r\n\r\nWidget "Like" - Like Vkontakte on the site\r\n\r\nTo place the like like from Vkontakte on your site go to this page\r\n\r\nFirst you need to register your site in the Vkontakte widget. Select "connect a new site" from the drop-down list and fill in the main fields of the form, then click save. Your widget has been assigned an id and now you only need to choose a design type.\r\n\r\nCustomize the appearance of the button. Choose the button option, below is an example of your button, choose the height of the button and the name.', 'case_1.jpg', 2, '["Иконки", "Социальные сети"]', 5, '2017-09-10 21:00:00', NULL),
(3, 'Добавляем на сайт лайки Вконтакте, Facebook, Google+ и кнопку Твитнуть3', 'We add to the site like Facebook, Facebook, Google+ and the Tweet button', 'Dobavljaem-na-sajt-lajki-Vkontakte-Facebook-Google-i-knopku-Tvitnut3', 'Инструкция по установки на свой сайт кнопок like от популярных социальных сетей.', 'Instructions for installing buttons on your site like popular social networks.', 'Обычно все пользователи для этих целей используют готовые плагины, например отличный плагин Pluso, но он скорее для разшаривания чем для лайков и не всегда подходит.\r\n\r\nЕсли Вам нужны кнопки лайк то это то что нужно.\r\n\r\nИтак начнем, первым на очереди виджет Vkontakte.\r\n\r\nВиджет «Мне нравится» — Like Vkontakte на сайт\r\n\r\nДля размещения виджета like от Vkontakte на своем сайте заходим на эту страницу\r\n\r\nДля начала Вам нужно зарегистрировать свой сайт в виджетах Вконтакте. Выберите из выпадающего списка «подключить новый сайт» и заполните основные поля формы, затем нажмите сохранить. Вашему виджету присвоен id и теперь осталось только выбрать вид дизайна.\r\n\r\nНастраиваем внешний вид кнопки.  Выбираем вариант кнопки, ниже будет приведен пример Вашей кнопки, выбираем высоту кнопки и название.', 'Usually, all users use ready-made plug-ins for this purpose, such as the excellent Pluso plug-in, but it''s more for sharing than for the likes and not always suitable.\r\n\r\nIf you need buttons like that, then this is what you need.\r\n\r\nSo, let''s start, the Vkontakte widget is first on the queue.\r\n\r\nWidget "Like" - Like Vkontakte on the site\r\n\r\nTo place the like like from Vkontakte on your site go to this page\r\n\r\nFirst you need to register your site in the Vkontakte widget. Select "connect a new site" from the drop-down list and fill in the main fields of the form, then click save. Your widget has been assigned an id and now you only need to choose a design type.\r\n\r\nCustomize the appearance of the button. Choose the button option, below is an example of your button, choose the height of the button and the name.', 'case_1.jpg', 3, '["Иконки", "Социальные сети"]', 6, '2017-09-18 21:00:00', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `category_articles`
--

CREATE TABLE IF NOT EXISTS `category_articles` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `category_articles`
--

INSERT INTO `category_articles` (`id`, `name`, `name_en`, `alias`, `created_at`, `updated_at`) VALUES
(4, 'Программирование', 'Programming', 'programming', NULL, NULL),
(5, 'Дизайн', 'Design', 'design', NULL, NULL),
(6, 'Продвижение', 'Promotion', 'promotion', NULL, NULL),
(7, 'Новости', 'News', 'news', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `category_portfolios`
--

CREATE TABLE IF NOT EXISTS `category_portfolios` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `category_portfolios`
--

INSERT INTO `category_portfolios` (`id`, `name`, `name_en`, `created_at`, `updated_at`) VALUES
(1, 'Landing-page', 'Landing-page', NULL, NULL),
(2, 'Сайт визитка', 'Website card', NULL, NULL),
(3, 'Интернет магазин', 'Online shop', NULL, NULL),
(4, 'Портал', 'Portal', NULL, NULL),
(5, 'Другое', 'Other', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `clients`
--

CREATE TABLE IF NOT EXISTS `clients` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tell` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `client_orders`
--

CREATE TABLE IF NOT EXISTS `client_orders` (
  `id` int(10) unsigned NOT NULL,
  `id_client` int(10) unsigned NOT NULL,
  `id_order` int(10) unsigned NOT NULL,
  `status` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2017_09_18_083527_create_category_articles_table', 1),
(4, '2017_09_18_083552_create_articles_table', 1),
(5, '2017_09_18_083958_create_pages_table', 1),
(6, '2017_09_18_084038_create_orders_table', 1),
(7, '2017_09_18_084052_create_order_codes_table', 1),
(8, '2017_09_18_084359_create_clients_table', 1),
(9, '2017_09_18_084450_create_client_orders_table', 1),
(10, '2017_09_18_084530_create_category_portfolios_table', 1),
(11, '2017_09_18_084548_create_portfolios_table', 1),
(12, '2017_09_18_084621_create_services_table', 1),
(13, '2017_09_18_084646_create_reviews_table', 1),
(14, '2017_09_18_112913_create_status_orders_table', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tell` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `service` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `order_codes`
--

CREATE TABLE IF NOT EXISTS `order_codes` (
  `id` int(10) unsigned NOT NULL,
  `code` int(11) NOT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `pages`
--

CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc_en` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `portfolios`
--

CREATE TABLE IF NOT EXISTS `portfolios` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_desc_en` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc_en` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `views` int(11) NOT NULL,
  `category` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `portfolios`
--

INSERT INTO `portfolios` (`id`, `name`, `name_en`, `alias`, `short_desc`, `short_desc_en`, `desc`, `desc_en`, `img`, `link`, `views`, `category`, `created_at`, `updated_at`) VALUES
(1, 'Yesvisa.com.ua', 'Yesvisa.com.ua', 'yesvisa', 'Консультация по оформлению виз в европу и другие страны мира', 'Consultation on the issue of visas to Europe and other countries of the world', 'Описание ru', 'Описание en', 'case_1.jpg', 'http://yesvisa.com.ua', 1, 2, NULL, NULL),
(2, 'Push-Up', 'Push-Up', 'push-up', 'Консультация по оформлению виз в европу и другие страны мира', 'Consultation on the issue of visas to Europe and other countries of the world', 'Описание ru', 'Описание en', 'case_1.jpg', 'http://yesvisa.com.ua', 43, 1, NULL, NULL),
(3, 'Kitel', 'Kitel', 'kitel', 'Консультация по оформлению виз в европу и другие страны мира', 'Consultation on the issue of visas to Europe and other countries of the world', 'Описание ru', 'Описание en', 'case_1.jpg', 'http://yesvisa.com.ua', 1357, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `reviews`
--

CREATE TABLE IF NOT EXISTS `reviews` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_case` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `reviews`
--

INSERT INTO `reviews` (`id`, `name`, `type_case`, `avatar`, `desc`, `created_at`, `updated_at`) VALUES
(1, 'Александр Борисович', 'Владелец интернет магазина', 'avatar.jpg', '<p>Сделано всё отлично! Web-icon свою работу выполнил на 5+ постоянно поддерживали в курсе, сделали даже раньше чем было оговорено и задумано (тексты и фото есть но не в полном объёме).</p>\r\n<p>Рекомендую к сотрудничеству, буду сам обращаться.</p>', NULL, NULL),
(2, 'Bogdanka April', 'Владелец сайта-визитки', 'avatar.jpg', '<p>Спасибо за работу, все выполнено в соответствии с моими требованиями и в срок!</p>', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `services`
--

CREATE TABLE IF NOT EXISTS `services` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `service_list` json NOT NULL,
  `service_list_en` json NOT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc_en` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `form_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `form_title_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `form_pod_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `form_pod_title_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `services`
--

INSERT INTO `services` (`id`, `name`, `name_en`, `alias`, `service_list`, `service_list_en`, `desc`, `desc_en`, `form_title`, `form_title_en`, `form_pod_title`, `form_pod_title_en`, `created_at`, `updated_at`) VALUES
(3, 'Создание сайта', 'Website creation', 'website_creation', '["Индивидуальный дизайн", "Подключение систем статистики", "Кроссбраузерная верстка", "Формы обратной связи", "Формы обратной связи увеличиная"]', '["Individual design", "Connecting statistical systems", "Cross-browser layout", "Feedback forms", "Forms of feedback increased"]', 'Описание одной из услуг', 'Description of one of the services', 'Заказать разработку сайта', 'Order website development', 'Отправьте заказ на разработку сайта', 'Send an order for website development', NULL, NULL),
(4, 'Графический дизайн', 'Website creation 2', 'website_creation2', '["2Индивидуальный дизайн", "Подключение систем статистики", "Кроссбраузерная верстка", "Формы обратной связи", "Формы обратной связи увеличиная"]', '["2Individual design", "Connecting statistical systems", "Cross-browser layout", "Feedback forms", "Forms of feedback increased"]', 'Описание одной из услуг', 'Description of one of the services', '2Заказать разработку сайта', '2Order website development', 'Отправьте заказ на разработку сайта', 'Send an order for website development', NULL, NULL),
(5, 'Поддержка и развитие', 'Website creation 3', 'website_creation3', '["3Индивидуальный дизайн", "Подключение систем статистики", "Кроссбраузерная верстка", "Формы обратной связи", "Формы обратной связи увеличиная"]', '["3Individual design", "Connecting statistical systems", "Cross-browser layout", "Feedback forms", "Forms of feedback increased"]', 'Описание одной из услуг', 'Description of one of the services', '3Заказать разработку сайта', '3Order website development', 'Отправьте заказ на разработку сайта', 'Send an order for website development', NULL, NULL),
(6, 'Продвижение', 'Website creation 4', 'website_creation4', '["4Индивидуальный дизайн", "Подключение систем статистики", "Кроссбраузерная верстка", "Формы обратной связи", "Формы обратной связи увеличиная"]', '["4Individual design", "Connecting statistical systems", "Cross-browser layout", "Feedback forms", "Forms of feedback increased"]', 'Описание одной из услуг', 'Description of one of the services', '4Заказать разработку сайта', '4Order website development', 'Отправьте заказ на разработку сайта', 'Send an order for website development', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `status_orders`
--

CREATE TABLE IF NOT EXISTS `status_orders` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `articles_alias_unique` (`alias`),
  ADD KEY `articles_category_foreign` (`category`);

--
-- Индексы таблицы `category_articles`
--
ALTER TABLE `category_articles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_articles_alias_unique` (`alias`);

--
-- Индексы таблицы `category_portfolios`
--
ALTER TABLE `category_portfolios`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `client_orders`
--
ALTER TABLE `client_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_orders_id_client_foreign` (`id_client`),
  ADD KEY `client_orders_id_order_foreign` (`id_order`),
  ADD KEY `client_orders_status_foreign` (`status`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `order_codes`
--
ALTER TABLE `order_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_codes_order_id_foreign` (`order_id`);

--
-- Индексы таблицы `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_alias_unique` (`alias`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `portfolios`
--
ALTER TABLE `portfolios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `portfolios_alias_unique` (`alias`),
  ADD KEY `portfolios_category_foreign` (`category`);

--
-- Индексы таблицы `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `services_alias_unique` (`alias`);

--
-- Индексы таблицы `status_orders`
--
ALTER TABLE `status_orders`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `category_articles`
--
ALTER TABLE `category_articles`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT для таблицы `category_portfolios`
--
ALTER TABLE `category_portfolios`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT для таблицы `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `client_orders`
--
ALTER TABLE `client_orders`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `order_codes`
--
ALTER TABLE `order_codes`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `portfolios`
--
ALTER TABLE `portfolios`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `services`
--
ALTER TABLE `services`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблицы `status_orders`
--
ALTER TABLE `status_orders`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `articles_category_foreign` FOREIGN KEY (`category`) REFERENCES `category_articles` (`id`);

--
-- Ограничения внешнего ключа таблицы `client_orders`
--
ALTER TABLE `client_orders`
  ADD CONSTRAINT `client_orders_id_client_foreign` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id`),
  ADD CONSTRAINT `client_orders_id_order_foreign` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `client_orders_status_foreign` FOREIGN KEY (`status`) REFERENCES `status_orders` (`id`);

--
-- Ограничения внешнего ключа таблицы `order_codes`
--
ALTER TABLE `order_codes`
  ADD CONSTRAINT `order_codes_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Ограничения внешнего ключа таблицы `portfolios`
--
ALTER TABLE `portfolios`
  ADD CONSTRAINT `portfolios_category_foreign` FOREIGN KEY (`category`) REFERENCES `category_portfolios` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
