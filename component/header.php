<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="../styles/header.css">

<div class="header">
    <nav class="container navbar">
        <div class="nav-items-lt">
            <li class="nav-item">
                <a href="/">Ourgram</a>
            </li>
        </div>
        <div class="nav-items-rt">
            <?php if (isset($_SESSION['user_login'])) { ?>
                <li class="nav-item ">
                    <button class="btn_createpost">
                        create post
                    </button>
                </li>
                <li class="nav-item">
                    <button>
                        <i class="fa fa-plus-circle"></i>
                    </button>
                </li>
                <li class="nav-item">
                    <button>
                        <i class="fa fa-bell-o"></i>
                    </button>
                </li>
            <?php } else { ?>
                <li class="nav-item ">
                    <a href="/signup">Sign up</a>
                </li>
                <li class="nav-item ">
                    <a href="/signin">Sign in</a>
                </li>
            <?php } ?>
        </div>
    </nav>
</div>