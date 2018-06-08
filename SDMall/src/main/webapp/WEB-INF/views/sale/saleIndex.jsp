<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="Dashboard">
<meta name="keyword"
	content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

<title>SD몰 판매관리 페이지</title>

<!-- Bootstrap core CSS -->
<link href="resources/assets/css/bootstrap.css" rel="stylesheet">
<!--external css-->
<link href="resources/assets/font-awesome/css/font-awesome.css"
	rel="stylesheet" />
<link href="resources/css/sale/saleStyle.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="resources/assets/css/zabuto_calendar.css">
<link rel="stylesheet" type="text/css"
	href="resources/assets/js/gritter/css/jquery.gritter.css" />
<link rel="stylesheet" type="text/css"
	href="resources/assets/lineicons/style.css">

<!-- Custom styles for this template -->
<link href="resources/assets/css/style.css" rel="stylesheet">
<link href="resources/assets/css/style-responsive.css" rel="stylesheet">

<script src="resources/assets/js/chart-master/Chart.js"></script>

<script src="resources/assets/js/jquery.js"></script>
<script src="resources/assets/js/jquery-1.8.3.min.js"></script>

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>

	<section id="container">
		<!-- **********************************************************************************************************************************************************
      TOP BAR CONTENT & NOTIFICATIONS
      *********************************************************************************************************************************************************** -->
		<!--header start-->
		<header class="header black-bg">
			<div class="sidebar-toggle-box">
				<div class="fa fa-bars tooltips" data-placement="right"
					data-original-title="Toggle Navigation"></div>
			</div>
			<!--logo start-->
			<a href="index.html" class="logo"><b>SD MALL</b></a>
			<!--logo end-->
		</header>
		<!--header end-->

		<!-- **********************************************************************************************************************************************************
      MAIN SIDEBAR MENU
      *********************************************************************************************************************************************************** -->
		<!--sidebar start-->
		<aside>
			<div id="sidebar" class="nav-collapse ">
				<!-- sidebar menu start-->
				<ul class="sidebar-menu" id="nav-accordion">

					<p class="centered">
						<a href="profile.html"><img
							src="resources/assets/img/ui-sam.jpg" class="img-circle"
							width="60"></a>
					</p>
					<h5 class="centered">판매자이름</h5>


					<li class="sub-menu"><a href="javascript:;"> <i
							class="fa fa-desktop"></i> <span>상품관리</span>
					</a>
						<ul class="sub">
							<li><a href="#">상품 조회/수정</a></li>
							<li><a href="#">상품 등록</a></li>
						</ul></li>

					<li class="sub-menu"><a href="javascript:;"> <i
							class="fa fa-cogs"></i> <span>판매관리</span>
					</a>
						<ul class="sub">
							<li><a href="#.html">주문조회</a></li>
							<li><a href="sale.delivery.go">발주발송관리</a></li>
							<li><a href="#.html">배송현황관리</a></li>
							<li><a href="#.html">구매확정내역</a></li>
							<li><a href="#.html">취소관리</a></li>
							<li><a href="#.html">반품관리</a></li>
							<li><a href="#.html">교환관리</a></li>
						</ul></li>
					<li class="sub-menu"><a href="javascript:;"> <i
							class="fa fa-book"></i> <span>정산관리</span>
					</a>
						<ul class="sub">
							<li><a href="#.html">정산내역</a></li>
						</ul></li>
					<li class="sub-menu"><a href="javascript:;"> <i
							class="fa fa-tasks"></i> <span>고객관리</span>
					</a>
						<ul class="sub">
							<li><a href="#.html">상품문의관리</a></li>
							<li><a href="#.html">고객문의관리</a></li>
							<li><a href="#.html">구매평 관리</a></li>
						</ul></li>
					<li class="sub-menu"><a href="javascript:;"> <i
							class="fa fa-th"></i> <span>통계</span>
					</a>
						<ul class="sub">
							<li><a href="basic_table.html">주문분석</a></li>
							<li><a href="responsive_table.html">유입분석</a></li>
							<li><a href="responsive_table.html">고객현황</a></li>
							<li><a href="responsive_table.html">재구매통계</a></li>
						</ul></li>
					<li class="sub-menu"><a href="javascript:;"> <i
							class=" fa fa-bar-chart-o"></i> <span>판매자정보</span>
					</a>
						<ul class="sub">
							<li><a href="morris.html">판매자 정보변경</a></li>
							<li><a href="chartjs.html">판매자 등급</a></li>
						</ul></li>

				</ul>
				<!-- sidebar menu end-->
			</div>
		</aside>
		<!--sidebar end-->

		<!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
		<!--main content start-->

		<jsp:include page="${contentPage }"></jsp:include>


		<!--main content end-->
		<!--footer start-->
		<footer class="site-footer">
			<div class="text-center">
				2014 - Alvarez.is <a href="index.html#" class="go-top"> <i
					class="fa fa-angle-up"></i>
				</a>
			</div>
		</footer>
		<!--footer end-->
	</section>

	<!-- js placed at the end of the document so the pages load faster -->

	<script src="resources/assets/js/bootstrap.min.js"></script>
	<script class="include" type="text/javascript"
		src="resources/assets/js/jquery.dcjqaccordion.2.7.js"></script>
	<script src="resources/assets/js/jquery.scrollTo.min.js"></script>
	<script src="resources/assets/js/jquery.nicescroll.js"
		type="text/javascript"></script>
	<script src="resources/assets/js/jquery.sparkline.js"></script>


	<!--common script for all pages-->
	<script src="resources/assets/js/common-scripts.js"></script>

	<script type="text/javascript"
		src="resources/assets/js/gritter/js/jquery.gritter.js"></script>
	<script type="text/javascript"
		src="resources/assets/js/gritter-conf.js"></script>

	<!--script for this page-->
	<script src="resources/assets/js/sparkline-chart.js"></script>
	<script src="resources/assets/js/zabuto_calendar.js"></script>



	<script type="application/javascript">
		
		
		
		
        $(document).ready(function () {
            $("#date-popover").popover({html: true, trigger: "manual"});
            $("#date-popover").hide();
            $("#date-popover").click(function (e) {
                $(this).hide();
            });
        
            $("#my-calendar").zabuto_calendar({
                action: function () {
                    return myDateFunction(this.id, false);
                },
                action_nav: function () {
                    return myNavFunction(this.id);
                },
                ajax: {
                    url: "show_data.php?action=1",
                    modal: true
                },
                legend: [
                    {type: "text", label: "Special event", badge: "00"},
                    {type: "block", label: "Regular event", }
                ]
            });
        });
        
        
        function myNavFunction(id) {
            $("#date-popover").hide();
            var nav = $("#" + id).data("navigation");
            var to = $("#" + id).data("to");
            console.log('nav ' + nav + ' to: ' + to.month + '/' + to.year);
        }
    
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	</script>


</body>
</html>