<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>ignite</title>
  <link href="/static/css/fonts.css" rel="stylesheet">
  <link href="/static/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
  <link href="/static/css/styles.css" rel="stylesheet">
  <link href="/static/css/animate.css" rel="stylesheet">
  <!-- Toastr -->
  <link href="/static/css/toastr.min.css" rel="stylesheet">
  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
</head>

<body id="top">
  <div class="navbar navbar-inverse navbar-fixed-top opaque-navbar">
    <div class="container">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navMain">
            <span class="glyphicon glyphicon-chevron-right" style="color:white;"></span>
          </button>
        <a class="navbar-brand" href="/">ignite</a>
      </div>
      <div class="collapse navbar-collapse" id="navMain">
        <ul class="nav navbar-nav pull-right">
          <li class="active"><a href="/">首页</a></li>
          <li><a href="#">注册</a></li>
          <li><a href="#">登录</a></li>
          <li><a href="#">关于</a></li>
        </ul>
      </div>
    </div>
  </div>

  <div class="video-container">
    <div class="filter"></div>
    <video autoplay loop class="fillWidth">
      <source src="http://opzx9m4cb.bkt.clouddn.com/helloworld.mp4" type="video/mp4" />Your browser does not support the video tag. I suggest you upgrade your browser.
      <source src="http://opzx9m4cb.bkt.clouddn.com/helloworld.webm" type="video/webm" />Your browser does not support the video tag. I suggest you upgrade your browser.
    </video>
    <div class="poster hidden">
      <img src="http://opzx9m4cb.bkt.clouddn.com/helloworld.jpg" alt="">
    </div>
  </div>


  <section class="hero">
    <div class="container" id="hero">
      <div class="row">
        <div class="col-md-8 col-md-offset-2 text-center inner">
          <h1 class="animated swing delay-1s">ignite<span>V1</span></h1>
          <p>A dockernized service for <em>SS</em></p>
        </div>
      </div>
      <div class="row">
        <div class="col-md-6 col-md-offset-3 text-center">
          <a href="#" class="signup-btn">激活账号</a>
          <p class="login-text">已注册用户，点击 <em>此处</em> 登陆.</p>
        </div>
      </div>
    </div>
    <div class="container text-center" id="signup">
      <form class="form" id="signup-form" action="/signup" method="post">
        <h1>激活账号</h1>
        <input type="text" placeholder="邀请码" name="invite-code">
        <input type="text" placeholder="用户名" name="username">
        <input type="password" placeholder="密码" name="password">
        <input type="password" placeholder="确认密码" name="confirm-password">
        <button id="signup-btn">激活</button>
      </form>
    </div>
  </section>

  <footer class="navbar navbar-fixed-bottom">
    <div class="container">
      <div class="row">
        <div class="col-md-6">
          <ul class="legals">
            <li><a href="#">Terms &amp; Conditions</a></li>
            <li><a href="#">Legals</a></li>
          </ul>
        </div>
        <div class="col-md-6 credit">
          <p>A dockernized service for <a href="#"><em>SS</em></a></p>
        </div>
      </div>
    </div>
  </footer>
  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
  <script src="/static/js/bootstrap.min.js"></script>
  <!-- Toastr script-->
  <script src="/static/js/toastr.min.js"></script>
  <script src="/static/js/scripts.js"></script>
  <script src="/static/js/signup.js"></script>
  <script>
        $(document).ready(function() {
            Signup.init();
        });
    </script>
</body>
</html>