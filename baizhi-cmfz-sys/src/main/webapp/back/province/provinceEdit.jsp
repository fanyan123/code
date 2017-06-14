
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<script>
    $(function(){
        $.post('${pageContext.request.contextPath}/province/queryById',{"id":"${param.id}"},function (province) {
            $('#idProvince').val(province.id);
            $('#nameProvince').textbox({
                value:province.name,
            });
        },'JSON');
    });
</script>
<div style="text-align: center">
    <form method="post" class="easyui-form" id="ffProvince">
        <div style="margin-top: 30px"><input type="hidden" data-options="required:true" id="idProvince" name="id"></div>
        <div style="margin-top: 30px">省名：<input class="easyui-textbox" data-options="required:true" id="nameProvince" name="name" ></div>
    </form>
</div>
