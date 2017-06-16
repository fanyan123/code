
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<script>
    $(function () {
        $('#fbPicture').filebox({
            buttonText: '选择文件',
            buttonAlign: 'left',
            accept:'image/jpeg',
            width:170
        });
        $('#fPicture').form({
            novalidate:true,
            required:true,
            success:function(data){
                console.log(data);
                $.messager.show({
                    title:'通知消息',
                    msg:data,
                    timeout:300,
                    showType:'slide'
                });

            },
        });
    })


</script>
<div style="text-align: center">
<form id="fPicture"  action="${pageContext.request.contextPath}/picture/upload" method="post" enctype="multipart/form-data">
   <img id="pictureImg">
    <div style="margin-top: 20px">添加图片<input id="fbPicture" type="text" style="width:150px" name="aaa"></div>
    <div style="margin-top: 20px"> 图片介绍<input class="easyui-textbox" name="title" /></div>
    <div style="margin-top: 20px"> 是否展示&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" checked="checked" name="type" value="1">是&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="type" value="0">否</div>
</form>
</div>