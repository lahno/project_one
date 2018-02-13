-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Фев 13 2018 г., 08:06
-- Версия сервера: 5.7.20
-- Версия PHP: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
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

CREATE TABLE `articles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_desc` text COLLATE utf8mb4_unicode_ci,
  `desc` longtext CHARACTER SET utf8mb4,
  `img` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `views` int(11) NOT NULL DEFAULT '0',
  `tags` json NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `status` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `articles`
--

INSERT INTO `articles` (`id`, `name`, `alias`, `short_desc`, `desc`, `img`, `views`, `tags`, `category_id`, `status`, `created_at`, `updated_at`, `seo_title`, `seo_description`) VALUES
(1, 'Как перенести WordPress на новый домен?', 'kak_perenesti_wordPress_na_novyy_domen', 'Приветствую тебя, дорогой читатель. Сегодня мы решили разместить краткое руководство по переносу Вашего сайта на CMS WordPress.', '<h3>Если Вам нужно перенести сайт и после этого изменится его адрес, то Вам суда!</h3>\r\n\r\n<h4>Итак что-же нам нужно сделать:</h4>\r\n\r\n<ol>\r\n	<li>Зайдите в <strong>phpMyAdmin</strong> и выберите базу данных вашего сайта<img alt=\"\" height=\"445\" src=\"/images_admin/5a79a30025e55.png\" width=\"935\" /></li>\r\n	<li>Нажмите на вкладку &quot;<strong>SQL</strong>&quot;&nbsp;и выполните следующий запрос, заменив старое имя домена&nbsp;на новое (обратите внимание, что в конце адреса не должно быть слеша, а протокол должен быть <strong>http</strong>, а не <strong>httpS</strong> ):\r\n	<pre>\r\n<code class=\"language-sql\">UPDATE wp_options SET option_value = REPLACE(option_value, \'http://старый_домен.com\', \'http://новый_домен.com\') WHERE option_name = \'home\' OR option_name = \'siteurl\';</code></pre>\r\n\r\n	<p><img alt=\"\" height=\"445\" src=\"/images_admin/5a79a30981bd9.png\" width=\"935\" /></p>\r\n	</li>\r\n	<li>Зайдите в админ-панель Вашего сайта на страницу &quot;<strong>Настройки - Общие</strong>&quot;.</li>\r\n	<li>В полях &quot;<strong>Адрес WordPress</strong>&quot; и &quot;<strong>Адрес блога</strong>&quot; укажите URL нового домена и подтвердите изменения, нажав на кнопку &quot;<strong>Обновить опции</strong>&quot;.</li>\r\n	<li>Если выполнить п.3-4 нет возможности, то поочередно выполните следующие два запроса, заменив http://старый_домен.com на новый адреса сайта (обратите внимание, что в конце адреса не должно быть слеша (знака &quot;/&quot;):\r\n	<pre>\r\n<code class=\"language-sql\">UPDATE wp_posts SET guid = REPLACE(guid, \'http://старый_домен.com\', \'http://новый_домен.com\');\r\nUPDATE wp_posts SET post_content = REPLACE(post_content, \'http://старый_домен.com\', \'http://новый_домен.com\');</code></pre>\r\n	</li>\r\n</ol>\r\n\r\n<p>Если старый или новый WordPress находится не в корне сайта, а в его папке (примером blog), то обязательно в файле <code>.htaccess</code> указать путь к папке:</p>\r\n\r\n<pre>\r\n<code class=\"language-http\">&lt;IfModule mod_rewrite.c&gt;\r\nRewriteEngine On\r\nRewriteBase /blog/\r\nRewriteRule ^index\\.php$ - [L]\r\nRewriteCond %{REQUEST_FILENAME} !-f\r\nRewriteCond %{REQUEST_FILENAME} !-d\r\nRewriteRule . /blog/index.php [L]\r\n&lt;/IfModule&gt;</code></pre>\r\n\r\n<p>На этом пожалуй все что касается переноса WordPress на новый домен. Спасибо что дочитали, до скорых встреч. ;-)</p>', 'img/uploads/articles/393c02826ac839f5a07131f10a6f3085.png', 1, '{\"tag_1\": \"CMS\", \"tag_2\": \"phpMyAdmin\", \"tag_3\": \"SQL\", \"tag_4\": \"WordPress\"}', 2, 'yes', '2015-02-05 00:00:00', '2018-02-11 22:27:44', 'Как перенести WordPress', NULL),
(2, 'Цвета социальных сетей - Hex и RGB', 'tsveta_sotsialnykh_setey_Hex_RGB', 'Эти цвета, определяют социальные сети в 2015 году. Если мы пропустили какие-нибудь соц сети, пожалуйста, сообщите нам об этом в комментариях.', '<h3>Ниже приведен список наиболее популярных социальных сетей и их цветовые гаммы.</h3>\r\n\r\n<h4>&nbsp;</h4>\r\n\r\n<h4>Facebook Цветовая палитра (Hex и RGB)</h4>\r\n\r\n<p><img alt=\"\" height=\"75\" src=\"/images_admin/article_img/5a8017c813245.png\" style=\"float:left\" width=\"100\" /></p>\r\n\r\n<p><strong>Facebook Blue</strong><br />\r\nHex: #3b5998<br />\r\nRGB: 59, 89, 152</p>\r\n\r\n<p><img alt=\"\" height=\"75\" src=\"/images_admin/article_img/5a8018345e7b9.png\" style=\"float:left\" width=\"100\" /><strong>Facebook Medium Blue</strong><br />\r\nHex: #6d84b4<br />\r\nRGB:&nbsp;109, 132, 180</p>\r\n\r\n<p><img alt=\"\" height=\"75\" src=\"/images_admin/article_img/5a80184ee32d3.png\" style=\"float:left\" width=\"100\" /><strong>Facebook Lighter Blue</strong><br />\r\nHex: #afbdd4<br />\r\nRGB:&nbsp;175, 189, 212</p>\r\n\r\n<p><img alt=\"\" height=\"75\" src=\"/images_admin/article_img/5a801871bfeeb.png\" style=\"float:left\" width=\"100\" /><strong>Facebook Lightest Blue</strong><br />\r\nHex: #d8dfea<br />\r\nRGB:&nbsp;216, 223, 234</p>\r\n\r\n<p><img alt=\"\" height=\"75\" src=\"/images_admin/article_img/5a80189f183a5.png\" style=\"float:left\" width=\"100\" /><strong>White</strong><br />\r\nHex: #ffffff<br />\r\nRGB:&nbsp;255, 255, 255</p>\r\n\r\n<h4>&nbsp;</h4>\r\n\r\n<h4>Twitter&nbsp;Цветовая палитра (Hex и RGB)</h4>\r\n\r\n<p><img alt=\"\" height=\"75\" src=\"/images_admin/article_img/5a801ecdb78bd.png\" style=\"float:left\" width=\"100\" /><strong>Twitter Dark Blue</strong><br />\r\nHex: #0084b4<br />\r\nRGB: 0, 132, 180</p>\r\n\r\n<p><img alt=\"\" height=\"75\" src=\"/images_admin/article_img/5a801ee085bfe.png\" style=\"float:left\" width=\"100\" /><strong>Twitter Logo Blue</strong><br />\r\nHex: #00aced<br />\r\nRGB: 0, 172, 237</p>\r\n\r\n<p><img alt=\"\" height=\"75\" src=\"/images_admin/article_img/5a801efd8c100.png\" style=\"float:left\" width=\"100\" /><strong>Twitter Verified Blue</strong><br />\r\nHex: #1dcaff<br />\r\nRGB:&nbsp;29, 202, 255</p>\r\n\r\n<p><img alt=\"\" height=\"75\" src=\"/images_admin/article_img/5a801f18c81db.png\" style=\"float:left\" width=\"100\" /><strong>Twitter Background Blue</strong><br />\r\nHex: #c0deed<br />\r\nRGB:&nbsp;192, 222, 237</p>\r\n\r\n<p><img alt=\"\" height=\"75\" src=\"/images_admin/article_img/5a801f2c2464b.png\" style=\"float:left\" width=\"100\" /><strong>White</strong><br />\r\nHex: #ffffff<br />\r\nRGB:&nbsp;255, 255, 255</p>\r\n\r\n<h4>&nbsp;</h4>\r\n\r\n<h4>Vimeo&nbsp;Цветовая палитра (Hex и RGB)</h4>\r\n\r\n<p><img alt=\"\" height=\"75\" src=\"/images_admin/article_img/5a801f54d8be1.png\" style=\"float:left\" width=\"100\" /><strong>Vimeo Blue</strong><br />\r\nHex: #45bbff<br />\r\nRGB: 69, 187, 255</p>\r\n\r\n<p><img alt=\"\" height=\"75\" src=\"/images_admin/article_img/5a801f6ba7487.png\" style=\"float:left\" width=\"100\" /><strong>Vimeo Sky Blue</strong><br />\r\nHex: #90d5ec<br />\r\nRGB: 144, 213, 236</p>\r\n\r\n<p><img alt=\"\" height=\"75\" src=\"/images_admin/article_img/5a801f7fef2a0.png\" style=\"float:left\" width=\"100\" /><strong>Vimeo Powder Blue</strong><br />\r\nHex: #d1eef7<br />\r\nRGB:&nbsp;209, 238, 247</p>\r\n\r\n<p><img alt=\"\" height=\"75\" src=\"/images_admin/article_img/5a801f95df3f4.png\" style=\"float:left\" width=\"100\" /><strong>Vimeo Purple</strong><br />\r\nHex: #c09eda<br />\r\nRGB:&nbsp;192, 158, 218</p>\r\n\r\n<p><img alt=\"\" height=\"75\" src=\"/images_admin/article_img/5a801fae132d4.png\" style=\"float:left\" width=\"100\" /><strong>Vimeo Green</strong><br />\r\nHex: #aad450<br />\r\nRGB:&nbsp;170, 212, 80</p>\r\n\r\n<p><img alt=\"\" height=\"75\" src=\"/images_admin/article_img/5a801fc337102.png\" style=\"float:left\" width=\"100\" /><strong>Vimeo Yellow</strong><br />\r\nHex: #f7b42c<br />\r\nRGB:&nbsp;247, 180, 44</p>\r\n\r\n<p><img alt=\"\" height=\"75\" src=\"/images_admin/article_img/5a801fd31a30d.png\" style=\"float:left\" width=\"100\" /><strong>Vimeo Orange</strong><br />\r\nHex: #ff8a3c<br />\r\nRGB:&nbsp;255, 138, 60</p>\r\n\r\n<p><img alt=\"\" height=\"75\" src=\"/images_admin/article_img/5a801fe2f4013.png\" style=\"float:left\" width=\"100\" /><strong>Vimeo Red</strong><br />\r\nHex: #fc575e<br />\r\nRGB:&nbsp;252, 87, 94</p>\r\n\r\n<p><img alt=\"\" height=\"75\" src=\"/images_admin/article_img/5a801ff315c1c.png\" style=\"float:left\" width=\"100\" /><strong>Vimeo Pink</strong><br />\r\nHex: #f27490<br />\r\nRGB: 242, 116, 144</p>\r\n\r\n<p><img alt=\"\" height=\"75\" src=\"/images_admin/article_img/5a8020043053d.png\" style=\"float:left\" width=\"100\" /><strong>Vimeo Magenta</strong><br />\r\nHex: #f49ac1<br />\r\nRGB:&nbsp;244, 154, 193</p>\r\n\r\n<p><img alt=\"\" height=\"75\" src=\"/images_admin/article_img/5a802013bf9e0.png\" style=\"float:left\" width=\"100\" /><strong>Vimeo Brown</strong><br />\r\nHex: #ccaa55<br />\r\nRGB:&nbsp;204, 170, 85</p>\r\n\r\n<p><img alt=\"\" height=\"75\" src=\"/images_admin/article_img/5a8020295e96a.png\" style=\"float:left\" width=\"100\" /><strong>Vimeo Gray</strong><br />\r\nHex: #99aabb<br />\r\nRGB:&nbsp;153, 170, 187</p>\r\n\r\n<p><img alt=\"\" height=\"75\" src=\"/images_admin/article_img/5a80203816cf8.png\" style=\"float:left\" width=\"100\" /><strong>Vimeo Mint</strong><br />\r\nHex: #66cc99<br />\r\nRGB: 102, 204, 153</p>\r\n\r\n<h4>&nbsp;</h4>\r\n\r\n<h4>Google+&nbsp;Цветовая палитра (Hex и RGB)</h4>\r\n\r\n<p><img alt=\"\" height=\"75\" src=\"/images_admin/article_img/5a80206e5c72a.png\" style=\"float:left\" width=\"100\" /><strong>Google+ Red</strong><br />\r\nHex: #dd4b39<br />\r\nRGB: 221, 75, 57</p>\r\n\r\n<h4>&nbsp;</h4>\r\n\r\n<h4>YouTube&nbsp;Цветовая палитра (Hex и RGB)</h4>\r\n\r\n<p><img alt=\"\" height=\"75\" src=\"/images_admin/article_img/5a8020844cf61.png\" style=\"float:left\" width=\"100\" /><strong>YouTube Red</strong><br />\r\nHex: #bb0000<br />\r\nRGB: 187, 0, 0</p>\r\n\r\n<h4>&nbsp;</h4>\r\n\r\n<h4>Instagram&nbsp;Цветовая палитра (Hex и RGB)</h4>\r\n\r\n<p><img alt=\"\" height=\"75\" src=\"/images_admin/article_img/5a80209d45ff5.png\" style=\"float:left\" width=\"100\" /><strong>Instagram Blue</strong><br />\r\nHex: #517fa4<br />\r\nRGB: 81, 127, 164</p>\r\n\r\n<h4>&nbsp;</h4>\r\n\r\n<h4>Vkontakte&nbsp;Цветовая палитра (Hex и RGB)</h4>\r\n\r\n<p><img alt=\"\" height=\"75\" src=\"/images_admin/article_img/5a8020afd0c97.png\" style=\"float:left\" width=\"100\" /><strong>VK Blue</strong><br />\r\nHex: #507299<br />\r\nRGB: 80, 114, 153</p>\r\n\r\n<h4>&nbsp;</h4>\r\n\r\n<h4>Tumblr&nbsp;Цветовая палитра (Hex и RGB)</h4>\r\n\r\n<p><img alt=\"\" height=\"75\" src=\"/images_admin/article_img/5a8020c50b4cd.png\" style=\"float:left\" width=\"100\" /><strong>Tumblr Dark Turquoise</strong><br />\r\nHex: #32506d<br />\r\nRGB: 50, 80, 109</p>', 'img/uploads/articles/3f808b3fab3ba43cdf1c4854070bd863.png', 33, '{\"tag_1\": \"web-дизайн\"}', 1, 'yes', '2015-02-09 00:00:00', '2018-02-11 12:56:11', 'Цвета социальных сетей', 'Эти цвета, определяют социальную сеть в 2015 году.'),
(3, 'Добавляем на сайт лайки Вконтакте, Facebook, Google+ и кнопку Твитнуть', 'dobavlyayem_na_sayt_layki_Vkontakte_Facebook_Google_i_knopku_Tvitnut', 'Инструкция по установки на свой сайт кнопок like от популярных социальных сетей.\r\nОбычно все пользователи для этих целей используют готовые плагины, например отличный плагин Pluso, но он скорее для разшаривания чем для лайков и не всегда подходит.', '<h3>Если Вам нужны кнопки лайк то это то что нужно.</h3>\r\n\r\n<p>Итак начнем, первым на очереди виджет Vkontakte.</p>\r\n\r\n<h4>&nbsp;</h4>\r\n\r\n<h4>Виджет &laquo;Мне нравится&raquo; &mdash; Like&nbsp;Vkontakte на сайт</h4>\r\n\r\n<p>Для размещения&nbsp;виджета like от Vkontakte на своем сайте заходим <a href=\"http://vk.com/dev/Like\" rel=\"nofollow noopener\" target=\"_blank\">на эту страницу</a></p>\r\n\r\n<p>Для начала Вам нужно зарегистрировать свой сайт в виджетах Вконтакте. Выберите из выпадающего списка &quot;подключить новый сайт&quot; и заполните основные поля формы, затем нажмите сохранить. Вашему виджету присвоен id и теперь осталось только выбрать вид дизайна.</p>\r\n\r\n<p>Настраиваем внешний вид кнопки. &nbsp;Выбираем вариант кнопки, ниже&nbsp;будет приведен&nbsp;пример Вашей&nbsp;кнопки, выбираем высоту кнопки и название.</p>\r\n\r\n<p><img alt=\"\" height=\"500\" src=\"/images_admin/article_img/5a802405820c6.png\" width=\"475\" /></p>\r\n\r\n<p>Когда выбран дизайн можно копировать код для вставки на сайт.</p>\r\n\r\n<p>Vkontakte генерирует два &quot;куска&quot; кода для виджета, первый что-то похожее:</p>\r\n\r\n<pre>\r\n<code class=\"language-javascript\">&lt;!-- Put this script tag to the &lt;head&gt; of your page --&gt;\r\n&lt;script type=\"text/javascript\" src=\"//vk.com/js/api/openapi.js?116\"&gt;&lt;/script&gt;\r\n\r\n&lt;script type=\"text/javascript\"&gt;\r\n  VK.init({apiId: 4762775, onlyWidgets: true});\r\n&lt;/script&gt;</code></pre>\r\n\r\n<p>Вставляем перед закрывающим тегом <code>&lt;/head&gt;</code>.</p>\r\n\r\n<p>Он подключит скрипт JavaScript Vkontakte и активирует именно Ваш виджет(зарегистрирован для сайта который поодключали&nbsp;ранее).</p>\r\n\r\n<blockquote>\r\n<p><strong>Важно!</strong> Если Вы уже&nbsp;добавляли на сайт виджет/ты&nbsp;Вконтакте, то этот код у Вас уже будет сайте, повторно&nbsp;его размещать&nbsp;не нужно.</p>\r\n</blockquote>\r\n\r\n<p>Второй &quot;кусок&quot; кода, что-то похожее:</p>\r\n\r\n<pre>\r\n<code class=\"language-javascript\">&lt;!-- Put this div tag to the place, where the Like block will be --&gt;\r\n&lt;div id=\"vk_like\"&gt;&lt;/div&gt;\r\n&lt;script type=\"text/javascript\"&gt;\r\nVK.Widgets.Like(\"vk_like\", {type: \"button\"});\r\n&lt;/script&gt;</code></pre>\r\n\r\n<p>Вставляем в том месте где должна размещаться сама кнопка.</p>\r\n\r\n<h4>&nbsp;</h4>\r\n\r\n<h4>Like от&nbsp;Facebook</h4>\r\n\r\n<p>Заходим&nbsp;<a href=\"https://developers.facebook.com/docs/plugins/like-button\" rel=\"nofollow noopener\" target=\"_blank\">на эту страницу</a>.</p>\r\n\r\n<p>Все практически аналогично Vkontakte.<br />\r\n<strong>URL to Like</strong> &mdash; Адрес страницы.<br />\r\n<strong>Width</strong> &mdash; Ширина кнопки, можно оставить пустой.<br />\r\n<strong>Layout</strong> &mdash; Шаблон для кнопки, может быть <code><em>standard</em></code> &mdash; кнопка с текстом, <code><em>box-count</em></code> &mdash; кнопка и счетчик сверху, <code><em>button-count</em></code> &mdash; кнопка и счетчик справа (Наш Вариант!), и <code><em>button</em></code> &mdash; просто кнопка.<br />\r\n<strong>Show Friends&rsquo; Faces</strong> &mdash; чекбокс, если отметить, то под кнопкой будут выводиться фото друзей, которые уже поставили лайк&nbsp;страничке.<br />\r\n<strong>Include Share Button</strong> &mdash; чекбокс, если отмечен, то возле кнопки &laquo;Нравится&raquo; будет выводиться кнопка &laquo;Поделиться&raquo;.<br />\r\nВсе время внизу настроек выводиться&nbsp;Ваша&nbsp;кнопка как пример.</p>\r\n\r\n<p><img alt=\"\" height=\"368\" src=\"/images_admin/article_img/5a8024909869c.png\" width=\"731\" /></p>\r\n\r\n<p>Нажимаем кнопку &laquo;Get Code&raquo; &mdash; появится окно с Вашим кодом:</p>\r\n\r\n<p><img alt=\"\" height=\"500\" src=\"/images_admin/article_img/5a8024a4162bc.png\" width=\"658\" /></p>\r\n\r\n<p>В этом окне можно выбрать вариант кода (HTML5, XFBML, IFRAME или Адрес), обычно ставят стандартный код <strong>HTML5</strong>.</p>\r\n\r\n<p>Facebook тоже генерирует два &quot;куска&quot; кода, первый нужно вставить после открывающего тега <code>&lt;body&gt;</code>. Вот как он примерно выглядит:</p>\r\n\r\n<pre>\r\n<code class=\"language-javascript\">&lt;div id=\"fb-root\"&gt;&lt;/div&gt;\r\n&lt;script&gt;(function(d, s, id) {\r\n  var js, fjs = d.getElementsByTagName(s)[0];\r\n  if (d.getElementById(id)) return;\r\n  js = d.createElement(s); js.id = id;\r\n  js.src = \"//connect.facebook.net/ru_RU/sdk.js#xfbml=1&amp;version=v2.0\";\r\n  fjs.parentNode.insertBefore(js, fjs);\r\n}(document, \'script\', \'facebook-jssdk\'));&lt;/script&gt;</code></pre>\r\n\r\n<blockquote>\r\n<p><strong>Важно!</strong> Если Вы уже&nbsp;добавляли на сайт виджеты Facebook, то этот код у Вас уже будет на сайте, дважды его размещать&nbsp;не нужно.</p>\r\n</blockquote>\r\n\r\n<p>Второй-же &quot;кусок&quot; кода вставляем в том месте где должна размещаться сама кнопка like</p>\r\n\r\n<pre>\r\n<code class=\"language-html\">&lt;div class=\"fb-like\" data-href=\"http://web-icon.com.ua/\" data-layout=\"button_count\" data-action=\"like\" data-show-faces=\"false\" data-share=\"false\"&gt;&lt;/div&gt;</code></pre>\r\n\r\n<blockquote>\r\n<p><strong>Важно знать! </strong>Если вы копируете виджет Facebook на другой сайт, не забываете изменить параметр&nbsp;<code>data-href<strong>=&quot;</strong><em>новый сайт</em></code><strong><code>&quot;</code>. </strong>Можно использовать теги CMS при передаче этого параметра.</p>\r\n</blockquote>\r\n\r\n<h4>&nbsp;</h4>\r\n\r\n<h4>Создаем кнопку Tweet или Твитнуть</h4>\r\n\r\n<p>Страница настройки виджета находится&nbsp;<a href=\"https://dev.twitter.com/docs/tweet-button\" rel=\"noopener\" target=\"_blank\">на этой странице</a>.</p>\r\n\r\n<p>На этой странице <code>https://dev.twitter.com/docs/tweet-button</code> размещена&nbsp;вся документация по настройке.</p>\r\n\r\n<p>Код необходимо вставить&nbsp;в место вывода самой кнопки like.</p>\r\n\r\n<p><strong>Варианты кнопки&nbsp;Tweet Button</strong></p>\r\n\r\n<p>Стандартная кнопка:</p>\r\n\r\n<pre>\r\n<code class=\"language-html\">&lt;a href=\"https://twitter.com/share\" class=\"twitter-share-button\" data-lang=\"en\"&gt;Tweet&lt;/a&gt;\r\n&lt;script&gt;!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=\"https://platform.twitter.com/widgets.js\";fjs.parentNode.insertBefore(js,fjs);}}(document,\"script\",\"twitter-wjs\");&lt;/script&gt;</code></pre>\r\n\r\n<p>Вертикальная кнопка с большим счетчиком вверху:</p>\r\n\r\n<pre>\r\n<code class=\"language-html\">&lt;a href=\"https://twitter.com/share\" class=\"twitter-share-button\" data-related=\"jasoncosta\" data-lang=\"en\" data-count=\"vertical\"&gt;Tweet&lt;/a&gt;\r\n&lt;script&gt;!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=\"https://platform.twitter.com/widgets.js\";fjs.parentNode.insertBefore(js,fjs);}}(document,\"script\",\"twitter-wjs\");&lt;/script&gt;</code></pre>\r\n\r\n<p>Большая кнопка без счетчика:</p>\r\n\r\n<pre>\r\n<code class=\"language-html\">&lt;a href=\"https://twitter.com/share\" class=\"twitter-share-button\" data-related=\"jasoncosta\" data-lang=\"en\" data-size=\"large\" data-count=\"none\"&gt;Tweet&lt;/a&gt;\r\n&lt;script&gt;!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=\"https://platform.twitter.com/widgets.js\";fjs.parentNode.insertBefore(js,fjs);}}(document,\"script\",\"twitter-wjs\");&lt;/script&gt;</code></pre>\r\n\r\n<h4>&nbsp;</h4>\r\n\r\n<h4>Создаем кнопку&nbsp;Google+</h4>\r\n\r\n<p>Перейдите на <a href=\"https://developers.google.com/+/web/+1button/?hl=ru\" rel=\"nofollow noopener\" target=\"_blank\">страницу для настройки виджета Google+</a></p>\r\n\r\n<p><img alt=\"\" height=\"490\" src=\"/images_admin/article_img/5a8025d8563bb.png\" width=\"935\" /></p>\r\n\r\n<p>Гугл сделал все еще проще, Вам нужно только выбрать несколько параметров:</p>\r\n\r\n<p><strong>Размер</strong>: <code>small</code>, <code>medium</code>, <code>standard</code> и <code>tall</code> (Внешний вид также отображается справа от полей настроек). Выбираем - <strong>medium</strong></p>\r\n\r\n<p><strong>Примечание</strong>: встроенное, всплывающее и нет. Это дополнительный текст возле кнопки, который выводит &quot;+103559988 Рекомендовать в Google&quot;. Выбираем - <strong>нет</strong></p>\r\n\r\n<p><strong>Язык</strong>: Здесь все понятно, это язык всплывающих подсказок</p>\r\n\r\n<p><strong>Расширенные настройки</strong> позволяют выбрать вид кнопки, когда именно выполнять код кнопки, добавить функции JavaScript и определение URL которому пользователь ставит like.</p>\r\n\r\n<p>Не выставляем эти параметры, оставим все по дефолту.</p>\r\n\r\n<p>Получаем код в поле под примером внешнего вида:</p>\r\n\r\n<pre>\r\n<code class=\"language-html\">&lt;!-- Вставьте этот тег в заголовке страницы или непосредственно перед закрывающим тегом основной части. --&gt;\r\n&lt;script src=\"https://apis.google.com/js/platform.js\" async defer&gt;\r\n  {lang: \'ru\'}\r\n&lt;/script&gt;\r\n\r\n&lt;!-- Поместите этот тег туда, где должна отображаться кнопка +1. --&gt;\r\n&lt;div class=\"g-plusone\" data-size=\"medium\" data-annotation=\"none\"&gt;&lt;/div&gt;</code></pre>\r\n\r\n<p>Так-же как с виджетами Facebook и Vkontakte имеем два &quot;куска&quot;. Первый в привычное место перед закрывающим тегом&nbsp;<code>&lt;/head&gt;</code>.</p>\r\n\r\n<p>Второй-же в то место где должна выводится кнопка Google+1</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>P.S. </strong>После размещения всего этого хозяйства на своем сайте, скорее всего будет желание как-то все облагородить. Привожу простой код CSS который нужно вставить в ваш файл стилей:</p>\r\n\r\n<pre>\r\n<code class=\"language-css\">#vk_like, .fb-like, .twitter-share-button, #___plusone_0{\r\n    display:inline-block;\r\n    vertical-align:top;\r\n}\r\n \r\n.fb-like{\r\n    margin-right:15px;\r\n}</code></pre>\r\n\r\n<p>На этом пожалуй все, если есть вопросы или предложения - оставляйте в комментариях. Спасибо за внимание :)</p>', 'img/uploads/articles/2006e12ae197774dfb9a9dceaabfd5a8.jpg', 23, '{\"tag_1\": \"css\", \"tag_2\": \"html\", \"tag_3\": \"JavaScript\"}', 2, 'yes', '2015-02-12 00:00:00', '2018-02-11 13:47:38', 'Как разместить на сайте лайки Вконтакте, Facebook, Google+ и кнопку Твитнуть', 'Инструкция по установки на свой сайт кнопок like от популярных социальных сетей.'),
(4, 'Симантическая микроразметка (Schema.org)', 'simanticheskaya_mikrorazmetka_Schema.org', 'Семантическая микроразметка – это новая эра в оптимизации сайтов, которая рассчитана прежде всего на поисковые системы.  Микроразметка Sсhema.org используется все активнее многими разработчиками сайтов. Стоит освоить ее использование и применить к своему сайту, чтобы  страницы сайта лучше индексировались ПС и попадали в поисковой выдаче на высокие позиции.', '<h3>Что может микроразметка.</h3>\r\n\r\n<p><strong>Sсhema.org</strong> представляет собой разметку, дающую возможность подавать информацию поисковым роботам в структурированном виде,&nbsp; что позволяет им выдавать сайты с более осмысленным подходом, если такое слово, конечно, применимо к роботам. Получая структурированный контент, поисковый робот распределяет его по категориям. Рассмотрим для примера слово &laquo;нечто&raquo;.</p>\r\n\r\n<p>Свойствами будут являться <code>additionalType</code>; тип &mdash; URL</p>\r\n\r\n<p>Дополнительные сведения, записанные в коде разметки, об элементах используются для того, чтобы обозначить специфику о них из наружных источников. Получается взаимосвязь, которая отслеживается ПС, между чем то и классом, к которому относится &laquo;нечто&raquo;.</p>\r\n\r\n<p><code>description</code>; тип &mdash; Текст; Коротко описывает элемент.</p>\r\n\r\n<p><code>image</code>; тип &mdash; URL; определяет принадлежность к изображениям</p>\r\n\r\n<p><code>name</code>; тип &mdash; Текст; Название или имя элемента.</p>\r\n\r\n<p><code>sameAs</code>; тип &mdash; URL; является источником информации,.</p>\r\n\r\n<p><code>url</code>; непосредственно адрес&nbsp; местонахождения страницы.</p>\r\n\r\n<p>Именно выше описанные свойства обозначают элементы для поисковиков и сообщают им, где лучше всего взять информацию, ссылаясь на страницу с такой информацией.</p>\r\n\r\n<p>Если взять в пример свойство image, то получим ссылку, которая приведет на страницу с исходным изображением. Без разметки HTML &ndash; код будет представлять собой следующее:</p>\r\n\r\n<pre>\r\n<code class=\"language-html\">&lt;h2&gt;Заголовок&lt;/h2&gt;\r\n&lt;img src=\"/mikrorazmetka.jpg\" /&gt;</code></pre>\r\n\r\n<p>А если добавить микроразметку, этот же участок контента получит следующий вид:</p>\r\n\r\n<pre>\r\n<code class=\"language-html\">&lt;div itemscope itemtype=\"http://schema.org/ImageObject\"&gt;\r\n&lt;h2 itemprop=\"name\"&gt;Заголовок&lt;/h2&gt;\r\n&lt;img src=\"/mikrorazmetka.jpg\" itemprop=\"contentURL\"/&gt;\r\n&lt;/div&gt;</code></pre>\r\n\r\n<p>Разница будет в следующем. Просто HTML -&nbsp; код просто информирует поисковик, что данный объект является изображением и выдает название картинки. Система микроразметки Sсhema.org позволяет узнать поисковой системе, что это сегмент изображения, передает информацию о названии картинки и прямую ссылку на картинку.</p>\r\n\r\n<p>Поисковики не могут делать выводы, они только занимаются сбором точной информации и файлов, а затем отображают их для использования пользователями. Наиболее актуальна на сегодняшний день микроразметка для коммерческих сайтов. Чем больше точной и структурированной информации с сайта получит поисковик, тем больше шансов у интернет &ndash; магазина попасть в топ выдачи.</p>\r\n\r\n<h4>&nbsp;</h4>\r\n\r\n<h4>Как микроразметка повлияет на SEO?</h4>\r\n\r\n<p>При поиске той или иной поисковой системой, данные выдаются несколько по-разному.</p>\r\n\r\n<p>Для Гугл:</p>\r\n\r\n<p><img alt=\"\" height=\"114\" src=\"/images_admin/article_img/5a8029a96b5b0.jpg\" width=\"478\" /></p>\r\n\r\n<p>Для Яндекс:</p>\r\n\r\n<p><img alt=\"\" height=\"128\" src=\"/images_admin/article_img/5a8029b7143ba.jpg\" width=\"574\" /></p>\r\n\r\n<p>Данные приводятся в виде расширенных сниппетов, что позволяет пользователям определиться &ndash; тот ли сайт им нужен, стоит ли вообще заходить на него.</p>\r\n\r\n<p>Семантическая разметка позволяет сниппеты для товаров или услуг с ценами, с адресами и телефонами для организаций или справочных служб,&nbsp; улучшает представление видеоматериалов и изображений, анонсы мероприятий и многое другое.</p>\r\n\r\n<p>И если подумать, как микроразметка повлияет на seo-оптимизацию, то сразу в голову приходят выводы, что, благодаря подаче информации в удобной и полезной форме, увеличится кликабельность и улучшаться поведенческие факторы.</p>\r\n\r\n<p>К тому же уже неоднократно заявлялось, что предоставленные поисковикам структурированные данные улучшают индексацию страниц, соответственно повышается позиция сайта или страницы в выдаче.</p>\r\n\r\n<h4>&nbsp;</h4>\r\n\r\n<h4>Как можно внедрить микроразметку на свой сайт?</h4>\r\n\r\n<p>Это можно реализовать несколькими способами. Первый способ подразумевает&nbsp; глубокое ознакомление с документацией Sсhema.org и прописывание необходимых кодов вручную в уже существующем на сайте HTML-коде. Для этого потребуются такие ресурсы как вопросы и ответы ПС Яндекс и Гугл, &nbsp;перевод официальной документации Sсhema.org, проверка работы всего сайта в части внутренней оптимизации и сниппеты Гугл для блоггеров.</p>\r\n\r\n<p>Второй способ разметки подразумевает использование&nbsp; инструмента Гугл &ndash;&nbsp; плагина <strong>Structured Data Markup helper</strong>.</p>\r\n\r\n<p><img alt=\"\" height=\"314\" src=\"/images_admin/article_img/5a8029e3b17cf.jpg\" width=\"670\" /></p>\r\n\r\n<p>Чтобы ПС показала, что нужно дополнительно внести в&nbsp; код шаблона для того, чтобы далее создать код разметки,&nbsp; в онлайн - режиме выбираем участки определенной информации с сайта и обозначаем их как разметку. Если сайт создавался самостоятельно, то HTML-код знаком. Выделяется&nbsp; тип данных,которые являются структурированными, вводится URL и проставляются тэги. Затем нужно нажать кнопку &laquo;Create HTML&raquo; и&nbsp; найти области, которые отмечены желтым цветом. Именно те кодированые участки, которые&nbsp; сервис выделил желтым цветом, и будут являться будущей разметкой.</p>\r\n\r\n<p>Затем&nbsp; полученный результат копируется и просто вставляется в то место, где нужно ее расположить. Конечно, наиболее просто скачать исходник, но если сайт был написан с использованием РНР и других подобных инструментов, придется устанавливать разметку руками</p>\r\n\r\n<p>После того, как код&nbsp; с элементами разметки вставлен, не мешает убедиться, что все данные выводятся поисковиком в корректной форме. Для этого существуют инструменты&nbsp; - <strong>Structured Data Testing Tool</strong> (для поисковика Google) или Валидатор (для Яндекс).</p>\r\n\r\n<p><img alt=\"\" height=\"319\" src=\"/images_admin/article_img/5a8029f53e684.jpg\" width=\"427\" /></p>\r\n\r\n<p>Тритий способ является самым простым. Нужно&nbsp; применить специальные плагины, чтобы воспользоваться микроразметкой <strong>Sсhema.org</strong>. Например, для ВордПресс существует плагин <a href=\"https://wordpress.org/plugins/schema-creator/\" rel=\"nofollow noopener\" target=\"_blank\">Schema Creator by Raven</a>.</p>\r\n\r\n<p>Устанавливаем плагин и в панели управления появляется новая кнопка:</p>\r\n\r\n<p><img alt=\"\" height=\"269\" src=\"/images_admin/article_img/5a802a1d812b1.jpg\" width=\"519\" /></p>\r\n\r\n<p>С помощью нее вызывается генерация разметки. Просто выбираете тип разметки и заполняете необходимой информацией поля.</p>\r\n\r\n<p><img alt=\"\" height=\"456\" src=\"/images_admin/article_img/5a802a2c217e9.jpg\" width=\"668\" /></p>\r\n\r\n<p>И не нужно заполнение форм, в которые приходится вносить ключевые слова.</p>\r\n\r\n<p>Есть еще один плагин, который также неплохо справляется с задачей микроразметки &ndash; <a href=\"https://wordpress.org/plugins/all-in-one-schemaorg-rich-snippets/\" rel=\"nofollow noopener\" target=\"_blank\">All in One Schema</a>.</p>\r\n\r\n<p>Если вам действительно нужно сделать качественную внутреннюю оптимизацию сайта,&nbsp; то стоит начать использовать микроразметку прямо сегодня.</p>', 'img/uploads/articles/ba16c422b8d66e8adb706c2c6f8c9e85.png', 14, '{\"tag_1\": \"html\", \"tag_2\": \"Seo-продвижение\"}', 3, 'yes', '2015-02-22 00:00:00', '2018-02-11 12:55:34', 'микроразметка schema.org', 'Что такое микроразметка schema.org или как увеличить SEO-продвижение сайта.'),
(5, 'PageSpeed Insights - как получить 100 баллов от Google', 'pagespeed-insights_100_points', 'Поисковый гигант Google в ранжировании сайтов использует очень разные параметры – насколько страница полезна пользователю, не несет ли она в себе угроз и спама, нормально ли работает на различных браузерах и т.д. И одним из важных критериев является время загрузки сайта. Поисковик считает, что медленно загружающиеся сайты – это зло, поэтому сильно понижает их в выдаче. А для того, чтобы каждый вебмастер смог оценить скорость загрузки своего сайта, доступен удобный инструмент, который носит название PageSpeed Insights.', '<h4>Принцип действия Google PageSpeed Insights</h4>\r\n\r\n<p>Для того чтобы проверить скорость загрузки сайта, просто введите его адрес в строку для URL на странице инструмента и нажмите кнопку &laquo;Анализировать&raquo;. Через несколько секунд будет показан результат. Формат вывода результата стоит рассмотреть отдельно. Во-первых, <strong>PageSpeed Insights</strong> проверяет сайт по двум категориям &ndash; для мобильной и десктопной версии. Рядом с оценками доступен эскиз того, как страница смотрится на экране мобильного или же ПК. Также выдается общая оценка быстродействия сайта для каждой из версий. Оценка находится в диапазоне от 0 до 100. Чем оценка выше, тем страница грузится быстрее.</p>\r\n\r\n<p>Под оценкой выводятся причины медленной загрузки, а также советы по их устранению. Все причины разделены на три группы, каждая из которых имеет свой цвет:</p>\r\n\r\n<ul>\r\n	<li><strong>красный</strong> &ndash; для критических ошибок. Влияние этого элемента на загрузку страницы очень сильное, поэтому исправить проблему нужно чем скорее, тем лучше;</li>\r\n	<li><strong>оранжевый</strong> &ndash; для ошибок, которые лучше исправить, но можно сильно не торопиться. Это скорее предупреждения о наличии замедляющих загрузку сайта элементах, но которые не настолько сильно влияют, как &laquo;красные&raquo;;</li>\r\n	<li><strong>зеленый</strong> &ndash; всё в норме, проверенные элементы оформлены правильно и не требуют вмешательства.</li>\r\n</ul>\r\n\r\n<p>Общий результат также подсвечивается одним из цветов: если результат 90 баллов и выше, сайт считается быстрым, если выше 70 &ndash; средней скорости, результат ниже 70 баллов указывает на однозначные проблемы, которые нужно быстро решить.</p>\r\n\r\n<h4>&nbsp;</h4>\r\n\r\n<h4>Как улучшить показатели скорости загрузки</h4>\r\n\r\n<p>По сути, результат проверки сайта при помощи <strong>PageSpeed Insights</strong> &ndash;&nbsp;это уже краткий перечень инструкций по улучшению быстродействия. Однако не всегда эти указания оказываются действенными. Оптимизацию следует начинать с основ &ndash; валидации сайта. Дело в том, что ошибки в коде приводят к тому, что браузеру приходится тратить на них дополнительное время, что влияет на скорость загрузки. К такому же эффекту может привести и использование устаревших html-элементов и т.д. Для этого нужно проверить сайт при помощи <a href=\"http://validator.w3.org/\" rel=\"nofollow\">http://validator.w3.org/</a> и исправить все замечания.</p>\r\n\r\n<p>Теперь, когда сайт проходит валидацию, начинается самое интересное, ведь проблемы со скоростью загрузки могут зависеть от очень разных причин: конфигурации и настроек сервера, &laquo;железа&raquo;, программного обеспечения, используемой CMS и и т.д. Причем один и тот ж симптом может быть вызван различными причинами. Наиболее распространённые проблемы сайтов следующие:</p>\r\n\r\n<ul>\r\n	<li><em>медленный ответ сервера.</em> Проблема может заключаться как в самом сервере, так и в используемом софте. Проверить это просто: если основной сайт грузится медленно, а отдельный php-файл, лежащий там же &ndash; быстро, то причина однозначно &laquo;неповоротливых&raquo; скриптах движка. Причем чем &laquo;тяжелее&raquo; CMS используется, тем с большей вероятностью проблема будет именно в ней. Также часто причина кроется не в самом движке, а в используемых плагинах, особенно самописных или мало известных. Чтобы это проверить, попробуйте протестировать сайт со стандартным шаблоном и отключенными плагинами;</li>\r\n	<li><em>отключенный кеш и/или сжатие.</em> Чтобы добиться высоких оценок в <strong>PageSpeed Insights</strong>, каждый передаваемый файл должен на ходу сжиматься, а также иметь свой &laquo;срок жизни&raquo;, во время которого он не будет повторно запрашиваться из интернета, поскольку будет использоваться копия из кеша. Чтобы исправить это, нужно включить модули <strong>deflate</strong> и <strong>expires</strong> на сервере (в случае, если используется Apache), а также внести определённые изменения в файл .htaccess;</li>\r\n	<li><em>использование больших изображений. </em>Многие пренебрегают этой рекомендацией, но на самом деле значительная часть промедления при загрузке страниц связана именно с подгрузкой тяжелых картинок. Google при анализе страницы использует специальные библиотеки, которые определяют, достаточно ли сжата картинка, или можно ее дополнительно оптимизировать. Поэтому не ждите, пока проблему выявит <strong>PageSpeed Insights</strong>, а самостоятельно прогоните все изображения сайта через специальную программу, например, optiPNG или другие подобные;</li>\r\n	<li><em>громоздкий javascript. </em>Даже если вы не программист, можно внести необходимые коррективы в код, чтобы Google перестал считать скрипты перегруженными. Для этого откройте скрипт в любом текстовом редакторе и удалите комментарии, лишнюю табуляцию, переносы строк и т.д. Возможно, код будет выглядеть не так красиво, но он станет легче, что непременно оценит инструмент для проверки скорости;</li>\r\n	<li><em>подключенные скрипты и стили, которые мешают загрузке основного контента. </em>Эта рекомендация вызывает немало дискуссий, но Google твердо уверен, что вначале должен идти контент сайта, и только потом &ndash; скрипты и CSS. Поэтому по возможности перенесите скрипты в конец страницы, исключение разве что составляет библиотека jQuery, которая обязательно должна быть перед любым другим javascript-кодом, а также код, который должен выполниться до загрузки основного контента сайта &ndash; прелоадеры и т.д. CSS перенести в конец файла тоже можно, хотя и не рекомендуется, поскольку подключаются стили в теге <code>&lt;head&gt;</code>. Однако можно попытаться ускорить их загрузку, разделив один громоздкий css-файл на несколько небольших, весом около 100 Кб. По возможности нужно также указать браузеру, чтобы дополнительные файлы он загружал асинхронно.</li>\r\n</ul>\r\n\r\n<p>Эти рекомендации касались десктопной версии. Для мобильной они сходи, однако есть свои нюансы, связанные с тонкостями работы мобильных браузеров. Также мобильная оценка повысится, если сайт имеет адаптацию под электронные девайсы.</p>\r\n\r\n<p>Если исправить все замечания, которые выдал <strong>PageSpeed Insights</strong>, можно добиться очень высокой оценки, вплоть до 100 баллов. Существует целый ряд трюков, который позволяет это сделать. Вот вполне рабочий способ добиться высшей оценки в Speed Insights. Метод основан на том, что вначале пользователю выдается одна быстро загружаемая страница, а пока он ее изучает, подгружаются остальные. Происходит это за счет возможности использования javascript для загрузки других js и css:</p>\r\n\r\n<ol>\r\n	<li>создается отдельный css-файл для первой видимой части страницы, назвать который можно, к примеру, head.css. В него добавляются все стили, которые относятся к первому экрану, выдаваемому пользователю при загрузке сайта;</li>\r\n	<li>после этого все скрипты делятся на часть, которая идет в head.css, и на всё остальное;</li>\r\n	<li>после этого в <code>&lt;head&gt;</code> с помощью тега <code>&lt;style&gt;</code> инлайново подключаем скомпилированную сетку на Bootstrap. Это делается для того, чтобы даже еще не загрузившаяся страница уже имела свою структуру и все элементы заранее находились на своих местах. Вместо Bootstap можно использовать любой другой инструмент для создания сеток;</li>\r\n	<li>после сетки точно также указываются все стили из head.css;</li>\r\n	<li>затем подключается скрипт для загрузки шрифтов, который работает с внутренним хранилищем, и берет шрифты из него, если они есть, а если нет, тянет из сети;</li>\r\n	<li>перед закрывающим тегом <code>&lt;/body&gt;</code> подключаем оставшиеся скрипты. Обязательно все подключаемые js-файлы и другие элементы должны лежать в корне сайта;</li>\r\n	<li>дополнительно нужно создать и подключить файл стилей min.css, куда помещаются все стили, не уместившиеся в head.css.</li>\r\n</ol>\r\n\r\n<p>Правда, даже оценка в 100/100 еще не гарантирует того, что сайт поднимется на высокие строки в поисковой выдаче автоматически, зато как минимум пользователям будет комфортно его использовать, даже на слабых компьютерах с низкой скоростью подключения.</p>', 'img/uploads/articles/09086ff2881dc0cf95b760cfa4f31693.jpg', 10, '{\"tag_1\": \"Seo-продвижение\", \"tag_2\": \"оптимизация\"}', 3, 'yes', '2015-05-15 11:42:00', '2018-02-11 12:55:06', 'Google PageSpeed Insights - как добиться 100 баллов от Google', 'Обзор инструмента Google PageSpeed Insights. Как добиться хорошего результата и что для этого нужно сделать.'),
(6, 'Основные принципы адаптивного дизайна сайтов', 'osnovnyye_printsipy_adaptivnogo_dizayna', 'Многообразие всевозможных мобильных устройств на рынке привело к тому, что статическая верстка перестала удовлетворять требованиям веб-разработчиков. Основной принцип – сайт должен оставаться функциональным и хорошо выглядеть на любом экране – с помощью статического дизайна реализовать невозможно. Поэтому на замену статике пришла адаптивность – страница самостоятельно подстраивается под размеры экрана устройства, с которого ее просматривают.', '<p>Для дизайнеров, которые пришли в веб после полиграфии, освоить принципы адаптивности не так и просто &ndash; нет никаких физических единиц измерения &ndash; сантиметров, миллиметров, дюймов, и даже пиксели теперь только относительные. Поэтому чтобы понять тонкости взаимного расположения элементов страницы в адаптивном исполнении, мы подготовили основные принципы такого дизайна.</p>\r\n\r\n<h4>&nbsp;</h4>\r\n\r\n<h4>Понятие &laquo;потока&raquo;</h4>\r\n\r\n<p>В адаптивном дизайне по мере того как уменьшается ширина экрана, контент начинает занимать всё большую высоту видимого пространства. Это автоматически означает, что всё, что находится ниже уровня видимости, дополнительно опускается. Это явление и получило название &laquo;поток&raquo;. Это один из ключевых моментов, который необходимо освоить и привыкнуть работать с ним, чтобы создавать адаптивные сайты.</p>\r\n\r\n<h4>&nbsp;</h4>\r\n\r\n<h4>Размеры &ndash; только в относительных единицах</h4>\r\n\r\n<p>Создавая сайт, вы должны рассчитывать, что он будет отображен не только на каких-то конкретных устройствах, например, с шириной в 320, 768 и 1440 пикселей. Страница должна одинаково хорошо смотреться на всем многообразии экранов устройств, существующих на рынке. Поэтому жестко задавать размеры элементов в пикселях не выйдет, и очевидное решение &ndash; относительные единицы. Так можно быть уверенным в том, что если элементу задать ширину 50%, он займет половину экрана и на смартфоне, и на планшете, и на стационарном ПК.</p>\r\n\r\n<h4>&nbsp;</h4>\r\n\r\n<h4>Точки разрыва</h4>\r\n\r\n<p>Еще одно важное понятие в адаптивном сайтостроении &ndash; это т.н. точки разрыва. Чтобы понять, что это такое, представьте сайт, который должен на экране компьютера вывести текст в трех колонках, на планшете &ndash; в двух, а на смартфоне &ndash; одной. Точки разрыва, установленные в определенных местах контента, помогут правильно перегруппировать текст из трех- или двухколоночного в одну сплошную колонку.&nbsp; Чтобы проще определять места установки точек разрыва, смотрите, как ведет себя контент: если в определенном месте после изменения ширины страницы он начинает &laquo;плыть&raquo; или картинки съезжают из зоны видимости &ndash; это подходящее место для установки точки.</p>\r\n\r\n<h4>&nbsp;</h4>\r\n\r\n<h4>Максимальная и минимальная ширина</h4>\r\n\r\n<p>если использовать весь экран смартфона или планшета для отображения содержимого веб-страницы &ndash; это идея отличная, то делать то же самое с широкоэкранным ПК &ndash; затея не очень, читателю будет очень сложно работать с таким сайтом. Поэтому здесь используется атрибут <strong>max-width</strong>, который и позволяет задать через CSS максимальные размеры, до которых сможет растянуться сайт. Значение указывается в пикселях и обычно составляет около 1000 пикселей &ndash; золотой стандарт для дизайна сайта. Также есть и <strong>min-width</strong>, задающий минимальную ширину элемента.</p>\r\n\r\n<h4>&nbsp;</h4>\r\n\r\n<h4>Вложенность объектов</h4>\r\n\r\n<p>Когда на странице есть очень много объектов, имеющих относительное позиционирование, управлять их взаимным расположением становится очень сложно. Вопрос решается при помощи использования контейнера &ndash; элемента div, в который помещается группы элементов помельче. Управлять позиционированием контейнеров уже намного проще, а все вложенные объекты будут спозиционированы согласно настроек родительского div.</p>\r\n\r\n<h4>&nbsp;</h4>\r\n\r\n<h4>Растр или вектор?</h4>\r\n\r\n<p>Для адаптивных сайтов предпочтительнее векторные изображения, поскольку они могут изменять масштаб без ущерба для качества картинки. Однако если графический элемент содержит много мелких деталей, всё-таки предпочтительнее растровый формат, поскольку аналогичный вектор будет иметь слишком большой вес, что для сайта, адаптированного под мобильные устройства, недопустимо. Поэтому соблюдайте здоровый баланс: где-то лучше подойдёт SVG, а где-то &ndash; PNG или JPEG.</p>', 'img/uploads/articles/a93670bac8edcafbff6eaf771456e8b8.png', 2, '{\"tag_1\": \"web-дизайн\"}', 1, 'yes', '2015-05-17 12:12:00', '2018-02-11 13:06:59', 'Основные принципы адаптивного дизайна сайтов', 'Основной принцип – сайт должен оставаться функциональным и хорошо выглядеть на любом экране – с помощью статического дизайна реализовать невозможно'),
(7, 'Сборщики проектов Gulp и Grunt', 'sborshchiki_proyektov_Gulp_i_Grunt', 'Обзор сборщиков проектов Gulp и Grunt, преимущества, плагины, что выбрать лучше?', '<h4>Общие сведения по Grunt</h4>\r\n\r\n<p>Grunt принадлежит к сфере инструментов, предназначенных для сборки и подгонки при помощи консоли с применением задач.&nbsp;Данное средство сочетает в себе много операций на одном шаге:</p>\r\n\r\n<ol>\r\n	<li>Объединение разработочных файлов.</li>\r\n	<li>Оптимизация кода javascript с целью ускорения загрузки веб-страниц.</li>\r\n	<li>Конвертация Sass.</li>\r\n	<li>Минимизация количества файлов CSS браузером и прочее.</li>\r\n</ol>\r\n\r\n<p>Все похожие средства, написанные ранее, предназначались для использования в узкоспециализированных сферах программирования. Так как они не проектировались специально для Front-end разработчиков, то имели ряд недостатков. Несколько из них даже были чувствительны к знанию других языков, или диалектических разновидностей. Всё это создавало дополнительные трудности в изучении и последующем применении.</p>\r\n\r\n<p>Многих разработчиков не устраивало данное положение вещей. После совместного сотрудничества был выпущен инструмент, несущий в своей основе язык, каждый день востребованный. Grunt в полной мере реализован на Javascript, может применяться на разнообразных платформах и функционирует в Node.js.</p>\r\n\r\n<p>Несмотря на относительную новизну, инструмент уже обзавёлся несколькими версиями, отмечающими произошедшие изменения. В последней из них он включает показ главной задачи и командную строку. Ничего лишнего. Для использования дополнительной функциональности существует целый ряд плагинов.</p>\r\n\r\n<h4>&nbsp;</h4>\r\n\r\n<h4>Плагины для grunt</h4>\r\n\r\n<p>Вопреки относительной молодости проекта, для него окончательно разработаны немало полезных плагинов, удовлетворяющих практически любые запросы и потребности.</p>\r\n\r\n<p>В случае необходимости написания объёмного веб-приложения существует возможность интеграции оптимизаций для Google Closure Compiler и Require.js, а также предкомпиляции заданных шаблонов Jade, Mocha, Cucumber и прочих. Все плагины на сегодня доступны по ссылкам на сайте Grunt.</p>\r\n\r\n<h4>&nbsp;</h4>\r\n\r\n<h4>Gulp, общие сведения</h4>\r\n\r\n<p>Средство для сведения в единое целое компонентов проекта получило название Gulp(Гальп). Оно создавалось для работы на основе Node.js, который служит &laquo;переводчиком&raquo; узкоспециализированного языка JavaScript в язык широкого спектра назначения (машинный код).</p>\r\n\r\n<p>Также Gulpвыполняет функции таск-менеджера. Таск-менеджер по своей сути &ndash; маленькое приложение, используемое для автоматического исполнения повторяющихся рутинных процессов. К подобным вещам относятся минификация, старт модульных тестов, предварительный процессинг CSS и конкатенация файлов. Должным образом запрограммированный таск-менеджер будет выполнять поставленные перед ним задачи, предоставив вам заниматься собственными делами. Идея, лежащая в основе, привлекательна в своей простоте и обеспечивает экономию массы времени, необходимого для решения задач по непосредственной разработке проекта.</p>\r\n\r\n<p>Инсталляция производится сначала глобально, а затем непосредственно для приложения.</p>\r\n\r\n<p>Чистый Gulp имеет не слишком большую функциональность, однако в значительной мере расширяет свои возможности за счёт использования разнообразных плагинов.</p>\r\n\r\n<h4>&nbsp;</h4>\r\n\r\n<h4>Gulp плагины</h4>\r\n\r\n<p>Каждый плагин в инструменте для сборки веб-приложений Gulp выполняет одну отдельную функцию.</p>\r\n\r\n<p>Все плагины для различных целей можно отыскать прямо на странице, содержащей их список, либо же поиском на npm.</p>\r\n\r\n<h4>&nbsp;</h4>\r\n\r\n<h4>Отличие Gulp от Grunt</h4>\r\n\r\n<p>После описания каждого инструмента для сборки сам собой напрашивается вопрос: какой же из них лучше подходит для выполнения поставленных задач и как сделать выбор в чью-либо пользу?</p>\r\n\r\n<ol>\r\n	<li><strong>Передача данных потоком</strong>. Система gulp базируется на принципе потоковой передачи данных. Она обеспечивает гораздо более значительный контроль над операциями и действует напрямую, не захламляя проект временными и промежуточными директориями с файлами. Разработчик перемещает файл под управление gulp с последующим сохранением результата в другое место. Просто и эффективно.</li>\r\n	<li><strong>Использование плагинов</strong>. Ключевое отличие заключается и в подходе к применению плагинов. Для обогащения собственного функционального потенциала нужны надстройки. Но каждый отдельно взятый плагин отвечает за исполнение одного элементарного действия. А собственно Gulp выступает оболочкой и организатором совершаемых действий в более сложные задачи. В отличии от Grunt в системе не найти плагинов, ответственных за одну и ту же процедуру, вступающих в конфликты друг с другом или с главным функционалом.</li>\r\n	<li><strong>Прежде всего код, а настройки &ndash; потом</strong>. Файл инструмента &ndash; gulpfile &ndash; является в первую очередь кодом, а не просто файлом с настройками. Написанный в соответствии со спецификацией CommonJS, gulp не составит для вас трудностей, особенно при знакомстве с Node. Хорошая читабельность и аккуратность кода достигается за счёт его структурирования хорошо известным способом.</li>\r\n</ol>\r\n\r\n<h4>&nbsp;</h4>\r\n\r\n<h4>Что выбрать?</h4>\r\n\r\n<p>Хотя для большого процента людей выбор таск-менеджера &ndash; это вопрос привычки и личных предпочтений, gulp всё же смотрится попроще и поосновательнее grunt. Так как для каждой элементарной процедуры предназначен свой плагин, то нет нужды путаться в довольно громоздкой простыне текста. В некоторых случаях он помогает уменьшить количество строк в коде.</p>\r\n\r\n<p>Стоить отметить, что grunt был первым в своей области, а потом, как альтернативное решение, появился gulp. Он содержит меньшее количество плагинов, которых, однако, вполне хватает для выполнения поставленных задач.</p>\r\n\r\n<blockquote>\r\n<p>Вся документация для данных средств в полном объёме представлена на официальных сайтах: <a href=\"http://gruntjs.com/\" rel=\"noopener\" target=\"_blank\">http://gruntjs.com/</a> и <a href=\"http://gulpjs.com/\" rel=\"noopener\" target=\"_blank\">http://gulpjs.com/</a>, соответственно.</p>\r\n</blockquote>', 'img/uploads/articles/1f7da512119b0a7a419716cc87c35c1c.jpg', 1, '{\"tag_1\": \"css\", \"tag_2\": \"html\", \"tag_3\": \"JavaScript\", \"tag_4\": \"less\", \"tag_5\": \"оптимизация\"}', 2, 'yes', '2015-12-02 12:19:00', '2018-02-11 12:54:25', 'Сборщики проектов Gulp и Grunt', 'Обзор сборщиков проектов Gulp и Grunt, преимущества, плагины, что выбрать лучше?');
INSERT INTO `articles` (`id`, `name`, `alias`, `short_desc`, `desc`, `img`, `views`, `tags`, `category_id`, `status`, `created_at`, `updated_at`, `seo_title`, `seo_description`) VALUES
(8, 'Создание запросов к базе данных MySQL на примерах', 'sozdaniye_zaprosov_k_baze_dannykh_MySQL', 'MySQL – это одна из множества СУБД, работающая с поддержкой языка программирования PHP. Такая БД не способна обрабатывать большое количество информации, но для использования на небольших и средних размеров сайтах MySQL вполне хватает. Простота работы и надежность этой базы данных послужила ее популяризации среди веб мастеров. Для создания и управления веб-страницами через интернет на любом компьютере используются специальные запросы.', '<p><strong>Запросы к базе данных MySQL</strong>&nbsp;&ndash; обращение к БД с помощью команд, которые позволяют проводить получение, коррекцию, удаление, сортировку, добавление информации и другие воздействия. Разобравшись с тем, как сделать запрос к базе данных MySQL, вы получите начальный уровень знаний, позволяющий успешно работать с системой.</p>\r\n\r\n<h4>&nbsp;</h4>\r\n\r\n<h4>Виды запросов MySQL</h4>\r\n\r\n<p>Если БД уже создана, а вам нужно научиться лишь управлять ею, то стоит начать с понимания сути запросов - введенных в поле командной строки команд. Все команды к СУБД традиционно делятся на:</p>\r\n\r\n<ul>\r\n	<li>Простые (задействуют в работе только одну таблицу из базы).</li>\r\n	<li>Сложные (нужны для редактирования сразу несколько таблиц).</li>\r\n</ul>\r\n\r\n<p>В статье мы расскажем, <strong>как сделать запрос к базе данных MySQL</strong> на примерах, что поможет тем, кто только начинает свою карьеру в программировании или желает создать собственный сайт, разобраться в особенностях БД.</p>\r\n\r\n<h4>&nbsp;</h4>\r\n\r\n<h4>Простые запросы в работе с базами данных MySQL</h4>\r\n\r\n<p>Разбираться в азах управления БД мы будем на примере таблицы с адресами клиентов интернет-магазина. В работе с любой базой данных предусмотрено два ключевых запроса, с которых можно начать управление сайтом: &laquo;Show databases;&raquo; и &laquo;Show tables in shop;&raquo;. Первая команда предназначена для отображения списка всех существующих баз данных. Второй запрос нужен для выведения информации о количестве таблиц в базе данных shop с указанием их названий.</p>\r\n\r\n<p>Ниже будут рассмотрены <strong>запросы в работе с базами данных</strong> по категориям</p>\r\n\r\n<h4>&nbsp;</h4>\r\n\r\n<h4>SELECT (выбрать) запросы к базе данных MySQL</h4>\r\n\r\n<p>Для выбора и просмотра уже существующей информации внутри таблицы используется запрос SELECT. Команда предполагает указание нужных параметров выборки, что позволяет более точно осуществлять поиск. Смысл каждого такого запроса в следующем: выбор определенной колонки из определенной таблицы с определенными значениями параметров этой колонки. Рассмотрим простые SELECT запросы, необходимые для чтения информации из <strong>базы данных, примеры запросов</strong>:</p>\r\n\r\n<p><em><strong>На примере нашего условного магазина с таблицами адресов клиентов запросы будут выглядеть следующим образом:</strong></em></p>\r\n\r\n<p><em>ВЫБРАТЬ ВСЕ данные из таблицы <strong>address</strong>:</em> <code>SELECT * FROM address;</code></p>\r\n\r\n<p><em>Вывести общее количество записей в таблице<strong> address</strong>:</em> <code>SELECT count(*) FROM address;</code></p>\r\n\r\n<p><em>ВЫБРАТЬ из таблицы <strong>address</strong> определенное КОЛИЧЕСТВО записей (в примере 4 штуки), НАЧИНАЯ с 3:</em> <code>SELECT * FROM address LIMIT 3, 4;</code></p>\r\n\r\n<p><em>ВЫБРАТЬ из таблицы <strong>address</strong> ВСЕ данные и ОТСОРТИРОВАТЬ их по порядку, учитывая значение поля name:</em> <code>SELECT * FROM address ORDER BY name;</code></p>\r\n\r\n<p><em>ВЫБРАТЬ из таблицы <strong>address</strong> ВСЕ данные и ОТСОРТИРОВАТЬ их по порядку, учитывая значение поля name, но в ОБРАТНОМ порядке:</em> <code>SELECT * FROM address ORDER BY name DESC;</code></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><em><strong>Если нужно провести сортировку по более точным параметрам, то команды будут такими:</strong></em></p>\r\n\r\n<p><em>ВЫБРАТЬ ВСЕ записи из таблицы <strong>address</strong> и СОРТИРОВАТЬ их по полю <strong>city</strong>, установив количество или ЛИМИТ первые 10 записей:</em> <code>SELECT * FROM address BY city LIMIT 10;</code></p>\r\n\r\n<p><em>ВЫБРАТЬ ВСЕ записи из таблицы <strong>address</strong>, ГДЕ поле <strong>city</strong> соответствует значению London:</em> <code>SELECT * FROM address WHERE city=&#39;London&#39;;</code></p>\r\n\r\n<p><em>ВЫБРАТЬ ВСЕ записи из таблицы <strong>address</strong>, ГДЕ поле <strong>city</strong> начинаются с букв &quot;Lo&quot;:</em> <code>SELECT * FROM address WHERE city LIKE &#39;Lo%&#39;;</code></p>\r\n\r\n<p><em>ВЫБРАТЬ ВСЕ записи из таблицы <strong>address</strong>, ГДЕ поле <strong>city</strong> заканчивается на буквах &quot;on&quot;, и СОРТИРОВАТЬ записи в порядке возрастания значения поля <strong>number</strong>:</em> <code>SELECT * FROM address WHERE city LIKE &#39;% on&#39; ORDER BY number;</code></p>\r\n\r\n<p>Следующие запросы пригодятся в том случае, когда нужно определить уникальные значения полей, скажем, из колонки &laquo;город&raquo; (city), но вы хотите исключить десятки повторяющиеся записей. Например, когда вам не важно количество адресов из Лондона, а нужно определить, сколько всего городов указано в поле &laquo;город&raquo; (city): <code>SELECT&nbsp;DISTINCT&nbsp;city FROM&nbsp;address;</code></p>\r\n\r\n<p>Или</p>\r\n\r\n<p><em>ВЫБРАТЬ ВСЕ значение строк из таблицы <strong>address</strong>, ГДЕ (номер улицы) Str_nmb имеет значение 3,4,5:</em>&nbsp;<code>SELECT * FROM address WHERE Str_nmb IN (3,4,5);</code></p>\r\n\r\n<h4>&nbsp;</h4>\r\n\r\n<h4>Запросы для создания, перезаписи и удаления информации</h4>\r\n\r\n<p>По ходу работы с БД вам, несомненно, понадобится не только найти записи, но и дополнить архив совершенно новыми. В этом поможет команда INSERT, используют которую по такому принципу:</p>\r\n\r\n<p><em>СОЗДАТЬ записи в таблице <strong>address</strong>, со значениями поля, в <strong>Str_name</strong> вставить запись &quot;Пушкина&quot;, а в <strong>Str_nmb</strong> &quot;23&quot;:</em> <code>INSERT INTO address (Str_nmb, Str_name) VALUES (Пушкина, &#39;23&#39;);</code></p>\r\n\r\n<p>Для изменения и перезаписи информации используется запрос UPDATE.</p>\r\n\r\n<p><em>В таблице <strong>address</strong>, ГДЕ country прописано England нужно ПЕРЕЗАПИСАТЬ значение поля city на London:</em>&nbsp;<code>UPDATE address SET city = &#39;London&#39; WHERE id = &#39;England&#39;;</code></p>\r\n\r\n<p><em>А если нужно УДАЛИТЬ определенную строку в таблице <strong>address</strong>, например, где в city написана запись &laquo;London&raquo;, вводим:</em> <code>DELETE&nbsp;FROM&nbsp;address WHERE&nbsp;city =&nbsp;&#39; London&#39;</code>.</p>\r\n\r\n<h4>Как создать более сложный запрос?</h4>\r\n\r\n<p>Способов построения команд для управления данными с нескольких таблиц великое множество. Данную тему можно смело рассматривать как отдельную. Суть подобных команд в том, чтобы указать сразу целый ряд параметров, по которым будет выполнен запрос <strong>SELECT</strong>, <strong>UPDATE</strong>, <strong>DELETE</strong>, <strong>INSERT</strong> для ускорения работы. Например, для вывода на экран всех уникальных имен людей из таблицы с клиентами, проживающих в городе с названием на букву L, из таблицы с адресами (с учетом того, что в таблице address поиск идет по полям city):</p>\r\n\r\n<p><code>SELECT DISTINCT last_name FROM person, address WHERE person.address_no = adress.adress_no AND city :OKE &#39;L%&#39;;</code><br />\r\n<em><strong>или</strong></em><br />\r\n<code>SELECT DISTINCT last_name FROM person p, address adr WHERE p.adress_no = adr.address_no AND city LIKE &#39;L%&#39;;</code></p>\r\n\r\n<p>Если вы поняли суть того, как осуществлять <strong>создание запросов к базе данных</strong> MySQL, то без труда сможете использовать этот принцип для управления собственным веб приложением.</p>', 'img/uploads/articles/d8c4b76da63faf6b5f50a21ea199ae83.png', 9, '{\"tag_1\": \"MySQL\", \"tag_2\": \"SQL\"}', 2, 'yes', '2016-11-23 12:28:00', '2018-02-12 23:55:14', 'Создание запросов к базе данных MySQL', 'MySQL – это одна из множества СУБД, работающая с поддержкой языка программирования PHP. Такая БД не способна обрабатывать большое количество информации, но для использования на небольших и средних размеров сайтах MySQL вполне хватает.');

