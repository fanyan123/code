
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<script>
    $(function(){
        $.post('${pageContext.request.contextPath}/music/queryById',{"id":"${param.id}"},function (music) {
            $('#idMusic').val(music.id);
            $('#titleMusic').textbox({
                value:music.title,
            });
            $('#authorMusic').textbox({
                value:music.author,
            });
            $('#countMusic').textbox({
                value:music.count,
            });
            $('#broadcastMusic').textbox({
                value:music.broadcast,
            });
            $('#picpathMusic').textbox({
                value:music.picpath,
            });
        },'JSON');
    });
</script>
<div style="text-align: center">
    <form method="post" class="easyui-form" id="ffMusic">
        <div style="margin-top: 30px"><input type="hidden" data-options="required:true" id="idMusic" name="id"></div>
        <div style="margin-top: 30px">标题：<input class="easyui-textbox" data-options="required:true" name="title" id="titleMusic"></div>
        <div style="margin-top: 30px">集数：<input class="easyui-textbox" data-options="required:true" name="count" id="countMusic"></div>
        <div style="margin-top: 30px">作者：<input class="easyui-textbox" data-options="required:true" name="author" id="authorMusic"></div>
        <div style="margin-top: 30px">播音：<input class="easyui-textbox" data-options="required:true" name="broadcast" id="broadcastMusic"></div>
        <div style="margin-top: 30px">图片名:<input class="easyui-textbox" data-options="required:true" name="picpath" id="picpathMusic" readonly="readonly"></div>
    </form>
</div>
