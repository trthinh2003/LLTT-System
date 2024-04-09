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
  <title>Đăng ký lịch thực hành</title>
  <link rel="shortcut icon" href="view/layout/assets/images/favicon.ico" type="image/x-icon" />
  <!--Bootstrap-->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css"/>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://kit.fontawesome.com/ae360af17e.js" crossorigin="anonymous"></script>
  <script type="text/JavaScript" src="https://MomentJS.com/downloads/moment-with-locales.js"></script>

  <script>
    var jsVar;
    var lophocphan = []
    function nek() {
      jsVar = <?php
                session_start();
                echo json_encode($_SESSION['ten']);
              ?>;
      document.getElementById("tengiangvie").value = jsVar.hotengiangvien
          
    }
        
    function nik() {
      nek();
      var c = <?php
                $servername = "localhost";
                $username = "root";
                $password = "";
                $dbname = "ql_lich_th";
                $conn = new mysqli($servername, $username, $password, $dbname);
                $sql = "select mahocphan,tennhom from lophocphan l join giangvien g where l.GIANGVIEN_ID=g.GIANGVIEN_ID;";
                $result = $conn->query($sql);
                if ($result->num_rows > 0) {
                  $data = array();
                  while ($row = $result->fetch_assoc()) {
                    $data[] = $row;
                  }
                  echo json_encode($data);
                } else {
                  echo null;
                }
                $conn->close();
              ?>;

      for (i = 0; i < c.length; i++) {
        lophocphan[i] = c[i].mahocphan + "-" + c[i].tennhom;
      }

      var op = ``;
      for (i = 0; i < lophocphan.length; i++) {
        console.log(lophocphan[i])
        op += `<option value="${lophocphan[i]}">${lophocphan[i]}</option> `;
      }
      console.log(op);
      document.getElementById('lophocpha').innerHTML = op;
    }
        
  </script>
  <link rel="stylesheet" href="view/layout/assets/css/normalize.css" />
  <link rel="stylesheet" href="view/layout/assets/css/style.css" />
</head>

