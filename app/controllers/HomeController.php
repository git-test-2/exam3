<?php
namespace App\controllers;

use League\Plates\Engine;
use App\QueryBuilder;
use PDO;

use Delight\Auth\Auth;

class HomeController
{
    private $templates;
    private $auth;



    public function __construct()
    {
        $this->templates  = new Engine('../app/views');

        $db = new PDO("mysql:host=localhost;dbname=exam3;charset=utf8","root","");
        $this->auth = new Auth($db);

    }

    public function index()
    {
        echo $this->templates->render('/', ['name' => 'Jonathan']);
    }

    public function about($vars)
    {
        echo $this->templates->render('about', ['name' => 'Jonathan']);
    }

    public function home()
    {
        echo $this->templates->render('home');
    }

    public function users($vars)
    {
        if ($this->auth->isLoggedIn()) {
            $users = new QueryBuilder();
            $allUsers = $users->getAll('users');


            echo $this->templates->render('users', ['users' => $allUsers]);
        }
    }

    // юзера
    public function create_user($vars)
    {
        echo $this->templates->render('create_user',['name' => 'Jonathan']);
    }



    public function action_create_user()
    {
        if ($this->auth->isLoggedIn()) {

            if(isset($_POST['password'])) {
                $_POST['password'] = password_hash($_POST['password'],PASSWORD_DEFAULT );
            }

            $new_user = new QueryBuilder();
            $new_user->insert($_POST,'users');

            }

            header("Location: http://exam3/users");
    }




    public function edit()
    {
        if($this->auth->isLoggedIn()) {
            //var_dump($_SESSION);die();
            $users = new QueryBuilder();
            $user = $users->getOne('users', $_GET['id']);
            //var_dump($allUsers);

            echo $this->templates->render('edit',['user' => $user]);
        }
    }

    public function edit_action()
    {
        if ($this->auth->isLoggedIn())
        {
            $edit  = new QueryBuilder();
            $edit->update($_POST,$_POST['id'],'users');

        //var_dump($_POST['id']); die();
        //echo $this->templates->render('edit');
        }

        header("Location: http://exam3/users");
    }



    public function media_page()
    {
        echo $this->templates->render('media_page');
    }

    public function action_media_page()
    {
        $image_path = pathinfo($_FILES['avatar']['name']); //получили массив с инфо про картинку
        $image_extension = $image_path['extension']; // взяли разрирение из массива .jpg
        $image_name = uniqid(). '.' .$image_extension; //сформировали уникальное имя и добавили к нему разширение .jpg
        //echo $image_name; //628fb491f2f49.jpg
        move_uploaded_file($_FILES['avatar']['tmp_name'],"img/demo/avatars/".$image_name);

        $avatar = "img/demo/avatars/".$image_name;
        $id = $_POST['id'];

        $insertAvatar  = new QueryBuilder();
        $insertAvatar->addImage($avatar,$id);

        header("Location: http://exam3/users");
    }



    public function page_register()
    {
        echo $this->templates->render('page_register');
    }

    public function action_register()
    {
        try {
            $userId = $this->auth->register($_POST['email'], $_POST['password'], $_POST['username'], function ($selector, $token) {
                echo 'Send ' . $selector . ' and ' . $token . ' to the user (e.g. via email)';
                echo '  For emails, consider using the mail(...) function, Symfony Mailer, Swiftmailer, PHPMailer, etc.';
                echo '  For SMS, consider using a third-party service and a compatible SDK';
            });

            //echo 'We have signed up a new user with the ID ' . $userId; // можно потом откомментировать
        }
        catch (\Delight\Auth\InvalidEmailException $e) {
            die('Invalid email address');
        }
        catch (\Delight\Auth\InvalidPasswordException $e) {
            die('Invalid password');
        }
        catch (\Delight\Auth\UserAlreadyExistsException $e) {
            die('User already exists');
        }
        catch (\Delight\Auth\TooManyRequestsException $e) {
            die('Too many requests');
        }

        header("Location: http://exam3/login");

    }


    public function security()
    {
        echo $this->templates->render('security');
    }


    public function action_security()
    {
        if($_POST['password'] === $_POST['confirm_password'])
        {
            $_POST['password'] = password_hash($_POST['password'],PASSWORD_DEFAULT );

            $email = $_POST['email'];
            $password = $_POST['password'];
            $id = $_POST['id'];

            $action_security  = new QueryBuilder();
            $action_security->updateSecurity($email,$password,$id);

            //var_dump($_POST);die();
            //var_dump($_POST['email'],$_POST['password'],$_POST['confirm_password'], $_POST['id']);die();
            header("Location: http://exam3/users");
        } else {
            header("Location: http://exam3/security");
        }

        //echo $this->templates->render('security');
    }




    public function status()
    {
        echo $this->templates->render('status');
    }

    public function action_status()
    {
        //var_dump($_POST['user_status']);die();
        //var_dump($_POST['status_id'],$_POST['status_active']);die(); //string(2) "23" string(7) "success"
        //var_dump($_POST);die();
        $change_status = new QueryBuilder();
        //$change_status->update($_POST,$_POST['status_id'],'users');
        $change_status->update($_POST,$_POST['id'],'users');
        header("Location: http://exam3/users");
    }



    public function page_login()
    {
        echo $this->templates->render('page_login');
    }

    public function action_login()
    {
        try {
            $this->auth->login($_POST['email'], $_POST['password']);

            //echo 'User is logged in'; //записать потом в сессию
        }
        catch (\Delight\Auth\InvalidEmailException $e) {
            die('Wrong email address');
        }
        catch (\Delight\Auth\InvalidPasswordException $e) {
            die('Wrong password');
        }
        catch (\Delight\Auth\EmailNotVerifiedException $e) {
            die('Email not verified');
        }
        catch (\Delight\Auth\TooManyRequestsException $e) {
            die('Too many requests');
        }

        header("Location: http://exam3/users");

    }


    public function logout()
    {
        $this->auth->logOut();

//        try {
//            $this->auth->logOutEverywhere();
//        }
//        catch (\Delight\Auth\NotLoggedInException $e) {
//            die('Not logged in');
//        }

        header("Location: http://exam3/login");
    }


    public function delete()
    {
        $delete = new QueryBuilder();
        $delete->delete();

        header("Location: http://exam3/users");
    }

}