<?php


$auth->logOut();

try {
    $auth->logOutEverywhere();
}
catch (\Delight\Auth\NotLoggedInException $e) {
    die('Not logged in');
}

header("Location: http://exam3/login");