<body onload="nik()">
    <div class="wrapper">
      <aside id="sidebar" class="js-sidebar">
        <!-- Nội dung thanh sidebar -->
        <div class="h-100">
          <div class="sidebar-logo">
            <a href="index.php?pg=teacher" id=""><img class="rounded-circle mx-1" src="view/layout/assets/images/logo.png" alt="Logo" width="40px"/>LLTT System</a>
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
                  <a href="index.php?pg=schedule_registration" class="sidebar-link">Đăng ký lịch thực hành</a>
                </li>
                <li class="sidebar-item">
                  <a href="#" class="sidebar-link">Thống kê số tiết dạy</a>
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
              <!-- <li class="nav-item dropdown">
                            <a href="#" data-bs-toggle="dropdown" class="nav-icon pe-md-0">
                                <img src="assets/images/avatar.jpg" class="avatar img-fluid rounded" alt="">
                            </a>
                            <div class="dropdown-menu dropdown-menu-end">
                                <a href="#" class="dropdown-item">Hồ sơ cá nhân</a>
                                <a href="#" class="dropdown-item">Cài đặt</a>
                                <a href="./login-form.html" class="dropdown-item">Đăng xuất</a>
                            </div>
                        </li> -->
                        <li class="nav-item dropdown">
                          <a href="" data-bs-toggle="dropdown" class="nav-icon pe-md-0">
                            <p class="login-sign text-black mt-2">
                              <img class="rounded-circle mx-1" src="view/layout/assets/images/teacher_avatar.jpg" alt="Logo" width="40px"/>
                              Xin chào, GV. <?=$teacher;?> 
                              <i class="fa-solid fa-chevron-down pe-2"></i></p>
                          </a>
                            <div class="dropdown-menu dropdown-menu-end" style="top: 55px;">
                              <a href="index.php?pg=teacher_profile" class="dropdown-item">Hồ sơ cá nhân</a>
                              <a href="#" class="dropdown-item">Cài đặt</a>
                              <a href="route/logout.php" class="dropdown-item">Đăng xuất</a>
                            </div>
                        </li>
              <!-- <li class="login-sign">
                <a href="view/login-form.php" class="text-primary"><i class="fa-solid fa-right-to-bracket pe-2"></i>Đăng nhập</a>
              </li> -->
            </ul>
          </div>
        </nav>

      <!-- Phan noi dung -->
      <main class="content px-3 py-2">
      
        <div class="container-fluid" id="divchinh">
          <div class="row justify-content-center align-items-center">Đăng Ký Lịch Thực Hành</div>
          <div class="row justify-content-center">
            <div class="col-md-10 col-lg-10  ">
              <label for="name" class="form-label">Tên giảng viên:</label>
              <input type="text" class="form-control" id="tengiangvie" name="tengiangvien" required disabled>
            </div>
          </div>

          <div class="row justify-content-center">
            <div class="col-md-5 col-lg-5">
              <label for="pwd" class="form-label">Học kỳ:</label>
              <select class="form-select" name="hocky" id="hock">
                <option>1</option>
                <option>2</option>
                <option>Hè</option>
              </select>
            </div>
            <div class="col-md-5 col-lg-5">
              <label for="pwd" class="form-label">Năm học:</label>
              <select class="form-select" name="amhocn" id="namho">
                <option>2023 - 2024</option>
                <option>2024 - 2025</option>
                <option>2025 - 2026</option>
              </select>
            </div>
          </div>
          <br>
          <div class="row align-items-end justify-content-center">

            <div class="col-md-2 col-lg-2">
              <label for="pwd" class="form-label">Lớp học phần:</label>
              <select class="form-select mt-3" id="lophocpha">

              </select>
            </div>
            <div class="col-md-3 col-lg-3">
              <label for="pwd" class="form-label">Tuần Thục Hành:</label>
              <input type="text" class="form-control" id="ngaythuchan" placeholder="Format: 1, 2,...." name="sis">
            </div>
            <div class="col-md-4 col-lg-4" id="baby">
              <label for="pwd" class="form-label">Phần Mềm:</label>
              <input type="text" class="form-control" id="phanme" placeholder="Enter software" name="sis">
              <ul class="chinh" id="theul">

              </ul>
            </div>

            <div class="col-md-1 col-lg-1">

              <button type="button" class="btn btn-success" id="them">Add</button>
            </div>
          </div>
          <br>

        </div>
        <br>
        <div class="row justify-content-center">
          <div class="col-10">
            <table class="table table-hover align-items-center justify-content-center" id="bang">
              <thead>
                <tr>
                  <th>Lớp học phần</th>
                  <th>Tuần thực hành</th>
                  <th>Yêu cầu phần mềm</th>
                </tr>
              </thead>


            </table>
          </div>
          <div class="row justify-content-center">
            <div class="col-1">
              <button type="button" class="btn btn-info" onclick="taidulieu()">Load</button>

            </div>

          </div>
        </div>
        <script>
          var phammem = [];

          function phanmem22(field1, field2) {
            this.ten = field1;
            this.id = field2;
          }
          var phammem2 = [];
          var f33 = document.getElementById('phanme')
          var c1 = document.getElementById('divchinh');
          c1.addEventListener("click", them)
          var c2 = document.getElementById('bang');
          c2.addEventListener("click", xoa);
          c2.addEventListener("contextmenu", chinhsua);
          f33.addEventListener("input", fetchdata);
          // hai mảng chính dùng để lưu trữ dữ liệu
          var thongtingiangvien = [];
          var thongtindangki = [];
          //điền thông tin cho tên giảng viên 

          //đây trở xuống là dữ liệu về hàm xử lý
          function thongtindangki_(lophocphan, ngayhoc, phanmem) {
            this.LHP = lophocphan;
            this.NH = ngayhoc;
            this.PM = phanmem;
          }


          function them(event) {
            if (event.target.id == 'them') {
              var lhp = document.getElementById('lophocpha').value;
              document.getElementById('lophocpha').value = null;
              var nth = document.getElementById('ngaythuchan').value;
              document.getElementById('ngaythuchan').value = null;
              var pm = document.getElementById('phanme').value;
              document.getElementById('phanme').value = null
              var doituong = new thongtindangki_(lhp, nth, pm);
              thongtindangki.push(doituong);
              themphantu(doituong);
              for (u = 0; u < lophocphan.length; u++) {
                if (lophocphan[u] == lhp) {
                  lophocphan.splice(u, 1);
                  break;
                }
              }
              console.log(lophocphan);
              var layop = document.getElementById('lophocpha').getElementsByTagName('option');

              for (var i = 0; i < layop.length; i++) {
                if (layop[i].value === lhp) {
                  layop[i].remove();
                }
              }
            }
            if (event.target.tagName == 'LI') {
              var c1 = document.getElementById("phanme");
              var c = c1.value;
              var giatri = "";
              if (c.includes(',') == false) {
                c = "";
              } else {
                c = c.substring(0, c.lastIndexOf(',') + 1);
                giatri += " ";
              }
              giatri += event.target.textContent;
              c += giatri;
              c1.value = c;

              document.getElementById("theul").innerHTML = "";
              c1.focus();
            }


          }

          function themphantu(doituong) {

            var t = document.getElementById('bang');
            var r = document.createElement('tr');
            t.appendChild(r);
            var d1 = document.createElement('td');
            d1.innerHTML = doituong.LHP;
            r.appendChild(d1);
            var d4 = document.createElement('td');
            d4.innerHTML = doituong.NH;
            r.appendChild(d4);
            var d5 = document.createElement('td');
            d5.innerHTML = doituong.PM;
            r.appendChild(d5);
            console.log(thongtindangki)


          }

          function xoa(event) {

            if (event.target.tagName != 'INPUT') {
              var c = confirm('Bạn có chắc xóa hàng không !!!!!!');
              if (c == true) {


                var cha = event.target.parentNode;
                var con = cha.getElementsByTagName('TD');
                var vitri = cha.rowIndex;
                var valu = con[0].textContent;
                lophocphan.push(valu);
                console.log(lophocphan);
                var newOption = document.createElement("option");
                newOption.value = valu;
                newOption.text = valu;
                var selectElement = document.getElementById("lophocpha");
                selectElement.appendChild(newOption);
                cha.remove();
                thongtindangki.splice(vitri - 1, 1);
                console.log(thongtindangki)
              }
            }

          }

          function chinhsua(event) {
            event.preventDefault();
            var c = event.target;
            var c4 = event.target.textContent;
            event.target.innerHTML = null;
            var c1 = document.createElement('input');
            var vitricot = c.cellIndex;
            if (vitricot == 0) {
              c1.type = "text";
            } else if (vitricot == 1) {
              c1.type = "text";
            } else if (vitricot == 2) {
              c1.type = "text";
            }
            c1.classList.add("form-control");
            c1.style.width = "50%";
            c1.style.height = "10%";
            c1.defaultValue = c4;
            c1.style.margin = "0 auto";
            c1.style.display = "block";
            event.target.appendChild(c1);
            c1.addEventListener("keydown", kiemtra);
          }

          function kiemtra(event) {
            if (event.keyCode == 13) {
              var cotthamchieu = event.target.parentNode;
              var hang = cotthamchieu.parentNode;
              var vitricot = cotthamchieu.cellIndex;
              var vitri = hang.rowIndex - 1;
              var valu = event.target.value;
              event.target.remove();
              cotthamchieu.innerHTML = valu;
              if (vitricot == 0) {
                thongtindangki[vitri].LHP = valu;
              } else if (vitricot == 1) {
                thongtindangki[vitri].NH = valu;
              } else if (vitricot == 2) {
                thongtindangki[vitri].PM = valu;
              }
              console.log(thongtindangki)
            }
          }

          function goiytimkiem(v) {
            var li = ``;
            var ml = 0;
            if (v != "") {
              for (i = 0; i < phammem.length; i++) {
                var kt = phammem[i].toLowerCase().includes(v.toLowerCase());
                if (v == phammem[i]) {
                  ml = 1;
                }
                if (kt == true) {
                  li = li + `<li>${phammem[i]}</li>`;
                }
              }
            }
            if (ml == 1) {
              li = ``;
            }
            document.getElementById("theul").innerHTML = li;



          }

          function layip() {
            var c = document.getElementById("phanme").value;
            var chuoitim = c.split(',');
            var v = chuoitim[chuoitim.length - 1];
            goiytimkiem(v.trim());

          }

          function fetchdata() {
            var c = <?php
                    $servername = "localhost";
                    $username = "root";
                    $password = "";
                    $dbname = "ql_lich_th";
                    $conn = new mysqli($servername, $username, $password, $dbname);
                    $sql = "SELECT tenphanmem, phienban,phanmem_id FROM phanmem";
                    $result = $conn->query($sql);
                    if ($result->num_rows > 0) {
                      $data = array();
                      while ($row = $result->fetch_assoc()) {
                        $data[] = $row;
                      }
                      echo json_encode($data);
                    } else {
                      echo null;
                    }
                    $conn->close();
                    ?>;
            phammem = [];
            for (i = 0; i < c.length; i++) {
              phammem[i] = c[i].tenphanmem + "-" + c[i].phienban;
              phammem2.push(new phanmem22(phammem[i], c[i].phanmem_id))
            }
            layip();

          }

          function taidulieu() {
            var hk1 = document.getElementById('hock').value;
            var nh1 = document.getElementById('namho').value;
            for (i = 0; i < thongtindangki.length; i++) {
              var ds = thongtindangki[i].NH.split(",");
              var hp = thongtindangki[i].LHP.split("-");
              var mapm = null
              for (f = 0; f < phammem2.length; f++) {
                if (thongtindangki[i].PM == phammem2[f].ten) {
                  mapm = phammem2[f].id;
                }
              }

              for (u = 0; u < ds.length; u++) {
                ds[u] = ds[u].trim();
               
                var doituong = {
                  hk: hk1,
                  nh: nh1,
                  mhp: hp[0],
                  nhom: hp[1],
                  idpm: mapm,
                  tuanhoc: ds[u]
                 
                }
                var xhr = new XMLHttpRequest();
            xhr.open('POST', 'xulySQL.php', true);
            xhr.setRequestHeader('Content-Type', 'application/json');
            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    console.log('Data sent successfully.');
                }
            };
            // var data = {
            //     MAHOCPHAN: doituong.mahocphan,
            //     HOCKI: doituong.hk,
            //     NAMHOC: doituong.nh,
            //     TENNHOM: doituong.nhom,
            //     PHANMEM_ID: doituong.idpm,
            //     TUANHOC: doituong.tuanhoc
            // };
            console.log(doituong.nh)
            var data = {
                MAHOCPHAN: new String(doituong.mhp),
                HOCKI: ''+doituong.hk,
                NAMHOC: new String(doituong.nh),
                TENNHOM: new String(doituong.nhom),
                PHANMEM_ID: new String(doituong.idpm),
                TUANHOC: new String(doituong.tuanhoc),
                NGAYYEUCAU: '2024-04-06 14:20:09'
            };
            xhr.send(JSON.stringify(data));
              }
            }
          }
        </script>
      </main>

      <a href="#" class="theme-toggle">
        <i class="fa-regular fa-moon" title="Chế độ tối"></i>
        <i class="fa-solid fa-sun" title="Chế độ sáng"></i>
      </a>
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


</body>

</html>