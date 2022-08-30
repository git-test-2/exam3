<?php

require "../vendor/autoload.php";


//делаем Роутинг
$dispatcher = FastRoute\simpleDispatcher(function(FastRoute\RouteCollector $r) {

    //этот роутинг 'GET', '/about' ищет вот эту ф-ю ['App\controllers\HomeController', 'about'] чтобы выполнить её
    $r->addRoute('GET', '/about', ['App\controllers\HomeController', 'about']);

    $r->addRoute('GET', '/home', ['App\controllers\HomeController', 'home']);


    $r->addRoute('GET', '/users', ['App\controllers\HomeController', 'users']);

    $r->addRoute('GET', '/create_user', ['App\controllers\HomeController', 'create_user']);
    $r->addRoute('POST', '/create_user', ['App\controllers\HomeController', 'action_create_user']);

    $r->addRoute('GET', '/edit', ['App\controllers\HomeController', 'edit']);
    $r->addRoute('POST', '/edit', ['App\controllers\HomeController', 'edit_action']);


    $r->addRoute('GET', '/media_page', ['App\controllers\HomeController', 'media_page']);
    $r->addRoute('POST', '/media_page', ['App\controllers\HomeController', 'action_media_page']);

    //логин как и регистрация
    $r->addRoute('GET', '/login', ['App\controllers\HomeController', 'page_login']); // /login
    $r->addRoute('POST', '/login', ['App\controllers\HomeController', 'action_login']); // /login

    //закомментировал в методе трайКетч, с ним не работает логаут.
    $r->addRoute('GET', '/logout', ['App\controllers\HomeController', 'logout']); // /login



    // У тебя должен быть 1 роут с get для показа вида с формой и другой роут с post для обработки данных
    // Названия роутов могут быть одинаковыми,
    // а методы в контроллере разные Евгений Афанасьев, [05.08.2022 23:52] Например, register и registerAction
    $r->addRoute('GET', '/page_register', ['App\controllers\HomeController', 'page_register']);
    $r->addRoute('POST', '/page_register', ['App\controllers\HomeController', 'action_register']);

    $r->addRoute('GET', '/security', ['App\controllers\HomeController', 'security']);
    $r->addRoute('POST', '/security', ['App\controllers\HomeController', 'action_security']);

    $r->addRoute('GET', '/delete', ['App\controllers\HomeController', 'delete']);


    $r->addRoute('GET', '/status', ['App\controllers\HomeController', 'status']);
    $r->addRoute('POST', '/status', ['App\controllers\HomeController', 'action_status']);

    //$r->addRoute('GET', '/users', 'get_all_users_handler'); // закрыли, чтобы не двоило
    // {id} must be a number (\d+)
    $r->addRoute('GET', '/user/{id:\d+}', 'get_user_handler');
    // The /{title} suffix is optional
    $r->addRoute('GET', '/articles/{id:\d+}[/{title}]', 'get_article_handler');

});

// Fetch method and URI from somewhere
    $httpMethod = $_SERVER['REQUEST_METHOD'];
    $uri = $_SERVER['REQUEST_URI'];

    // Strip query string (?foo=bar) and decode URI
    if (false !== $pos = strpos($uri, '?')) {
        $uri = substr($uri, 0, $pos);
    }
    $uri = rawurldecode($uri);

    $routeInfo = $dispatcher->dispatch($httpMethod, $uri);


    switch ($routeInfo[0]) {
        case FastRoute\Dispatcher::NOT_FOUND:
            // ... 404 Not Found
            break;
        case FastRoute\Dispatcher::METHOD_NOT_ALLOWED:
            $allowedMethods = $routeInfo[1];
            // ... 405 Method Not Allowed
            break;
        case FastRoute\Dispatcher::FOUND:
            $handler = $routeInfo[1];
            $vars = $routeInfo[2];
            // ... call $handler with $vars

            $controller = new $handler[0]; //создали объект класса и передали в ф-ю, потому что сам по себе объект создасться не может
            //передайм данные, чтобы выполнить нашу страницу
            call_user_func([$controller, $handler[1]], $vars); // объект - $controller, экшен объекта - $handler[1], $vars - параметры
            break;
    }


