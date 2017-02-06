-- phpMyAdmin SQL Dump
-- version 4.4.15.7
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1:3306
-- Время создания: Фев 06 2017 г., 17:44
-- Версия сервера: 5.5.50
-- Версия PHP: 7.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `laravelNews`
--

-- --------------------------------------------------------

--
-- Структура таблицы `articles`
--

CREATE TABLE IF NOT EXISTS `articles` (
  `id` int(10) unsigned NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fulltext` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_k` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_d` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `articles`
--

INSERT INTO `articles` (`id`, `title`, `fulltext`, `author`, `meta_k`, `meta_d`, `created_at`, `updated_at`) VALUES
(1, 'Статья 1', 'Текст статьи', 'Иванов', 'ключи', 'описание', NULL, NULL),
(2, 'Текст статьи 2', 'полный текст 2', 'Петров', 'ключи ', 'описание', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2017_02_04_152740_create_table_articles', 1),
(4, '2017_02_04_152908_create_table_news', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `id` int(10) unsigned NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_desc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fulltext` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '/no_image.jpg',
  `meta_k` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_d` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `news`
--

INSERT INTO `news` (`id`, `title`, `short_desc`, `fulltext`, `img`, `meta_k`, `meta_d`, `created_at`, `updated_at`) VALUES
(1, 'How to add Tagging to your Laravel App', 'In recent years, tagging systems have become a popular way of categorizing items, and you can find them in almost every app. From blog posts to todo lists, they all have tagging implementations.', '<p>&nbsp;</p>\r\n\r\n<p>In recent years, tagging systems have become a popular way of categorizing items, and you can find them in almost every app. From blog posts to todo lists, they all have tagging implementations.</p>\r\n\r\n<p>Let&rsquo;s look at how easy integrating a tagging system is in a Laravel app. In the <a href="http://links.laravel-news.com/">Laravel Links</a> app I created a few weeks back I decided to add tagging to the links and what follows is instructions for setting it up.</p>\r\n\r\n<h2>Installing a Tagging package</h2>\r\n\r\n<p>The community has created several tagging packages, and you will need to research which one suits your use case. Here are three of the most popular ones I found:</p>\r\n\r\n<ul>\r\n	<li><a href="https://cartalyst.com/manual/tags/2.0">Cartalyst Tags</a></li>\r\n	<li><a href="https://github.com/cviebrock/eloquent-taggable">Eloquent Taggable</a></li>\r\n	<li><a href="https://github.com/rtconner/laravel-tagging">Laravel Tagging</a></li>\r\n</ul>\r\n\r\n<p>I choose the Laravel Tagging package by <a href="https://github.com/rtconner">rtconner</a>, and the installation is simple.</p>\r\n\r\n<p>First require the package:</p>\r\n\r\n<pre>\r\n<code>composer require rtconner/laravel-tagging &quot;~2.0&quot;\r\n</code></pre>\r\n\r\n<p>Open config/app.php and add it to the providers array:</p>\r\n\r\n<pre>\r\n<code>Conner\\Tagging\\Providers\\TaggingServiceProvider::class,\r\n</code></pre>\r\n\r\n<p>Now run publish the vendor folder with Artisan:</p>\r\n\r\n<pre>\r\n<code>php artisan vendor:publish --provider=&quot;Conner\\Tagging\\Providers\\TaggingServiceProvider&quot;\r\n</code></pre>\r\n\r\n<p>Finally, migrate the database:</p>\r\n\r\n<pre>\r\n<code>php artisan migrate\r\n</code></pre>\r\n\r\n<p>Now we are ready to add the trait to our model. My model is named &ldquo;Links.php&rdquo; and here is the class:</p>\r\n\r\n<pre>\r\n<code>use Conner\\Tagging\\Taggable;\r\n\r\nclass Links extends Model\r\n{\r\n    use Taggable;\r\n\r\n    protected $table = &#39;links&#39;;\r\n</code></pre>\r\n\r\n<p>That is all it takes to get setup and ready to use; however, it leaves out an important step. Tagging typically needs JavaScript and styling to make it easy for the user to select an existing tag or add a new one.</p>\r\n\r\n<h2>Installing jQuery and Selectize</h2>\r\n\r\n<p><a href="https://brianreavis.github.io/selectize.js/">Selectize</a> by Brian Reavis is a jQuery based plugin that turns an input field into a tagging system. This plugin can easily be installed through NPM and then setup using <a href="http://browserify.org/">Browserify</a> with Elixir.</p>\r\n\r\n<p>In your terminal install jQuery and Selectize and automatically save them to your package.json with the following:</p>\r\n\r\n<pre>\r\n<code>npm install jquery --save\r\nnpm install selectize --save\r\n</code></pre>\r\n\r\n<p>If you open package.json now you should see the following dependencies:</p>\r\n\r\n<pre>\r\n<code>&quot;dependencies&quot;: {\r\n  &quot;laravel-elixir&quot;: &quot;^3.0.0&quot;,\r\n  &quot;bootstrap-sass&quot;: &quot;^3.0.0&quot;,\r\n  &quot;jquery&quot;: &quot;^2.1.4&quot;,\r\n  &quot;selectize&quot;: &quot;^0.12.1&quot;\r\n}\r\n</code></pre>\r\n\r\n<p>Bootstrap and Elixir come pre-included in a default Laravel install. Which will now use to finish off the installation.</p>\r\n\r\n<p>Create a file <code>resources/assets/js/app.js</code> and include the following:</p>\r\n\r\n<pre>\r\n<code>window.$ = window.jQuery = require(&#39;jquery&#39;)\r\nrequire(&#39;selectize&#39;);\r\nvar bootstrap = require(&#39;bootstrap-sass&#39;);\r\n\r\n$( document ).ready(function() {\r\n    $(&#39;#tags&#39;).selectize({\r\n        delimiter: &#39;,&#39;,\r\n        persist: false,\r\n        valueField: &#39;tag&#39;,\r\n        labelField: &#39;tag&#39;,\r\n        searchField: &#39;tag&#39;,\r\n        options: tags,\r\n        create: function(input) {\r\n            return {\r\n                tag: input\r\n            }\r\n        }\r\n    });\r\n});\r\n</code></pre>\r\n\r\n<p>What this is going to do is utilize browserify to pull in jQuery, Selectize, and Bootstrap JavaScript into our file. We assign jQuery to the window so that plugins can read it from the global scope. Then we are assigning the Selectize Plugin to any input with the id of &ldquo;tags&rdquo;.</p>\r\n\r\n<p>Before we can compile, we need to adjust our gulp file.</p>\r\n\r\n<pre>\r\n<code>elixir(function(mix) {\r\n    mix.sass(&#39;app.scss&#39;)\r\n        .browserify(&#39;app.js&#39;);\r\n});\r\n</code></pre>\r\n\r\n<p>The unique change here is the call to browserify. That call allows our &ldquo;require&rdquo; lines to pull in the proper dependencies.</p>\r\n\r\n<p><br />\r\n&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Bootstrap Styles</h2>\r\n\r\n<p>Since Bootstrap is already included we can utilize it to handle our styles. Open app.scss and uncomment this line:</p>\r\n\r\n<pre>\r\n<code>@import &quot;node_modules/bootstrap-sass/assets/stylesheets/bootstrap&quot;;\r\n</code></pre>\r\n\r\n<p>This will pull in bootstrap directly from the node_modules directory.</p>\r\n\r\n<p>All that is left is to pull in styles for Selectize. The plugin ships with bootstrap support and it&rsquo;s just a matter of importing that css file:</p>\r\n\r\n<pre>\r\n<code>@import &quot;node_modules/selectize/dist/css/selectize.bootstrap3&quot;;\r\n</code></pre>\r\n\r\n<p>Now if you run <code>gulp</code> everything should compile, and your views will display properly.</p>\r\n\r\n<h2>Displaying and Saving Tags</h2>\r\n\r\n<p>In our template, we need to create two new items. An input field for adding tags and a JavaScript array of existing tags so Selectize can autocomplete.</p>\r\n\r\n<p>In our controller pull out all existing tags and assign them to the view:</p>\r\n\r\n<pre>\r\n<code>$tags = Links::existingTags()-&gt;pluck(&#39;name&#39;);\r\nreturn view(&#39;create&#39;, compact(&#39;tags&#39;));\r\n</code></pre>\r\n\r\n<p>Then in our create template add the tags input:</p>\r\n\r\n<pre>\r\n<code>&lt;input type=&quot;text&quot; name=&quot;tags&quot; id=&quot;tags&quot;&gt;\r\n</code></pre>\r\n\r\n<p>Next a new JavaScript array of tags:</p>\r\n\r\n<pre>\r\n<code>&lt;script&gt;\r\nvar tags = [\r\n    @foreach ($tags as $tag)\r\n    {tag: &quot;{{$tag}}&quot; },\r\n    @endforeach\r\n];\r\n&lt;/script&gt;\r\n</code></pre>\r\n\r\n<p>Now when the form is submitted create the model and attach the tags:</p>\r\n\r\n<pre>\r\n<code>// Create the link first\r\n$link = Links::create([...]);\r\n\r\n// Now add tags\r\n$link-&gt;tag(explode(&#39;,&#39;, $request-&gt;tags));\r\n</code></pre>\r\n\r\n<p>With this all set you should now be able to save tags and autocomplete existing tags.</p>\r\n\r\n<h2>More tagging options</h2>\r\n\r\n<p>The Laravel Tagging package includes a lot more features than what has been shown so far. Here is a list of all available features:</p>\r\n\r\n<p><strong>Eager Loading</strong></p>\r\n\r\n<pre>\r\n<code>$link = Link::with(&#39;tagged&#39;)-&gt;first(); // eager load\r\n</code></pre>\r\n\r\n<p><strong>Removing Tags</strong></p>\r\n\r\n<pre>\r\n<code>$link-&gt;untag(&#39;laravel&#39;); // remove Laravel tag\r\n$article-&gt;untag(); // remove all tags\r\n</code></pre>\r\n\r\n<p><strong>Syncing Tags</strong></p>\r\n\r\n<pre>\r\n<code>$link-&gt;retag([&#39;tutorial&#39;, &#39;package&#39;]); // delete current tags and save new tags\r\n</code></pre>\r\n\r\n<p><strong>Fetching by Tag</strong></p>\r\n\r\n<pre>\r\n<code>Link::withAnyTag([&#39;laravel&#39;,&#39;tutorial&#39;])-&gt;get(); // fetch with any tag listed\r\n\r\nLink::withAllTags([&#39;package&#39;, &#39;php&#39;])-&gt;get(); // only fetch with all the tags\r\n</code></pre>\r\n\r\n<p>If you have any questions on how I did things or have feedback, please comment below.</p>\r\n\r\n<p>&nbsp;</p>', 'laravel-tagging.jpg', 'ключи', 'описание', '2017-02-06 10:00:00', '2017-02-06 07:53:38'),
(2, 'How to use WordPress as a backend for a Laravel Application', 'Last week I relaunched Laravel News, and the new site is running on Laravel with WordPress as the backend. I’ve been using WordPress for the past two years, and I’ve grown to enjoy the features that it provides. The publishing experience...', '<p>&nbsp;</p>\r\n\r\n<p>Last week I <a href="https://laravel-news.com/welcome-to-the-next-version-of-laravel-news">relaunched Laravel News</a>, and the new site is running on Laravel with WordPress as the backend. I&rsquo;ve been using WordPress for the past two years, and I&rsquo;ve grown to enjoy the features that it provides. The publishing experience, the media manager, the mobile app, and Jetpack for tracking stats.</p>\r\n\r\n<p>I wasn&rsquo;t ready to give these features up, and I didn&rsquo;t have the time to build my own system, so I decided to keep WordPress and just use an API plugin to pull all the content I needed out, then store it in my Laravel application. In this tutorial, I wanted to outline how I set it all up.</p>\r\n\r\n<p>Please keep in mind there are several different ways of doing this, and you can take a look at the <a href="https://laravel-news.com/wordpress-and-laravel">WordPress and Laravel</a> post for a list of third party packages and resources that others have created to solve this same task. The primary options are to either hook into the WordPress database, pull from the API, or sync data from one system to the other.</p>\r\n\r\n<p>I choose the sync option because I wanted everything separated. While researching I came across a package called <a href="https://github.com/jasonherndon/WordpressToLaravel">WordPressToLaravel</a> that does this, however, it only works with the wordpress.com hosted sites.</p>\r\n\r\n<p>I decided to create my own system for working with a self-hosted WordPress install. This method requires more work up front, but it allows my site to be a typical Laravel application that I can easily improve and extend as needed.</p>\r\n\r\n<p>Once I had it syncing content, I then set it up as a recurring task through the <a href="https://laravel-news.com/laravel-5-scheduler">Laravel Scheduler</a>, so it&rsquo;s completely automated.</p>\r\n\r\n<p>My setup is also entirely custom for my needs. I only wanted to pull posts, categories, and tags. Pages and other sections are all driven by either static Blade files or other API&rsquo;s.</p>\r\n\r\n<p>Let&rsquo;s go through how this all works.</p>\r\n\r\n<h2>WordPress API</h2>\r\n\r\n<p>WordPress doesn&rsquo;t ship with an API; however, the community has built a plugin named <a href="http://v2.wp-api.org/">WP Rest API</a> that allows any blog to have a jSON API.</p>\r\n\r\n<p>In my case, I&rsquo;m doing read-only requests that do not require any authentication. That makes reading and fetching data easy and simplifies a lot of code.</p>\r\n\r\n<p>Here is my basic class to fetch a list of posts:</p>\r\n\r\n<pre>\r\n<code>class WpApi\r\n{\r\n    protected $url = &#39;http://site.com/wp-json/wp/v2/&#39;;\r\n\r\n    public function importPosts($page = 1)\r\n    {\r\n        $posts = collect($this-&gt;getJson($this-&gt;url . &#39;posts/?_embed&amp;filter[orderby]=modified&amp;page=&#39; . $page));\r\n        foreach ($posts as $post) {\r\n            $this-&gt;syncPost($post);\r\n        }\r\n    }\r\n\r\n    protected function getJson($url)\r\n    {\r\n        $response = file_get_contents($url, false);\r\n        return json_decode( $response );\r\n    }\r\n}\r\n</code></pre>\r\n\r\n<p>Now when you call WpAPI-&gt;importPosts() it will grab the first page of results. The query string is worth mentioning because it has a few special clauses. The first is <code>_embed</code> which will embed all the extra data like image embeds, categories, and tags. Next is a filter to order by last modified that way when you edit a post on WordPress it is then on the first page of results, meaning it&rsquo;s resynced.</p>\r\n\r\n<p>Next, we need the ability to sync the post with our database. Here is how I set it up:</p>\r\n\r\n<pre>\r\n<code>protected function syncPost($data)\r\n{\r\n    $found = Post::where(&#39;wp_id&#39;, $data-&gt;id)-&gt;first();\r\n\r\n    if (! $found) {\r\n        return $this-&gt;createPost($data);\r\n    }\r\n\r\n    if ($found and $found-&gt;updated_at-&gt;format(&quot;Y-m-d H:i:s&quot;) &lt; $this-&gt;carbonDate($data-&gt;modified)-&gt;format(&quot;Y-m-d H:i:s&quot;)) {\r\n        return $this-&gt;updatePost($found, $data);\r\n    }\r\n}\r\n\r\nprotected function carbonDate($date)\r\n{\r\n    return Carbon::parse($date);\r\n}\r\n</code></pre>\r\n\r\n<p>For this step, I added a <code>wp_id</code> field to my own Posts table that way I have a one to one between my local database and WordPress.</p>\r\n\r\n<p>Next, I just check and see if it doesn&rsquo;t exist, then create it. Otherwise, update it, if it&rsquo;s been modified since it was originally synced.</p>\r\n\r\n<p>The <code>createPost</code> and <code>updatePost</code> are typical Laravel Eloquent inserts or updates. Here is the code for create:</p>\r\n\r\n<pre>\r\n<code>protected function createPost($data)\r\n{\r\n    $post = new Post();\r\n    $post-&gt;id = $data-&gt;id;\r\n    $post-&gt;wp_id = $data-&gt;id;\r\n    $post-&gt;user_id = $this-&gt;getAuthor($data-&gt;_embedded-&gt;author);\r\n    $post-&gt;title = $data-&gt;title-&gt;rendered;\r\n    $post-&gt;slug = $data-&gt;slug;\r\n    $post-&gt;featured_image = $this-&gt;featuredImage($data-&gt;_embedded);\r\n    $post-&gt;featured = ($data-&gt;sticky) ? 1 : null;\r\n    $post-&gt;excerpt = $data-&gt;excerpt-&gt;rendered;\r\n    $post-&gt;content = $data-&gt;content-&gt;rendered;\r\n    $post-&gt;format = $data-&gt;format;\r\n    $post-&gt;status = &#39;publish&#39;;\r\n    $post-&gt;publishes_at = $this-&gt;carbonDate($data-&gt;date);\r\n    $post-&gt;created_at = $this-&gt;carbonDate($data-&gt;date);\r\n    $post-&gt;updated_at = $this-&gt;carbonDate($data-&gt;modified);\r\n    $post-&gt;category_id = $this-&gt;getCategory($data-&gt;_embedded-&gt;{&quot;wp:term&quot;});\r\n    $post-&gt;save();\r\n    $this-&gt;syncTags($post, $data-&gt;_embedded-&gt;{&quot;wp:term&quot;});\r\n    return $post;\r\n}\r\n</code></pre>\r\n\r\n<p>If you look carefully, there are a few special cases like the author, featured image, category, and tags. Those come from the <code>_embed</code> in the original query string and syncing that data is just a matter of doing the same thing as previous.</p>\r\n\r\n<pre>\r\n<code>public function featuredImage($data)\r\n{\r\n    if (property_exists($data, &quot;wp:featuredmedia&quot;)) {\r\n        $data = head($data-&gt;{&quot;wp:featuredmedia&quot;});\r\n        if (isset($data-&gt;source_url)) {\r\n            return $data-&gt;source_url;\r\n        }\r\n    }\r\n    return null;\r\n}\r\n\r\npublic function getCategory($data)\r\n{\r\n    $category = collect($data)-&gt;collapse()-&gt;where(&#39;taxonomy&#39;, &#39;category&#39;)-&gt;first();\r\n    $found = Category::where(&#39;wp_id&#39;, $category-&gt;id)-&gt;first();\r\n    if ($found) {\r\n        return $found-&gt;id;\r\n    }\r\n    $cat = new Category();\r\n    $cat-&gt;id = $category-&gt;id;\r\n    $cat-&gt;wp_id = $category-&gt;id;\r\n    $cat-&gt;name = $category-&gt;name;\r\n    $cat-&gt;slug = $category-&gt;slug;\r\n    $cat-&gt;description = &#39;&#39;;\r\n    $cat-&gt;save();\r\n    return $cat-&gt;id;\r\n}\r\n\r\nprivate function syncTags(Post $post, $tags)\r\n{\r\n    $tags = collect($tags)-&gt;collapse()-&gt;where(&#39;taxonomy&#39;, &#39;post_tag&#39;)-&gt;pluck(&#39;name&#39;)-&gt;toArray();\r\n    if (count($tags) &gt; 0) {\r\n        $post-&gt;setTags($tags);\r\n    }\r\n}\r\n</code></pre>\r\n\r\n<p>For the category I am pulling out the first category the post is assigned to because I only want one post per category, then in syncTags, I&rsquo;m utilizing the <a href="https://cartalyst.com/manual/tags/2.0">Tags package by Cartalyst</a>.</p>\r\n\r\n<h2>Creating a Scheduled Command</h2>\r\n\r\n<p>The final step to complete the import is to build a scheduled task to automatically pull posts down. I created a command named Importer through Artisan:</p>\r\n\r\n<pre>\r\n<code>php artisan make:console Importer\r\n</code></pre>\r\n\r\n<p>Then in the handle method:</p>\r\n\r\n<pre>\r\n<code>$page = ($this-&gt;argument(&#39;page&#39;)) ? $this-&gt;argument(&#39;page&#39;) : 1;\r\n$this-&gt;wpApi-&gt;importPosts($page);\r\n</code></pre>\r\n\r\n<p>Finally, in Console/Kernel set this to run every minute:</p>\r\n\r\n<pre>\r\n<code>$schedule-&gt;command(&#39;import:wordpress&#39;)\r\n    -&gt;everyMinute();\r\n</code></pre>\r\n\r\n<p>Now every minute of every day it attempts to sync the data and either create, update, or ignore the posts.</p>\r\n\r\n<h2>Going Further</h2>\r\n\r\n<p>This is a basic outline in how I set this feature up, and it only scratches the surface on what all could be done. For example, I&rsquo;m heavily caching all the DB queries within the site and during this sync process if something is updated then the related cache is cleared.</p>\r\n\r\n<p>I hope this helps show you that utilizing WordPress as a backend is not that hard to manage and at the same time gives you tons of benefits like creating posts from mobile, using it&rsquo;s media manager, and even writing in Markdown with Jetpack.</p>\r\n\r\n<p>&nbsp;</p>', 'laravel-wordpress.jpg', 'ключи новость 2', 'описание новость 2', '2017-02-06 08:11:00', '2017-02-06 07:58:39'),
(48, 'Automatically Send Tweets through Laravel Notifications', 'One of the exciting new features that came out in Laravel 5.3 was Laravel Notifications, and they allow you to send quick updates through a variety of services.', '<p>&nbsp;</p>\r\n\r\n<p>One of the exciting new features that came out in <a href="https://laravel-news.com/laravel-5-3-is-now-released/">Laravel 5.3</a> was <a href="https://laravel-news.com/laravel-notifications-easily-send-quick-updates-through-slack-sms-email-and-more/">Laravel Notifications</a>, and they allow you to send quick updates through a variety of services.</p>\r\n\r\n<p>Included in the Laravel core is support for Email, Slack, and Nexmo but you can build your own or visit the <a href="https://laravel-news.com/new-community-project-laravel-notification-channels/">community project</a> where a lot of integrations have already been built.</p>\r\n\r\n<p>As I am working on this site I wanted to automatically send a tweet whenever a new post is published and a <a href="http://laravel-notification-channels.com/twitter/">package</a>, for this has already been created by <a href="https://twitter.com/christophrumpel">Christoph Rumpel</a>. Let&rsquo;s take a look at how easy it is to integrate the Twitter package and automatically tweet out new posts.</p>\r\n\r\n<h2>Twitter Package Setup</h2>\r\n\r\n<p>First, install the package:</p>\r\n\r\n<pre>\r\n<code>composer require laravel-notification-channels/twitter\r\n</code></pre>\r\n\r\n<p>Next, add the provider to config/app.php</p>\r\n\r\n<pre>\r\n<code>...\r\n&#39;providers&#39; =&gt; [\r\n    ...\r\n     NotificationChannels\\Twitter\\TwitterServiceProvider::class,\r\n],\r\n...\r\n</code></pre>\r\n\r\n<p>Finally, create a <a href="https://apps.twitter.com/">new app on Twitter</a> and add your config to the config/services.php file and your .env:</p>\r\n\r\n<pre>\r\n<code>...\r\n&#39;twitter&#39; =&gt; [\r\n    &#39;consumer_key&#39;    =&gt; getenv(&#39;TWITTER_CONSUMER_KEY&#39;),\r\n    &#39;consumer_secret&#39; =&gt; getenv(&#39;TWITTER_CONSUMER_SECRET&#39;),\r\n    &#39;access_token&#39;    =&gt; getenv(&#39;TWITTER_ACCESS_TOKEN&#39;),\r\n    &#39;access_secret&#39;   =&gt; getenv(&#39;TWITTER_ACCESS_SECRET&#39;)\r\n]\r\n...\r\n</code></pre>\r\n\r\n<p>Tip: The access_token and access_secret can be found on the &ldquo;Keys and Access Tokens&rdquo; tab of your Twitter app page.</p>\r\n\r\n<h2>Sending the Tweet</h2>\r\n\r\n<p>For my setup, I have a Post model that I&rsquo;ll be using to send out the tweet from, but you can use any model you already have. Just add the Notifiable trait to it:</p>\r\n\r\n<pre>\r\n<code>class Post extends Model\r\n{\r\n    use Notifiable;\r\n\r\n</code></pre>\r\n\r\n<p>Next, create your notification class:</p>\r\n\r\n<pre>\r\n<code>php artisan make:notification PostPublished\r\n</code></pre>\r\n\r\n<p>Open up this file and adjust the <code>via</code> method and add a <code>toTwitter</code> method. Here is the completed class:</p>\r\n\r\n<pre>\r\n<code>&lt;?php\r\n\r\nnamespace App\\Notifications;\r\n\r\nuse Illuminate\\Notifications\\Notification;\r\nuse NotificationChannels\\Twitter\\TwitterChannel;\r\nuse NotificationChannels\\Twitter\\TwitterStatusUpdate;\r\n\r\nclass PostPublished extends Notification\r\n{\r\n    public function via($notifiable)\r\n    {\r\n        return [TwitterChannel::class];\r\n    }\r\n\r\n    public function toTwitter($notifiable) {\r\n        return new TwitterStatusUpdate(&#39;You should follow @laravelnews https://laravel-news.com/&#39;);\r\n    }\r\n}\r\n</code></pre>\r\n\r\n<p>Now to call this all you have to do is grab a Post and send it off:</p>\r\n\r\n<pre>\r\n<code>$post = Post::find(1);\r\n$post-&gt;notify(new PostPublished());\r\n</code></pre>\r\n\r\n<p>The final change we need to make is to update the <code>toTwitter</code> method in the PostPublished class, so it includes the actual post data.</p>\r\n\r\n<pre>\r\n<code>public function toTwitter($post) {\r\n    return new TwitterStatusUpdate($post-&gt;title .&#39; https://laravel-news.com/&#39;. $post-&gt;uri, [$post-&gt;featured_image]);\r\n}\r\n</code></pre>\r\n\r\n<p>The Post model is passed into the method, and then I just pull out the title, the full path to the post and add the post&rsquo;s featured image as a second param.</p>\r\n\r\n<p>That&rsquo;s it!</p>\r\n\r\n<p>These notification channels are simplifying the integration with a lot of external services that in the past would have been a chore to setup manually. If you&rsquo;d like to go further here is a tutorial on <a href="https://laravel-news.com/telegram-notification-channels">how to send notifications to Telegram</a></p>', 'laravel-twitter.png', 'Ключевые', 'Описание', '2017-02-06 07:04:04', '2017-02-06 07:56:12'),
(52, 'Тестовая новость', 'Тестовая новость краткое описание', '<p>Полный текст&nbsp;</p>', '1938.jpg', 'urtyurt', 'yurtyu', '2017-02-06 07:15:20', '2017-02-06 07:59:34'),
(53, 'asdf', 'asdfas', '<p>dfasdf</p>', '000009191808.jpg', 'dasfsd', 'fasd', '2017-02-06 08:04:40', '2017-02-06 08:04:40');

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@laravelnews.ru', '$2y$10$sJuXn6xCxbuNCWrSWI.wVebx4KEXGnHZ3kH6HVRvNzXPlvqeaHVES', 'sgViiV0IgJDmJ1ZxszWkKymjzPnxfb1KfxJd77IBKwxsXohGszuLWMMor9lk', '2017-02-05 03:48:10', '2017-02-05 03:48:10');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

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
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `news`
--
ALTER TABLE `news`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=54;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
