
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<script>
    $(function(){
        $.post('${pageContext.request.contextPath}/music/queryById',{"id":"${param.id}"},function (result) {
            $('#id').val(result.id);
            $('#title').textbox({
                value:result.title,
            });
            $('#author').textbox({
                value:result.author,
            });
            $('#count').textbox({
                value:result.count,
            });
            $('#broadcast').textbox({
                value:result.broadcast,
            });
        },'JSON');
    });
</script>
<div style="text-align: center">
    <form method="post" class="easyui-form" id="ff">
        <div style="margin-top: 30px"><input type="hidden" data-options="required:true" id="id" name="id"></div>
        <div style="margin-top: 30px">标题：<input class="easyui-textbox" data-options="required:true" name="title" id="title"></div>
        <div style="margin-top: 30px">集数：<input class="easyui-textbox" data-options="required:true" name="count" id="count"></div>
        <div style="margin-top: 30px">作者：<input class="easyui-textbox" data-options="required:true" name="author" id="author"></div>
        <div style="margin-top: 30px">播音：<input class="easyui-textbox" data-options="required:true" name="broadcast" id="broadcast"></div>
    </form>
</div>
