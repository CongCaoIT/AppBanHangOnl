<?php
// Thông tin kết nối đến CSDL
$servername = "localhost"; // Tên máy chủ CSDL (thường là localhost)
$username = "root"; // Tên người dùng CSDL
$password = ""; // Mật khẩu người dùng CSDL
$dbname = "dataappbanhangonl"; // Tên CSDL

// Tạo kết nối đến CSDL
$conn = new mysqli($servername, $username, $password, $dbname);

// Đóng kết nối
$conn->close();
?>

<?php
session_start(); // Bắt đầu phiên làm việc
if (isset($_POST['login'])) {
	// Lấy dữ liệu từ form đăng nhập
	$email = $_POST['Email'];
	$password = $_POST['Password'];

	// Thông tin kết nối đến CSDL
	$servername = "localhost"; // Tên máy chủ CSDL (thường là localhost)
	$username = "root"; // Tên người dùng CSDL
	$password_db = ""; // Mật khẩu người dùng CSDL
	$dbname = "dataappbanhangonl"; // Tên CSDL

	// Tạo kết nối đến CSDL
	$conn = new mysqli($servername, $username, $password_db, $dbname);

	// Kiểm tra kết nối
	if ($conn->connect_error) {
		die("Connection failed: " . $conn->connect_error);
	}

	// Tạo câu truy vấn SQL để kiểm tra tên đăng nhập và mật khẩu
	$sql = "SELECT * FROM `user` WHERE `email` = '$email' AND `pass` = '$password'";
	$result = $conn->query($sql);

	// Kiểm tra xem có kết quả trả về hay không
	if ($result->num_rows > 0) {
		// Đăng nhập thành công
		// Chuyển hướng đến trang basic_table.html
		$_SESSION['logged_in'] = true;
		$_SESSION['username'] = $email;
		header("Location: ../Layout/_LayoutView/LayoutView.php");
		exit(); // Đảm bảo không có mã PHP nào thực thi sau header
	} else {
		// Đăng nhập thất bại
		echo "Invalid email or password";
	}

	// Đóng kết nối
	$conn->close();
}
?>


<!DOCTYPE html>

<head>
	<title>Visitors an Admin Panel Category Bootstrap Responsive Website Template | Login :: w3layouts</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="keywords" content="Visitors Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
	<link rel="stylesheet" href="../../css/bootstrap.min.css">
	<!-- //bootstrap-css -->
	<!-- Custom CSS -->
	<link href="../../css/style.css" rel='stylesheet' type='text/css' />
	<link href="../../css/style-responsive.css" rel="stylesheet" />
	<!-- font CSS -->
	<link href='//fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
	<!-- font-awesome icons -->
	<link rel="stylesheet" href="../../css/font.css" type="text/css" />
	<link href="../../css/font-awesome.css" rel="stylesheet">
	<!-- //font-awesome icons -->
	<script src="js/jquery2.0.3.min.js"></script>
</head>

<body>
	<div class="log-w3">
		<div class="w3layouts-main">
			<h2>Sign In Now</h2>
			<form action="#" method="post">
				<input type="email" class="ggg" name="Email" placeholder="E-MAIL" required="" value="caotancong2003@gmail.com">
				<input type="password" class="ggg" name="Password" placeholder="PASSWORD" required="" value="onfibase">
				<span><input type="checkbox" />Remember Me</span>
				<h6><a href="#">Forgot Password?</a></h6>
				<div class="clearfix"></div>
				<input type="submit" value="Sign In" name="login">
			</form>
			<p>Don't Have an Account ?<a href="registration.html">Create an account</a></p>
		</div>
	</div>
	<script src="js/bootstrap.js"></script>
	<script src="js/jquery.dcjqaccordion.2.7.js"></script>
	<script src="js/scripts.js"></script>
	<script src="js/jquery.slimscroll.js"></script>
	<script src="js/jquery.nicescroll.js"></script>
	<!-- [if lte IE 8]><script language="javascript" type="text/javascript" src="js/flot-chart/excanvas.min.js"></script><![endif] -->
	<script src="js/jquery.scrollTo.js"></script>
</body>

</html>