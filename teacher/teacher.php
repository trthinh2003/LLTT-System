<?php
    ob_start();
    session_start();
    if (isset($_SESSION['TeacherName']) && $_SESSION['TeacherName'] != "") {
        $teacher = $_SESSION['TeacherName'];
    }
    else {
        header('Location: index.php');
    }
    if (isset($_SESSION['TeacherID']) && $_SESSION['TeacherID'] != "") {
        $teacherID = $_SESSION['TeacherID'];
    }
?>
<!DOCTYPE html>
<html lang="en" data-bs-theme="dark">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>LLTT System</title>
    <link rel="shortcut icon" href="view/layout/assets/images/favicon.ico" type="image/x-icon" />
    <!--Bootstrap-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/ae360af17e.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="view/layout/assets/css/normalize.css" />
    <link rel="stylesheet" href="view/layout/assets/css/style.css" />
    <link rel="stylesheet" href="view/layout/assets/css/normalscheduleshow.css">
  </head>

  <body>
    <div class="wrapper">
        <!-- Nội dung thanh sidebar -->
        <aside id="sidebar" class="js-sidebar">
            <div class="h-100">
                <div class="sidebar-logo">
                    <a href="#" id=""><img class="rounded-circle mx-1" src="view/layout/assets/images/logo.png" alt="Logo" width="40px"/>LLTT System</a>
                </div>
                <ul class="sidebar-nav mx-0">
                    <li class="sidebar-header">Menu Chính</li>
                    <!-- Chuc nang chung, Giang vien se la nguoi co chuc nang nay -->
                    <li class="sidebar-item">
                        <a href="#" class="sidebar-link collapsed" data-bs-target="#options" data-bs-toggle="collapse" aria-expanded="false">
                            <i class="fa-solid fa-list pe-2"></i>Chức năng chính
                        </a>
                        <ul id="options" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="#sidebar">
                            <li class="sidebar-item">
                                <a href="index.php?pg=class_show" class="sidebar-link">Xem các lớp học phần</a>
                            </li>
                            <li class="sidebar-item">
                                <a href="index.php?pg=lab_view" class="sidebar-link">Xem thông tin phòng máy</a>
                            </li>
                            <li class="sidebar-item">
                                <a href="index.php?pg=approveRequirements" class="sidebar-link">Kiểm tra các yêu cầu</a>
                            </li>
                            <li class="sidebar-item">
                                <a href="index.php?pg=schedule_registration" class="sidebar-link">Đăng ký yêu cầu thực hành</a>
                            </li>
                        </ul>
                    </li>
                    <!-- Chuc nang xem lich TH, chuc nang nay ca QTHT, Giang vien va Sinh vien deu co the xem duoc -->
                    <li class="sidebar-item">
                        <a href="index.php?pg=schedule_watching_teacher" class="sidebar-link">
                            <i class="fa-solid fa-calendar-days pe-2"></i>
                            Xem lịch thực hành
                        </a>
                    </li>
                </ul>
            </div>
        </aside>
        <div class="main">
            <nav class="navbar navbar-expand px-3 border-bottom border-black">
                <button class="btn" id="sidebar-toggle" type="button">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="navbar-collapse navbar">
                    <ul class="navbar-nav">
                        <li class="nav-item dropdown">
                            <a href="" data-bs-toggle="dropdown" class="nav-icon pe-md-0">
                                <p class="login-sign text-black mt-2">
                                    <img class="rounded-circle mx-1" src="view/layout/assets/images/teacher_avatar.jpg" alt="Logo" width="40px"/>
                                    Xin chào, GV. <?=$teacher;?> 
                                    <i class="fa-solid fa-chevron-down pe-2"></i></p>
                            </a>
                            <div class="dropdown-menu dropdown-menu-end" style="top: 55px;">
                                <a href="index.php?pg=teacher_profile" class="dropdown-item">Hồ sơ cá nhân</a>
                                <a href="route/logout.php" class="dropdown-item">Đăng xuất</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
            <!-- Phan noi dung -->
            <main class="content px-3 py-2">
                <div class="container-fluid">
                    <div class="mb-3">
                        <h4>Quản Trị Thông Tin</h4>
                    </div>
                    <div class="row">
                        <div class="col-xl-6 d-flex">
                            <div class="card flex-fill border-0 illustration">
                                <div class="card-body p-0 d-flex flex-fill">
                                    <div class="d-flex justify-content-center align-items-center">
                                        <div class=""><img src="view/layout/assets/images/sys-avatar.png" class="img-fluid illustration-img" alt=""/></div>
                                        <div class="">
                                            <div class="p-2 m-1">
                                                <h4>Chào mừng đến với hệ thống</h4>
                                                <h5 class="mb-0"><b>Quản Lý Lịch Thực Hành</b></h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Điếm số lượt truy cập -->
                        <div class="col-xl-6 d-flex">
                            <div class="card flex-fill border-0 illustration">
                                <div class="card-body p-0 d-flex flex-fill">
                                    <div class="d-flex justify-content-center align-items-center">
                                        <div class="align-self-start text-start">
                                            <img src="view/layout/assets/images/view.png" class="img-fluid illustration-img" alt=""/>
                                        </div>
                                        <div class="text-start">
                                            <div class="p-2 m-1">
                                                <h4>Số người đang truy cập</h4>
                                                <h3 class="mb-0">
                                                    <b><?php if (isset($_SESSION['luottruycap'])) echo $_SESSION['luottruycap'];?></b>
                                                </h3>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Lịch -->
                    <h4><i class="fa-regular fa-calendar-days pe-2"></i>Lịch hôm nay</h4>
                    <div class="container-calendar flex">
                        <div class="calendar shadow">
                            <div class="month flex">
                                <div class="prev">
                                    <i class="fas fa-chevron-left"></i>
                                </div>
                                <div class="content">
                                    <h1 class="fw-bold"></h1>
                                    <p></p>
                                </div>
                                <div class="next">
                                    <i class="fas fa-chevron-right"></i>
                                </div>
                            </div>
                            <div class="weekdays flex">
                                <div>Chủ nhật</div>
                                <div>Hai</div>
                                <div>Ba</div>
                                <div>Tư</div>
                                <div>Năm</div>
                                <div>Sáu</div>
                                <div>Bảy</div>
                            </div>
                            <div class="days flex">
                                <div class="previous-day">26</div>
                                <div class="previous-day">27</div>
                                <div class="previous-day">28</div>
                                <div class="previous-day">29</div>
                                <div class="previous-day">30</div>
                                <div class="previous-day">31</div>
                                <div class="">1</div>
                                <div class="today">11</div>
                                <div class="">31</div>
                                <div class="next-days">1</div>
                                <div class="next-days">2</div>
                                <div class="next-days">3</div>
                                <div class="next-days">4</div>
                                <div class="next-days">5</div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
            <a href="#" class="theme-toggle">
                <i class="fa-regular fa-moon" title="Chế độ tối"></i>
                <i class="fa-solid fa-sun" title="Chế độ sáng"></i>
            </a>
             <!-- footer -->
            <footer class="footer">
                <div class="container-fluid">
                    <div class="row text-muted">
                        <div class="col-6 text-start">
                            <p class="mb-0">
                                <a href="#" class="text-muted">
                                    <strong>LLTT System</strong>
                                </a>
                            </p>
                        </div>
                        <div class="col-6 text-end">
                            <ul class="list-inline">
                                <li class="list-inline-item">
                                    <a href="#" class="text-muted">Liên hệ</a>
                                </li>
                                <li class="list-inline-item">
                                    <a href="#" class="text-muted">Về chúng tôi</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </footer>
        </div>
    </div>

    <script src="view/layout/assets/js/sidebar.js"></script>
    <script src="view/layout/assets/js/darklightmode.js"></script>
    <script src="view/layout/assets/js/normalscheduleshow.js"></script>
    </body>
</html>