<%@page import="poly.dto.BoardDTO"%>
<%@page import="poly.dto.UserDTO"%>
<%@page import="poly.dto.AirplaneDTO"%>
<%@page import="poly.util.CmmUtil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/SessionValue.jsp"%>
<%
	UserDTO uDTO = (UserDTO) request.getAttribute("uDTO");
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">




<!-- Title -->
<title>AirCheck</title>

<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700|Work+Sans:300,400,700" rel="stylesheet">
    <link rel="stylesheet" href="/reborn/fonts/icomoon/style.css">

    <link rel="stylesheet" href="/reborn/css/bootstrap.min.css">
    <link rel="stylesheet" href="/reborn/css/magnific-popup.css">
    <link rel="stylesheet" href="/reborn/css/jquery-ui.css">
    <link rel="stylesheet" href="/reborn/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/reborn/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="/reborn/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="/reborn/css/animate.css">
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/mediaelement@4.2.7/build/mediaelementplayer.min.css">
    
    
    
    <link rel="stylesheet" href="/reborn/fonts/flaticon/font/flaticon.css">
  
    <link rel="stylesheet" href="/reborn/css/aos.css">

    <link rel="stylesheet" href="/reborn/css/style.css">
    
    <link rel="stylesheet" href="/example/style.css" />

	
		
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

 
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>


<script type="text/javascript">
	function doSubmit(url) {

		//폼을 객체로 가져옴
		var f = document.getElementById("form1");
		f.action = url;
		f.submit();

	}
</script>

<style>

.row1 {
    
    display: flex;
    
    flex-wrap: wrap;
    margin-right: 0px;
    margin-left: 0px;
	}
	
	.row1 div {
			text-overflow:ellipsis;
			overflow:hidden;
			white-space:nowrap;
			
			padding: 9px 0;
    		text-align: center;
    		font-size: 16px;
		}
     
	
	a {
    color: #4e73df;
    
	}
	
	.btn-primary {
    color: #fff;
    background-color: #4e73df;
    border-color: #4e73df;
	}
	
	.site-blocks-cover, .site-blocks-cover .row {
    
    height: calc(75vh);
	}
	
	#custom-search-input {
        margin:0;
        margin-top: 10px;
        padding: 0;
    }
 
    #custom-search-input .search-query {
        padding-right: 3px;
        padding-right: 4px \9;
        padding-left: 3px;
        padding-left: 4px \9;
        /* IE7-8 doesn't have border-radius, so don't indent the padding */
 
        margin-bottom: 0;
        -webkit-border-radius: 3px;
        -moz-border-radius: 3px;
        border-radius: 3px;
    }
 
    #custom-search-input button {
        border: 0;
        background: none;
        /** belows styles are working good */
        padding: 2px 5px;
        margin-top: 2px;
        position: relative;
        left: -28px;
        /* IE7-8 doesn't have border-radius, so don't indent the padding */
        margin-bottom: 0;
        -webkit-border-radius: 3px;
        -moz-border-radius: 3px;
        border-radius: 3px;
        color:#D9230F;
    }
 
    .search-query:focus + button {
        z-index: 3;   
    }
	
	.btn3-default {
	
	
    color: #333;
    background-color: #fff;
    border-color: #ccc;
    width: 86px;
    height: 34px;
    
    }
	
	.btn3 {
    
    top: -4px;
    bottom: 10px;
	}

	::-webkit-scrollbar {

		display:none;

	}
	
	


</style>


<script>
	$(function() {
		$('#search2').click(
				function() {
					var schLineType = $("#schLineType").val();
					console.log(schLineType);
					var schIOType = $("#schIOType").val();
					console.log(schIOType);
					var schAirCode = $("#schAirCode").val();
					console.log(schAirCode);
					
					var url = "AjaxAirplaneOperation.do" /*URL*/
							+ "?schLineType=" + schLineType + "&schIOType="
							+ schIOType + "&schAirCode=" + schAirCode;
					console.log(url);

					
					$.ajax({

						type : "GET",
						url : url,
						dataType : "json",
						error : function() {
							alert('통신실패!!');
						},
						success : function(data) {
							

							var show = "";

							$.each(data, function(key, value) {
								
								show +='<div>'
						        show +='<div style="color: #858796; font-size: 1.5rem; font-weight: 400; line-height: 2.5;">'
								show +='<div class="row1" style="border-left: 1px solid #e3e6f0;border-top: 2px solid #e3e6f0;">'
								show +='<div class="col-md-3" style="border-right: 1px solid #e3e6f0; border-bottom: 1px solid #e3e6f0;">'+ value.airlineKorean +'</div>'
								show +='<div class="col-md-3" style="border-right: 1px solid #e3e6f0; border-bottom: 1px solid #e3e6f0;">'+ value.airFln +'</div>'
								show +='<div class="col-md-2" style="border-right: 1px solid #e3e6f0; border-bottom: 1px solid #e3e6f0;">'+ value.std +'</div>'
								show +='<div class="col-md-2" style="border-right: 1px solid #e3e6f0; border-bottom: 1px solid #e3e6f0;">'+ value.boardingKor +'</div>'
								show +='<div class="col-md-2" style="border-right: 1px solid #e3e6f0; border-bottom: 1px solid #e3e6f0;">'+ value.arrivedKor +'</div>'
								show +='</div>'
								show +='</div>'
								show +='</div>'
							    

							});

							$("#viewData").html(show);

						}

					})

				});

	})
