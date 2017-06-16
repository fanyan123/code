
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<script>
    $(function(){
        $.post('${pageContext.request.contextPath}/teacher/queryById',{"id":"${param.id}"},function (teacher) {
            $('#idTeacher').val(teacher.id);
            $('#nameTeacher').textbox({
                value:teacher.name,
            });
            $('#picpathTeacher').textbox({
                value:teacher.picpath,
            });
        },'JSON');
    });
</script>
<div style="text-align: center">
    <form method="post" class="easyui-form" id="ffTeacher">
        <div style="margin-top: 30px"><input type="hidden" data-options="required:true" id="idTeacher" name="id"></div>
        <div style="margin-top: 30px">上师名：<input class="easyui-textbox" data-options="required:true" id="nameTeacher" name="name" ></div>
        <div style="margin-top: 30px">头像名：<input class="easyui-textbox" data-options="required:true" id="picpathTeacher" name="picpath" readonly="readonly"></div>
    </form>
</div>
