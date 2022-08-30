<?php


namespace App;
use Aura\SqlQuery\QueryFactory;
use PDO;


class QueryBuilder
{
    private $queryFactory;
    private $pdo;

    public function __construct()
    {
        $this->pdo = new PDO("mysql:host=localhost;dbname=exam3;charset=utf8","root","");
        $this->queryFactory = new QueryFactory('mysql');
    }



    public function getAll($table)
    {
      $select = $this->queryFactory->newSelect();

        $select->cols(['*'])
            ->from($table);


        $sth = $this->pdo->prepare($select->getStatement());
        $sth->execute($select->getBindValues());
        $result = $sth->fetchAll(PDO::FETCH_ASSOC);

        return $result;
    }

    public function getOne($table, $id) { // под вопросом
        $select = $this->queryFactory->newSelect();

        $select->cols(['*'])
            ->from($table)
            ->where("id = {$id}");

        $sth = $this->pdo->prepare($select->getStatement());
        $sth->execute($select->getBindValues());


        $result = $sth->fetch(PDO::FETCH_ASSOC);
        return $result;


    }

    public function insert($data, $table)
    {
        $insert = $this->queryFactory->newInsert();
        $insert
            ->into($table) // users
            ->cols($data); // $_POST

        //var_dump($insert->getStatement());die(); //смотрели запрос  string(125) "INSERT INTO `posts` ( `title`, `email`, `efqwefwefw` ) VALUES ( :title, :email, :efqwefwefw )"

        $sth = $this->pdo->prepare($insert->getStatement());
        $sth->execute($insert->getBindValues());
        //var_dump($sth);die();
    }


    public function update($data, $id, $table)
    {
        $update = $this->queryFactory->newUpdate();
        $update
            ->table($table)
            ->cols($data)
            ->where('id = :id')
            ->bindValue('id', $id);

        //var_dump($update->getStatement());die();
        $sth = $this->pdo->prepare($update->getStatement());
        $sth->execute($update->getBindValues());
    }

    public function addImage($avatar, $id)
    {
        $sql = "UPDATE users SET `avatar` = :avatar WHERE `id` = :id";
        $statement = $this->pdo->prepare($sql);
        $statement->execute(['avatar'=> $avatar,':id' => $id]);
    }

    public function updateSecurity($email, $password, $id)
    {
        $sql = "UPDATE users SET `email` = :email,`password` = :password WHERE `id` = :id";
        $statement = $this->pdo->prepare($sql);
        $statement->execute(['email'=> $email,'password'=> $password,':id' => $id]);
    }

    public function delete()
    {
        if(isset($_GET['id'])) {

            $id = $_GET['id'];

            $sql = "DELETE FROM users WHERE id = :id"; //не пишем DELETE * FROM, просто DELETE FROM
            $statement =  $this->pdo->prepare($sql);
            $statement->execute(['id'=>$id]);
        }
    }

}