</script>



</head>
<body>

	<!-- 페이지 이동용(기본은 마이페이지) -->
	<form name="form1" id="form1" method="POST" action="mypage.do"
		style="display: none;">
		<input type="hidden" name="userNo" value="<%=userNo%>" />
	</form>


	<div class="site-wrap">

    <div class="site-mobile-menu">
      <div class="site-mobile-menu-header">
        <div class="site-mobile-menu-close mt-3">
          <span class="icon-close2 js-menu-toggle"></span>
        </div>
      </div>
      <div class="site-mobile-menu-body"></div>
    </div> 
    <!-- .site-mobile-menu -->
    

	<!-- ##### Header Area Start ##### -->
	<div class="site-navbar-wrap js-site-navbar bg-white2">
      
     
              <div class="col-10">
                <nav class="site-navigation text-center" role="navigation">
                
                  <div class="container">
        			
        			
        
        			<div class="nav_wrapper"> 
					  <!--<a class="menu-link" href="#menu"></a>-->
					  
					  <br/>
					  <div class="">
               		 	<h2><a href="index.do" style="color: rgba(0, 0, 0, 0.9);">AirCheck</a></h2>
              		  </div>
					  <br/>
					  <div class="spinner-master">
					    <input type="checkbox" id="spinner-form" />
					    <label for="spinner-form" class="spinner-spin">
					    <div class="spinner diagonal part-1"> </div>
					    <div class="spinner horizontal"> </div>
					    <div class="spinner diagonal part-2"> </div>
					    </label>
					  </div>
					  
					  <nav id="menu" class="menu">
					    <ul class="dropdown">
					    <%if(id.equals("admin")) { %> 
					      <li class="b"><a href="index.do" title="Link">Home</a></li>
					      <%if("".equals(id)) { %>
					      <%}else {%>
					      <li><a href="UserList.do" title="Link">회원관리</a></li>
					      <%} %>
					      <li><a href="AirplaneSelect.do" title="Link">항공 운항 정보 관리</a></li>
					      <li><a href="ParkingLot.do" title="Link">공항 주차장 정보 관리</a></li>
					      <li><a href="BoardList.do" title="Link">커뮤니티 관리</a></li>
					      <%if("".equals(id) || id == null) { %>
					      <li class="b"><a href="register.do" title="Link">Register</a></li>
					      <li class="b"><a href="login.do" title="Link">Login</a></li>
					      <%} else { %>
					      <li class="b"><a href="register.do" title="Link">Register</a></li>
					      <li class="b"><a href="logout.do" title="Link"><%="관리자님 환영합니다." %> &nbsp; Logout</a></li>
					      <%  }  %>
					      
					      <%} else { %>
					      <li class="b"><a href="index.do" title="Link">Home</a></li>
					      <%if("".equals(id)) { %>
					      <%}else {%>
					      <li><a href="javascript:doSubmit('mypage.do');" title="Link">마이페이지</a></li>
					      <%} %>
					      <li><a href="AirplaneSelect.do" title="Link">항공 운항 정보</a></li>
					      <li><a href="ParkingLot.do" title="Link">공항 주차장 정보</a></li>
					      <li><a href="BoardList.do" title="Link">커뮤니티</a></li>
					      <%if("".equals(id) || id == null) { %>
					      <li class="b"><a href="register.do" title="Link">Register</a></li>
					      <li class="b"><a href="login.do" title="Link">Login</a></li>
					      <%} else { %>
					      <li class="b"><a href="register.do" title="Link">Register</a></li>
					      <li class="b"><a href="logout.do" title="Link"><%=id + "님 환영합니다." %> &nbsp; Logout</a></li>
					      <%  }  %>
					      <%  }  %>
					    </ul>
					  </nav>
					  
					</div>
        			
        
        
        
        </div>
        </nav>
        </div>
        </div>
        </div>
        		
          
       
	<!-- ##### Header Area End ##### -->
	
	<!--================Home Banner Area =================-->
    <div style="height: 113px;"></div>
    <div class="slide-one-item home-slider owl-carousel">
      
      

      <div class="site-blocks-cover" style="background-image: url(/reborn/images/e.jpg);" data-aos="fade">
        <div class="container">
          <div class="row align-items-center justify-content-center">
            <div class="col-md-7 text-center" data-aos="fade">
              <h1>항공 운항 정보</h1>
              <p class="font-weight-normal"></p>
            </div>
          </div>
        </div>
      </div> 
    </div>
