<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<!-- Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet" />

    <!--  Style -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="loginstyle.css" />
    
<title>Login</title>
</head>
<body>

	<div class="main-container" style="background-image: url('https://msp.c.yimg.jp/images/v2/FUTi93tXq405grZVGgDqG5UMxt7pSW5r6_f9kXOqzIQd2hraMsg6ORlPAriECmiQtaZBFyEfUDTKHtC6pfyayWhOPlvbjxAe-g_GQ_t4p8xbi3D9eOurv3o8gIvbh_wVoQ2aBtMcLu5mA_H2_vo_FM2XW7vTBfnKfUJWUKLZJQo=/615707.jpg?errorImage=false');">
		<div class="bg-layer">
	      <div class="login-container">
	        <header>Sign In Form</header>
	        <form action="LoginController" method="post">
	          <div class="field-1">
	            <span class="fa fa-user"><i class="bi bi-person"></i></span>
	            <input type="text" name="email" required placeholder="Email" />
	          </div>
	          <div class="field-2 space">
	            <span class="fa fa-lock"><i class="bi bi-file-lock"></i></span>
	            <input type="password" name="password" class="pass-key" required placeholder="Password" />
	            <div class="show">SHOW</div>
	          </div>
	          <div class="pass">
	            <a href="#">Forgot Password?</a>
	          </div>
	          <div class="field-3">
	            <input type="submit" value="SIGN IN" />
	          </div>
	        </form>
	      </div>
      </div>
    </div>

    <script>
      const pass_field = document.querySelector(".pass-key");
      const showBtn = document.querySelector(".show");
      showBtn.addEventListener("click", function () {
        if (pass_field.type === "password") {
          pass_field.type = "text";
          showBtn.textContent = "HIDE";
          showBtn.style.color = "#3498db";
        } else {
          pass_field.type = "password";
          showBtn.textContent = "SHOW";
          showBtn.style.color = "#fff";
        }
      });
    </script>

</body>
</html>