-- --------------------------------------------------------

--
-- Структура таблицы `category_articles`
--

CREATE TABLE `category_articles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `category_articles`
--

INSERT INTO `category_articles` (`id`, `name`, `name_en`, `alias`) VALUES
(1, 'Дизайн', 'Design', 'design'),
(2, 'Программирование', 'Programming', 'programming'),
(3, 'Маркетинг', 'Marketing', 'marketing');

-- --------------------------------------------------------

--
-- Структура таблицы `category_portfolios`
--

CREATE TABLE `category_portfolios` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `category_portfolios`
--

INSERT INTO `category_portfolios` (`id`, `name`, `name_en`) VALUES
(1, 'Интернет магазин', 'Online shop'),
(2, 'Landing Page', 'Landing Page'),
(3, 'Портал', 'Portal');

-- --------------------------------------------------------

--
-- Структура таблицы `clients`
--

CREATE TABLE `clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `clients`
--

INSERT INTO `clients` (`id`, `name`, `email`, `phone`, `company`, `created_at`, `updated_at`) VALUES
(1, 'client_1', 'email_1@site.com', '0930000001', NULL, NULL, NULL),
(2, 'client_2', 'email_2@site.com', '0930000002', NULL, NULL, NULL),
(3, 'client_3', 'email_3@site.com', '0930000003', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `client_orders`
--

CREATE TABLE `client_orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `client_orders`
--

INSERT INTO `client_orders` (`id`, `client_id`, `order_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2017_11_24_133542_create_roles_table', 1),
(4, '2017_11_24_133604_create_roles_users_table', 1),
(5, '2017_11_25_134937_create_pages_table', 1),
(6, '2017_11_25_135010_create_category_articles_table', 1),
(7, '2017_11_25_135027_create_articles_table', 1),
(8, '2017_11_25_135050_create_category_portfolios_table', 1),
(9, '2017_11_25_135108_create_portfolios_table', 1),
(10, '2017_11_25_135136_create_reviews_table', 1),
(11, '2017_11_25_140118_create_topics_table', 1),
(12, '2017_11_25_140147_create_status_orders_table', 1),
(13, '2017_11_25_140237_create_services_table', 1),
(14, '2017_11_25_140300_create_orders_table', 1),
(15, '2017_11_25_140314_create_clients_table', 1),
(16, '2017_11_25_140342_create_client_orders_table', 1),
(17, '2018_02_04_193000_add_seo_to_articles_table', 2),
(18, '2018_02_04_193317_add_seo_to_pages_table', 2),
(19, '2018_02_04_193449_add_seo_to_services_table', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `service_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `name`, `email`, `phone`, `comment`, `service_id`, `code`, `status_id`, `created_at`, `updated_at`) VALUES
(1, 'order_1', 'email_1@site.com', '0930000001', NULL, 1, NULL, 1, NULL, NULL),
(2, 'order_2', 'email_2@site.com', '0930000002', NULL, 2, NULL, 2, NULL, NULL),
(3, 'order_3', 'email_3@site.com', '0930000001', NULL, 4, NULL, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci,
  `desc_en` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `pages`
--

INSERT INTO `pages` (`id`, `name`, `name_en`, `alias`, `desc`, `desc_en`, `created_at`, `updated_at`, `seo_title`, `seo_description`) VALUES
(1, 'О нас', 'About', 'about', '<p>Компания Web icon была создана в 2013 году. Наша миссия - предоставлять клиентам самые профессиональные и высококачественные услуги разработки сайтов, интернет-маркетинга и обслуживание клиентов. В процессе нашей работы мы всегда следим за новинками в сфере IT, и применяем в наших проектах исключительно современные технологии. Свяжитесь с нами сегодня, чтобы узнать, как наша команда профессиональных разработчиков, дизайнеров и SEO-специалистов, может помочь в росте и развитии вашего бизнеса.</p>\r\n\r\n<h3 style=\"text-align:center\">5 факторов, почему вы должны выбрать именно нас для веб-проекта или онлайн-маркетинговой кампании.</h3>\r\n\r\n<ol>\r\n	<li><strong>Вы говорите, мы слушаем</strong></li>\r\n</ol>\r\n\r\n<p>Мы стремимся сначала понять бизнес-цели нашего клиента. Затем все решения принимаются с учетом этих целей. Любой веб-сайт будет бесполезен, если он не поможет вам достичь ваших целей. Вы говорите, мы слушаем ... и вот после этого мы вам можем набросать множество идей для улучшения вашего бизнеса.</p>\r\n\r\n<ol>\r\n	<li><strong>Мы ценим целостность</strong></li>\r\n</ol>\r\n\r\n<p>Мы верим в честность, целостность и искренне относимся к нашим клиентам. Мы не собираемся продавать вам то, что вам не нужно. Мы не будем лгать, чтобы просто получить заказ. Мы будем относиться к вам со всей добротой и уважением.</p>\r\n\r\n<ol>\r\n	<li><strong>Мы знаем SEO</strong></li>\r\n</ol>\r\n\r\n<p>Поисковая оптимизация (SEO) - это искусство поиска в поисковых системах, таких как Google, Yahoo и Bing. Если ваш сайт не будет правильно размещен в поисковых системах, потенциальные клиенты просто не смогут узнать о Вас. Многие из наших клиентов окупают весь свой веб-сайт в первый месяц, с оплат от привлечения новых партнеров, что является прямым результатом наших усилий в области SEO.</p>\r\n\r\n<ol>\r\n	<li><strong>Мы создаем выдающиеся дизайны</strong></li>\r\n</ol>\r\n\r\n<p>Мы создаем только уникальные проекты. Наша цель - позиционировать ваш бизнес в качестве лучшего игрока в вашей отрасли и, чтобы вы могли превзойти всех ваших конкурентов. Профессиональный веб-дизайн повышает доверие ваших клиентов<s>, </s>что в конечном итоге приведет к дальнейшему росту.</p>\r\n\r\n<ol>\r\n	<li><strong>Мы всегда соблюдаем сроки</strong></li>\r\n</ol>\r\n\r\n<p>Мы знаем, что время - это деньги в мире бизнеса, поэтому мы устанавливаем реалистичные сроки<s> </s>и придерживаемся их. Мы постоянно общаемся с нашими клиентами, чтобы предоставлять им обновления по мере продвижения и запускать проекты, начатые на согласованной дате запуска.</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" height=\"110\" src=\"/images_admin/article_img/5a80d0864b14c.jpg\" width=\"200\" /><img alt=\"\" height=\"110\" src=\"/images_admin/article_img/5a80d0422f820.jpg\" width=\"200\" /><img alt=\"\" height=\"110\" src=\"/images_admin/article_img/5a80d0422f908.jpg\" width=\"200\" /><img alt=\"\" height=\"110\" src=\"/images_admin/article_img/5a80d0422f848.jpg\" width=\"200\" /></p>\r\n\r\n<p>С момента нашего основания, мы постоянно улучшаемся и среди наших известных клиентов, есть такие, как: Rowenta, Gillette, Philips, Milka, K2. Мы стратегически помогаем строить ваш бренд, улучшать ваше присутствие в глобальной сети и развивать более значимые отношения с вашими клиентами. Обращайтесь к нам и мы найдем к вам уникальный подход.</p>', '<p>The Company Web-icon was created in 2013. Our mission is to provide customers with the most professional and high-quality website development services, Internet marketing and customer service. In the course of our work, we always follow the novelties in the IT field, and we use only modern technologies in our projects. Contact us today to find out how our team of professional developers, designers and SEO professionals can help in the growth and development of your business.</p>\r\n\r\n<h3 style=\"text-align:center\">5 factors why you should choose us for a web project or an online marketing campaign.</h3>\r\n\r\n<ol>\r\n	<li><strong>You say, we listen</strong></li>\r\n</ol>\r\n\r\n<p>We strive first to understand the business goals of our client. Then all decisions are made with these goals in mind. Any website will be useless if it doesn&rsquo;t help you achieve your goals. You say, we listen ... and after that we can sketch out a lot of ideas for improving your business.</p>\r\n\r\n<ol>\r\n	<li><strong>We value integrity</strong></li>\r\n</ol>\r\n\r\n<p>We believe in honesty, integrity and sincerely treat our customers. We are not going to sell you something you don&rsquo;t need. We will not lie to just receive an order. We will treat you with all kindness and respect.</p>\r\n\r\n<ol>\r\n	<li><strong>We know SEO</strong></li>\r\n</ol>\r\n\r\n<p>Search engine optimization (SEO) is the art of searching in search engines such as Google, Yahoo and Bing. If your site isn&rsquo;t properly placed in the search engines, potential customers simply will not be able to find out about you. Many of our customers pay back their entire website in the first month, with fees from attracting new partners, which is a direct result of our SEO efforts.</p>\r\n\r\n<ol>\r\n	<li><strong>We create outstanding designs</strong></li>\r\n</ol>\r\n\r\n<p>We create only unique projects. Our goal is to position your business as the best player in your industry and so that you can surpass all of your competitors. Professional web design enhances the confidence of your customers, which ultimately leads to further growth.</p>\r\n\r\n<ol>\r\n	<li><strong>We always comply with the deadlines</strong></li>\r\n</ol>\r\n\r\n<p>We know that time is money in the business world, so we set realistic terms and adhere to them. We constantly communicate with our customers to provide them with updates as they progress and launch projects started on the agreed launch date.</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" height=\"110\" src=\"/images_admin/article_img/5a80d0864b14c.jpg\" width=\"200\" /><img alt=\"\" height=\"110\" src=\"/images_admin/article_img/5a80d0422f820.jpg\" width=\"200\" /><img alt=\"\" height=\"110\" src=\"/images_admin/article_img/5a80d0422f908.jpg\" width=\"200\" /><img alt=\"\" height=\"110\" src=\"/images_admin/article_img/5a80d0422f848.jpg\" width=\"200\" /></p>\r\n\r\n<p>Since our foundation, we are constantly improving and among our well-known customers, there are such as: Rowenta, Gillette, Philips, Milka, K2. We strategically help build your brand, improve your presence in the global network and develop more meaningful relationships with your customers. Contact us and we will find a unique approach to you.</p>', NULL, '2018-02-11 23:24:07', 'О нас', 'Компания Web icon была создана в 2013 году. Наша миссия - предоставлять клиентам самые профессиональные и высококачественные услуги разработки сайтов, интернет-маркетинга и обслуживание клиентов.'),
(2, 'Тестовая страница', 'Test page', 'test_page', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `portfolios`
--

CREATE TABLE `portfolios` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_desc` text COLLATE utf8mb4_unicode_ci,
  `short_desc_en` text COLLATE utf8mb4_unicode_ci,
  `desc` text COLLATE utf8mb4_unicode_ci,
  `desc_en` text COLLATE utf8mb4_unicode_ci,
  `img` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iframe_link` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `category_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `portfolios`
--

INSERT INTO `portfolios` (`id`, `name`, `name_en`, `alias`, `short_desc`, `short_desc_en`, `desc`, `desc_en`, `img`, `link`, `iframe_link`, `views`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'Portfolio 1', 'Portfolio 1', 'portfolio_1', 'Short description text', 'Short description text', 'Description text', 'Description text', 'no_img.jpg', 'test.com', 'google.com', '0', 1, NULL, NULL),
(2, 'Portfolio 2', 'Portfolio 2', 'portfolio_2', 'Short description text', 'Short description text', 'Description text', 'Description text', 'no_img.jpg', 'test.com', 'google.com', '0', 2, NULL, NULL),
(3, 'Portfolio 3', 'Portfolio 3', 'portfolio_3', 'Short description text', 'Short description text', 'Description text', 'Description text', 'no_img.jpg', '', 'google.com', '0', 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `reviews`
--

CREATE TABLE `reviews` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_case` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `reviews`
--

INSERT INTO `reviews` (`id`, `name`, `type_case`, `avatar`, `desc`, `created_at`, `updated_at`) VALUES
(1, 'Александр Борисович', 'Интернет магазин', 'img/uploads/avatars/7b98373807a4b26783b72ffd7fdb8faf.png', '<p>Сделано всё отлично! Web-icon свою работу выполнил на 5+ постоянно поддерживали в курсе, сделали даже раньше чем было оговорено и задумано (тексты и фото есть но не в полном объёме).&nbsp;<br />\r\nРекомендую к сотрудничеству, буду сам обращаться.</p>', '2016-10-25 13:11:28', '2018-01-10 14:01:13'),
(2, 'Ivan K', 'Интернет магазин', 'img/uploads/avatars/bd1af0b823975fe44d91cddcc30b575e.png', '<p>Роботою задоволений. Якісно, чітко, оперативно, доступно по ціні. Web-icon добре розуміється на WordPress. Зробив навіть більше чим обговорювалося першопочатково. Однозначно рекомендую Web-icon до співпраці. Велике дякую за хорошу роботу, було приємно співпрацювати!</p>', '2016-04-05 13:11:28', '2018-01-10 14:06:31'),
(3, 'Виктор Панченко', 'Веб-проект', 'img/uploads/avatars/1b2987c0afeea176233dea45c64da4c1.png', '<p>Web-icon отлично справился с поставленной задачей. Порадовала адекватная реакция на указанные недоработки, которые очень быстро были исправлены. Спасибо!</p>', '2016-05-24 13:11:28', '2018-01-10 14:07:49'),
(4, 'Наталья Красноум', 'Сайт-визитка', 'img/uploads/avatars/0f078d9f5427f10e8e68a45000ca7701.png', '<p>Web-icon сделал логотип для моего сайта-визитки. Порадовал профессионализм и креативность, сроки исполнения, ответственность, а особенно - советы, которые Web-icon давал в процессе обсуждения вариантов. При этом были учтены мои пожелания. Спасибо за работу! ) Рекомендую Web-icon, как творческую и перспективную компанию.</p>', '2014-10-24 13:11:28', '2018-01-10 14:10:37'),
(5, 'Евгений Корнак', 'Интернет магазин', 'img/uploads/avatars/fcbb5bbe651a1f468b83dd7b925724ce.png', '<p>Web-icon отлично справился с работой, в очень даже сжатые сроки. Что особо понравилось в работе с Web-icon, то что всегда на связи. Обязательно буду работать с ними дальше.</p>', '2014-04-11 13:11:28', '2018-01-10 14:11:28'),
(6, 'Владимир Донцов', 'Интернет магазин', 'img/uploads/avatars/d5d8b42b923e1b562e4e9898ef615e24.png', '<p>Работа была выполнена ранее заявленных сроков. Web-icon всегда находился на связи, даже в позднее время, ответы на вопросы получал в самые кратчайшие сроки. Все поставленные задания и даже немного больше были выполнены очень оперативно. Буду постоянно пользоваться услугами Web-icon.</p>', '2014-09-18 13:11:56', '2018-01-10 14:11:56'),
(7, 'Аркадий Байцов', 'Веб-проект', 'img/uploads/avatars/d5d8b42b923e1b562e4e9898ef615e24.png', '<p>Компания Web-icon показала себя как высококлассный специалист своего дела, слов на ветер не бросала! Всё сделано как надо и даже больше!</p>', '2014-07-04 13:12:27', '2018-01-10 14:12:27'),
(8, 'Sergey Ulizko', 'Интернет магазин', 'img/uploads/avatars/79751b24561b2fb56fe1a67129fa0303.png', '<p>Остался доволен работой. Перед тем как приступить к работе по советовали что и как нужно будет сделать на сайте, сейчас и в будущем чтоб он отвечал времени. Понравился подход к работе, все четко, быстро и качественно. Рекомендую!</p>', '2014-10-06 13:13:47', '2018-01-10 14:13:47');

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`) VALUES
(1, 'admin', NULL),
(2, 'guest', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `roles_users`
--

CREATE TABLE `roles_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `roles_users`
--

INSERT INTO `roles_users` (`id`, `user_id`, `role_id`) VALUES
(1, 1, 1),
(2, 1, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `services`
--

CREATE TABLE `services` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `service_list` json NOT NULL,
  `service_list_en` json NOT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci,
  `desc_en` text COLLATE utf8mb4_unicode_ci,
  `form_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `form_title_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `form_pod_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `form_pod_title_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `services`
--

INSERT INTO `services` (`id`, `name`, `name_en`, `alias`, `service_list`, `service_list_en`, `desc`, `desc_en`, `form_title`, `form_title_en`, `form_pod_title`, `form_pod_title_en`, `sort`, `seo_title`, `seo_description`) VALUES
(1, 'Разработка сайта', 'Site development', 'site_development', '[\"Разработка прототипа\", \"Индивидуальный дизайн\", \"Кроссбраузерность\", \"Система статистики\", \"Система управления\", \"SEO — оптимизация\", \"Постоянное сопровождение\"]', '[\"Development of a prototype\", \"Individual design\", \"Cross-browser compatibility\", \"Statistics system\", \"Control system\", \"SEO - optimization\", \"Constant support\"]', '<h3>Веб-разработка, современная и эффективная</h3>\r\n\r\n<p>Компания Web-icon использует только современные веб-разработки. Мы можем помочь вам определить, что лучше всего подходит для ваших нужд. Наша миссия заключается в том, чтобы упростить процесс веб-разработки.</p>\r\n\r\n<p>Мы специализируемся на создании красивых, профессиональных веб-сайтов. Эти элементы объединяются для создания исключительного пользовательского интерфейса (UX). Это позитивное взаимодействие с вашим брендом укрепляет доверие ваших клиентов, превращая посетителей в клиентов.</p>\r\n\r\n<p>Информация, которую вы предоставляете нам, позволяет точно и четко определить ваши желания и спланировать ваш сайт.</p>\r\n\r\n<p><strong>Разработка веб-сайта включает в себя следующие этапы:</strong></p>\r\n\r\n<ol>\r\n	<li>Проектирование/прототипирование</li>\r\n	<li>Разработка дизайна</li>\r\n	<li>Верстка</li>\r\n	<li>Программирование</li>\r\n	<li>Тестирование</li>\r\n	<li>Продакшен</li>\r\n</ol>\r\n\r\n<p>Мы категорически не используем никакие готовые системы для разработки сайтов (WordPress, OpenCart и т.п.). Мы создаем проекты полностью сами, используя последние тренды в веб-разработке. &nbsp;Выбор правильной основы для вашего сайта - это первый и самый большой шаг в настройке вашего бизнеса на успех.</p>\r\n\r\n<p>Вы можете быть уверены, что наша стратегия веб-разработки оптимизирует ваш сайт для согласования с вашими целями.</p>\r\n\r\n<p>На сегодняшнем динамичном рынке жизненно важно, чтобы ваша компания имела доступ к самым современным интернет-технологиям. Наши решения для веб-разработки разработаны с учетом ваших бизнес-процессов, предлагая вашему бизнесу средства для более плавного и эффективного управления. Мы принимаем меры для обеспечения безопасной и эффективной работы вашей онлайн-инфраструктуры.</p>\r\n\r\n<p>Независимо от того, ищете ли вы компанию по разработке веб-сайтов, чтобы создать сайт с нуля или обновить свой текущий сайт с помощью новейших технологических инноваций, мы надеемся, что вы рассмотрите возможность применения нашего богатого опыта в сфере разработки и последующей поддержки вашего сайта.</p>\r\n\r\n<p>Мы разрабатываем абсолютно разные проекты, начиная от обычного сайта-визитки или лендинга, и до крупных порталов и социальных сетей.</p>', '<h3>Web development, modern and efficient</h3>\r\n\r\n<p>The Сompany Web-icon uses only modern web development. We can help you determine what is best for your needs. Our mission is to simplify the process of web development.</p>\r\n\r\n<p>We specialize in creating beautiful, professional websites. These elements are combined to create an exclusive user interface (UX). This positive interaction with your brand strengthens the confidence of your customers, turning visitors into customers.</p>\r\n\r\n<p>The information you provide us, allows us to accurately and clearly identify your desires and plan your site.</p>\r\n\r\n<p><strong>The development of the website includes the following stages:</strong></p>\r\n\r\n<ol>\r\n	<li>Design / prototyping</li>\r\n	<li>Development of design</li>\r\n	<li>Layout</li>\r\n	<li>Programming</li>\r\n	<li>Testing</li>\r\n	<li>Production</li>\r\n</ol>\r\n\r\n<p>We categorically don&rsquo;t use any ready-made systems for website development (WordPress, OpenCart, etc.). We create projects completely ourselves, using the latest trends in web development. Choosing the right foundation for your site is the first and biggest step in setting up your business for success.</p>\r\n\r\n<p>You can rest assured that our web development strategy optimizes your site for alignment with your goals.</p>\r\n\r\n<p>In today&#39;s dynamic market, it is vital that your company has access to the most advanced Internet technologies. Our web development solutions are designed with your business processes in mind, offering your business the tools for smoother and more efficient management. We take measures to ensure the safe and efficient operation of your online infrastructure.</p>\r\n\r\n<p>Regardless of whether you are looking for a website development company to create a website from scratch or update your current website with the latest technological innovations, we hope that you will consider using our rich experience in developing and further supporting your site.</p>\r\n\r\n<p>We develop completely different projects, ranging from the usual site-business card or lending, and to large portals and social networks.</p>', 'Заказать разработку сайта', 'Order website development', 'оставьте заявку и мы свяжемся с Вами', 'leave a request and we will contact you', '0', 'Разработка сайта', 'Разработка прототипа, Индивидуальный дизайн, Кроссбраузерность, Система статистики, Система управления, SEO — оптимизация, Постоянное сопровождение'),
(2, 'Дизайн', 'design', 'design', '[\"Индивидуальный подход\", \"Профессиональный дизайн\", \"Усмотрение всех пожеланий клиента\", \"Дизайн веб приложений\", \"Корпоративный стиль\"]', '[\"Individual approach\", \"Professional design\", \"Examination of all the wishes of the client\", \"Web application design\", \"Corporate style\"]', '<p>Дизайн вашего сайта означает цветовую схему, макет, размер шрифта, и многие другие аспекты. Он должен выглядеть красиво, но он также должен быть практичным и &nbsp;понятным.</p>\r\n\r\n<p>Недостаточно, чтобы просто ваш сайт функционировал безупречно; он должен и выглядеть безупречно. Именно здесь на помощь приходят дизайнеры веб-сайтов.</p>\r\n\r\n<p>Мы специализируемся на создании красивого, профессионального и простого в использовании дизайна веб-сайта. Мы делаем веб дизайн, это не всегда сайты. Могут быть части сайта, баннера, логотипы, и т.п.</p>\r\n\r\n<p>Эти элементы объединяются для создания исключительного пользовательского интерфейса (UX). Это позитивное взаимодействие с вашим брендом укрепляет доверие, превращая посетителей вашего сайта в клиентов.</p>\r\n\r\n<p><strong>Мы создаем уникальный дизайн в несколько этапов:</strong></p>\r\n\r\n<p><strong>Тщательная консультация.</strong> Мы ставим в приоритет, узнать о потребностях клиента, его предпочтениях, антипатиях и любых идеях, которые могут быть у него.</p>\r\n\r\n<p><strong>Захват видения.</strong> После первоначальной консультации наша команда разрабатывает прототипы дизайна и создает несколько отличительных концепций дизайна, обеспечивающих различные видения, на основе ваших желаний.</p>\r\n\r\n<p><strong>Соображения конверсии. </strong>Мы создаем сайты, которые привлекают людей, и наша цель - превратить клиентов &ndash; в вашу прибыль. Мы включаем четкие пути для пользователей, чтобы обеспечить их конвертирование для вашего бизнеса.</p>\r\n\r\n<p>Мы гордимся своей интуитивной навигацией и повышаем эффективность процессов.</p>\r\n\r\n<p>Итак, давайте подведем итоги:</p>\r\n\r\n<p><strong>Мы считаем, что дизайн веб-сайта должен быть сосредоточен на следующем:</strong></p>\r\n\r\n<ul>\r\n	<li>Учитывать потребности и чувства целевой аудитории веб-сайта</li>\r\n	<li>Использование графических элементов надлежащим образом для демографии целевой аудитории</li>\r\n	<li>Использование унифицирующих элементов для усиления дизайна на сайте</li>\r\n	<li>Увеличение доверия ваших клиентов, с помощью уникального и современного дизайна</li>\r\n</ul>\r\n\r\n<p>Если у вас уже есть веб-сайт, который не приносят вам желаемых результатов, или если вы просто хотите обновить дизайн, то компания Web-icon может помочь вам.</p>\r\n\r\n<p>Вся наша дизайнерская работа выполняется исключительно профессиональными дизайнерами.</p>\r\n\r\n<p>Мы предлагаем редизайн сайта или проекты с нуля, и вы сможете достичь своих целей в сети, используя описанный выше процесс.</p>\r\n\r\n<p>Если вы хотите узнать больше или хотите обсудить свои варианты дизайна, свяжитесь с нами сегодня для бесплатной консультации!</p>', '<p>The design of your web-site means color scheme, layout, font size, and many other aspects. It should look beautiful, but it must also be practical and understandable.</p>\r\n\r\n<p>It&#39;s not enough that your site simply functions flawlessly; it should and look perfect. It is here that website designers come to their aid.</p>\r\n\r\n<p>We specialize in creating a beautiful, professional and easy-to-use website design. We do web design, it&#39;s not always sites. There may be parts of the site, banners, logos, etc.</p>\r\n\r\n<p>These elements are combined to create an exclusive user interface (UX). This positive interaction with your brand reinforces the trust by turning visitors to your site into customers.</p>\r\n\r\n<p><strong>We create a unique design in several stages:</strong></p>\r\n\r\n<p><strong>Thorough consultation.</strong> We put in priority, learn about the needs of the client, his preferences, dislikes and any ideas that he might have.</p>\r\n\r\n<p><strong>Vision capture.</strong> After the initial consultation, our team develops design prototypes and creates several distinctive design concepts that provide different visions, based on your desires.</p>\r\n\r\n<p><strong>Conversion considerations. </strong>We create websites that attract people, and our goal is to turn customers into your profits. We include clear ways for users to ensure their conversion for your business.</p>\r\n\r\n<p>We are proud of our intuitive navigation and increase the efficiency of processes.</p>\r\n\r\n<p>So, let&#39;s sum up the results:</p>\r\n\r\n<p><strong>We believe that the design of the website should focus on the following:</strong></p>\r\n\r\n<ul>\r\n	<li>Take into account the needs and feelings of the target audience of the website</li>\r\n	<li>Use graphic elements appropriately for demographics of the target audience</li>\r\n	<li>Use of unifying elements to strengthen the design on the site</li>\r\n	<li>Increase the trust of your customers with a unique and modern design</li>\r\n</ul>\r\n\r\n<p>If you already have a website that doesn&rsquo;t bring you the desired results, or if you just want to update the design, then Web-icon can help you.</p>\r\n\r\n<p>All our design work is performed exclusively by professional designers.</p>\r\n\r\n<p>We offer website redesign or projects from scratch, and you will be able to achieve your goals on the network using the process described above.</p>\r\n\r\n<p>If you want to know more or want to discuss your design options, contact us today for a free consultation!</p>', 'Заказать разработку дизайна', 'Order development of design', 'оставьте заявку и мы свяжемся с Вами', 'leave a request and we will contact you', '0', 'Дизайн', 'Индивидуальный подход, Профессиональный дизайн, Усмотрение всех пожеланий клиента, Дизайн веб приложений, Корпоративный стиль'),
(3, 'Маркетинг', 'Marketing', 'marketing', '[\"Анализ и стратегия продвижения\", \"Грамотный продающий текст\", \"Гарантия вывода в ТОП 10\", \"Оптимизация страниц сайта\", \"Консультация и рекомендации\", \"Поддержка проекта\"]', '[\"Analysis and promotion strategy\", \"Literate selling text\", \"Guarantee of withdrawal in the TOP 10\", \"Website Optimization\", \"Consultation and recommendations\", \"Project support\"]', '<p>Маркетинг - один из самых эффективных методов генерации лидерства, доступных вам сегодня - до тех пор, пока у вас есть эффективная стратегия контента.</p>\r\n\r\n<p>Наши руководящие принципы - это отношения и результаты. Мы действительно ценим создание отношений с нашими клиентами в интересах предоставления им наилучших результатов. Эти ценности объясняют, почему наши клиенты любят работать с командой Web-icon! Мы собрали уникальную команду дизайнеров, разработчиков и маркетологов с уникальными перспективами, интересами и опытом. Мы знаем интернет-маркетинг внутри и снаружи.</p>\r\n\r\n<p>Цифровой и поисковый маркетинг является важной частью любого веб-присутствия</p>\r\n\r\n<ul>\r\n	<li>Повышает узнаваемость бренда</li>\r\n	<li>Привлечение потенциальных клиентов</li>\r\n	<li>Интегрированная стратегия веб-маркетинга</li>\r\n	<li>Оценка веб-сайта и бренда для определения возможностей цифрового маркетинга</li>\r\n</ul>\r\n\r\n<p>Мы вдохнем жизнь в историю вашей компании, развивая брендинг, который продвигает вас &nbsp;и формирует четкий образ. Наша компания поможет вам сделать первый шаг или преодолеть последнее препятствие.</p>\r\n\r\n<p>Мы берем ваш бренд, платформу и бизнес, с которым вы так много работали, чтобы он мог выйти в жизнь. И мы не просто бросаем вас к волкам, заметьте, а скорее готовим вас к выходу на рынок. Таким образом, мы помогаем вам достичь уровня воздействия путем размещения, исполнения, креативных концепций и всеобъемлющие кампании будут помогать вам достигать ваших целей.</p>\r\n\r\n<p>Наши передовые целевые решения помогают вам привлекать нужных клиентов, конвертировать потенциальных клиентов и развивать свой бизнес. Как вы узнаете, что ваша маркетинговая программа эффективна и экономична? Мы создадим измеримые маркетинговые кампании &ndash; с отслеживанием каждого клика, каждого нового клиента, - так что вы будете знать, что ваши рекламные доллары прилагают все усилия, чтобы принести вам больше успеха.</p>\r\n\r\n<p><strong>Мы предлагаем вам следующее:</strong></p>\r\n\r\n<p>Эксперты в области профессионального SEO, управление рекламными кампаниями</p>\r\n\r\n<p>Среди всех агентств интернет-маркетинга, мы единственные, кто генерирует, проверяет и сообщает о результатах онлайн-продаж в режиме реального времени</p>\r\n\r\n<p>Уникальная технология отслеживания новых клиентов</p>\r\n\r\n<p>Эксперты в области E-commerce трафика и получения доходов</p>\r\n\r\n<p>Высокопрозрачная компания - как в работе, так и в общении</p>\r\n\r\n<p>Благодаря нашему опыту в области цифрового маркетинга и благодаря инновационному и креативному мышлению, Web-icon может действительно помочь вашему бизнесу улучшить и оптимизировать маркетинговые усилия, которые приведут к результатам, возможностям и продажам.</p>', '<p>Marketing is one of the most effective methods of generating leadership available to you today - as long as you have an effective content strategy.</p>\r\n\r\n<p>Our guidelines are relationships and results. We really appreciate the creation of relations with our customers in order to provide them with the best results. These values ​​explain why our customers like to work with the Web-icon team! We have assembled a unique team of designers, developers and marketers with unique perspectives, interests and experience. We know Internet marketing inside and out.</p>\r\n\r\n<p>Digital and search marketing is an important part of any web presence</p>\r\n\r\n<ul>\r\n	<li>Improves brand awareness</li>\r\n	<li>Attracting potential customers</li>\r\n	<li>Integrated web marketing strategy</li>\r\n	<li>Evaluating a website and brand to identify digital marketing opportunities</li>\r\n</ul>\r\n\r\n<p>We will breathe life into the history of your Company developing branding that promotes you and forms a clear image. Our company will help you take the first step or overcome the last obstacle.</p>\r\n\r\n<p>We take your brand, platform and business, with which you worked so much so that it could come to life. And we do not just throw you to the wolves, mind you, but rather prepare you to enter the market. Thus, we help you achieve a level of impact through placement, execution, creative concepts and a comprehensive campaign will help you achieve your goals.</p>\r\n\r\n<p>Our advanced target solutions help you attract the right customers, convert potential customers and grow your business. How will you know that your marketing program is efficient and economical? We will create measurable marketing campaigns - with tracking every click, every new customer - so that you will know that your advertising dollars are doing their best to bring you more success.</p>\r\n\r\n<p><strong>We offer you the following:</strong></p>\r\n\r\n<p>Experts in the field of professional SEO, management of advertising campaigns</p>\r\n\r\n<p>Among all Internet marketing agencies, we are the only ones who generate, verify and report on the results of online sales in real time</p>\r\n\r\n<p>Unique technology for tracking new customers</p>\r\n\r\n<p>Experts in the field of E-commerce traffic and revenue generation</p>\r\n\r\n<p>Highly transparent company - both in work and in communication</p>\r\n\r\n<p>Thanks to our experience in digital marketing and through innovative and creative thinking, Web-icon can really help your business improve and optimize marketing efforts that will lead to results, opportunities and sales.</p>', 'Заказать маркетинг проекта', 'Order marketing project', 'оставьте заявку и мы свяжемся с Вами', 'leave a request and we will contact you', '0', 'Маркетинг', 'Анализ и стратегия продвижения, Грамотный продающий текст, Гарантия вывода в ТОП 10, Оптимизация страниц сайта, Консультация и рекомендации, Поддержка проекта'),
(4, 'Поддержка', 'Support', 'support', '[\"Контроль стабильности работы\", \"Тестирование работоспособности\", \"Устранение технических проблем и ошибок\", \"Оптимизация скорости загрузки\", \"Доработки сайта\", \"Создание резервных копий\", \"Защита от атак\"]', '[\"Control of job stability\", \"Performance testing\", \"Elimination of technical problems and errors\", \"Optimizing download speed\", \"Site development\", \"Create backups\", \"Protection against attacks\"]', '<p>Так же, как дом или бизнес, также и ваш сайт нуждается в поддержке. Когда что-то ломается, то нужно это исправлять. Когда он стареет, его необходимо обновить. Обслуживание веб-сайта может быть сложным и трудоемким процессов, поэтому, почему бы и не попросить Web-icon о помощи? Мы предлагаем обслуживание веб-сайта, безопасность веб-сайта, управление приложениями, сканирование и средства защиты, обучение, консультации и многое другое.</p>\r\n\r\n<p>Помимо самой разработки сайтов с нуля мы также оказываем надежную поддержку наших клиентов.</p>\r\n\r\n<p>Ваш сайт должен работать постоянно, быть надежно защищенным, обновляться и не содержать ошибок. Если какая-либо часть этих критериев не выполняется, то мы вступаем в действие.</p>\r\n\r\n<p>Мы можем консультироваться, планировать и разрабатывать стратегии. Мы можем отслеживать время безотказной работы и производительность. Помимо всего прочего мы &nbsp;делаем оптимизацию скорости работы сайта</p>\r\n\r\n<p>Наша команда профессионалов сможет помочь вам в устранении ошибок, вирусов и улучшении вашего сайта с течением времени.</p>\r\n\r\n<p>Мы работаем с вами, чтобы защитить ваши инвестиции и улучшить их. Мы добавляем новые функции, исправляем то, что сломалось, и упрощаем администрирование.</p>\r\n\r\n<p>Наша миссия - безопасность и производительность веб-сайта</p>\r\n\r\n<p>Почему люди уходят с некоторых сайтов?</p>\r\n\r\n<p>Медленное время загрузки = высокие показатели отказов. Google фактически рассчитывает время загрузки вашего сайта в своем алгоритме ранжирования страниц.</p>\r\n\r\n<p>Думаете, вы в безопасности от хакеров?</p>\r\n\r\n<p>Любой &ndash; абсолютно любой сайт может стать объектом для хакеров. Посетители вашего сайта могут стать жертвами вирусов, если бот находит хотя одну слабую точку в коде вашего сайта.</p>\r\n\r\n<p>Мы можем помочь.</p>', '<p>Just like home or business, also your website needs support. When something breaks, you need to fix it. When the site becomes old, it needs to be updated. Serving a website can be a complex and time-consuming process, so why not ask the Web-icon for help? We offer web site maintenance, website security, application management, scanning and protection tools, training, advice and much more.</p>\r\n\r\n<p>In addition to the very development of sites from scratch, we also provide reliable support for our customers.</p>\r\n\r\n<p>Your site should work constantly, be securely protected, updated and don&rsquo;t contain errors. If any part of these criteria is not met, then we come into act.</p>\r\n\r\n<p>We can consult, plan and develop strategies. We can track uptime and performance. In addition, we optimize the speed of the site.</p>\r\n\r\n<p>Our team of professionals will be able to help you in eliminating bugs, viruses and improving your site over time.</p>\r\n\r\n<p>We work with you to protect your investments and improve them. We add new features, fix what&#39;s broken, and simplify administration.</p>\r\n\r\n<p>Our mission is the security and performance of the website.</p>\r\n\r\n<p>Why do people leave from some sites?</p>\r\n\r\n<p>Slow loading time = high failure rates. Google actually calculates the time of loading your site in its algorithm of page ranking.</p>\r\n\r\n<p>Do you think you are safe from hackers?</p>\r\n\r\n<p>Anyone - absolutely any site can become an object for hackers. Visitors to your site can become victims of viruses, if the bot finds one weak point in the code of your site.</p>\r\n\r\n<p>We can help you.</p>', 'Заказать поддержку сайта', 'Order site support', 'оставьте заявку и мы свяжемся с Вами', 'leave a request and we will contact you', '0', 'Поддержка', 'Контроль стабильности работы, Тестирование работоспособности\", Устранение технических проблем и ошибок, Оптимизация скорости загрузки, Доработки сайта, Создание резервных копий, Защита от атак');

-- --------------------------------------------------------

--
-- Структура таблицы `status_orders`
--

CREATE TABLE `status_orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `status_orders`
--

INSERT INTO `status_orders` (`id`, `name`, `name_en`) VALUES
(1, 'status_1', 'status_1'),
(2, 'status_2', 'status_2'),
(3, 'status_3', 'status_3');

-- --------------------------------------------------------

--
-- Структура таблицы `topics`
--

CREATE TABLE `topics` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gmail.com', '$2y$10$f/SgtMRJfyR9u7qUXrXBW.S8QhaxXFq1hT2PAbxqKGIP7deqdPDTi', 'j0bVaiEr9aoqZq6MByEEIRiGrFFpgFgqt8jhCSmx82AufDv6PvNJL2awKEV7', NULL, NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `articles_category_id_foreign` (`category_id`);

--
-- Индексы таблицы `category_articles`
--
ALTER TABLE `category_articles`
  ADD PRIMARY KEY (`id`);

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
  ADD KEY `client_orders_client_id_foreign` (`client_id`),
  ADD KEY `client_orders_order_id_foreign` (`order_id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_service_id_foreign` (`service_id`),
  ADD KEY `orders_status_id_foreign` (`status_id`);

--
-- Индексы таблицы `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

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
  ADD KEY `portfolios_category_id_foreign` (`category_id`);

--
-- Индексы таблицы `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `roles_users`
--
ALTER TABLE `roles_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `roles_users_user_id_foreign` (`user_id`),
  ADD KEY `roles_users_role_id_foreign` (`role_id`);

--
-- Индексы таблицы `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `status_orders`
--
ALTER TABLE `status_orders`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `topics`
--
ALTER TABLE `topics`
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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `category_articles`
--
ALTER TABLE `category_articles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `category_portfolios`
--
ALTER TABLE `category_portfolios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `client_orders`
--
ALTER TABLE `client_orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `portfolios`
--
ALTER TABLE `portfolios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `roles_users`
--
ALTER TABLE `roles_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `services`
--
ALTER TABLE `services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `status_orders`
--
ALTER TABLE `status_orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `topics`
--
ALTER TABLE `topics`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `articles_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `category_articles` (`id`);

--
-- Ограничения внешнего ключа таблицы `client_orders`
--
ALTER TABLE `client_orders`
  ADD CONSTRAINT `client_orders_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  ADD CONSTRAINT `client_orders_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Ограничения внешнего ключа таблицы `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`),
  ADD CONSTRAINT `orders_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `status_orders` (`id`);

--
-- Ограничения внешнего ключа таблицы `portfolios`
--
ALTER TABLE `portfolios`
  ADD CONSTRAINT `portfolios_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `category_portfolios` (`id`);

--
-- Ограничения внешнего ключа таблицы `roles_users`
--
ALTER TABLE `roles_users`
  ADD CONSTRAINT `roles_users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `roles_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