<!--================End Home Banner Area =================-->

<!--================About  Area =================-->

<br/><br/>

<!--================About Area End =================-->

	<!-- ##### Blog Area Start ##### -->
	<section class="blog-area blog-page section-padding-100">
		<div class="container-fluid">
			<div class="row">
				<div class="col-12">

					<div class="blog-catagories mb-70 d-flex flex-wrap justify-content-between">

						<!-- Begin Page Content -->
						<div class="container-fluid">


							


								<br/><br/>
			  
						
						<div class="container">
						
						<hr>       				
		 				
		 				&nbsp;&nbsp;
		 				<select class="form1-control" name="schIOType" id="schIOType" style="width:30%; height:34px;">
							<option value="">운행타입</option>
							<option value="I">도착</option>
							<option value="O">출발</option>
						</select>
					&nbsp;&nbsp;
		 				
						<select class="form1-control" name="schLineType" id="schLineType" style="width:20%; height:34px;" >
							<option value="">구분</option>
							<option value="D">국내선</option>
							<option value="I">국제선</option>
						</select>
					&nbsp;&nbsp;	
						
						<select class="form1-control" name="schAirCode" id="schAirCode" style="width:30%; height:34px;">
							<option value="">공항</option>
							<option value="GMP">서울/김포</option>
							<option value="PUS">부산/김해</option>
							<option value="CJU">제주</option>
							<option value="TAE">대구</option>
							<option value="USN">울산</option>
							<option value="CJJ">청주</option>
							<option value="MWX">무안</option>
							<option value="KWJ">광주</option>
							<option value="RSU">여수</option>
							<option value="KPO">포항</option>
							<option value="YNY">양양</option>
							<option value="HIN">사천</option>
							<option value="KUV">군산</option>
							<option value="WJU">횡성/원주</option>
						</select>
					&nbsp;
					
					
						<button type="submit" class="btn btn-primary" name="search2" id="search2" style="margin:12px;">검색</button>
						
						<hr>
					
					<div style="height:480px; overflow-x:hidden; overflow-y:scroll; -ms-overflow-style: none;">
						<div style="color: #858796; font-size: 1.5rem; font-weight: 400; line-height: 2.5;">
							<div class="row1" style="border-top: 1px solid #e3e6f0;  border-left: 1px solid #e3e6f0;">	
								<div class="col-md-3" style="border-right: 1px solid #e3e6f0; border-bottom: 1px solid #e3e6f0;">항공사</div>
								<div class="col-md-3" style="border-right: 1px solid #e3e6f0; border-bottom: 1px solid #e3e6f0;">편명</div>
								<div class="col-md-2" style="border-right: 1px solid #e3e6f0; border-bottom: 1px solid #e3e6f0;">예정시각</div>
								<div class="col-md-2" style="border-right: 1px solid #e3e6f0; border-bottom: 1px solid #e3e6f0;">출발지</div>
								<div class="col-md-2" style="border-right: 1px solid #e3e6f0; border-bottom: 1px solid #e3e6f0;">도착지</div>
							</div>
						</div>	
						<div>
								<div id="viewData">	
							
								</div>							
						</div>
							
						</div>
					</div>

						</div>
						<!-- /.container-fluid -->

					</div>
					<!-- End of Main Content -->
					
					


				</div>

			</div>

		</div>
	</section>
	<!-- ##### Footer Area Start ##### -->
	
	<br/><br/><br/><br/><br/><br/><br/><br/>
	
	<script src="/reborn/js/jquery-3.3.1.min.js"></script>
  <script src="/reborn/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="/reborn/js/jquery-ui.js"></script>
  <script src="/reborn/js/popper.min.js"></script>
  <script src="/reborn/js/bootstrap.min.js"></script>
  <script src="/reborn/js/owl.carousel.min.js"></script>
  <script src="/reborn/js/jquery.stellar.min.js"></script>
  <script src="/reborn/js/jquery.countdown.min.js"></script>
  <script src="/reborn/js/jquery.magnific-popup.min.js"></script>
  <script src="/reborn/js/bootstrap-datepicker.min.js"></script>
  <script src="/reborn/js/aos.js"></script>

  
  <script src="/reborn/js/mediaelement-and-player.min.js"></script>

  <script src="/reborn/js/main.js"></script>
  
 
  <script src="http://code.jquery.com/jquery-2.1.3.min.js"></script> 
 <script src="/example/script.js"></script>
  


<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
 
		
	<!-- ##### Footer Area End ##### -->
</div>


</body>
</html>