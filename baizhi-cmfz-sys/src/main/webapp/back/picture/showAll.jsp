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
            $('#fb').filebox({
                buttonText: '选择文件',
                buttonAlign: 'left'
            })
        });

    </script>

</head>

<body>
    <form action="${pageContext.request.contextPath}/picture/upload" method="post" enctype="multipart/form-data">
         添加图片<input id="fb" type="text" style="width:150px" name="aaa">
        图片介绍<input class="easyui-textbox" name="title" />
        <input type="submit" value="添加" >
    </form>

</body>
</html>
