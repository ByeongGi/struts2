<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" autoFlush="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- JSTL 선언 -->
<%@ taglib prefix="s" uri="/struts-tags"%><!-- struts tag 선언 -->
<div class="bs-component">
	<nav class="navbar navbar-inverse navbar-fixed-top">
		
		<!-- /navbar-header Start -->
		<div class="navbar-header">
			<!-- Top Menu Category : Service Name = Home -->
			<a class="navbar-brand" href="#">EE-WAVE</a>
				<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target="#myNavbar">
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>							
							<span class="icon-bar"></span>
				</button>
		</div>
		<!-- /navbar-header END -->
			
		<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<!-- Top Menu Category : Home -->
					<li id="cat-home"><a href="#">Home</a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">Page 1 <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">Page 1-1</a></li>
							<li><a href="#">Page 1-2</a></li>
							<li><a href="#">Page 1-3</a></li>		
						</ul></li>
						
					<li><a  href="#"">Page 2</a></li>
					<li id="cat-cat3"><a href="#">Cat 3</a></li>
					<li><a  href="#">Board</a></li>
					
				</ul>
				
				<s:if test="#session.mem_name != null">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#" data-toggle="dropdown" class="dropdown-toggle">
						<span class="glyphicon glyphicon-user"></span>권한 : <c:out value="${sessionScope.mem_role}"/> , <c:out value="${sessionScope.mem_name}"/> 님 </a>
						<ul class="dropdown-menu dropdown-menu-right" >
							<li><a href="#">Profile</a></li>
							<li><a href="#">Settings</a></li>
						</ul> <!-- Dropdown menu End-->
					</li>
					<li><a href="logout"><span class="glyphicon glyphicon-log-in"></span> Log-Out</a></li>		
					<li> <a> </a> </li>		
					
				</ul>
				</s:if>
				
				<s:else>
			    <ul class="nav navbar-nav navbar-right">
					<li><a href="logIn"><span class="glyphicon glyphicon-log-in"></span> Log-In </a></li>
					<li> <a> </a> </li>		
				</ul>
			    </s:else>
								
		</div>
	</nav>

</div>