<?php
header("Access-Control-Allow-Origin:*");
header("Access-Control-Allow-Headers:*");
//MySQL database Connection
$con=mysqli_connect('localhost', 'root', '', 'pos_bfc');

$json = file_get_contents('php://input');
$obj = json_decode($json, true);

var_dump($json);
if(isset($obj["username"]) && isset($obj["password"])){
    $username = mysqli_real_escape_string($con,$obj['username']);
    $password = mysqli_real_escape_string($con,$obj['password']);

//Declare array variable
    $result=[];
//Select Query
    $sql="SELECT * FROM login_bfc WHERE username='{$username}' and password='{$password}'";
    // $sql = "SELECT * FROM login_bfc WHERE username = '$username' and password = '$password'";
    $res = $con->query($sql);

    if($res->num_rows>0){
        $row = $res->fetch_assoc();
        $result['loginStatus'] = true;
        $result['message'] = "Login Successfully";
        $result["userInfo"] = $row;
    }else{
        $result['loginStatus'] = false;
        $result['message'] = "Invalid Login Details";
    }
    // Converting the array into JSON format.
    echo json_encode($result);
}else{
    echo json_encode(['message' => "Oops! Something Wrong. $obj"]);
}
?>