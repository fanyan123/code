
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<script>
    $(function(){
        $.post('${pageContext.request.contextPath}/picture/queryById',{"id":"${param.id}"},function (result) {
            $('#id').val(result.id);
            $('#name').textbox({
                value:result.name,
            });
            $('#title').textbox({
                value:result.title,
            });
            if(result.type=='0'){
                $('#type1').prop("checked",true);
            }else{
                $('#type').prop("checked",true);
            }
        },'JSON');
    });
</script>
<div style="text-align: center">
    <form method="post" class="easyui-form" id="ff">
        <div style="margin-top: 30px"><input type="hidden" data-options="required:true" id="id" name="id"></div>
        <div style="margin-top: 30px">图片名：<input class="easyui-textbox" data-options="required:true" id="name" name="name" readonly="readonly"></div>
        <div style="margin-top: 20px"> 图片标题：<input class="easyui-textbox" data-options="required:true" id="title" name="title"></div>
        <div style="margin-top: 20px"> 图片是否在前台展示：<input type="radio" id="type" name="type" value="1">是<input type="radio" id="type1" name="type" value="0">否</div>
    </form>
</div>
