<?php

class DB
{
    private $host = "localhost";
    private $dbname = "furniture";
    private $password = "";
    private $user = "root";
    private $dbType = "mysql";
    private $connection;
    public function __construct()
    {

        $this->connection = new pdo("$this->dbType:host=$this->host;dbname=$this->dbname", $this->user, $this->password);
    }
    public function get_connection()
    {
        return $this->connection;
    }
    public function select($cols, $table, $condition = 1)
    {
        return  $this->connection->query("select $cols from $table where $condition");
    }
    public function delete($table, $condition)
    {
        return $this->connection->query("delete from $table where $condition");
    }
    public function insert($table, $cols, $values)
    {
        return $this->connection->query("insert into $table ($cols) values ($values) ");
    }
    public function update($table, $cols, $condition = 1)
    {
        return $this->connection->query("update $table set $cols where $condition");
    }
    public function leftjoin($table1,$table2,$cond1,$cond2,$cond3){
       return $this->connection->query("SELECT * FROM $table1
       LEFT JOIN $table2 ON $cond1= $cond2 where $cond3");
    }
    public function order($col,$table,$col_order,$limit_num){
        return $this->connection->query("select $col from $table order by $col_order limit $limit_num");
    }
    public function other($col,$table,$cond,$col_order,$limit_num){
        return $this->connection->query("select $col from $table where $cond order by $col_order limit $limit_num");
    }
}
?>