<%@page import="poly.util.CmmUtil"%>
<%@page import="poly.dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file = "/WEB-INF/view/SessionValue.jsp" %>
<% UserDTO uDTO = (UserDTO)request.getAttribute("uDTO"); %>


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
        
       
	 <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

	
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
        
       <style>
         .btn-primary {
    color: #fff;
    background-color: #4e73df;
    border-color: #4e73df;
	}
	
	.site-blocks-cover, .site-blocks-cover .row {
    
    height: calc(75vh);
	}
	
	.form-control[readonly]{
	
    cursor: default;
    background-color: #fff;
    
	}
	
	.col {
	
	    flex-basis: auto;
	}
	 
	  
        </style>
        
        <script type="text/javascript">
	    function doSubmit(url){
	    	
	    	//폼을 객체로 가져옴
	    	var f = document.getElementById("form1");
	    	f.action = url;
	    	f.submit();
	    	
	    }
	    
	    
	    
	</script>
         
        
    </head>
	<body>
	
	<!-- 페이지 이동용(기본은 마이페이지) -->
	<form name="form1" id="form1" method="POST" action="mypage.do" style="display: none;">
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
               		 	<h2><a href="index.do" style="color: rgba(0, 0, 0, 0.9); font-size: 30px;">AirCheck</a></h2>
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
              <h1>마이페이지 수정</h1>
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

   
    
    <section class="cool-facts-area section-padding-100-0">
        <div class="container">
        
        	<div class="container">
					  <div class="row">
					  
					
					 <div class="col col-md-10">
					  <form action="/mypagerevise2.do" method="POST" id="cup">
					  <input type="hidden"  name="userNo" value="<%=CmmUtil.nvl(uDTO.getUserNo())%>" />
					  <input type="hidden"  name="gopassword" id="gopassword" value="<%=CmmUtil.nvl(uDTO.getPassword())%>" />
					  <div class="form-group required">
					    <label for="exampleInputEmail1" class='control-label'>아이디</label>
					    <input type="text" class="form-control" id="id" name="id" value="<%=CmmUtil.nvl(uDTO.getUserId())%>" readonly>
					    <!--<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>-->
					  </div>
					  <div class="form-group required">
					    <label for="exampleInputEmail1" class='control-label'>새 비밀번호</label>
					    <input type="password" class="form-control" id="password" name="password" placeholder="새 비밀번호">
					    <!--<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>-->
					  </div>
					  <div class="form-group required">
					    <label for="exampleInputEmail1" class='control-label'>새 비밀번호 확인</label>
					    <input type="password" class="form-control" id="passwordcheck" name="passwordcheck" placeholder="새 비밀번호 확인">
					    <!--<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>-->
					  </div>
					  <div class="form-group required">
					    <label for="exampleInputEmail1" class='control-label'>이름</label>
					    <input type="text" class="form-control" id="name" name="name" value="<%=CmmUtil.nvl(uDTO.getUserName())%>">
					    <!--<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>-->
					  </div>
					  <div class="form-group required">
					    <label for="exampleInputEmail1" class='control-label'>성별</label>
					    <input type="text" class="form-control" id="gender" name="gender" value="<%=CmmUtil.nvl(uDTO.getGender())%>" readonly>
					    <!--<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>-->
					  </div>
					  <div class="form-group required">
					    <label for="exampleInputPassword1" class='control-label'>이메일</label>
					    <input type="text" class="form-control" id="email" name="email" value="<%=CmmUtil.nvl(uDTO.getEmail())%>" readonly>
					  </div>
					 <div class="form-group required">
					    <label for="exampleInputPassword1" class='control-label'>핸드폰 번호</label>
					    <input type="text" class="form-control" id="phone" name="phone" value="<%=CmmUtil.nvl(uDTO.getPhone())%>">
					  </div>
					
					    <ul class="media-date text-uppercase reviews list-inline">
					    <li class="mm"><button type="button" class="btn btn-primary" id="ok">수정</button></li>
					    <li class="aaaa"><a href="javascript:doSubmit('mypage.do');"><button type="button" class="btn btn-primary">이전</button></a></li>
					  </ul>
					</form>
					</div>
					  <div class="col col-md-2"></div>
					
					</div>
					</div>
    
		
				</div>
    
              	
              	
    </section>
   
    
    <br/><br/><br/><br/><br/><br/>
    
		
	<!-- ##### Footer Area End ##### -->
    
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

  <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    
    <script>
    $(function() {
  		
  		var check=false;
  		
  			$("#ok").click(function(){
  				
  				var password  = $("#password").val();
  				var passwordcheck  = $("#passwordcheck").val();
  				var passwordregExp = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
  				var gopassword = document.getElementById("gopassword").value;
  				
  				if(password.length >= 1) {
  				
			  	  		if(password.length <2) {
			  				alert("비밀번호를 2자리 이상 입력해주세요");
			  				return;
			  			}
		  	  			
		  	  			if(!password.match(passwordregExp)) {
		  	  				alert("비밀번호를 8~15자리 이내의 숫자와 특수 문자를 포함해야합니다");
		  	  				return;
		  	  			}
		  	  			 
		  	  			
			  	  		if(passwordcheck == "") {
			  				alert("비밀번호를 확인해주세요");
			  				return;
			  			} else if(passwordcheck != password) {
			  				alert("비밀번호가 맞지 않습니다.");
			  				return;
			  			} 
  	  			
	  	  				$("#cup").submit();
	  	  				
  				} else if(password.length < 1) {
  					
  					document.getElementById("password").value = gopassword;
  					
  					
  					$("#cup").submit();
  					
  				}
  	  			
  	  		})
  			
  		
  		})
 		 
  		
  	
    
    
    </script>
  	
  	
 
	</body>
</html>