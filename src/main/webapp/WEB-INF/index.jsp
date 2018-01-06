<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Index</title>

		<link rel="stylesheet" type="text/css" href="/css/bootstrap.css">
		<link rel="stylesheet" type="text/css" href="/css/style.css">

		<script type="text/javascript" src="/js/jquery.js"></script>
		<script type="text/javascript" src="/js/bootstrap.js"></script>	
		<script type="text/javascript" src="/js/main.js"></script>

		<style type="text/css">
			body{
background: #356aa0; /* Old browsers */
background: -moz-radial-gradient(center, ellipse cover, #356aa0 0%, #356aa0 100%); /* FF3.6-15 */
background: -webkit-radial-gradient(center, ellipse cover, #356aa0 0%,#356aa0 100%); /* Chrome10-25,Safari5.1-6 */
background: radial-gradient(ellipse at center, #356aa0 0%,#356aa0 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#356aa0', endColorstr='#356aa0',GradientType=1 ); /* IE6-9 fallback on horizontal gradient */
				
				color: lightgrey;
			}

			.display-4{
				text-align: center;
			}

			/*Inputs*/
			input.form-control{
				background-color: rgba(32,32,32,.1);
				border: 1px solid rgba(16,16,16,.25);
				color: lightgrey;
			}
			input.form-control:hover{
				background-color: rgba(16,16,16,0.20);
				color: white;
			}
			input.form-control:focus{
				background-color: rgba(16,16,16,0.20);
				color: white;
			}
			.btn-default{
				color: lightgrey;
				border: 1px solid rgba(32,32,32,.5);
				border-radius: 4px;
			}
			button:hover{
				color: white;
			}

			/*Parenting*/
			.centerParent{
				text-align: center;
				width:50%;
				margin: 0 auto;
			}
			.centerChild{
				text-align: center;
				width: 100%;
				margin: 1% auto;
			}

			/*Scrollbar*/
			.scroll {
			  width: 20px;
			  height: 200px;
			  overflow: auto;
			  float: left;
			  margin: 0 10px;
			}
			::-webkit-scrollbar {
			  width: 5px;
			}			 
			::-webkit-scrollbar-thumb {
			  background: grey; 
			}
			::-webkit-scrollbar-track {
			  background: #666; 
			}

			/*Button Colors*/
			.removeBtn{
				background-color: rgba(255,99,132,0.2);
				border: 1px solid rgba(255,99,132,1);
			}
			.resetBtn{
				background-color: rgba(75,192,192,0.2);
				border: 1px solid rgba(75,192,192,1);
			}
			.submitBtn{
				background-color: rgba(54,162,235,0.2);
				border: 1px solid rgba(54,162,235,1);
			}

			/*Tables*/
			table{					
				background-color: rgba(32,32,32,0.2);
				border-collapse: separate;
				border-spacing: 1px;
				border-radius: 4px;
			}
			table.table{
				background-color: rgba(32,32,32,0.2);
				border: 1px solid rgba(16,16,16,.20);
			}
			tr:hover{
				background-color: rgba(16,16,16,0.20);
				color: white;
			}
			.table thead th{
				border: 1px solid rgba(16,16,16,.25);
				border-radius: 4px;
			}
			.table-bordered td{
				border: 1px solid rgba(16,16,16,.25);
				border-radius: 4px;
			}
		</style>
	</head>

	<body>
		<div class="container">
			<h1 class="display-4 mt-4 mb-4">20</h1>

			<table class="table table-bordered">
				<thead>
					<tr>
						<th>Name:</th>
						<th>Time:</th>
						<th>Answers:</th>
						<th>Restarts:</th>
						<th>Restart:</th>
						<th>Remove:</th>
					</tr>
				</thead>

				<tbody id="timers">
					<c:forEach items="${users}" var="user">
						<tr id="${user.id}">
							<td>${user.username}</td>
							<td createdAt=${user.createdAt.getTime()}></td>
							<td>${user.answers}</td>
							<td>${user.restarts}</td>
							<td>
								<button id="resetBtn${user.id}" class="resetBtn btn-block btn-default">Restart</button>
							</td>
							<td>
								<button id="removeBtn${user.id}" class="removeBtn btn-block btn-default">Remove</button>
							</td>
						</tr>						
					</c:forEach>
				</tbody>
			</table>

			<form id="timerForm" class="form-horizontal" action="/action_page.php">
				<div class="form-group">
					<label class="control-label col-sm-2  btn-block centerChild" for="username">Name:</label>

					<div class="col-sm-4 centerParent">
						<input type="text" class="form-control centerChild" id="username">
					</div>
				</div>

				<div class="form-group">        
					<div class="col-sm-4 centerParent">
						<button type="submit" class="submitBtn btn-block btn-default centerChild">Submit</button>
					</div>
				</div>
			</form>
		</div>
	</body>
</html>