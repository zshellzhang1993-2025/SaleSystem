<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="cn.edu.njnu.viewmodel.BookViewModel"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>BookSales</title>
</head>
<body>
	<%@include file="../header.jsp"%>
	<%
		String currentOrderUrl = "/booksales/user/current_order?user="
				+ userid;
		String updateAccountUrl = "/booksales/user/update_account?user="
				+ userid;
		String shoppingcarUrl = "/booksales/user/car_content?user="
				+ userid;
		String feedbackUrl = "/booksales/user/feedback?user=" + userid;
	%>
	<div class="container body-content">
		<div style="width: 20%; height: 100%; float: left; color: transparent">.</div>
		<div
			style="position: fixed; text-align: center; width: 15%; background-color: #f7f7f7; height: auto; margin-top: 20px;">
			<div style="background-color: #428bca; height: 7px; width: 100%;">.</div>
			<ul class="nav nav-pills nav-stacked">
				<li><a href="<%=userUrl%>" style="font-family: 微软雅黑;">历史订单列表</a></li>
				<li><a href="<%=currentOrderUrl%>" style="font-family: 微软雅黑;">当前订单列表</a></li>
				<li><a href="<%=updateAccountUrl%>" style="font-family: 微软雅黑;">修改账户信息</a></li>
				<li><a href="<%=shoppingcarUrl%>" style="font-family: 微软雅黑;">我的购物车</a></li>
				<li><a href="<%=feedbackUrl%>" style="font-family: 微软雅黑;">待评价的商品</a></li>
			</ul>
			<div style="background-color: #428bca; height: 7px; width: 100%;">.</div>
		</div>
		<div style="float: left; width: 80%; height: auto; padding-left: 4%">

			<h2 style="font-family: 微软雅黑; margin-bottom: 60px;">评价商品</h2>
			<%
				BookViewModel book = (BookViewModel) request.getAttribute("book");
				int orderid = (int) request.getAttribute("order");
				String commentUrl = "/booksales/user/feedback_book?user=" + userid
						+ "&book=" + book.getId() + "&order=" + orderid;
			%>

			<table class="table">
				<tr>
					<th>书名</th>
					<th>价格</th>
					<th>分类</th>
					<th>描述</th>
				</tr>

				<tr>
					<td><%=book.getName()%></td>
					<td><%=book.getPrice()%></td>
					<td><%=book.getCategory()%></td>
					<td><%=book.getDesc()%></td>
				</tr>
			</table>

			<div class="row">
				<div class="col-md-8">
					<section id="loginForm">
						<form action="<%=commentUrl%>" method="post"
							class="form-horizontal" role="form">

							<h4 style="font-family: 微软雅黑;">评分</h4>
							<hr />
							<input id="input-22" name="star" value="0" type="number"
								class="rating" min=0 max=5 step=1 data-rtl=0
								data-container-class='text-left' data-glyphicon=0>

							<h4 style="font-family: 微软雅黑;">评论</h4>
							<hr />
							<div class="form-group">
								<div class="col-md-10">
									<textarea rows="3" class="form-control" name="comment"></textarea>
								</div>
							</div>

							<div class="form-group">
								<div class="col-md-10">
									<input type="submit" value="提  交" class="btn btn-primary"
										style="font-family: 微软雅黑;" />
								</div>
							</div>
						</form>
					</section>
				</div>
			</div>
		</div>
		<div
			style="width: 100%; height: 120px; clear: both; color: transparent">.</div>
		<%@include file="../footer.jsp"%>
	</div>
</body>
</html>
