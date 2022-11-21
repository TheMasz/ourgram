<?php
session_start();
if (!isset($_SESSION['user_login'])) {
    header('location: /signin');
    exit;
} else {
    include("connect.php");
    $user_id = $_SESSION['user_login'];
    $stmt = $conn->query("SELECT * FROM users WHERE id = $user_id");
    $row = $stmt->fetch(PDO::FETCH_ASSOC);
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <link rel="stylesheet" href="../styles/index.css">
    <link rel="stylesheet" href="../styles/homepage.css">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/png" sizes="32px" href="../assets/favicon.ico">
    <title>Ourgram</title>
</head>

<body>
    <?php include("./component/header.php"); ?>
    <div class="main-wrap">
        <div class="main-lt">
            <?php include("./component/sidebar.php"); ?>
        </div>
        <div class="main-rt">
            <div class="main-rt_inside_wrap container">
                <div class="main-rt_inside_lt">
                    <div class="story_wrap">
                        <div class="avatar-lg"></div>
                    </div>
                    <?php include("./component/post.php"); ?>
                    <?php include("./component/post.php"); ?>
                </div>
                <div class="main-rt_inside_rt">
                    <a href="">
                        <div class="my_profile row">
                            <?php if (isset($row['profile_pic'])) { ?>
                                <div class="avatar-lg" style="background: url(<?php echo $row['profile_pic'] ?>);"></div>
                            <?php } else {  ?>
                                <div class="avatar-lg" style="background: blue;">
                                    <p><?php echo substr($row['username'], 0, 1) ?></p>
                                </div>
                            <?php } ?>

                            <div class="px-1">
                                <p class="b "><?php echo $row['username']  ?></p>
                                <?php if (isset($row['profile_name'])) { ?>
                                    <p><?php echo $row['profile_name'] ?></p>
                                <?php } else {  ?>
                                    <a href="" class="blue-sub f-12">Edit Profile</a>
                                <?php } ?>
                            </div>
                        </div>
                    </a>

                    <div class="row space_between py-2">
                        <p class="gray b">Suggest people</p>
                        <a href="" class="b">See more</a>
                    </div>
                    <ul>
                        <li class="py-1">
                            <div class="row space_between">
                                <a href="">
                                    <div class="row">
                                        <div class="avatar-md mr-05"></div>
                                        <p>steve kab</p>
                                    </div>
                                </a>

                                <a class="blue b" href="">follow</a>
                            </div>
                        </li>
                        <li class="py-1">
                            <div class="row space_between">
                                <a href="">
                                    <div class="row">
                                        <div class="avatar-md mr-05"></div>
                                        <p>steve kab</p>
                                    </div>
                                </a>
                                <a class="blue b" href="">follow</a>
                            </div>
                        </li>
                        <li class="py-1">
                            <div class="row space_between">
                                <a href="">
                                    <div class="row">
                                        <div class="avatar-md mr-05"></div>
                                        <p>steve kab</p>
                                    </div>
                                </a>
                                <a class="blue b" href="">follow</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <script src="./script/carousel.js"></script>

</body>

</html>