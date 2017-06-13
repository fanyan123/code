
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<script>
    $(function(){
        $.post('${pageContext.request.contextPath}/teacher/queryById',{"id":"${param.id}"},function (result) {
            $('#id').val(result.id);
            $('#name').textbox({
                value:result.name,
            });
        },'JSON');
    });
</script>
<div style="text-align: center">
    <form method="post" class="easyui-form" id="ff">
        <div style="margin-top: 30px"><input type="hidden" data-options="required:true" id="id" name="id"></div>
        <div style="margin-top: 30px">上师名：<input class="easyui-textbox" data-options="required:true" id="name" name="name" ></div>
    </form>
</div>
