<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Shopping Smart - SDmall</title>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="resources/plugins/jquery-ui-1.12.1.custom/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="resources/css/shop_styles.css">
<link rel="stylesheet" type="text/css" href="resources/css/shop_responsive.css">

<script src="resources/plugins/Isotope/isotope.pkgd.min.js"></script>
<script src="resources/plugins/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
<script src="resources/plugins/parallax-js-master/parallax.min.js"></script>
<script src="resources/js/shop_custom.js"></script>
</head>

<body>


<div class="super_container">
	
	<!-- Shop -->

	<div class="shop">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">

					<!-- Shop Sidebar -->
					<div class="shop_sidebar">
						<div class="sidebar_section">
							<div class="sidebar_title">Categories</div>
							<ul class="sidebar_categories">
								<c:choose>
								<c:when test="${param.ct_clf==3 }">
								<c:forEach var="sideCate" items="${allCategory}">
									<c:if test="${sideCate.ct_parentno==param.ct_parentno }">
										<li><a href="shop.Category?ct_no=${sideCate.ct_no }&ct_clf=${sideCate.ct_clf}&ct_parentno=${sideCate.ct_parentno }">${sideCate.ct_clfname }</a></li>
										<c:if test="${sideCate.ct_no==null}">
										</c:if>
									</c:if>
								</c:forEach>
								</c:when>
								
								<c:otherwise>
								<c:forEach var="sideCate" items="${allCategory}">
									<c:if test="${sideCate.ct_parentno==param.ct_no }">
										<li><a href="shop.Category?ct_no=${sideCate.ct_no }&ct_clf=${sideCate.ct_clf}&ct_parentno=${sideCate.ct_parentno }">${sideCate.ct_clfname }</a></li>
										<c:if test="${sideCate.ct_no==null}">
										</c:if>
									</c:if>
								</c:forEach>
								</c:otherwise>
								</c:choose>
								
							</ul>
						</div>
					</div>
				</div>

				<div class="col-lg-9">
					
					<!-- Shop Content -->
					<div class="shop_content">
						<div class="shop_bar clearfix">
							<div class="shop_product_count"><span>${itemCount }</span> products found</div>
						</div>
						<div class="product_grid">
							<div class="product_grid_border"></div>
							
							<c:if test="${fn:length(goodsList)==0 }">
							<h5 class="goods_nothing">해당 상품이 없습니다.</h3>
							</c:if>
							<c:forEach var="goods" items="${goodsList}">
							<a href="goods?gd_no=${goods.gd_no }">
							<c:choose>
								<c:when test="${goods.gd_price==goods.gd_csmprice }">
								<div class="product_item">
									<div class="product_border"></div>
									<div class="product_image d-flex flex-column align-items-center justify-content-center"><img src="${pageContext.request.contextPath}/upload/${goods.gd_imgs}" alt=""></div>
									<div class="product_content">
										<div class="product_price"><fmt:formatNumber value="${goods.gd_price }" pattern="#,###" />원</div>
										<div class="product_name"><div><a href="goods?gd_no=${goods.gd_no }" tabindex="0">${goods.gd_name }</a></div></div>
									</div>
								</div>
								</c:when>
								<c:otherwise>
								<div class="product_item discount">
									<div class="product_border"></div>
									<div class="product_image d-flex flex-column align-items-center justify-content-center"><img src="${pageContext.request.contextPath}/upload/${goods.gd_imgs}"></div>
									<div class="product_content">
										<div class="product_price"><fmt:formatNumber value="${goods.gd_price }" pattern="#,###" />원<span><fmt:formatNumber value="${goods.gd_csmprice }" pattern="#,###" /></span></div>
										<div class="product_name"><div><a href="goods?gd_no=${goods.gd_no }" tabindex="0">${goods.gd_name }</a></div></div>
									</div>
									<ul class="product_marks">
										<li class="product_mark product_discount">${(goods.gd_price-goods.gd_csmprice)*100/goods.gd_csmprice}%</li>
									</ul>
								</div>
								</c:otherwise>
							</c:choose>
							</a>
							</c:forEach>
														

						</div>

						<!-- Shop Page Navigation -->
						<c:if test="${pageCount > 1 }">
						<div class="shop_page_nav d-flex flex-row">
						<c:if test="${param.ct_no!=null }">
							<c:set var="prm" value="shop.Category?ct_no=${param.ct_no }&ct_clf=${param.ct_no}&ct_parentno=${param.ct_parentno }&p="/>
						</c:if>
						<c:if test="${param.gd_name!=null }">
							<c:set var="prm" value="shop.search?gd_name=${param.gd_name }&p="/>
						</c:if>
							<c:if test="${page != 1 }">
								<a class="btn btn-default" href="${prm }${page - 1 }" role="button"><div class="page_prev d-flex flex-column align-items-center justify-content-center"><i class="fas fa-chevron-left"></i></div></a>
							</c:if>
							<ul class="page_nav d-flex flex-row">
							<c:forEach var="p" begin="1" end="${pageCount }">
								<li><a href="${prm }${p}">${p }</a></li>
							</c:forEach>
							</ul>
							<c:if test="${page != pageCount }">
								<a class="btn btn-default" href="${prm }${page + 1 }" role="button"><div class="page_next d-flex flex-column align-items-center justify-content-center"><i class="fas fa-chevron-right"></i></div></a>
							</c:if>
						</div>
						</c:if>
					</div>

				</div>
			</div>
		</div>
	</div>

</div>

</body>

</html>