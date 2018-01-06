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
				background: #3e5c97; /* Old browsers */
				background: -moz-radial-gradient(center, ellipse cover, #3e5c97 0%, #3c537d 44%, #3c4c5b 100%); /* FF3.6-15 */
				background: -webkit-radial-gradient(center, ellipse cover, #3e5c97 0%,#3c537d 44%,#3c4c5b 100%); /* Chrome10-25,Safari5.1-6 */
				background: radial-gradient(ellipse at center, #3e5c97 0%,#3c537d 44%,#3c4c5b 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
				filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#3e5c97', endColorstr='#3c4c5b',GradientType=1 ); /* IE6-9 fallback on horizontal gradient */

				color: white;
			}

			.btn-default{
				background-color: rgba(32,32,32,0.25);
				border-radius: 8px;
				color: white;
			}

			.display-4{
				text-align: center;
			}

			table.table{
				background-color: rgba(32,32,32,0.25);
				border-radius: 8px;
			}

			input.form-control{
				background-color: rgba(32,32,32,0.25);
			}

			input.form-control:hover{
				background-color: rgba(16,16,16,0.25);
			}

			input.form-control:focus{
				background-color: rgba(16,16,16,0.25);
				color: white;
			}

			tr:hover{
				background-color: rgba(16,16,16,0.125);
				color: white;	
			}

			button{
				background-color: rgba(32,32,32,0.25);
			}

			button:hover{
				background-color: rgba(16,16,16,0.5);
			}

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
						<th>Reset:</th>
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
								<button id="resetBtn${user.id}" class="resetBtn btn-block btn-default">Reset</button>
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
					<label class="control-label col-sm-2  btn-block centerChild" for="username">Username:</label>

					<div class="col-sm-4 centerParent">
						<input type="text" class="form-control centerChild" id="username">
					</div>
				</div>

				<div class="form-group">        
					<div class="col-sm-4 centerParent">
						<button type="submit" class="btn-block btn-default centerChild">Submit</button>
					</div>
				</div>
			</form>
		</div>
	</body>
</html>