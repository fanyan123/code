<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>login</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/back/static/css/themes/default/easyui.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/back/static/css/themes/icon.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/back/static/css/IconExtension.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/back/static/js/jquery.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/back/static/js/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/back/static/js/form.validator.rules.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/back/static/js/easyui-lang-zh_CN.js"></script>
		<script type="text/javascript">
			$(function(){
				$("#image").click();
			});
			function code(img){
				img.src="${pageContext.request.contextPath}/admin/imageCode?name="+Math.random()+"";
			}
		</script>
		<style type="text/css">
			input{
				height: 20px;
    			margin-top: 10px;
    			font-size: 20px;
			}
			.l{
				font-size:20px;
			}
			select{
				height: 25px;
    			font-size: 15px;
    			margin-top: 10px;
			}
			.login:hover{
				background: orange;
				color:white;
				border:none;
			}
		</style>
	</head>

	<body style="background:#E0ECFF">
	<div style="height:520px;width: 700px;margin: auto;text-align:center;background: whitesmoke">
	<div style="height:40px;width: 400px;margin: auto;text-align:center;border-bottom: 5px solid #8ce89c;padding-bottom: 20px;">
		<h1>持明法州管理系统</h1>
	</div>
		<div style="width: 700px;margin: auto;height:480px; ">

			<form action="${pageContext.request.contextPath}/admin/login" style="margin:auto;width:400px;border:1px solid #49bd67;margin-top: 50px;border-radius: 20px;padding: 20px;" method="post">
				<span class="l">帐   &nbsp;&nbsp;&nbsp; 号</span>：<input name="username" type="text" class="easyui-textbox"/><br /><br />
				<span class="l">密   &nbsp;&nbsp;&nbsp; 码</span>：<input name="password" type="password" class="easyui-passwordbox"/><br /><br />
				<span class="l">验  证  码</span>：<input class="easyui-textbox" name="code" data-options="width:100"/>&nbsp;&nbsp;&nbsp;<img alt="验证码图片" src="${pageContext.request.contextPath}/admin/imageCode"onclick="code(this);" id="image"/><br />
				<br />
				<div align="center"><input type="submit"  class="login"  value="登录" style="border:none;text-align: center;height:40px;border-radius: 7px;
							padding-bottom: 5px; cursor: pointer;padding-top: 5px;"/></div>
			</form>
		</div>
	</div>
	</body>
</html>
