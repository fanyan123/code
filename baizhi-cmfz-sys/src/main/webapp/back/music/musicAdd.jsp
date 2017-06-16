<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<script>
    $(function () {
        $('#fbMusic').filebox({
            buttonText: '选择图片',
            buttonAlign: 'left',
            accept:'image/jpeg',
            width:170
        });
    })
</script>
<div style="text-align: center">
    <form method="post" class="easyui-form" id="fMusic" enctype="multipart/form-data">
        <div style="margin-top: 10px">标题：<input class="easyui-textbox" data-options="required:true" name="title"></div>
        <div style="margin-top: 10px">集数：<input class="easyui-textbox" data-options="required:true" name="count"></div>
        <div style="margin-top: 10px">作者：<input class="easyui-textbox" data-options="required:true" name="author"></div>
        <div style="margin-top: 10px">播音：<input class="easyui-textbox" data-options="required:true" name="broadcast"></div>
        <div style="margin-top: 10px">图片：<input id="fbMusic" type="text" style="width:150px" name="aaa"></div>
    </form>
</div>
