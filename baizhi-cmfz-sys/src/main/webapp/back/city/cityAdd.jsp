<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<script>
    $(function(){

        $('#province').combobox({
            width:175,
            required:true,
            multiple:false,
            url:'${pageContext.request.contextPath}/province/queryAll1',
            valueField:'id',
            textField:'name',
            value:'请选择'
        })

    });
</script>
<div style="text-align: center">
    <form method="post" class="easyui-form" id="CityF">
        <div style="margin-top: 30px">市名：<input class="easyui-textbox" data-options="required:true" name="name"></div>
        <div style="margin-top: 30px">所属省：<select id="province" name="province.id"></select></div>
    </form>
</div>
