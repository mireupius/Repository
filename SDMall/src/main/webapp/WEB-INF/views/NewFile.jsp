<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>부트스트랩 101 템플릿</title>

<!-- 부트스트랩 -->
<link href="resources\bootstrap-3.3.2-dist\css\bootstrap.min.css"
	rel="stylesheet">

<!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
<!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

<link href="resources\css\NewFile.css" rel="stylesheet">
<link rel="stylesheet" href="resources\css/reset.css"><!-- CSS reset -->
<link rel="stylesheet" href="resources\css/style.css"><!-- Resource style -->
<script src="resources\js\modernizr.js"></script><!-- Modernizr -->
<script src="resources\js\jquery-2.1.1.js"></script>
<script src="resources\js\jquery.menu-aim.js"></script> <!-- menu aim -->
<script src="resources\js\main.js"></script> <!-- Resource jQuery -->
</head>
<body>


	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->

	<script src="resources/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
	<div class="header_QQ col-md-12">
		<div class="global_Width col-md-8 col-md-offset-2">
			<div class="row">
				<div class="title_QQ col-md-3">타이틀</div>
				<div class="SearchBar_QQ col-md-5">검색</div>
				<div class="headerBanner_QQ col-md-4">해더 광고</div>
			</div>
			<div class="row">
				<div class="menuBar_QQ col-md-9">
				
					<div class="cd-dropdown-wrapper">
						<a class="cd-dropdown-trigger" href="#0">Dropdown</a>
						<nav class="cd-dropdown">
							<h2>Title</h2>
							<a href="#0" class="cd-close">Close</a>
							<ul class="cd-dropdown-content">

								<li class="has-children"><a href="#0">Clothing</a>
									<ul class="cd-secondary-dropdown is-hidden">
										<li class="go-back"><a href="#0">Menu</a></li>
										<li class="see-all"><a href="#0">All Clothing</a></li>
										<li class="has-children"><a href="#0">Accessories</a>

											<ul class="is-hidden">
												<li class="go-back"><a href="#0">패션의류</a></li>
												<li class="see-all"><a href="#0">All Accessories</a></li>
												<li class="has-children"><a href="#0">Beanies</a>
													<ul class="is-hidden">
														<li class="go-back"><a href="#0">Accessories</a></li>
														<li class="see-all"><a href="#0">All Benies</a></li>
														<li><a href="#0">Caps &amp; Hats</a></li>
														<!-- other list items here -->
													</ul></li>
												<li class="has-children"><a href="#0">Caps &amp;
														Hats</a>
													<ul class="is-hidden">
														<li class="go-back"><a href="#0">Accessories</a></li>
														<li class="see-all"><a href="#0">All Caps &amp;
																Hats</a></li>
														<li><a href="#0">Beanies</a></li>
														<!-- other list items here -->
													</ul></li>
												<li><a href="#0">Glasses</a></li>
												<!-- other list items here -->
											</ul></li>

										<li class="has-children">
											<!-- other list items here -->
										</li>

										<li class="has-children">
											<!-- other list items here -->
										</li>

										<li class="has-children">
											<!-- other list items here -->
										</li>
									</ul> <!-- .cd-secondary-dropdown --></li>
								<!-- .has-children -->

								<li class="has-children">
									<!-- other list items here -->
								</li>
								<!-- .has-children -->

								<li class="has-children">
									<!-- other list items here -->
								</li>
								<!-- .has-children -->

							</ul>
							<!-- .cd-dropdown-content -->
						</nav>
						<!-- .cd-dropdown -->
					</div>
					<!-- .cd-dropdown-wrapper -->
					
				</div>
				<div class="menuBar_QQ col-md-3">고객메뉴</div>
			</div>
		</div>
	</div>

</body>
</html>